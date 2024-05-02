#import "PdfViewerPlugin.h"
#if __has_include(<pdf_viewer/pdf_viewer-Swift.h>)
#import <pdf_viewer/pdf_viewer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "pdf_viewer-Swift.h"
#endif

static NSString* const kDirectory = @"EasyPdfViewer";
static NSString* const kFilePath = @"file:///";
static NSString* kFileName = @"";

@implementation PdfViewerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
   FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"pdf_viewer_plugin"
            binaryMessenger:[registrar messenger]];
  PdfViewerPlugin* instance = [[PdfViewerPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
          if ([@"getPage" isEqualToString:call.method]) {
              size_t pageNumber = (size_t)[call.arguments[@"pageNumber"] intValue];
              NSString * filePath = call.arguments[@"filePath"];
              result([self getPage:filePath ofPage:pageNumber]);
          } else if ([@"getNumberOfPages" isEqualToString:call.method]) {
              NSString * filePath = call.arguments[@"filePath"];
              NSNumber * clearCacheDir = call.arguments[@"clearCacheDir"];
              result([self getNumberOfPages:filePath clearCacheDir:clearCacheDir]);
          } else if ([@"clearCacheDir" isEqualToString:call.method]) {
              [self clearCacheDir];
              result(nil);
          }
          else {
              result(FlutterMethodNotImplemented);
          }
      });
}

- (void)clearCacheDir {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePathAndDirectory = [documentsDirectory stringByAppendingPathComponent:kDirectory];

    if ([[NSFileManager defaultManager] fileExistsAtPath:filePathAndDirectory]) {
        NSLog(@"[PdfViewerPlugin] Removing old documents cache");
        NSError *error;

        if (![[NSFileManager defaultManager] removeItemAtPath:filePathAndDirectory error:&error]) {
            NSLog(@"Clear directory error: %@", error);
        }
    }
}

-(NSString *)getNumberOfPages:(NSString *)url clearCacheDir:(NSNumber *)clearCacheDir
{
    NSURL * sourcePDFUrl;
    if([url containsString:kFilePath]){
        sourcePDFUrl = [NSURL URLWithString:url];
    }else{
        sourcePDFUrl = [NSURL URLWithString:[kFilePath stringByAppendingString:url]];
    }
    CGPDFDocumentRef SourcePDFDocument = CGPDFDocumentCreateWithURL((__bridge CFURLRef)sourcePDFUrl);
    size_t numberOfPages = CGPDFDocumentGetNumberOfPages(SourcePDFDocument);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *temporaryDirectory = [paths objectAtIndex:0];
    NSString *filePathAndDirectory = [temporaryDirectory stringByAppendingPathComponent:kDirectory];
    NSError *error;

    // Clear cache folder
    if ([clearCacheDir boolValue]) {
        [self clearCacheDir];
    }

    if (![[NSFileManager defaultManager] createDirectoryAtPath:filePathAndDirectory
                                   withIntermediateDirectories:YES
                                                    attributes:nil
                                                         error:&error])
    {
        NSLog(@"Create directory error: %@", error);
        return nil;
    }
    // Generate random file size for this document

    kFileName = [[NSUUID UUID] UUIDString];
    NSLog(@"[PdfViewerPlugin] File has %zd pages", numberOfPages);
    NSLog(@"[PdfViewerPlugin] File will be saved in cache as %@", kFileName);
    return [NSString stringWithFormat:@"%zd", numberOfPages];
}

-(NSString*)getPage:(NSString *)url ofPage:(size_t)pageNumber
{
    NSURL * sourcePDFUrl;
    if([url containsString:kFilePath]){
        sourcePDFUrl = [NSURL URLWithString:url];
    }else{
        sourcePDFUrl = [NSURL URLWithString:[kFilePath stringByAppendingString:url]];
    }
    CGPDFDocumentRef SourcePDFDocument = CGPDFDocumentCreateWithURL((__bridge CFURLRef)sourcePDFUrl);
    size_t numberOfPages = CGPDFDocumentGetNumberOfPages(SourcePDFDocument);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *temporaryDirectory = [paths objectAtIndex:0];
    NSString *filePathAndDirectory = [temporaryDirectory stringByAppendingPathComponent:kDirectory];
    NSError *error;

    if (pageNumber > numberOfPages) {
        pageNumber = numberOfPages;
    }

    if (![[NSFileManager defaultManager] createDirectoryAtPath:filePathAndDirectory
                                   withIntermediateDirectories:YES
                                                    attributes:nil
                                                         error:&error])
    {
        NSLog(@"Create directory error: %@", error);
        return nil;
    }
    CGPDFPageRef SourcePDFPage = CGPDFDocumentGetPage(SourcePDFDocument, pageNumber);
    CGPDFPageRetain(SourcePDFPage);
    NSString *relativeOutputFilePath = [NSString stringWithFormat:@"%@/%@-%d.png", kDirectory, kFileName, (int)pageNumber];
    NSString *imageFilePath = [temporaryDirectory stringByAppendingPathComponent:relativeOutputFilePath];
    CGRect sourceRect = CGPDFPageGetBoxRect(SourcePDFPage, kCGPDFMediaBox);
    UIGraphicsBeginPDFContextToFile(imageFilePath, sourceRect, nil);
    // Calculate resolution
    // Set DPI to 300
    CGFloat dpi = 300.0 / 72.0;
    CGFloat width = sourceRect.size.width * dpi;
    CGFloat height = sourceRect.size.height * dpi;
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    // Fill Background
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    // Change interpolation settings
    CGContextSetInterpolationQuality(currentContext, kCGInterpolationHigh);
    // Fill background with white color
    CGContextSetRGBFillColor(currentContext, 1.0f, 1.0f, 1.0f, 1.0f);
    CGContextFillRect(currentContext, CGContextGetClipBoundingBox(currentContext));
    CGContextTranslateCTM(currentContext, 0.0, height);
    CGContextScaleCTM(currentContext, dpi, -dpi);
    CGContextSaveGState(currentContext);
    CGContextDrawPDFPage (currentContext, SourcePDFPage);
    CGContextRestoreGState(currentContext);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [UIImagePNGRepresentation(image) writeToFile: imageFilePath atomically:YES];
    return imageFilePath;
}

@end

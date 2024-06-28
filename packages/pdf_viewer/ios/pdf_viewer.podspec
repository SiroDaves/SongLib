#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint pdf_viewer.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'pdf_viewer'
  s.version          = '1.0.7'
  s.summary          = 'Allows you to generate PNG&#x27;s of specified pages from a provided PDF file source.'
  s.description      = <<-DESC
  Allows you to generate PNG&#x27;s of specified pages from a provided PDF file source.
                         DESC
  s.homepage         = 'https://github.com/sirodaves'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'devs' => 'info@sirodaves.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end

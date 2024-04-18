import 'package:flutter/material.dart';

import '../../theme/theme_colors.dart';

/// UI Widget for displaying metadata.
class MetaCard extends StatelessWidget {
  final String _title;
  final Widget _children;

  // ignore: public_member_api_docs
  const MetaCard(this._title, this._children, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(_title, style: const TextStyle(fontSize: 18)),
              ),
              _children,
            ],
          ),
        ),
      ),
    );
  }
}

class AccountDetailCard extends StatelessWidget {
  final String label;
  final String data;
  const AccountDetailCard({super.key, required this.label, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 0.5, color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 9, left: 24, bottom: 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  data,
                  style: const TextStyle(
                    fontSize: 18,
                    color: ThemeColors.textGray,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

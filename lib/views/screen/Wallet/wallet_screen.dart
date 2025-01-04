import 'package:flutter/material.dart';
import 'package:project_template/views/base/bottom_menu..dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomMenu(1),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/constants/app_styles.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 48,
          vertical: isMobile ? 10 : 14,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 16,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Quiz Application UI',
            style: AppStyles.bannerTitle.copyWith(fontSize: isMobile ? 18 : 34),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

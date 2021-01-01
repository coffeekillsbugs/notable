import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/colors.dart';
import '../sigma_provider.dart';

class BlackButton extends StatelessWidget {
  final IconData kIcon;
  final double kSize;

  BlackButton({this.kIcon, this.kSize = 24.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // >>> Logic to collapse extended floating action buttons on interaction
        if (Provider.of<SigmaProvider>(context, listen: false).isFABCollapsed == false) {
          Provider.of<SigmaProvider>(context, listen: false)
              .changeTodoPadding();
        }

        // >>> Navigation routes
        if (kIcon == Icons.edit) {
          Navigator.pushNamed(context, 'NewNote');
        } else if (kIcon == Icons.check_box_rounded) {
          Navigator.pushNamed(context, 'NewTodo');
        }
      },
      child: Container(
        height: 56.0,
        width: 56.0,
        decoration: BoxDecoration(
          color: AppColor.darkGrey,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              offset: Offset(0.0, 0.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Container(
          //   height: 24.0,
          // width: 24.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Icon(
            kIcon,
            size: kSize,
            color: Colors.white,
            // semanticLabel: 'Info',
          ),
        ),
      ),
    );
  }
}

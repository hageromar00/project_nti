import 'package:flutter/material.dart';
import 'package:project_nti_app/core/color_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:project_nti_app/core/color_manager/color_manager.dart';

class Button1 extends StatelessWidget {
  final String text;
  final Function() onTab;
  final double? fontSize;
  final String? iconPath;
  final bool isLoading;

  const Button1({
    super.key,
    required this.text,
    required this.onTab,
    this.fontSize,
    this.iconPath,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: ColorManager.primaryColorGradient,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onTab,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, screenHeight * 0.07),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (iconPath != null) ...[
                    Image.asset(
                      iconPath!,
                      height: 22,
                      width: 22,
                    ),
                    const SizedBox(width: 6),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: fontSize ?? screenWidth * 0.055,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

// class Button1 extends StatelessWidget {
//   final String text;
//   final Function() onTab;

//   final double? fontSize;
//   final String? iconPath; 
//   final bool isLoading;
//   const Button1({
//     super.key,
//     required this.text,
//     required this.onTab,
//     this.fontSize,
//     this.iconPath,
//     this.isLoading = false,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Container(
//       decoration: BoxDecoration(
//         gradient: ColorManager.primaryColorGradient,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: ElevatedButton(
//         onPressed: onTab,
//         style: ElevatedButton.styleFrom(
//           minimumSize: Size(double.infinity, screenHeight * 0.07),
//           backgroundColor: Colors.transparent,
//           foregroundColor: Colors.white,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),

//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (iconPath != null) ...[
//               Image.asset(
//                 iconPath!,
//                 height: 22,
//                 width: 22,
//               ),
//               const SizedBox(width: 6),
//             ],
//             Text(
//               text,
//               style: TextStyle(
//                 fontSize: fontSize ?? screenWidth * 0.055,
//                 fontWeight: FontWeight.w600,
//                 fontStyle: FontStyle.normal,
//               ),
//             ),
//           ],

//         child:  isLoading?CircularProgressIndicator():Text(
//           text,
//           style: TextStyle(
//             fontSize: screenWidth * 0.055,
//             fontWeight: FontWeight.w600,
//             fontStyle: FontStyle.normal,
//           ),

//         ),
//       ),
//     ));
//   }
// }


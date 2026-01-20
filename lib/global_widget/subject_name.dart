import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app/utils/color_constant.dart';

class SubjectNameCard extends StatelessWidget {
  const SubjectNameCard(
      {super.key,
      this.height = 100,
      this.width = 100,
      required this.name,
      required this.imageUrl});

  final double height;
  final double width;
  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorConstants.myCustomWhite,
            image:
                DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            color: ColorConstants.myCustomWhite,
          ),
        ),
      ],
    );
  }
}

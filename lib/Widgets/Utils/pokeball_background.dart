import 'package:flutter/material.dart';
import 'package:my_first_app/auxiliary.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokeballBackground extends StatelessWidget {
  final Color color;
  final double? left, right, top, bottom, dimension;

  const PokeballBackground({
    super.key, 
    required this.color,
    this.left,
    this.right,
    this.top,
    this.bottom,
    this.dimension,
  });
  
  @override
  Widget build(BuildContext context) {
    return 
      Positioned(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
        child: 
          SvgPicture.asset(
            'assets/images/pokeball.svg',
            height: dimension,
            width: dimension,
            colorFilter: 
              ColorFilter.mode(
                lightenColor(color),
                BlendMode.srcIn,
              ),
          ),
      );
  }
}
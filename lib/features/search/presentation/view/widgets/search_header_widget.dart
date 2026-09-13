// features/search/presentation/view/widgets/search_header_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_platform_app/features/search/presentation/view/widgets/search_text_field.dart';

class SearchHeaderWidget extends StatelessWidget {
  const SearchHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onDoubleTap: () => Navigator.pop(context),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xff1E1E1E)
                
            ),
            child: Center(child: SvgPicture.asset("assets/SVG/Vector 9 (1).svg",fit: BoxFit.fill,)),
          ),
        ),
        SizedBox(width: 10,),
       
          SearchTextField()
      ],
    );
  }
}

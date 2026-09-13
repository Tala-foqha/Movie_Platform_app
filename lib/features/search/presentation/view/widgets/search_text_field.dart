// features/search/presentation/view/widgets/search_text_field.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_platform_app/core/widgets/custom_text_form_field.dart' show CustomTextFormField;
import 'package:movie_platform_app/features/search/presentation/manger/search/search_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextFormField(hinttext: "Search any movies name here", validator: (value){},
      controller: context.read<SearchCubit>().searchController,
      onChanged: (value) {

        context.read<SearchCubit>().serchMovie(context.read<SearchCubit>().searchController.text);
        
      },
      borderRadius: BorderRadius.circular(35),
      fillColor:  Color(0xff1E1E1E),
      suffixIcon: SvgPicture.asset("assets/SVG/page_info.svg",
      fit: BoxFit.scaleDown,

          height: 10,
          width: 10, ), hasBorder: false,
      
      
      
       
      
                    ),
    );
  }
}

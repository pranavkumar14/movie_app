import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:movie_app/app/core/route/app_route.gr.dart';
import 'package:movie_app/app/view/home/data/model/movie_list_response_model.dart';


class MovieSearchBarWidget extends StatelessWidget {
  const MovieSearchBarWidget(
      {super.key,
        required this.controller,
        this.onChanged,
        required this.onSelected,
        required this.suggestionsBuilder});

  final TextEditingController controller;
  final  Function(String)? onChanged;
  final void Function(Result) onSelected;
  final FutureOr<List<Result>> Function(String) suggestionsBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 3,
      ),
      child: TypeAheadField<Result>(
        hideOnEmpty: controller.text.length > 2 ? false : true,
        controller: controller,
        builder: (context, controller, focusNode) {
          return TextField(
              keyboardType: TextInputType.text,
              inputFormatters: [LengthLimitingTextInputFormatter(100),],
              onTapOutside: (p){
                controller.text='';
                FocusScope.of(context).unfocus();
              },
              onSubmitted: (d){
                if(controller.text.length>2)context.pushRoute(SearchResultRoute(query: d));
              },
              onChanged: onChanged,
              style: Theme.of(context).textTheme.labelLarge,
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                isDense: true,
                suffixIcon: IconButton(onPressed: (){
                  if(controller.text.length>2){
                    context.pushRoute(
                      SearchResultRoute(query: controller.text)
                  );
                  }},
                    icon: Icon(Icons.search)),
                hintText: 'Search Movies...',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color.fromRGBO(181, 181, 181, 1)),
                ),
                fillColor: Colors.white,
                filled: true,
              )
          );
        },
        itemBuilder: (context, value) {
          return ListTile(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
            tileColor: Colors.white,
            title: Text(value.originalTitle,style: Theme.of(context).textTheme.labelLarge,),
          );
        },
        onSelected: onSelected,
        suggestionsCallback: suggestionsBuilder,
      ),
    );
  }
}

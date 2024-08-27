


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_pp/bussness/cubit/search_cubit.dart';
import 'package:shoping_pp/view/show_details_prodect/search/widget/body_search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (contextA) => SearchCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Search Page",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        body: const SearchBody(),
      ),
    );
  }
}

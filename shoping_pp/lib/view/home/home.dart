import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_pp/bussness/cubit/home_cubit.dart';
import 'package:shoping_pp/config/root/app_root.dart';
import 'package:shoping_pp/config/status.dart';
import 'package:shoping_pp/data/api/prodect_api.dart';
import 'package:shoping_pp/data/repo/prodects_repo.dart';
import 'package:shoping_pp/view/widgets/list_of_prodects.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
          prodectsApiRepo: ProdectsApiRepo(dataProdectsApi: DataProdectsApi())),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoot.searchPage);
                },
                icon: const Icon(
                  Icons.search,
                ))
          ],
          backgroundColor: Colors.cyanAccent,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.loadingType == LoadingType.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: state.listProdects.length,
                    itemBuilder: (context, index) {
                      return ListOfProdects(
                          onTap: () => context
                              .read<HomeCubit>()
                              .navigetToDetailsProdects(
                                  context, state.listProdects.elementAt(index)),
                          prodects: state.listProdects.elementAt(index));
                    },
                  );
          },
        ),
      ),
    );
  }
}

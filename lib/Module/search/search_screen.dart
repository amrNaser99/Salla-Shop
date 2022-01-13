import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Module/search/search_cubit/search_cubit.dart';
import 'package:shop_app/Module/search/search_cubit/search_states.dart';
import 'package:shop_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SearchCubit cubit = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultTextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.search,
                    hintText: 'Search',
                    labelText: 'Search',
                    onSubmitted: (text) {
                      cubit.search(text);
                    },
                    validate: (value) {
                      if (value == null) {
                        return 'Field is Empty';
                      }
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (state is SearchLoadingState)
                    const LinearProgressIndicator(),
                  const SizedBox(
                    width: 10,
                  ),
                  if (state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => buildListSItem(
                            cubit.searchModel!.data!.data![index], context,index),
                        separatorBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 2.0,
                          color: Colors.grey[300],
                        ),
                        itemCount: cubit.searchModel!.data!.data!.length,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

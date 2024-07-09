import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/card_bloc.dart';
import '../models/Card.dart';


class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _StatefulWidgetState();
}

class _StatefulWidgetState extends State<CardList> {
  @override
  void initState() {
    context.read<CardBloc>().add(CardLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Screen'),
        ),
        body:
            BlocBuilder<CardBloc, CardState>(builder: (context, state) {
          if (state is CardLoadingState) {
            return const Center(
                child: Column(
              children: [
                CircularProgressIndicator.adaptive(),
              ],
            ));
          } else if (state is CardLoadedState) {
            return Center(
              child: _list(state.product),
            );
          } else if (state is CardErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is CardOffline) {
            return Center(
              child: FutureBuilder<List<Product>>(
                  future: state.product,
                  builder: (context, snapshot) {
                    return _list(snapshot.data);
                  }),
            );
          }

          return const SizedBox();
        }));
  }

  Widget _list(List<Product>? list) {
    return ListView.builder(
      itemCount: list?.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Row(mainAxisSize: MainAxisSize.min, children: [
            Text('[${list?[index].id}]${list?[index].title?.substring(0, 4)}',
                overflow: TextOverflow.ellipsis)
          ]),
        );
      },
    );
  }
}

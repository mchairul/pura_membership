import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pura_membership/providers/app_provider.dart';
import 'package:pura_membership/widgets/prize_list.dart';

class ScreenPrizes extends StatelessWidget {
  const ScreenPrizes({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AppProvider>().prizesData;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text("Daftar Hadiah",
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 28
            ),
          ),
        ),
        SizedBox(height: 50,),
        Container(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<AppProvider>().prizesData;
            },
            child: Center(
              child: Consumer<AppProvider>(
                builder: (context, value, child) {
                  return value.map.length == 0 ? CircularProgressIndicator() :
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: value.map['items'].length,
                      itemBuilder: (context, index){
                        return new PrizeList(map: value.map['items'][index]);
                      }
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

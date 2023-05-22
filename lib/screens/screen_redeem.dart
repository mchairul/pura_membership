import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pura_membership/providers/app_provider.dart';
import 'package:pura_membership/widgets/prize_list.dart';

class ScreenRedeem extends StatelessWidget {
  const ScreenRedeem({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AppProvider>().getRedeem;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text("History Redeem",
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
              context.read<AppProvider>().getRedeem;
            },
            child: Center(
              child: Consumer<AppProvider>(
                builder: (context, value, child) {
                  return value.redeem.isEmpty ? Text("Belum ada penukaran") :
                  Table(
                    border: TableBorder.all(),
                    children: [
                      const TableRow(
                          children: [
                            Text("Tanggal",style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Hadiah",style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Cost",style: TextStyle(fontWeight: FontWeight.bold))
                          ]
                      ),
                      for (var data in value.redeem) TableRow(
                        children: [
                          Text(data.date),
                          Text(data.prizes),
                          Text(data.cost.toString()),
                        ]
                      )
                    ],
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

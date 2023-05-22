import 'package:flutter/material.dart';
import 'package:pura_membership/widgets/alert.dart';

class PrizeList extends StatelessWidget {
  const PrizeList({super.key, required this.map});
  final Map<String, dynamic> map;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.deepPurple,
          child: ListTile(
            title: Text('${map['nama']}' + ' cost : ' + '${map['cost']}' + ' poin',style: TextStyle(color: Colors.white),),
            trailing: IconButton(
              icon: Icon(Icons.redeem,color: Colors.white,),
              onPressed: () => {
                //ketika tombol icon mata diklik
                debugPrint('icon redeem clicked'),
                showAlertDialog(context, map['nama'], map['cost']),
              },
            ),
          ),
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:grass/models/user.dart';

class RedemptionPage extends StatelessWidget {
  const RedemptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Redeemptions"),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) { return Divider(indent: 10,
                      endIndent: 10,);},
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.amber,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(User.redemptions[index].company??""),
                          Text(User.redemptions[index].description??"")
                          ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: (){},
                        child: Text(User.redemptions[index].cost.toString()+" points"),
                      )
                    ],
                  ),
                );  
              },
              itemCount: User.redemptions.length,
            ),
          ),
        ],
      ),
    );
  }
}
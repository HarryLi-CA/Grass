import 'package:flutter/material.dart';
import 'package:grass/models/user.dart';

class RedemptionPage extends StatelessWidget {
  const RedemptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    if(!User.loaded){
      User.putDummyData();}
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Redeemptions"),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) { return Divider(indent: 10,
                      endIndent: 10,);},
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.amber,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text("Hello"),
                          Text("Hello")
                          ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: (){},
                        child: Text("HEllo"),
                      )
                    ],
                  ),
                );  
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
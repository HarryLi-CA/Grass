import 'package:flutter/material.dart';
import 'package:grass/models/liability.dart';
import 'package:grass/models/user.dart';
import 'package:grass/services/feedbackGeneration.dart';
import 'package:grass/models/transaction.dart';
import 'package:grass/models/user.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: Colors.black,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Divider(
          height: 20,
          color: Colors.black,
        ),
        Container(
          padding: const EdgeInsets.all(5.1),
          //height: 150,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(children:[
            const Text(
              'Feedback on your last statement: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white),
            ),
            FutureBuilder(
              future: OpenAiFeedback.generateFeedback((){setState(() {
                
              });}),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) { 
                return Text(
                  snapshot.data??"", 
                  style: TextStyle( fontWeight: FontWeight.w300, color: Colors.white),
                );
               },
            ),
          ]),
        ),
        Divider(
          height: 20,
          color: Colors.black,
        ),
        Container(
          padding: const EdgeInsets.all(10.1),
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(children: [
            const Text(
              'Next Milestones:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.green),
                  
            ),
            Divider(
          height: 10,
          color: Colors.white,
           ),
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ Text(
                    User.milestones[index].toString(), 
                    style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),) ,
                    
                  Text("100xp", 
                    style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white)
                  ), ],
                  );

                },
                separatorBuilder: (BuildContext context, int index) {
                  return Placeholder();
                },
              ),
            ),
          ]),
        ),
        Divider(
          height: 20,
          color: Colors.black,
        ),
        Container(
          //physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10.1),
          height: 400,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text(
              'Transactions:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.green),    
            ),
            Divider(
              height: 10,
            ),
            //Text(User.transactions.length.toString()),
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: User.transactions.length,
                //shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(User.transactions[index].category ?? "",
                        style: TextStyle(fontSize: 22, color: Colors.white)),
                        Text(User.transactions[index].amt.toString(), 
                         style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, ),)                    
                  ]
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),

            ),
          ]),
        ),
        Divider(
          height: 20,
          color: Colors.black,
        ),
        Container(
          padding: const EdgeInsets.all(10.1),
          height: 150,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 83, 135, 86),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              'Assets:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: User.assets.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ 
                      Text(User.assets[index].type.toString(), 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),),
                      Text(User.assets[index].amt.toString(), 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)

                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          ]),
        ),
        Divider(
          height: 20,
          color: Colors.black,
        ),
        Container(
          padding: const EdgeInsets.all(10.1),
          height: 150,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 207, 135, 135),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              'Liabilities:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.red.shade900),
            ),
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: User.liabilities.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                   
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ 
                      Text(User.liabilities[index].type.toString(),  
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),),
                      Text(User.liabilities[index].amt.toString(), 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)

                    ],
                  );;
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          ]),
        ),
        Divider(
          height: 20,
          color: Colors.black,
        ),
      ]),
    ));
  }
}
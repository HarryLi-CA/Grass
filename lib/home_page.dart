import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Container(
      color: Colors.black,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Divider(
          height: 50,
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
              'Feedback on your last statement:',
              style: TextStyle(
                  
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return null;
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
                  fontSize: 18,
                  color: Colors.white),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return null;
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
          padding: const EdgeInsets.all(10.1),
          height: 350,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text(
              'Transactions:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
            Divider(
          height: 10,
        ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return null;
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
          padding: const EdgeInsets.all(10.1),
          height: 150,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 83, 135, 86),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              'Assests:',
              style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 18,
                  color: Colors.white),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return null;
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
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return null;
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
      ]),
    )
    );
  }
}

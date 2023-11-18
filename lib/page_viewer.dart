import 'package:flutter/material.dart';
import 'package:grass/home_page.dart';
import 'package:grass/redemption_page.dart';

class PageViewer extends StatelessWidget {
  const PageViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2, // make sure that this matches the amount of pages
      child: Scaffold( 
      body: TabBarView(
        children:[
          HomePage(),
          RedemptionPage(),
        ]
      ),
      bottomNavigationBar: TabBar( 
          tabs: [
            Tab(
              icon: Icon(Icons.home)
            ),
            Tab(
              icon: Icon(Icons.notifications)
            ),
          ],
          labelColor: Color(0xff006600),
          unselectedLabelColor: Color(0xff141D1D),
          indicatorColor: Color(0xff006600),
        ),
        backgroundColor: Color(0xffEFEFEF),
      ),
    );
  }
}
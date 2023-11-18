import 'package:grass/models/asset.dart';
import 'package:grass/models/liability.dart';
import 'package:grass/models/milestone.dart';
import 'package:grass/models/redemption.dart';
import 'package:grass/models/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  static bool loaded = false;
  static int points = 0;
  static int netWorth = 0;
  static String pastAdvice = "";
  static String pastAdviceCat = "";
  static List<Transaction> transactions = List.empty(growable: true);
  static List<Milestone> milestones = List.empty(growable: true);
  static List<Asset> assets = List.empty(growable: true);
  static List<Liability> liabilities = List.empty(growable: true);
  static List<Redemption> redemptions = List.empty(growable: true);
  static Future loadUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    points = prefs.getInt("points")??points;
    pastAdvice = prefs.getString("pastAdvice")??pastAdvice;
    pastAdviceCat = prefs.getString("pastAdviceCat")??pastAdviceCat;

    List<String> categorires = prefs.getStringList("transactionCat")??List.empty(growable: true);
    List<String> amts = prefs.getStringList("transactionAmt")??List.empty(growable: true);
    for (var i = 0; i < categorires.length; i++) {
      transactions.add(Transaction(category: categorires[i], amt: int.parse(amts[i])));
    }

    categorires = prefs.getStringList("milestoneCat")??List.empty(growable: true);
    amts = prefs.getStringList("milestoneAmt")??List.empty(growable: true);
    for (var i = 0; i < categorires.length; i++) {
      milestones.add(Milestone(category: categorires[i], amt: int.parse(amts[i])));
    }

    categorires = prefs.getStringList("assetType")??List.empty(growable: true);
    amts = prefs.getStringList("assetAmt")??List.empty(growable: true);
    for (var i = 0; i < categorires.length; i++) {
      assets.add(Asset(type: categorires[i], amt: int.parse(amts[i])));
    }

    categorires = prefs.getStringList("liabilityCat")??List.empty(growable: true);
    amts = prefs.getStringList("liabilityAmt")??List.empty(growable: true);
    for (var i = 0; i < categorires.length; i++) {
      liabilities.add(Liability(type: categorires[i], amt: int.parse(amts[i])));
    }

    List<String> comp = prefs.getStringList("redeemComp")??List.empty(growable: true);
    List<String> description = prefs.getStringList("redeemDesc")??List.empty(growable: true);
    List<String> cost = prefs.getStringList("redeemCost")??List.empty(growable: true);
    for (var i = 0; i < categorires.length; i++) {
      redemptions.add(Redemption(company: comp[i], description: description[i], cost: int.parse(cost[i])));
    }
    loaded = true;
  }



  static Future saveUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("points", points);
    
    List<String> categorires = List.empty(growable: true);
    List<String> amts =  List.empty(growable: true);
    for (var i = 0; i < transactions.length; i++) {
      categorires.add((transactions[i]).category??"");
      amts.add((transactions[i].amt??0).toString());
    }
    prefs.setStringList("transactionCat", categorires);
    prefs.setStringList("transactionAmt", amts);

    categorires = List.empty(growable: true);
    amts =  List.empty(growable: true);
    for (var i = 0; i < milestones.length; i++) {
      categorires.add((milestones[i]).category??"");
      amts.add((milestones[i].amt??0).toString());
    }
    prefs.setStringList("milestoneCat", categorires);
    prefs.setStringList("milestoneAmt", amts);

    categorires = List.empty(growable: true);
    amts =  List.empty(growable: true);
    for (var i = 0; i < assets.length; i++) {
      categorires.add((assets[i]).type??"");
      amts.add((assets[i].amt??0).toString());
    }
    prefs.setStringList("assetCat", categorires);
    prefs.setStringList("assetAmt", amts);

    categorires = List.empty(growable: true);
    amts =  List.empty(growable: true);
    for (var i = 0; i < liabilities.length; i++) {
      categorires.add((liabilities[i]).type??"");
      amts.add((liabilities[i].amt??0).toString());
    }
    prefs.setStringList("liabilityCat", categorires);
    prefs.setStringList("liabilityAmt", amts);


    List<String> company = List.empty(growable: true);
    List<String> description = List.empty(growable: true);
    List<String> cost = List.empty(growable: true);
    for (var i = 0; i < redemptions.length; i++) {
      company.add((redemptions[i]).company??"");
      description.add((redemptions[i]).description??"");
      cost.add((redemptions[i].cost??0).toString());
    }
    prefs.setStringList("redeemComp", company);
    prefs.setStringList("redeemDesc", description);
    prefs.setStringList("redeemCost", cost);    
  }

  static void putDummyData(){
    points = 1000;
    transactions = [
      Transaction(category: "Groceries", amt: 2000),
      Transaction(category: "Restaurants", amt: 2000),
      Transaction(category: "Entertainment", amt: 2000),
      Transaction(category: "Rent", amt: 5000),
      Transaction(category: "Coffee", amt: 500),
    ];
    milestones = [
      Milestone(category: "Networth", amt: 1000),
    ];
    assets = [
      Asset(
        type: "Car",
        amt: 50000,
      ),
    ];
    liabilities = [
      Liability(
        type: "OSAP Student Loan",
        amt: 12000,
      ),
      Liability(
        type: "Student Line of Credit",
        amt: 30000,
      ),
    ];
    redemptions = [
      Redemption(company: "Indeed", description: "Get \$50 whem spending \$100", cost: 500),
    ];
    //saveUser();
    loaded = true;
  }
}
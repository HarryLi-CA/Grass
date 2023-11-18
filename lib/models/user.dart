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
  static List<Transaction> transactions = new List.empty();
  static List<Milestone> milestones = new List.empty();
  static List<Asset> assets = new List.empty();
  static List<Liability> liabilities = new List.empty();
  static List<Redemption> redemptions = new List.empty();
  static Future loadUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    points = prefs.getInt("points")??points;

    List<String> categorires = prefs.getStringList("transactionCat")??List.empty();
    List<String> amts = prefs.getStringList("transactionAmt")??List.empty();
    for (var i = 0; i < categorires.length; i++) {
      transactions.add(Transaction(category: categorires[i], amt: int.parse(amts[i])));
    }

    categorires = prefs.getStringList("milestoneCat")??List.empty();
    amts = prefs.getStringList("milestoneAmt")??List.empty();
    for (var i = 0; i < categorires.length; i++) {
      milestones.add(Milestone(category: categorires[i], amt: int.parse(amts[i])));
    }

    categorires = prefs.getStringList("assetType")??List.empty();
    amts = prefs.getStringList("assetAmt")??List.empty();
    for (var i = 0; i < categorires.length; i++) {
      assets.add(Asset(type: categorires[i], amt: int.parse(amts[i])));
    }

    categorires = prefs.getStringList("liabilityCat")??List.empty();
    amts = prefs.getStringList("liabilityAmt")??List.empty();
    for (var i = 0; i < categorires.length; i++) {
      liabilities.add(Liability(type: categorires[i], amt: int.parse(amts[i])));
    }

    List<String> comp = prefs.getStringList("redeemComp")??List.empty();
    List<String> description = prefs.getStringList("redeemDesc")??List.empty();
    List<String> cost = prefs.getStringList("redeemCost")??List.empty();
    for (var i = 0; i < categorires.length; i++) {
      redemptions.add(Redemption(company: comp[i], description: description[i], cost: int.parse(cost[i])));
    }
    loaded = true;
  }



  static Future saveUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("points", points);
    
    List<String> categorires = List.empty();
    List<String> amts =  List.empty();
    for (var i = 0; i < transactions.length; i++) {
      categorires.add((transactions[i]).category??"");
      amts.add((transactions[i].amt??0).toString());
    }
    prefs.setStringList("transactionCat", categorires);
    prefs.setStringList("transactionAmt", amts);

    categorires = List.empty();
    amts =  List.empty();
    for (var i = 0; i < milestones.length; i++) {
      categorires.add((milestones[i]).category??"");
      amts.add((milestones[i].amt??0).toString());
    }
    prefs.setStringList("milestoneCat", categorires);
    prefs.setStringList("milestoneAmt", amts);

    categorires = List.empty();
    amts =  List.empty();
    for (var i = 0; i < assets.length; i++) {
      categorires.add((assets[i]).type??"");
      amts.add((assets[i].amt??0).toString());
    }
    prefs.setStringList("assetCat", categorires);
    prefs.setStringList("assetAmt", amts);

    categorires = List.empty();
    amts =  List.empty();
    for (var i = 0; i < liabilities.length; i++) {
      categorires.add((liabilities[i]).type??"");
      amts.add((liabilities[i].amt??0).toString());
    }
    prefs.setStringList("liabilityCat", categorires);
    prefs.setStringList("liabilityAmt", amts);


    List<String> company = List.empty();
    List<String> description = List.empty();
    List<String> cost = List.empty();
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
    saveUser();
    loaded = true;
  }
}
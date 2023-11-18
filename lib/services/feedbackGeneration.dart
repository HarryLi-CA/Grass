import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:grass/models/milestone.dart';
import 'package:grass/models/transaction.dart';
import 'package:grass/models/user.dart';

class OpenAiFeedback {
  static final openAI = OpenAI.instance.build(
    token: "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",
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
    enableLog: true
  );
  static Future<String> generateFeedback(Function() stateUpdate) async{
    if(User.pastAdvice != ""){
      return User.pastAdvice;
    }
    String transactionPrompt = "";
    for (var i = 0; i < User.transactions.length; i++) {
      Transaction curTransaction = User.transactions[i];
      transactionPrompt += "${curTransaction.category??""} \$${curTransaction.amt}, ";
    }
    String prompt = "Give me 1 sentence specific category harsh criticism on my financial history, in a language university students will understand:$transactionPrompt";
    final request = CompleteText(prompt:prompt,
                model: TextDavinci3Model(), maxTokens: 200);
    final response = await openAI.onCompletion(request:request);
    print(response!.choices.last.text);
    String reply = response!.choices.last.text??"";
    prompt = "Previously you said($reply). Make a realistic milestone for a month of a non-essential category of spending needs to be reduced and by what percentage? Reply with the category and the percentage only, separated by comma, without explanation. Here is the financial history and spending: $transactionPrompt";
    
    final request2 = CompleteText(prompt:prompt,
                model: TextDavinci3Model(), maxTokens: 200);
    final response2 = await openAI.onCompletion(request:request2);
    print(response2!.choices.last.text);
    String milestone = response2.choices.last.text;
    List<String> milestoneSplit = milestone.split(", ");
    if(milestoneSplit[0]!=User.pastAdviceCat){
      User.milestones.add(Milestone(category: milestoneSplit[0].substring(2), amt: int.parse(milestoneSplit[1].split("%")[0])));
      stateUpdate();
    }
    User.pastAdvice = reply;
    return reply;
  }
}
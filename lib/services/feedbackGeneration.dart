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
  static Future<String> generateFeedback() async{
    String transactionPrompt = "";
    for (var i = 0; i < User.transactions.length; i++) {
      Transaction curTransaction = User.transactions[i];
      transactionPrompt += "${curTransaction.category??""} \$${curTransaction.amt}, ";
    }
    String prompt = "Give me 1 sentence harsh criticism on my financial history, in a language university students will understand:$transactionPrompt";
    final request = CompleteText(prompt:prompt,
                model: TextDavinci3Model(), maxTokens: 200);
    final response = await openAI.onCompletion(request:request);
    String reply = response!.object??"";
    prompt = "Which category of spending needs to be reduced and by what percentage? Reply with the category and the percentage only, separated by comma, without explanation: $transactionPrompt";
    
    final request2 = CompleteText(prompt:prompt,
                model: TextDavinci3Model(), maxTokens: 200);
    final response2 = await openAI.onCompletion(request:request2);
    String milestone = response2!.object;
    List<String> milestoneSplit = milestone.split(", |%");
    User.milestones.add(Milestone(category: milestoneSplit[0], amt: int.parse(milestoneSplit[1])));
    return reply;
  }
}
import 'package:flutter/material.dart';
import 'package:my_provider_app/resource/notifiers/eligibility_provider.dart';
import 'package:provider/provider.dart';

class EligibilityScreen extends StatelessWidget {
  final ageController = TextEditingController();

  EligibilityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligibilityScreenProvider>(
      create: (context) => EligibilityScreenProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Container(
                padding: const EdgeInsets.all(16),
                child: Form(
                  child: Consumer<EligibilityScreenProvider>(
                    builder: (context, provider, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (provider.isEligible == null)
                                  ? Colors.orangeAccent
                                  : provider.isEligible!
                                      ? Colors.green
                                      : Colors.redAccent,
                            ),
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: ageController,
                            decoration: const InputDecoration(
                              hintText: "Give your age",
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            child: TextButton(
                              child: provider.isLoading!
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ))
                                  : const Text(
                                      "Check",
                                      style: TextStyle(color: Colors.white),
                                    ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                Colors.blue,
                              )),
                              onPressed: () {
                                if(ageController.text.trim().isNotEmpty) {
                                  int age =
                                      int.parse(ageController.text.trim());
                                  provider.checkEligibility(age);
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(provider.eligibilityMessage)
                        ],
                      );
                    },
                  ),
                )),
          );
        },
      ),
    );
  }
}

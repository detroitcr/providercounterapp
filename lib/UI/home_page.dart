import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertutorial/MODELS/api_model.dart';
import 'package:providertutorial/Provider/get_data_provider.dart';

import '../API/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ApiPracticeModel practiceModel;
  late ApiService service;

  @override
  void initState() {
    super.initState();
    Provider.of<GetDataProvider>(context, listen: false).getRData(context);
  }

  @override
  Widget build(BuildContext context) {
    final getMd1 = Provider.of<GetDataProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: getMd1.isProcessing
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: getMd1.practice.data!.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.network(
                            getMd1.practice.data![index].avatar ?? '',

                            // practiceModel.data![index].avatar ?? '',
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                         const   Text('email : -'),
                            const SizedBox(width: 5,),
                            Text(
                              getMd1.practice.data![index].email!,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Name: -'),
                            Row(
                              children: [
                                Text(
                                  getMd1.practice.data![index].firstName!,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  getMd1.practice.data![index].lastName!,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              ),
      ),
    );
  }
}

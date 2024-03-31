import 'package:flutter/material.dart';
import 'package:petnymble/widgets/history_item.dart';
import 'package:petnymble/provider/history_provider.dart';
import 'package:provider/provider.dart';

class AdoptedHistoryScreen extends StatefulWidget {
  const AdoptedHistoryScreen({super.key});

  @override
  State<AdoptedHistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<AdoptedHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.060,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Adopted History",
                    style: TextStyle(
                      fontSize: size.width * 0.040,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.030,
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: context.watch<HistoryProvider>().historyList.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer<HistoryProvider>(
                              builder: (context, value, child) => Column(
                                children: value.historyList
                                    .map(
                                      (cartItem) => AdoptHistoryItem(
                                        historyItem: cartItem,
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          ],
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height * 0.25,
                              ),
                              Icon(
                                Icons.card_travel,
                                size: size.width * 0.20,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: size.height * 0.020,
                              ),
                              Text(
                                "Your Adopt is empty!",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Call loadState() when the screen/widget is initialized
    Provider.of<HistoryProvider>(context, listen: false).loadState();
  }
}

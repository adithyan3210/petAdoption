import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petnymble/model/pet_model.dart';
import 'package:petnymble/provider/history_provider.dart';
import 'package:petnymble/provider/pet_provider.dart';
import 'package:petnymble/widgets/pet_hero_image.dart';
import 'package:provider/provider.dart';

class AdoptingScreen extends StatefulWidget {
  const AdoptingScreen({Key? key, required this.pet}) : super(key: key);
  final PetModel pet;

  @override
  State<AdoptingScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<AdoptingScreen> {
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
                    "Pet Details",
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: size.width,
                                  height: size.height * 0.3,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: PetHero(
                                    image: widget.pet.image,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.015,
                                      ),
                                      Text(
                                        "About Me${widget.pet.name}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: size.width * 0.080,
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.010,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Name"),
                                          Text(widget.pet.name),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Age"),
                                          Text("${widget.pet.age} years")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    )),
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Price",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Rs ${widget.pet.price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Free",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.030),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.070,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<HistoryProvider>().addToCart(widget.pet);
                          context.read<PetProvider>().buyItem(widget.pet);
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return Center(
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Builder(builder: (context) {
                                    return Stack(
                                      children: [
                                        Lottie.asset(
                                          'assets/animations/pawanimation.json',
                                          fit: BoxFit.fitWidth,
                                        ),
                                        Lottie.asset(
                                          'assets/animations/popanimation.json',
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              );
                            },
                          );
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black,
                              content: Text(
                                "You've now adopted ${widget.pet.name}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          backgroundColor:
                              const Color.fromARGB(255, 112, 91, 222),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Adopt Me",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  'assets/images/dogfinger.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

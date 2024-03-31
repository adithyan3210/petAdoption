import 'package:flutter/material.dart';
import 'package:petnymble/widgets/pet_card.dart';
import 'package:petnymble/model/pet_model.dart';
import 'package:petnymble/provider/pet_provider.dart';
import 'package:provider/provider.dart';

class PetCategory extends StatefulWidget {
  final String title;
  final String search;
  const PetCategory({
    super.key,
    required this.title,
    required this.search,
  });

  @override
  State<PetCategory> createState() => _PetCategoryState();
}

class _PetCategoryState extends State<PetCategory> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String search = widget.search.toLowerCase();
    String title = widget.title;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: size.width * 0.055,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Consumer<PetProvider>(
            builder: (context, value, child) {
              List<PetModel> filteredPets = value.pet
                  .where((product) =>
                      product.category
                          .toLowerCase()
                          .contains(title.toLowerCase()) &&
                      (product.name.toLowerCase().contains(search) ||
                          product.category.toLowerCase().contains(search)))
                  .toList();
              return Row(
                children: filteredPets
                    .map((pet) => PetCard(
                          pet: pet,
                        ))
                    .toList(),
              );
            },
          ),
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
      ],
    );
  }
}

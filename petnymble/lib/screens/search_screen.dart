import 'package:flutter/material.dart';
import 'package:petnymble/widgets/pet_card.dart';
import 'package:petnymble/model/pet_model.dart';
import 'package:petnymble/provider/pet_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;
  bool showSearchResults = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var search = _searchController.text.toLowerCase();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Add border here
            borderRadius: BorderRadius.circular(10), // Optional: add border radius
          ),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                showSearchResults = value.isNotEmpty;
              });
            },
            decoration: const InputDecoration(
              hintText: 'Search Pets',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Show search results based on the entered query
              if (showSearchResults)
                Center(
                  child: Consumer<PetProvider>(
                    builder: (context, value, child) {
                      List<PetModel> filteredPets = value.pet
                          .where((pet) =>
                              pet.name.toLowerCase().contains(search) ||
                              pet.category.toLowerCase().contains(search))
                          .toList();
                      if (filteredPets.isEmpty) {
                        return const Text('No Pets Found');
                      }
                      return Column(
                        children: filteredPets
                            .map((pet) => PetCard(
                                  pet: pet,
                                ))
                            .toList(),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:petnymble/model/pet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetProvider extends ChangeNotifier {
  List<PetModel> _pet = [
    PetModel(
        name: "German Shepherd",
        age: 5,
        price: 9999,
        image:
            'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSM6HM1W3sF0CaA66OuR6lddF93hMGxjTnyr6h_7mReU1_AhTY6',
        isAvailable: true,
        category: "dog"),
    PetModel(
        name: "Bichon Frise",
        age: 7,
        price: 6999,
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Bichon_Fris%C3%A9_-_studdogbichon.jpg/640px-Bichon_Fris%C3%A9_-_studdogbichon.jpg',
        isAvailable: true,
        category: "dog"),
    PetModel(
        name: "Labrador",
        price: 5800,
        age: 10,
        image:
            'https://cdn.shopify.com/s/files/1/1708/4041/files/custom_resized_lab_480x480.jpg',
        isAvailable: true,
        category: "dog"),
    PetModel(
        name: "Beagle",
        age: 7,
        price: 4900,
        image:
            'https://cdn.britannica.com/16/234216-050-C66F8665/beagle-hound-dog.jpg',
        isAvailable: true,
        category: "dog"),
    PetModel(
        name: "Siberian Husky",
        age: 3,
        price: 10999,
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1_gQz61GddSSUfWmVILQEuzByejnIdB-2qGdxDwSXFeIOn8g-',
        isAvailable: true,
        category: "dog"),
    PetModel(
        name: "Doberman",
        age: 8,
        price: 10500,
        image:
            'https://cdn.shopify.com/s/files/1/1708/4041/files/custom_resized_Doberman_480x480.jpg',
        isAvailable: true,
        category: "dog"),
    PetModel(
        name: "Bengal Cat",
        age: 2,
        price: 1500,
        image:
            "https://cats.com/wp-content/uploads/2020/10/Bengal-cat-like-a-leopard-sneaks.jpg",
        isAvailable: true,
        category: "cat"),
    PetModel(
        name: "Persian Cat",
        age: 8,
        price: 2899,
        image:
            "https://www.thesprucepets.com/thmb/5OSN_p9hUfPssKsJORQDGnAz_tQ=/1963x0/filters:no_upscale():strip_icc()/GettyImages-181861505-4e63227ed0a14dc9bfe86848ef54caf3.jpg",
        isAvailable: true,
        category: "cat"),
    PetModel(
        name: "British Shorthair",
        age: 8,
        price: 2800,
        image:
            'https://www.thesprucepets.com/thmb/2HF5pGwbA1_74qlubXRyEM_xxlk=/2121x0/filters:no_upscale():strip_icc()/GettyImages-1319774380-c3da91f9259a47e0966007f8e10690ba.jpg',
        isAvailable: true,
        category: "cat"),
    PetModel(
        name: "Birman",
        age: 1,
        price: 3999,
        image:
            "https://www.thesprucepets.com/thmb/D5s03LINbIYpZuiG6uvBpKrAKXk=/3500x0/filters:no_upscale():strip_icc()/GettyImages-623368786-f66c97ad6d2d494287b448415f4340a8.jpg",
        isAvailable: true,
        category: "cat"),
    PetModel(
        name: "Parrot",
        age: 1,
        price: 1599,
        image:
            'https://www.treehugger.com/thmb/F5G8zaALRp7rvgWqDVT13t9pKY8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/close-up-of-scarlet-macaw-flying-in-mid-air-634869043-f360b379b8c44a28a052b41d99adc2a7.jpg',
        isAvailable: true,
        category: "Birds"),
    PetModel(
        name: "Love Birds",
        age: 2,
        price: 499,
        image:
            'https://images.fineartamerica.com/images-medium-large-5/single-love-bird-seeks-same-bryan-keil.jpg',
        isAvailable: true,
        category: "Birds"),
    PetModel(
        name: "Columbidae",
        age: 1,
        price: 1599,
        image:
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSw9Dh3-9LcK7v2NW1Xgg5lBzDdzYu3HY2YiJJeWw36iz0wR94-f57-4A8NdxFvoGNMlmxsQzd55MS2WSPX_acSJxRjilvjgiIMyZqJMg',
        isAvailable: true,
        category: "Birds"),
    PetModel(
        name: "Cockatoos",
        age: 1,
        price: 1599,
        image:
            'https://www.thesprucepets.com/thmb/mM9ajuBgNAAs-2QvuEn8KnIMn9E=/5200x0/filters:no_upscale():strip_icc()/two-white-cockatooes-643467100-db35b6ee10af4e579f7b77683d0b7fda.jpg',
        isAvailable: true,
        category: "Birds"),
    PetModel(
        name: "Queen angelfish",
        age: 1,
        price: 250,
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Queen_Angelfish.jpg/1200px-Queen_Angelfish.jpg',
        isAvailable: true,
        category: "Fish"),
    PetModel(
        name: "fighting fish",
        age: 1,
        price: 129,
        image:
            'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSNe-kZHvh6Q3bbFq3QgTyTSmaJEpO2d2fr8n2pBAgmSJYc7wBz',
        isAvailable: true,
        category: "Fish"),
    PetModel(
        name: "betta",
        age: 1,
        price: 599,
        image:
            'https://5.imimg.com/data5/SELLER/Default/2021/2/VG/XM/XD/47884844/dumbo-ear-halfmoon-betta-male--1000x1000.png',
        isAvailable: true,
        category: "Fish"),
    PetModel(
        name: "Guppy",
        age: 1,
        price: 49,
        image: 'https://cdn.britannica.com/02/117202-050-62267C8B/Guppy.jpg',
        isAvailable: true,
        category: "Fish"),
  ];

  List<PetModel> get pet => _pet;

  Future<void> buyItem(PetModel product) async {
    final PetModel item =
        _pet.firstWhere((element) => element.id == product.id);
    item.isAvailable = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedList = json.encode(_pet.map((item) => item.toMap()).toList());
    await prefs.setString('petList', encodedList);
    notifyListeners();
  }

  // Loading the history from shared preferences
  Future<void> loadState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonList = prefs.getString('petList');
    if (jsonList != null) {
      List<dynamic> decodedList = json.decode(jsonList);
      _pet = decodedList.map((item) => PetModel.fromMap(item)).toList();
    }
    notifyListeners();
  }
}

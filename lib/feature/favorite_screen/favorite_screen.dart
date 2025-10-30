import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_nti_app/core/color_manager/color_manager.dart';
import 'package:project_nti_app/feature/favorite_screen/widgets/buy_now_button.dart';
import 'package:project_nti_app/feature/favorite_screen/widgets/favorite_category_selector.dart';
import 'package:project_nti_app/feature/favorite_screen/widgets/favorite_item_card.dart';
import 'package:project_nti_app/feature/home_screen/model/product_model.dart';
import 'package:project_nti_app/feature/authentication/models/user_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String selectedCategory = "All";
  List<ProductModel> favProducts = [];
  UserModel? user;

  @override
  void initState() {
    super.initState();
    _getUserFavProducts();
  }

  Future<void> _getUserFavProducts() async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;

    final userDoc = await _firestore
        .collection('users')
        .doc(currentUser.uid)
        .get();
    user = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
    List<String> favIds = List<String>.from(user!.favList);

    QuerySnapshot productsSnapshot = await _firestore
        .collection('products')
        .get();
    List<ProductModel> allProducts = productsSnapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    final seenIds = <String>{};
    setState(() {
      favProducts = allProducts
          .where(
            (product) =>
                favIds.contains(product.id ?? '') &&
                (selectedCategory == "All" ||
                    product.category == selectedCategory),
          )
          .where((p) => p.id != null && seenIds.add(p.id!))
          .toList();
    });
  }

  void _filterCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
    _getUserFavProducts();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              Text(
                "Favorite’s",
                style: TextStyle(
                  color: ColorManager.darkGray,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.07,
                ),
              ),
              SizedBox(height: height * 0.02),
              FavoriteCategorySelector(
                selectedCategory: selectedCategory,
                onCategorySelected: _filterCategory,
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: favProducts.isEmpty
                    ? const Center(child: Text("No favorites yet"))
                    : ListView.builder(
                        itemCount: favProducts.length,
                        itemBuilder: (context, index) {
                          return FavoriteItemCard(product: favProducts[index]);
                        },
                      ),
              ),
              const BuyNowButton(),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}

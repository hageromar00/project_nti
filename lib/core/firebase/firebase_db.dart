import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_nti_app/feature/home_screen/model/product_model.dart';

import '../../feature/authentication/models/user_model.dart';

class FirebaseDataBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    UserModel user = UserModel(
      id: credential.user!.uid,
      name: name,
      email: email,
      password: password,
      favList: [],
    );

    await _firestore.collection('users').doc(user.id).set(user.toMap());
    return user;
  }

  Future<UserModel> signIn(String email, String password) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    DocumentSnapshot doc = await _firestore
        .collection('users')
        .doc(credential.user!.uid)
        .get();

    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  }

  Future<UserModel?> getCurrentUser() async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return null;

    DocumentSnapshot doc = await _firestore
        .collection('users')
        .doc(currentUser.uid)
        .get();

    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  }

  Future<void> updateFavList(String userId, List<String> favList) async {
    await _firestore.collection('users').doc(userId).update({
      'favList': favList,
    });
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  //Function to add Product to firebase
  Future<void> ProductToFirebase() async {
    final List<ProductModel> productsData = [
      // 👕 Clothes
      ProductModel(
        name: 'Casual T-Shirt',
        price: 29.99,
        image:
            'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
        description: 'Soft cotton T-shirt perfect for everyday wear.',
        category: 'Clothes',
      ),
      ProductModel(
        name: 'Denim Jacket',
        price: 59.99,
        image:
            'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
        description: 'Stylish denim jacket for a cool look.',
        category: 'Clothes',
      ),
      ProductModel(
        name: 'Summer Dress',
        price: 49.99,
        image: 'https://www.mytheresa.com/media/1094/1238/100/76/P01078119.jpg',
        description: 'Light and flowy dress for warm days.',
        category: 'Clothes',
      ),
      ProductModel(
        name: 'Graphic Hoodie',
        price: 39.99,
        image:
            'https://images.unsplash.com/photo-1520975918318-5b1a56b35ef9?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
        description: 'Warm hoodie with a cool graphic print.',
        category: 'Clothes',
      ),

      // 👟 Shoes
      ProductModel(
        name: 'Running Sneakers',
        price: 79.99,
        image:
            'https://images.unsplash.com/photo-1600180758891-2b547b1251d7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
        description: 'Lightweight running shoes with great grip.',
        category: 'Shoes',
      ),
      ProductModel(
        name: 'White Casual Sneakers',
        price: 69.99,
        image:
            'https://img.joomcdn.net/771862c7a2a906ff73612f20d13771b485db6369_original.jpeg',
        description: 'Trendy white sneakers that match any outfit.',
        category: 'Shoes',
      ),
      ProductModel(
        name: 'Leather Boots',
        price: 89.99,
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvFzUvde5cjuJ_E2AXLzz5cfdu9ndtfjFp_g&s',
        description: 'Durable leather boots for all seasons.',
        category: 'Shoes',
      ),
      ProductModel(
        name: 'High-Top Canvas Sneakers',
        price: 64.99,
        image:
            'https://images.unsplash.com/photo-1600180758804-f5a1f8c83e3c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
        description: 'Stylish high-top sneakers for everyday wear.',
        category: 'Shoes',
      ),

      // ⌚ Watches
      ProductModel(
        name: 'Classic Leather Watch',
        price: 120.0,
        image:
            'https://i5.walmartimages.com/seo/OLEVS-Brown-Leather-Watches-Men-Big-Gold-Dial-Mens-Roman-Numerals-Watches-Diamond-Watch-Date-Luxury-Quartz-Men-s-Watches-Waterproof-Wrist-Watches-Lum_d628c0ae-5dea-4b6d-85b6-cc6039c3a4f5.de88df1e8110f072191eab120ad30add.png',
        description: 'Elegant watch with a premium leather strap.',
        category: 'Watches',
      ),
      ProductModel(
        name: 'Smart Watch',
        price: 199.99,
        image:
            'https://images.unsplash.com/photo-1598970434795-0c54fe7c0642?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
        description: 'Stay connected and track fitness with this smart watch.',
        category: 'Watches',
      ),
      ProductModel(
        name: 'Gold Wristwatch',
        price: 250.0,
        image:
            'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
        description: 'Luxury gold-plated wristwatch for special occasions.',
        category: 'Watches',
      ),
      ProductModel(
        name: 'Fitness Smartwatch',
        price: 149.99,
        image: 'https://cdn.mos.cms.futurecdn.net/Pk5ydxYo6ty2Q4SX9vznP6.jpg',
        description: 'Smartwatch with fitness tracking and notifications.',
        category: 'Watches',
      ),

      // 👜 Bags
      ProductModel(
        name: 'Leather Handbag',
        price: 99.99,
        image:
            'https://www.letanneur.us/cdn/shop/files/TEMI1014G05-d_c4c045a7-8a31-4b47-943a-85913ad5c3df.jpg?v=1752221074',
        description: 'Stylish handbag crafted from genuine leather.',
        category: 'Bags',
      ),
      ProductModel(
        name: 'Travel Backpack',
        price: 79.99,
        image:
            'https://m.media-amazon.com/images/I/71CNbs4-ukL._AC_SL1447_.jpg',
        description: 'Durable and spacious backpack for daily or travel use.',
        category: 'Bags',
      ),
      ProductModel(
        name: 'Mini Shoulder Bag',
        price: 49.99,
        image:
            'https://images.unsplash.com/photo-1584917865442-de89df76afd3?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
        description: 'Compact and chic shoulder bag for casual outings.',
        category: 'Bags',
      ),
      ProductModel(
        name: 'Eco Leather Tote Bag',
        price: 119.99,
        image:
            'https://images.unsplash.com/photo-1584917865442-de89df76afd3?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
        description:
            'Large tote bag made from eco-friendly leather alternative.',
        category: 'Bags',
      ),
    ];

    for (var product in productsData) {
      await _firestore.collection('products').add(product.toJson());
    }
  }

  //get Products from firebase
  Future<List<ProductModel>> getProducts() async {
    QuerySnapshot querySnapshot = await _firestore.collection('products').get();

    // Convert the documents to ProductModel objects
    List<ProductModel> products = querySnapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return products;
  }
}

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
        image: 'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=800',
        description: 'Soft cotton T-shirt perfect for everyday wear.',
        category: 'Clothes',
      ),
      ProductModel(
        name: 'Denim Jacket',
        price: 59.99,
        image: 'https://images.unsplash.com/photo-1521223890158-f9f7c3d5d504?w=800',
        description: 'Stylish denim jacket for a cool look.',
        category: 'Clothes',
      ),
      ProductModel(
        name: 'Summer Dress',
        price: 49.99,
        image: 'https://i.pinimg.com/736x/6b/b0/ae/6bb0ae7e3d9a126383fcd2ee129db4d2.jpg',//done
        description: 'Light and flowy dress for warm days.',
        category: 'Clothes',
      ),
      ProductModel(
        name: 'Graphic Hoodie',
        price: 39.99,
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxeDz24-gdHUVx2Ndg2yePJAN8Xj8QCBjFXg&s',
        description: 'Warm hoodie with a cool graphic print.',
        category: 'Clothes',
      ),
      ProductModel(
        name: 'Oversized Sweatshirt',
        price: 34.99,
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0D66IV8oXfzUZ2QXY1w86o-KlWa4jHLKHVw&s',
        description: 'Comfy oversized sweatshirt for relaxed style.',
        category: 'Clothes',
      ),
      ProductModel(
        name: 'Plaid Shirt',
        price: 42.99,
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThisJYubnI1iidtz3yKdheD6RvSjTbYjLDVw&s',
        description: 'Classic plaid shirt for everyday casual wear.',
        category: 'Clothes',
      ),

      // 👟 Shoes
      ProductModel(
        name: 'Running Sneakers',
        price: 79.99,
        //done
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7QNE_b8OoOYG6SvcwIzP_sn9jBReH9CPyn8fw__4289Uz5T2D3edHziZ0jZArMWGH8xw&usqp=CAU',
        description: 'Lightweight running shoes with great grip.',
        category: 'Shoes',
      ),
      ProductModel(
        name: 'White Casual Sneakers',
        price: 69.99,
        //done
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF5zvK2lJGFNsZJaGuw0SjxD_lHv6W0BUFQw&s',
        description: 'Trendy white sneakers that match any outfit.',
        category: 'Shoes',
      ),
      ProductModel(
        name: 'Leather Boots',
        price: 89.99,
        //done
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvFzUvde5cjuJ_E2AXLzz5cfdu9ndtfjFp_g&s',
        description: 'Durable leather boots for all seasons.',
        category: 'Shoes',
      ),
      ProductModel(
        name: 'High-Top Canvas Sneakers',
        price: 64.99,
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSjKMxpD-f2-wBk-FFGFz0GC04FTg-ekHwng&s',
        description: 'Stylish high-top sneakers for everyday wear.',
        category: 'Shoes',
      ),
      ProductModel(
        name: 'Slip-On Trainers',
        price: 54.99,
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm0SvwsAsW1DZordWcMxzaUIPRrk71kaxVEg&s',
        description: 'Comfortable slip-on trainers for daily use.',
        category: 'Shoes',
      ),
      ProductModel(
        name: 'Retro Running Shoes',
        price: 74.99,
        image: 'https://www.fashionbeans.com/wp-content/uploads/2019/04/retro-sneakers-19-top-1.jpg',
        description: 'Stylish retro sneakers with breathable fabric.',
        category: 'Shoes',
      ),

      // ⌚ Watches
      ProductModel(
        name: 'Classic Leather Watch',
        price: 120.0,
        //done
        image: 'https://www.titan.co.in/dw/image/v2/BKDD_PRD/on/demandware.static/-/Sites-titan-master-catalog/default/dwbcf87c5d/images/Titan/Catalog/90189WL01_1.jpg?sw=600&sh=600',
        description: 'Elegant watch with a premium leather strap.',
        category: 'Watches',
      ),
      ProductModel(
        name: 'Smart Watch',
        price: 199.99,
        image: 'https://m.media-amazon.com/images/I/61pIzNaNRWL.jpg', //done
        description: 'Stay connected and track fitness with this smart watch.',
        category: 'Watches',
      ),
      ProductModel(
        name: 'Gold Wristwatch',
        price: 250.0,
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQzVdDeT_W-jH80feBXXu5KZIX88RWxvV_vA&s',//done
        description: 'Luxury gold-plated wristwatch for special occasions.',
        category: 'Watches',
      ),
      ProductModel(
        name: 'Fitness Smartwatch',
        price: 149.99,
        image: 'https://pyxis.nymag.com/v1/imgs/921/c0c/d56eeaa21522d8918ee1cedde9dea91293.rsquare.w600.jpg', //done
        description: 'Smartwatch with fitness tracking and notifications.',
        category: 'Watches',
      ),
      ProductModel(
        name: 'Digital Sports Watch',
        price: 89.99,
        image: 'https://m.media-amazon.com/images/I/616ZpI9EadL._AC_UY1000_.jpg',
        description: 'Sporty digital watch with waterproof design.',
        category: 'Watches',
      ),
      ProductModel(
        name: 'Chronograph Steel Watch',
        price: 139.99,
        image: 'https://m.media-amazon.com/images/I/81SaDsBddtL._AC_UY350_.jpg',
        description: 'Elegant stainless steel chronograph watch with precise detailing.',
        category: 'Watches',
      ),

      // 👜 Bags
      ProductModel(
        name: 'Leather Handbag',
        price: 99.99,
        image: 'https://s.alicdn.com/@sc04/kf/H3445853a67034d678535459b352db2a8C.jpg?avif=close&webp=close',
        description: 'Stylish handbag crafted from genuine leather.',
        category: 'Bags',
      ),
      ProductModel(
        name: 'Travel Backpack',
        price: 79.99,
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPRn2oBgbG8l5ak3rlt3InaQ1rBD3MBc-GyA&s',
        description: 'Durable and spacious backpack for daily or travel use.',
        category: 'Bags',
      ),
      ProductModel(
        name: 'Mini Shoulder Bag',
        price: 49.99,
        image: 'https://m.media-amazon.com/images/I/41vFIMFbWHL._AC_UY1000_.jpg',
        description: 'Compact and chic shoulder bag for casual outings.',
        category: 'Bags',
      ),
      ProductModel(
        name: 'Eco Leather Tote Bag',
        price: 119.99,
        image: 'https://cdn.iceberg.com.filoblu.com/rx/ofmt_webp/media/catalog/product/2/5/25IK2P1722769379000-U_3.JPG',
        description: 'Large tote bag made from eco-friendly leather alternative.',
        category: 'Bags',
      ),
      ProductModel(
        name: 'Crossbody Bag',
        price: 59.99,
        image: 'https://m.media-amazon.com/images/I/51t3jnd1lUL._AC_SL1001_.jpg',
        description: 'Trendy crossbody bag with adjustable strap.',
        category: 'Bags',
      ),
      ProductModel(
        name: 'Laptop Backpack',
        price: 89.99,
        image: 'https://m.media-amazon.com/images/I/717Rp03xdmL._AC_SL1500_.jpg',
        description: 'Spacious laptop backpack with multiple compartments.',
        category: 'Bags',
      ),
    ];

    for (var product in productsData) {
      final docRef = _firestore.collection('products').doc();
      product.id = docRef.id;
      await docRef.set(product.toJson());
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

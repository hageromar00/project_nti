import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/color_manager/color_manager.dart';

class FavoriteToggleIcon extends StatefulWidget {
  final String productName;
  final String userId;

  const FavoriteToggleIcon({
    super.key,
    required this.productName,
    required this.userId,
  });

  @override
  State<FavoriteToggleIcon> createState() => _FavoriteToggleIconState();
}

class _FavoriteToggleIconState extends State<FavoriteToggleIcon> {
  bool isFavorite = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    DocumentSnapshot userDoc = await _firestore
        .collection('users')
        .doc(widget.userId)
        .get();
    List favList = (userDoc.data() as Map<String, dynamic>)['favList'] ?? [];
    setState(() {
      isFavorite = favList.contains(widget.productName);
    });
  }

  void _toggleFavorite() async {
    DocumentReference userRef = _firestore
        .collection('users')
        .doc(widget.userId);
    DocumentSnapshot userDoc = await userRef.get();
    List favList = List<String>.from(
      (userDoc.data() as Map<String, dynamic>)['favList'] ?? [],
    );

    setState(() {
      if (isFavorite) {
        favList.remove(widget.productName);
        isFavorite = false;
      } else {
        if (!favList.contains(widget.productName)) {
          favList.add(widget.productName);
        }
        isFavorite = true;
      }
    });

    await userRef.update({'favList': favList});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        onPressed: _toggleFavorite,
        icon: isFavorite
            ? ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [Colors.red, Colors.orange],
                  ).createShader(bounds);
                },
                child: const Icon(
                  Icons.favorite,
                  size: 25,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.favorite_border, size: 25, color: Colors.grey),
      ),
    );
  }
}

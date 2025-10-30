import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_nti_app/feature/home_screen/model/product_model.dart';

import '../../../core/firebase/firebase_db.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.firebaseDataBase}) : super(ProductInitial());
  FirebaseDataBase firebaseDataBase ;
  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];

  //get Products from firebase
  Future<void> getProducts() async {
    emit(ProductLoading());
    try {
      products = await firebaseDataBase.getProducts();
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }


  // filter products by type
  //getData by category
  void filterProductsByType(String productType) {
    filteredProducts = products.where((product) {
      return product.category == productType;
    }).toList();
    emit(ProductSuccess(filteredProducts));
  }
}

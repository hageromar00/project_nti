import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_nti_app/feature/home_screen/cubit/product_cubit.dart';
import 'package:project_nti_app/feature/home_screen/widget/categoty_selector.dart';
import 'package:project_nti_app/feature/home_screen/widget/custom_home_app_bar.dart';
import 'package:project_nti_app/feature/home_screen/widget/custom_search_filter.dart';
import 'package:project_nti_app/feature/home_screen/widget/favorite_toggle_icon.dart';
import 'package:project_nti_app/feature/show_product_details/show_product_details.dart';
import '../../core/color_manager/color_manager.dart';
import '../../core/utils/size_config.dart';

class HomeScreenProduct extends StatefulWidget {
  final String name;
  const HomeScreenProduct({super.key,required this.name});

  @override
  State<HomeScreenProduct> createState() => _HomeScreenProductState();
}

class _HomeScreenProductState extends State<HomeScreenProduct> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.local_fire_department, 'label': 'Popular'},
    {'icon': Icons.checkroom, 'label': 'Clothes'},
    {'icon': Icons.watch, 'label': 'Watches'},
    {'icon': Icons.backpack, 'label': 'Bags'},
  ];

  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.h(24),
          left: SizeConfig.w(16),
          right: SizeConfig.w(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomHomeAppBar(name: widget.name,),
              SizedBox(height: SizeConfig.h(20)),
              const CustomSearchFilter(),
              SizedBox(height: SizeConfig.h(20)),

              SizedBox(
                height: SizeConfig.h(70),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryItem(
                      icon: category['icon'],
                      label: category['label'],
                      isSelected: selectedIndex == index,
                      onPressed: () {
                        if (category['label'] == 'Popular') {
                          context.read<ProductCubit>().getProducts();
                        } else {
                          context.read<ProductCubit>().filterProductsByType(category['label']);
                        }
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: SizeConfig.h(20)),

              BlocConsumer<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductError) {
                    return Text(state.error);
                  }
                  if (state is ProductLoading) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.darkGray,
                        ),
                      ),
                    );
                  }

                  if (state is ProductSuccess) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.products.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                        SizeConfig.screenWidth < 600 ? 2 : 4,
                        mainAxisExtent: SizeConfig.h(250),
                        crossAxisSpacing: SizeConfig.w(10),
                        mainAxisSpacing: SizeConfig.h(10),
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ShowDetailsScreen(product: state.products[index],)
                          ,));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                      const BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child: Image.network(
                                        state.products[index].image,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      right: 5,
                                      top: 5,
                                      child: FavoriteToggleIcon(
                                        productName:
                                        state.products[index].name,
                                        userId: FirebaseAuth
                                            .instance.currentUser!.uid,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.products[index].name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "\$${state.products[index].price}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  return const SizedBox();
                },
                listener: (context, state) {
                  if (state is ProductError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

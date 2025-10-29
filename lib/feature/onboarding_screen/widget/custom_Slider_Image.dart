import 'dart:async';
import 'package:flutter/material.dart';

class CustomSliderImage extends StatefulWidget {
  const CustomSliderImage({super.key});

  @override
  State<CustomSliderImage> createState() => _CustomSliderImageState();
}

class _CustomSliderImageState extends State<CustomSliderImage> {
  final List<String> dataList = [
    'assets/onboarding1.jpg',
    'assets/onboarding2.jpg',
    'assets/onboarding3.jpg',
  ];

  late PageController pageController;
  int currentIndex = 1;
  Timer? autoScrollTimer;

  List<String> get loopedList {
    return [dataList.last, ...dataList, dataList.first];
  }

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 0.8,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var img in loopedList) {
        precacheImage(AssetImage(img), context);
      }
    });

    startAutoScroll();
  }

  void startAutoScroll() {
    autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (!pageController.hasClients) return;

      currentIndex++;
      await pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );

      if (currentIndex == loopedList.length - 1) {
        currentIndex = 1;
        pageController.jumpToPage(currentIndex);
      }
    });
  }

  @override
  void dispose() {
    autoScrollTimer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final sliderWidth = screenWidth ;
    final sliderHeight = screenHeight * 0.6;

    return SizedBox(
      width: sliderWidth,
      height: sliderHeight,
      child: PageView.builder(
        controller: pageController,
        itemCount: loopedList.length,
        physics: const ClampingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return carouselView(index, sliderWidth, sliderHeight);
        },
      ),
    );
  }

  Widget carouselView(int index, double sliderWidth, double sliderHeight) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          double scale = 1.0;
          if (pageController.position.haveDimensions) {
            double page = pageController.page ?? 0.0;
            scale = (1 - ((page - index).abs() * 0.2)).clamp(0.8, 1.0);
          }
          return Transform.scale(
            scale: scale,
            child: Container(
              width: sliderWidth,
              height: sliderHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(loopedList[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class CarouselSlider extends StatefulWidget {
//   CarouselSlider(
//       {@required this.items,
//       this.images,
//       this.height,
//       this.aspectRatio: 16 / 9,
//       this.viewportFraction: 0.8,
//       this.initialPage: 0,
//       int realPage: 10000,
//       this.enableInfiniteScroll: true,
//       this.reverse: false,
//       this.autoPlay: false,
//       this.autoPlayInterval: const Duration(seconds: 4),
//       this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
//       this.autoPlayCurve: Curves.fastOutSlowIn,
//       this.pauseAutoPlayOnTouch,
//       this.enlargeCenterPage = false,
//       this.onPageChanged,
//         this.scrollPhysics,
//       this.scrollDirection: Axis.horizontal})
//       : this.realPage = enableInfiniteScroll ? realPage + initialPage : initialPage,
//         this.pageController = PageController(
//           viewportFraction: viewportFraction,
//           initialPage: enableInfiniteScroll ? realPage + initialPage : initialPage,
//         );
//   final List images;

//   final List<Widget> items;

//   final double height;

//   final double aspectRatio;

//   final num viewportFraction;
//   final num initialPage;

//   final num realPage;

//   final bool enableInfiniteScroll;

//   final bool reverse;

//   final bool autoPlay;

//   final Duration autoPlayInterval;

//   final Duration autoPlayAnimationDuration;

//   final Curve autoPlayCurve;

//   final Duration pauseAutoPlayOnTouch;

//   final bool enlargeCenterPage;

//   final Axis scrollDirection;

//   final Function(int index) onPageChanged;

//   final ScrollPhysics scrollPhysics;

//   final PageController pageController;

//   Future<void> nextPage({Duration duration, Curve curve}) {
//     return pageController.nextPage(duration: duration, curve: curve);
//   }


//   Future<void> previousPage({Duration duration, Curve curve}) {
//     return pageController.previousPage(duration: duration, curve: curve);
//   }
//   void jumpToPage(int page) {
//     final index = _getRealIndex(pageController.page.toInt(), realPage, items.length);
//     return pageController.jumpToPage(pageController.page.toInt() + page - index);
//   }

//   Future<void> animateToPage(int page, {Duration duration, Curve curve}) {
//     final index = _getRealIndex(pageController.page.toInt(), realPage, items.length);
//     return pageController.animateToPage(pageController.page.toInt() + page - index,
//         duration: duration, curve: curve);
//   }

//   @override
//   _CarouselSliderState createState() => _CarouselSliderState();
// }

// class _CarouselSliderState extends State<CarouselSlider> with TickerProviderStateMixin {
//   Timer timer;
//   int _currentImageIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     timer = getTimer();
//   }

//   Timer getTimer() {
//     return Timer.periodic(widget.autoPlayInterval, (_) {
//       if (widget.autoPlay) {
//         widget.pageController
//             .nextPage(duration: widget.autoPlayAnimationDuration, curve: widget.autoPlayCurve);
//       }
//     });
//   }

//   void pauseOnTouch() {
//     timer.cancel();
//     timer = Timer(widget.pauseAutoPlayOnTouch, () {
//       timer = getTimer();
//     });
//   }

//   Widget getWrapper(Widget child) {
//     if (widget.height != null) {
//       final Widget wrapper = Container(height: widget.height, child: child);
//       return widget.autoPlay && widget.pauseAutoPlayOnTouch != null
//           ? addGestureDetection(wrapper)
//           : wrapper;
//     } else {
//       final Widget wrapper = AspectRatio(aspectRatio: widget.aspectRatio, child: child);
//       return widget.autoPlay && widget.pauseAutoPlayOnTouch != null
//           ? addGestureDetection(wrapper)
//           : wrapper;
//     }
//   }

//   Widget addGestureDetection(Widget child) =>
//       GestureDetector(onPanDown: (_) => pauseOnTouch(), child: child);

//   @override
//   void dispose() {
//     super.dispose();
//     timer?.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
    

//     return getWrapper(PageView.builder(
//       physics: widget.scrollPhysics,
//       scrollDirection: widget.scrollDirection,
//       controller: widget.pageController,
//       reverse: widget.reverse,
//       itemCount: widget.enableInfiniteScroll ? null : widget.items.length,
//       onPageChanged: (int index) {
//         int currentPage = _getRealIndex(index + widget.initialPage, widget.realPage, widget.items.length);
//         if (widget.onPageChanged != null) {
//           widget.onPageChanged(currentPage);
//         }
//       },
//       itemBuilder: (BuildContext context, int i) {
//         final int index =
//             _getRealIndex(i + widget.initialPage, widget.realPage, widget.items.length);

//         return AnimatedBuilder(
//           animation: widget.pageController,
//           child: widget.items[index],
//           builder: (BuildContext context, child) {
//             if (widget.pageController.position.minScrollExtent == null ||
//                 widget.pageController.position.maxScrollExtent == null) {
//               Future.delayed(Duration(microseconds: 1), () {
//                 setState(() {});
//               });
//               return Container();
//             }
//             double value = widget.pageController.page - i;
//             value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);

//             final double height =
//                 widget.height ?? MediaQuery.of(context).size.width * (1 / widget.aspectRatio);
//             final double distortionValue =
//                 widget.enlargeCenterPage ? Curves.easeOut.transform(value) : 1.0;

//             if (widget.scrollDirection == Axis.horizontal) {
//               return Center(child: SizedBox(height: distortionValue * height, child: child));
//             } else {
//               return Center(
//                   child: SizedBox(
//                       width: distortionValue * MediaQuery.of(context).size.width, child: child));
//             }
//           },
//         );
//       },
//     ));
//   }
// }

// int _getRealIndex(int position, int base, int length) {
//   final int offset = position - base;
//   return _remainder(offset, length);
// }

// int _remainder(int input, int source) {
//   final int result = input % source;
//   return result < 0 ? source + result : result;
// }
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ostadecommerce/app/app_colors.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({
    super.key, required this.imageUrls,
  });
  final List<String>imageUrls;
  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 220.0,
              aspectRatio: 1,
              viewportFraction: 1,
            onPageChanged: (int index,CarouselPageChangedReason reason){
            _currentIndex.value = index;
            }
          ),
          items: widget.imageUrls.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      image: DecorationImage(image: NetworkImage(i),fit: BoxFit.scaleDown)
                    ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context,value,child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i =0;i<widget.imageUrls.length;i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: value==i?AppColors.themeColor:null,
                        border: Border.all(color: Colors.grey)
                      ),
                    ),

                ],
              );
            }
          ),
        )
      ],
    );
  }
}

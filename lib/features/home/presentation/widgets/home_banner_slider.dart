import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ostadecommerce/app/app_colors.dart';

class HomeBannerSlider extends StatefulWidget {
  const HomeBannerSlider({
    super.key,
  });

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {
  ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 180.0,
              aspectRatio: 1,
              viewportFraction: 1,
            onPageChanged: (int index,CarouselPageChangedReason reason){
            _currentIndex.value = index;
            }
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context,value,child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i =0;i<5;i++)
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
        )
      ],
    );
  }
}

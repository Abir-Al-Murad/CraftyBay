import 'package:flutter/material.dart';
import 'package:ostadecommerce/app/app_colors.dart';
import 'package:ostadecommerce/app/assests_paths.dart';
import 'package:ostadecommerce/app/utils/constants.dart';
import 'package:ostadecommerce/features/products/presentation/widgets/total_price_and_cart_section.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/increment_decrement_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context,index){
            return Card(
              color: Colors.white,
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16),
              shadowColor: AppColors.themeColor.withOpacity(0.1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:EdgeInsets.all(4),
                    decoration:BoxDecoration(

                    ),
                    child: Image.asset(
                      AssetPaths.dummyShoePng,height: 100,width: 100,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Nike Shoe - 2025 Edition",style: TextTheme.of(context).titleSmall,),
                                    Text("Size: XL   Color: Red",style: TextTheme.of(context).bodySmall,),
                                  ],
                                ),
                              ),
                              IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Text(
                                  '${takaSign}1000',
                                  style: TextTheme.of(context).titleSmall?.copyWith(
                                    color: AppColors.themeColor
                                  ),
                                ),
                              IncrementDecrementButton(onChange: (int value){

                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

            );
          }, separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 8,
                );
          },)),
          TotalPriceAndCartSection(),

        ],
      ),
    );
  }
}

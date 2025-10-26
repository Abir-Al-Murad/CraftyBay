import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/app/app_colors.dart';
import 'package:ostadecommerce/features/review/presentation/controllers/review_list_controller.dart';
import 'package:ostadecommerce/features/review/presentation/screens/add_review_screen.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/centered_circuler_progress.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key, required this.productId});
  final String productId;
  static const name = '/review-list';

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  final ScrollController _scrollController = ScrollController();
  final ReviewListController _reviewListController = Get.find<ReviewListController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _reviewListController.getReviewList(widget.productId);
      _scrollController.addListener(loadMore);
    });
  }

  void loadMore() {
    if (_scrollController.position.extentAfter < 300 &&
        !_reviewListController.getReviewListProgress) {
      print("Loading More Data");
      _reviewListController.getReviewList(widget.productId);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(loadMore);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reviews")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reviews(${_reviewListController.totalReviews.toString()})",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 10,),
             GetBuilder<ReviewListController>(
                builder: (controller) {
                  print(_reviewListController.riviewList.length);
                  if(controller.isInitialLoading){
                    return CenteredCirculerProgress();
                  }
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async{
                        _reviewListController.refreshReviewList(widget.productId);
                      },
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: _reviewListController.riviewList.length + (_reviewListController.getReviewListProgress ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index >= _reviewListController.riviewList.length) {
                              return Padding(
                                padding: EdgeInsets.all(16),
                                child: Center(child: CircularProgressIndicator()),
                              );
                            }

                            return Container(
                              padding: EdgeInsets.all(18),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 1,
                                        blurRadius: 4
                                    )
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey.shade200,
                                        child: Icon(Icons.person_outline),
                                      ),
                                      SizedBox(width: 5,),
                                      Text("${controller.riviewList[index].firstName} ${controller.riviewList[index].lastName}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(controller.riviewList[index].comment),
                                ],
                              ),
                            );
                          }),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Object? isSuccess = await Navigator.pushNamed(context, AddReviewScreen.name, arguments: widget.productId);
          if(isSuccess == true){
            _reviewListController.refreshReviewList(widget.productId);
          }
        },
        child: Icon(Icons.add, color: Colors.white),
        shape: const CircleBorder(),
        backgroundColor: AppColors.themeColor,
      ),
    );
  }
}

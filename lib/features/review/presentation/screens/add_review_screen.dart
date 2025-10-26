import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/features/review/presentation/controllers/review_list_controller.dart';
import 'package:ostadecommerce/features/review/presentation/widgets/review_text_field.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/centered_circuler_progress.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/snack_bar_message.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key, required this.productId});
  static const name = '/add-review';
  final String productId;

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final ReviewListController _reviewListController = ReviewListController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 10,
          children: [
            SizedBox(height: 20,),
            ReviewTextField(firstNameController: _firstNameController, maxline: 1, hintText: 'First Name',),
            ReviewTextField(firstNameController: _lastNameController, maxline: 1, hintText: "Last Name"),
            ReviewTextField(firstNameController: _commentController, maxline: 5, hintText: 'Write Review'),
            SizedBox(height: 8,),
            GetBuilder<ReviewListController>(
              builder: (controller) {
                return Visibility(
                    visible: controller.addReviewInProgress == false,
                    replacement: CenteredCirculerProgress(),
                    child: FilledButton(onPressed:_onTapSubmit, child: Text("Submit")));
              }
            ),
          ],
        ),
      ),
    );
  }

  void _onTapSubmit(){
    if(_commentController.text.isEmpty){
      showSnackBarMessage(context, 'Comment Box is Empty');
    }else{
      submit();
    }
  }

  Future<void> submit()async{
    final bool isSuccess =await _reviewListController.addReview(widget.productId, _commentController.text);
    if(isSuccess){
      showSnackBarMessage(context, "Review submitted successfully");
      Navigator.pop(context,true);
    }else{
      showSnackBarMessage(context, _reviewListController.errorMessage!);
    }
  }
}


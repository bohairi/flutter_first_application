import 'package:flutter/material.dart';
import 'package:flutter_first_application/qiuz_test/answer_model.dart';

class CostumButton extends StatelessWidget{
  AnswerModel answerModel;
  VoidCallback index;
  VoidCallback score;
  CostumButton({required this.answerModel, required this.index,required this.score});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      answerModel.onPressed();
      index();
      score();
    }, child: Text(answerModel.answer));
  }
}
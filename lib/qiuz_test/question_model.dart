import 'package:flutter/material.dart';
import 'package:flutter_first_application/qiuz_test/answer_model.dart';

class QuestionModel {
  String question;
  List <AnswerModel> listOfAnswerModel;

  QuestionModel({required this.question,required this.listOfAnswerModel});
}
import 'package:flutter/material.dart';
import 'package:flutter_first_application/qiuz_test/answer_model.dart';
import 'package:flutter_first_application/qiuz_test/costum_button.dart';
import 'package:flutter_first_application/qiuz_test/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    question: "What is your fav color?",
    listOfAnswerModel: [
      AnswerModel(onPressed: () {}, answer: "red"),
      AnswerModel(onPressed: () {}, answer: "blue"),
      AnswerModel(onPressed: () {}, answer: "green"),
    ],
  ),
  QuestionModel(
    question: "What is your fav car?",
    listOfAnswerModel: [
      AnswerModel(onPressed: () {}, answer: "BMW"),
      AnswerModel(onPressed: () {}, answer: "MARCEDES"),
      AnswerModel(onPressed: () {}, answer: "TYOTA"),
    ],
  ),
  QuestionModel(
    question: "What is your fav city?",
    listOfAnswerModel: [
      AnswerModel(onPressed: () {}, answer: "Irbid"),
      AnswerModel(onPressed: () {}, answer: "Amman"),
      AnswerModel(onPressed: () {}, answer: "Aqaba"),
    ],
  ),
  QuestionModel(
    question: "What is your fav food?",
    listOfAnswerModel: [
      AnswerModel(onPressed: () {}, answer: "mansaf"),
      AnswerModel(onPressed: () {}, answer: "makmoura"),
      AnswerModel(onPressed: () {}, answer: "msakhan"),
    ],
  ),
];
List<AnswerModel> answers = [
  AnswerModel(onPressed: () {}, answer: "red"),
  AnswerModel(onPressed: () {}, answer: "blue"),
  AnswerModel(onPressed: () {}, answer: "green"),
];

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  int netidex = questions.length - 1;
  int score = 0;
  int netscore = questions.length * 5;
  @override
  Widget build(BuildContext context) {
      bool endQuiz = score == netscore+1;
      //?
    return Scaffold(
      backgroundColor: Color.fromARGB(205, 71, 117, 222),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          "Quiz App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child:  endQuiz ? Center(
          child: Card(
            color: Colors.blueGrey,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.celebration,
                  size: 80,
                  color: const Color.fromARGB(255, 106, 226, 95),),
                  Text("Congratulation your score is $netscore",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),),
                   TextButton.icon(onPressed: () {
                    setState(() {
                      index = 0;
                      score = 0;
                    });
                  }, label: Text("Reset Quiz",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.amber
                  ),)),
                ],
              ),
            ),
          ),
        ) : Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              questions[index].question,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    questions[index].listOfAnswerModel.map((a) {
                      return CostumButton(
                        answerModel: a,
                        index: () {
                          setState(() {
                            if (index != netidex) {
                              index++;
                            }
                          });
                        },
                        score: () {
                          setState(() {
                            if (score != netscore) {
                              score += 5;
                            }
                          });
                        },
                      );
                    }).toList(),
              ),
            ),
            TextButton.icon(onPressed: () {
              setState(() {
                index = 0;
                score = 0;
              });
            }, label: Text("Reset Quiz",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.amber
            ),)),
            Text(
              "Your Score is : $score",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(onPressed: (){
              setState(() {
                if (score == netscore){
                  score++;
                }
              });
            }, child: Text("Quiz End",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.redAccent
            ),))
          ],
        ),
      ),
    );
  }
}

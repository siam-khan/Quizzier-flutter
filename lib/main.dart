import 'package:flutter/material.dart';

import 'quiz_brain.dart';

QuizBrain quizBrain= QuizBrain();

void main() {
  runApp( Quizzler());
}
class Quizzler extends StatelessWidget {
  const Quizzler({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: QuizPage(),),),
        
        
        ),
        
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({ Key? key }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper=[];
  
  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getCorrectAnswer();
     setState(() {
        if(userPickedAnswer==correctAnswer){
                // print("user got it r8!");
               scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
              }else{
                // print("user got it wrong");
                scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
              }
 
    quizBrain.nextQuestion();
 });
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween
      ,
      crossAxisAlignment: CrossAxisAlignment.stretch
      ,
      children:  [
        Expanded(
          flex: 5,
          
          child: Padding(padding: EdgeInsets.all(10.0),
          child: Center(child: Text(quizBrain.geQuestionText(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25.0,color: Colors.white),
          ),
          ),
          ),
          ),

          Expanded(
            child: Padding(padding: EdgeInsets.all(15.0),
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.green,
            child: Text("True",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
            ),
            onPressed: (){

              
checkAnswer(true);
              

      
 
            }, 
            ),
            ),
            ),
Expanded(
  child: Padding(padding: EdgeInsets.all(15.0),
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.red,
            child: Text("Flase",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
            ),
            onPressed: (){

checkAnswer(false);

            }, 
            ),
            ),
            ),

Row(
  children:scoreKeeper,
),

      ],
    );
  }
}
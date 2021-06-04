import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String output="0";
  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";
  buttonPressed(String buttonText){
    if(buttonText=="CLEAR"){
      _output="0";
      num1=0.0;
      num2=0.0;
      operand="";
    }
    else if(buttonText=="+"||buttonText=="-"||buttonText=="X"||buttonText=="/"){
      num1=double.parse(output);
      operand=buttonText;
      _output="0";
    }
    else if(buttonText=="."){
      if(_output.contains(".")){
        print("Already contains a decimal");
        return;
      }
      else{output=_output+buttonText;}
    }
    else if(buttonText=="="){
      num2=double.parse(_output);
      if (operand=="+"){
        _output=(num1+num2).toString();
      }
      if (operand=="-"){
        _output=(num1-num2).toString();
      }
      if (operand=="X"){
        _output=(num1*num2).toString();
      }
      if (operand=="/"){
        _output=(num1/num2).toString();
      }
      num1=0.0;
      num2=0.0;
      operand="";
    }
    else {
      _output=_output+buttonText;
    }
    print(_output);setState(() {
      output=double.parse(_output).toString();
    });
}
    Widget buildButton(String buttonText){
    return Expanded(child: OutlineButton(
      child: Text(buttonText),
      padding: EdgeInsets.all(24.0),
      onPressed: () =>
       buttonPressed(buttonText),
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children:<Widget> [
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.symmetric(vertical: 24.0,horizontal: 12.0),
          ),
          Text(output
            ,style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 40.0,
          ),),
          Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("X")
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+")
                ],
              ),
              Row(
                children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}





import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  //Button Widget
  Widget Calcbutton(String btntxt,Color btncolor,Color txtcolor){
    return
      ElevatedButton(
        onPressed: (){
          Calculation(btntxt);
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          //color: btncolor,
          backgroundColor: btncolor,
          padding: const EdgeInsets.all(20),),
        child: Text(btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
      );
  }
  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 237, 192,1),
      appBar: AppBar(
        title: const Text('Calculator - Nhóm 3'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                    Expanded(
                      // padding: const EdgeInsets.only(left:10,right:10),
                      flex:1,
                      child: Text('$text',
                        textAlign: TextAlign.right,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child:Calcbutton('AC',Colors.grey,Colors.black)),
                Expanded(child: Calcbutton('+/-',Colors.grey,Colors.black)),
                Expanded(child: Calcbutton('%',Colors.grey,Colors.black)),
                Expanded(child: Calcbutton('/',Colors.amber[700]!,Colors.white)),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child:Calcbutton('7',Colors.grey[850]!,Colors.white)),
                Expanded(child: Calcbutton('8',Colors.grey[850]!,Colors.white)),
                Expanded(child: Calcbutton('9',Colors.grey[850]!,Colors.white)),
                Expanded(child: Calcbutton('x',Colors.amber[700]!,Colors.white)),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child:Calcbutton('4',Colors.grey[850]!,Colors.white)),
                Expanded(child: Calcbutton('5',Colors.grey[850]!,Colors.white)),
                Expanded(child: Calcbutton('6',Colors.grey[850]!,Colors.white)),
                Expanded(child: Calcbutton('-',Colors.amber[700]!,Colors.white)),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child:Calcbutton('1',Colors.grey[850]!,Colors.white)),
                Expanded(child: Calcbutton('2',Colors.grey[850]!,Colors.white)),
                Expanded(child: Calcbutton('3',Colors.grey[850]!,Colors.white)),
                Expanded(child: Calcbutton('+',Colors.amber[700]!,Colors.white)),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Expanded(
                  flex: 2,
                  //child:
                    //calcbutton('0',Colors.grey[850]!,Colors.white)
                  child: SizedBox(
                    width: 100,
                    height: 70,
                    child: Padding(
                      padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.03,right:MediaQuery.of(context).size.width*0.03),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.grey[850],
                        ),
                        onPressed: (){
                          Calculation('0');
                        },
                        child: const Text('0',
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white),
                        ),

                      ),
                    ),
                  ),
                ),

                Expanded(child: Calcbutton('.',Colors.grey[850]!,Colors.white)),
                Expanded(child: Calcbutton('=',Colors.amber[700]!,Colors.white)),

              ],
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void Calculation(btnText) {
    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == 'x') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == 'x') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    }

    else if(btnText == '+/-') {
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-$result';
      finalResult = result;

    }

    else {
      result = result + btnText;
      finalResult = result;
    }


    setState(() {
      text = finalResult;
    });

  }


  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }



  String doesContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }

}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Petrol App',
      home: MyHomePage(title: 'PETROL EXPENSES CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 var price=00.00;
 final myController1=TextEditingController();
 final myController2=TextEditingController();
 final myController3=TextEditingController();
 final myController4=TextEditingController();

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFFF95A5A
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,40.0,0,20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children:  [
                   const Text("Petrol Price:"),
                   Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: TextField(
                       textAlignVertical: TextAlignVertical.bottom,
                       decoration: const InputDecoration(
                         border:InputBorder.none,
                           constraints: BoxConstraints(
                               maxHeight: 30.0, maxWidth: 280.0
                           ),
                         filled:true,
                         fillColor: Color(0xFFFFD7D7),
                         prefixIconColor: Color(0xFFFFD7D7),
                       ),
                       controller: myController1,
                     ),
                   ),
                 ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,20.0,0,20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Distance:"),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: myController2,
                      decoration: const InputDecoration(
                        border:InputBorder.none,
                        constraints: BoxConstraints(
                            maxHeight: 30.0, maxWidth: 280.0
                        ),
                        filled:true,
                        fillColor: Color(0xFFFFD7D7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,20,0,20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Days of work in a week:"),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: myController3,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        constraints: BoxConstraints(
                            maxHeight: 30.0, maxWidth: 280.0
                        ),
                        filled:true,
                        fillColor: Color(0xFFFFD7D7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,20.0,0,20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  const Text("Mileage:"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: myController4,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        constraints: BoxConstraints(
                            maxHeight: 30.0, maxWidth: 280.0
                        ),
                        filled:true,
                        fillColor: Color(0xFFFFD7D7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0,30.0,0,30),
              child: ElevatedButton(
                onPressed: calculate,
                child: const Text("CALCULATE"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFF95A5A))
                  ),
                ),
            ),
            Container(
              alignment : Alignment.center,
              margin: const EdgeInsets.all(60.0),
              child:Text("$price", style: const TextStyle(color: Colors.white)),
              width: 170.0,
              height: 170.0,
              decoration: const BoxDecoration(
                color: Color(0xFFF95A5A),
                shape: BoxShape.circle
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [Text("Petrol Expenses this month"),]
            )
          ],
        ),
      ),
    );
  }

  void calculate(){
   //total distance travelled= no of days*2*distance
    //mileage= distance for one litre of petrol
    //distance/mileage= litres of petrol required
    //litres of petrol * petrol price= total expenses

    var totalDist= 2*int.parse(myController2.text)*int.parse(myController3.text);
    var litres= totalDist/int.parse(myController4.text);
    price=4*litres*int.parse(myController1.text);

    setState(() {
      ("$price");
    });

  }
}

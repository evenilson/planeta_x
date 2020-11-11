import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int radioValor = 1;
  String _nomePlaneta = "";

  void tomaContaValorRadio(int valor) {
    setState(() {
      radioValor = valor;
      switch (radioValor) {
        case 0:
          _nomePlaneta = "Planeta Pluto";
          break;
        case 1:
          _nomePlaneta = "Planeta Marte";
          break;
        case 2:
          _nomePlaneta = "Planeta Vênus";
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Planeta X"),
        backgroundColor: Colors.blueAccent[200],
      ),
      backgroundColor: Colors.blue[100],
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(20.5),
          children: <Widget>[
            Image.asset(
              'assets/planet.png',
              width: 100.0,
              height: 100.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'O seu peso na Terra',
                        hintText: 'Kg',
                        icon: Icon(Icons.person_outline)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                          activeColor: Colors.greenAccent[400],
                          value: 0,
                          groupValue: radioValor,
                          onChanged: tomaContaValorRadio),
                      Text(
                        "Pluto",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Radio<int>(
                          activeColor: Colors.greenAccent[400],
                          value: 1,
                          groupValue: radioValor,
                          onChanged: tomaContaValorRadio),
                      Text(
                        "Marte",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Radio<int>(
                          activeColor: Colors.greenAccent[400],
                          value: 2,
                          groupValue: radioValor,
                          onChanged: tomaContaValorRadio),
                      Text(
                        "Vênus",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  // Resultado
                  Text(
                    "O meu peso...",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.1,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

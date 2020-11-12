import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controlePeso = new TextEditingController();
  int radioValor = 1;
  String _nomePlaneta = "";

  bool selectionValueA = true;
  bool selectionValueB = false;
  bool selectionValueC;
  bool switchValue = false;

  double _resltFinal = 0.0;

  void tomaContaValorRadio(int valor) {
    setState(() {
      radioValor = valor;
      switch (radioValor) {
        case 0:
          _resltFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.06);
          _nomePlaneta = "Peso em plutão é ${_resltFinal.toStringAsFixed(2)}";
          break;
        case 1:
          _resltFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.38);
          _nomePlaneta = "Peso em Marte é ${_resltFinal.toStringAsFixed(2)}";
          break;
        case 2:
          _resltFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.91);
          _nomePlaneta = "Peso em Vênus é ${_resltFinal.toStringAsFixed(2)}";
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
                    controller: _controlePeso,
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
                        "Plutão",
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
                    _controlePeso.text.isEmpty
                        ? "Informe o seu peso"
                        : _nomePlaneta + "Kg",
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

  double calcularPesoEmPlaneta(String peso, double gravidadeSuperficial) {
    if (int.parse(peso).toString().isNotEmpty && int.parse(peso) > 0) {
      return (int.parse(peso) * gravidadeSuperficial);
    } else {
      print("Numero errado...");
      return int.parse("180") * 0.38; // devolve-nos um peso padrao
    }
  }
}

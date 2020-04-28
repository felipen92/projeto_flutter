import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _msg = "Informe seus dados!";

  void _resetFild() {
      alturaController.text = "";
      pesoController.text = "";
    setState(() {
      _msg = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double altura = double.parse(alturaController.text) / 100;
      double peso = double.parse(pesoController.text);
      double result = peso / (altura * altura);

      if (result < 18.6) {
        _msg = "Abaixo do Peso (${result.toStringAsPrecision(3)}) ";
      } else if (result >= 18.6 && result < 24.9) {
        _msg = "Peso Ideal (${result.toStringAsPrecision(3)}) ";
      } else if (result >= 24.9 && result < 29.9) {
        _msg = "Levemente Acima do Peso (${result.toStringAsPrecision(3)}) ";
      } else if (result >= 29.9 && result < 34.9) {
        _msg = "Obesidade Grau I (${result.toStringAsPrecision(3)}) ";
      } else if (result >= 34.9 && result < 39.9) {
        _msg = "Obesidade Grau II (${result.toStringAsPrecision(3)}) ";
      } else if (result >= 40.0) {
        _msg = "Obesidade Grau III (${result.toStringAsPrecision(3)}) ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFild)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.black,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    )),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                controller: pesoController,
                validator: (value){
                  if(value.isEmpty){
                    return "Inserir seu Peso!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                controller: alturaController,
                validator: (value){
                  if(value.isEmpty){
                    return "Inserir sua Altura!";
                  }
                },
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                height: 75.0,
                child: RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      _calculate();
                    }
                  },
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  color: Colors.black,
                ),
              ),
              Text(
                _msg,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

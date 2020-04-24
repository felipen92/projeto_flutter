import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contador de Pessoas",
      home: Home()
    )
  );
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _contador = 0;

  String _msg = "Pode Entrar!";

  void _contadorPessoa(int valor){
    setState(() {
      _contador += valor;
    });

    if(_contador < 0){
      _msg = "Mundo Invertido?!";
    }else if(_contador <= 10){
      _msg = "Pode Entrar!";
    }else{
      _msg = "Lotado!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Image.asset(
            "images/original.jpg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pessoas: $_contador",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: () {
                        _contadorPessoa(1);
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: () {
                        _contadorPessoa(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                _msg,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30),
              )
            ],
          )
        ],
      );
  }
}
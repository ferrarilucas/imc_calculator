import 'package:flutter/material.dart';


class Tela extends StatefulWidget {
  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  TextEditingController altura = TextEditingController();
  TextEditingController peso = TextEditingController();
  String _infotext = "Informe seus dados"; 

  GlobalKey<FormState> _validator = GlobalKey<FormState>();

  void _limparTudo(){
    altura.text="";
    peso.text="";
    setState(() {
    _infotext = "Informe seus dados";
    });
  }
  void _calcular(){
   
   setState((){

    double altura_conta = double.parse(altura.text) / 100;
    double peso_conta = double.parse(peso.text);

    double conta = peso_conta/(altura_conta*altura_conta);
    if (conta < 10){
     _infotext = "DESNUTRIÇÃO GRAU V (${conta.toStringAsPrecision(3)})";
    }
    else if (conta >= 10 && conta <= 12.9){
      _infotext = "DESNUTRIÇÃO GRAU IV (${conta.toStringAsPrecision(3)})";
    }
    else if (conta >= 13 && conta <= 15.9){
      _infotext = "DESNUTRIÇÃO GRAU III (${conta.toStringAsPrecision(3)})";
    }
    else if (conta >= 16 && conta <= 16.9){
      _infotext = "DESNUTRIÇÃO GRAU II (${conta.toStringAsPrecision(3)})";
    }
    else if (conta >= 17 && conta <= 18.4){
      _infotext = "DESNUTRIÇÃO GRAU I (${conta.toStringAsPrecision(3)})";
    }
    else if (conta >= 18.5 && conta <= 24.9){
      _infotext = "Parabéns, Seu IMC está normal! (${conta.toStringAsPrecision(3)})";
    }
    else if (conta >= 25 && conta <= 29.9){
      _infotext = "PRÉ OBESIDADE (${conta.toStringAsPrecision(3)})";
    }
    else if (conta >= 30 && conta <= 34.5){
      _infotext = "OBESIDADE GRAU I (${conta.toStringAsPrecision(3)})";
    }
    else if (conta >= 35 && conta <= 39.9){
      _infotext = "OBESIDADE GRAU II (${conta.toStringAsPrecision(3)})";
    }
    else if (conta >40){
      _infotext = "OBESIDADE GRAU III (${conta.toStringAsPrecision(3)})";
    } 
   });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("CALCULADORA DE IMC"),
       centerTitle: true,
       backgroundColor: Colors.orange,
       actions: <Widget>[
         IconButton(
           icon: Icon(Icons.refresh), 
           onPressed: _limparTudo,
           
           )

       ]
     ),
    body:SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Form(
        key: _validator,
        child:Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget>[
         Icon(Icons.person_outline, size: 150.0, color: Colors.orange),
         TextFormField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
          labelText: "Peso  (Kg)",
          labelStyle: TextStyle(color: Colors.orange, fontSize: 25.0)),
         textAlign: TextAlign.center,
         style: TextStyle(color:Colors.orange),
         controller: peso,
         validator: (value){
           if (value.isEmpty){
             return "Insira seu peso";
           }
         },
        ),
        TextFormField(keyboardType: TextInputType.number,
        decoration: InputDecoration(
         labelText: "Altura  (Cm)",
         labelStyle: TextStyle(color: Colors.orange, fontSize: 25.0)),
         textAlign: TextAlign.center,
         style: TextStyle(color:Colors.orange),
         controller: altura,
         validator: (value){
           if (value.isEmpty){
             return "Insira sua altura";
           }
         },
        ),
       Container(
         height: 60.0,
         padding: EdgeInsets.only(top:10.0, bottom: 10.0),
          child: RaisedButton(
          onPressed: (){
            if(_validator.currentState.validate()){
              _calcular();
            }
          },
          child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.00)),
          color: Colors.orange,
          )
       ),
      Text(_infotext, 
      style: TextStyle(color: Colors.orange, fontSize: 25.00),
      textAlign: TextAlign.center,
         )
        ],
       ),
      )
     ),
    );
  }
}
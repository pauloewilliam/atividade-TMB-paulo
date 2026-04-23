import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TelaTMB(),
    debugShowCheckedModeBanner: false,
  ));
}

class TelaTMB extends StatefulWidget {
  @override
  _TelaTMBState createState() => _TelaTMBState();
}

class _TelaTMBState extends State<TelaTMB> {
  TextEditingController idade = TextEditingController();
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();

  String genero = "M";
  double atividade = 1.2;
  double resultado = 0;

  void calcular() {
    double i = double.tryParse(idade.text) ?? 0;
    double p = double.tryParse(peso.text) ?? 0;
    double a = double.tryParse(altura.text) ?? 0;

    double tmb;

    if (genero == "M") {
      tmb = 66 + (13.7 * p) + (5 * a) - (6.8 * i);
    } else {
      tmb = 655 + (9.6 * p) + (1.8 * a) - (4.7 * i);
    }

    setState(() {
      resultado = tmb * atividade;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Saúde"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              TextField(
                controller: idade,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Idade",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: peso,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: altura,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 15),

              Text("Gênero"),
              Row(
                children: [
                  Radio(
                    value: "M",
                    groupValue: genero,
                    onChanged: (valor) {
                      setState(() {
                        genero = valor!;
                      });
                    },
                  ),
                  Text("Masculino"),

                  Radio(
                    value: "F",
                    groupValue: genero,
                    onChanged: (valor) {
                      setState(() {
                        genero = valor!;
                      });
                    },
                  ),
                  Text("Feminino"),
                ],
              ),

              SizedBox(height: 10),

              Text("Nível de Atividade"),
              DropdownButton<double>(
                value: atividade,
                isExpanded: true,
                items: [
                  DropdownMenuItem(value: 1.2, child: Text("Sedentário")),
                  DropdownMenuItem(value: 1.375, child: Text("Leve")),
                  DropdownMenuItem(value: 1.55, child: Text("Moderado")),
                  DropdownMenuItem(value: 1.725, child: Text("Ativo")),
                  DropdownMenuItem(value: 1.9, child: Text("Muito ativo")),
                ],
                onChanged: (valor) {
                  setState(() {
                    atividade = valor!;
                  });
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: calcular,
                child: Text("Calcular"),
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: Column(
                  children: [
                    Text(
                      "Resultado",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${resultado.toStringAsFixed(2)} kcal",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
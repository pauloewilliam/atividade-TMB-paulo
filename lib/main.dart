import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  String genero = "masculino";
  String atividade = "sedentario";

  double resultado = 0;

  void calcularTMB() {
    double idade = double.tryParse(idadeController.text) ?? 0;
    double peso = double.tryParse(pesoController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;

    if (genero == "masculino") {
      resultado = 88.36 + (13.4 * peso) + (4.8 * altura) - (5.7 * idade);
    } else {
      resultado = 447.6 + (9.2 * peso) + (3.1 * altura) - (4.3 * idade);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Calculadora de Saúde")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: idadeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Idade"),
              ),
              TextField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Peso (kg)"),
              ),
              TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Altura (cm)"),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Masculino"),
                      value: "masculino",
                      groupValue: genero,
                      onChanged: (value) {
                        setState(() {
                          genero = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Feminino"),
                      value: "feminino",
                      groupValue: genero,
                      onChanged: (value) {
                        setState(() {
                          genero = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              DropdownButton<String>(
                value: atividade,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(value: "sedentario", child: Text("Sedentário")),
                  DropdownMenuItem(value: "leve", child: Text("Levemente ativo")),
                  DropdownMenuItem(value: "moderado", child: Text("Moderado")),
                  DropdownMenuItem(value: "ativo", child: Text("Ativo")),
                ],
                onChanged: (value) {
                  setState(() {
                    atividade = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: calcularTMB,
                child: const Text("Calcular"),
              ),

              const SizedBox(height: 20),

              Text("Resultado: ${resultado.toStringAsFixed(2)} kcal"),
            ],
          ),
        ),
      ),
    );
  }
}
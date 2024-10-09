import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FaseDaVidaScreen(),
    );
  }
}

class FaseDaVidaScreen extends StatefulWidget {
  const FaseDaVidaScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FaseDaVidaScreenState createState() => _FaseDaVidaScreenState();
}

class _FaseDaVidaScreenState extends State<FaseDaVidaScreen> {
  final TextEditingController faseController = TextEditingController();
  String resultado = "";
  String msgErro = "";

  void determinarFaseDaVida() {
    setState(() {
      // Tentativa de converter a entrada para número inteiro
      int? idade = int.tryParse(faseController.text);
      
      if (idade == null || idade < 0) {
        msgErro = "Por favor, insira uma idade válida";
        resultado = "";
      } else {
        msgErro = "";
        resultado = resultadoFaseDaVida(idade);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Determinador de Fase da Vida',
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.black
            ),
          ),
          centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: 450), // Largura máxima de 300
          child: Padding(
            padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: faseController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                labelText: 'Digite sua idade',
                labelStyle: const TextStyle(fontSize: 18),
                errorText: msgErro.isNotEmpty ? msgErro : null,
                prefixIcon:
                        const Icon(Icons.cake_outlined),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: determinarFaseDaVida,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              child: const Text(
                'Fase da Vida',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
            ),
            const SizedBox(height: 16),
            if (resultado.isNotEmpty)
              Text(
                resultado,
                style: const TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                  ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    ),
      ),
    );
  }
}

String resultadoFaseDaVida(int idade) {
  if (idade < 3) {
    return "Infância";
  } else if (idade >= 3 && idade <= 12) {
    return "Pré-adolescência";
  } else if (idade >= 13 && idade <= 19) {
    return "Adolescência";
  } else if (idade >= 20 && idade <= 35) {
    return "Juventude";
  } else if (idade >= 36 && idade <= 55) {
    return "Meia-idade";
  } else {
    return "Terceira idade";
  }
}
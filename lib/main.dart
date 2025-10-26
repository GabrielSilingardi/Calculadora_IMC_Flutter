import 'package:calculadora_imc/StyledWidgets.dart';
import 'package:calculadora_imc/class.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(colorScheme: ColorScheme.dark()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var campoPeso = TextEditingController();
  var campoAltura = TextEditingController();

  bool campoPesoInvalido = false;
  bool campoAlturaInvalido = false;

  List<dynamic>? imcResultado;
  double? resultado;
  String? condicao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextLabel(texto: "Insira seu peso"),
            TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: campoPesoInvalido ? Colors.red : Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  campoPeso.text = value;

                  if (campoPeso.text != "") {
                    campoPesoInvalido = false;
                  }
                });
              },
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            SizedBox(height: 20),
            TextLabel(texto: "Insira sua altura"),
            TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: campoAlturaInvalido ? Colors.red : Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  campoAltura.text = value;

                  if (campoAltura.text != "") {
                    campoAlturaInvalido = false;
                  }
                });
              },
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  final pesoRaw = campoPeso.text.replaceAll(",", ".");
                  final alturaRaw = campoAltura.text.replaceAll(",", ".");

                  final peso = double.tryParse(pesoRaw);
                  final altura = double.tryParse(alturaRaw);

                  setState(() {
                    campoPesoInvalido = peso == null || pesoRaw.isEmpty;
                    campoAlturaInvalido = altura == null || alturaRaw.isEmpty;
                  });

                  if (campoPesoInvalido == false && campoAlturaInvalido == false) {
                    IMC.peso = peso;
                    IMC.altura = altura;

                    imcResultado = IMC.calculo();
                    
                    resultado = imcResultado![0];
                    condicao = imcResultado![1];
                  }
                },
                child: Text("Calcular", style: TextStyle(color: Colors.black)),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${resultado?.toStringAsFixed(2) ?? 0.00}", style: TextStyle(fontSize: 40)),
                        SizedBox(width: 3),
                        Text("imc")
                      ],
                    ),
                    Text(condicao ?? "")
                    ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

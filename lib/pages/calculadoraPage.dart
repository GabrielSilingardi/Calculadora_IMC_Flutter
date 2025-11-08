import 'package:flutter/material.dart';
import 'package:calculadora_imc/StyledWidgets.dart';
import 'package:calculadora_imc/class.dart';
import 'package:flutter/services.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  var campoNome = TextEditingController();
  var campoPeso = TextEditingController();
  var campoAltura = TextEditingController();

  bool campoNomeInvalido = false;
  bool campoPesoInvalido = false;
  bool campoAlturaInvalido = false;

  List<dynamic>? imcResultado;
  double? resultado;
  String? condicao;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextLabel(texto: "Insira seu nome"),
                    TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r"[0-9]")),
                      ],
                      maxLength: 20,
                      keyboardType: TextInputType.text,
                      controller: campoNome,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: campoNomeInvalido
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          campoNome.text = value;

                          if (campoNome.text != "") {
                            campoNomeInvalido = false;
                          }
                        });
                      },
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                    TextLabel(texto: "Insira seu peso (KG)"),
                    TextField(
                      buildCounter:
                          (
                            context, {
                            required currentLength,
                            required isFocused,
                            required maxLength,
                          }) => null,
                      maxLength: 4,
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.number,
                      controller: campoPeso,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: campoPesoInvalido
                                ? Colors.red
                                : Colors.white,
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
                    TextLabel(texto: "Insira sua altura (M)"),
                    TextField(
                      buildCounter:
                          (
                            context, {
                            required currentLength,
                            required isFocused,
                            required maxLength,
                          }) => null,
                      maxLength: 5,
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.number,
                      controller: campoAltura,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: campoAlturaInvalido
                                ? Colors.red
                                : Colors.white,
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
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                        ),
                        onPressed: () {
                          final pesoRaw = campoPeso.text.replaceAll(",", ".");
                          final alturaRaw = campoAltura.text.replaceAll(
                            ",",
                            ".",
                          );

                          final nome = campoNome.text.trim();
                          final peso = double.tryParse(pesoRaw);
                          double? altura = double.tryParse(alturaRaw);

                          setState(() {
                            campoNomeInvalido = nome.isEmpty;
                            campoPesoInvalido =
                                peso == null ||
                                pesoRaw.isEmpty ||
                                peso.toString().startsWith("0");
                            campoAlturaInvalido =
                                altura == null ||
                                alturaRaw.isEmpty ||
                                altura.toString().startsWith("0");
                          });

                          if (campoNomeInvalido == false &&
                              campoPesoInvalido == false &&
                              campoAlturaInvalido == false) {

                            if (altura.toString().length == 5) {
                              altura = altura! / 100;
                            }

                            IMC.id = 0;
                            IMC.nome = nome;
                            IMC.peso = peso;
                            IMC.altura = altura;

                            imcResultado = IMC.calculo();

                            resultado = imcResultado![3];
                            condicao = imcResultado![4];
                          }
                        },
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            campoNome.text = "";
                            campoPeso.text = "";
                            campoAltura.text = "";
                            resultado = null;
                            condicao = "";
                          });
                        },
                        child: Text(
                          "Limpar",
                          style: TextStyle(color: Color.fromARGB(255, 182, 35, 36)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        resultado == null
            ? Text("")
            : Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${resultado?.toStringAsFixed(2) ?? 0.00}",
                          style: TextStyle(fontSize: 40),
                        ),
                        SizedBox(width: 3),
                        Text("imc"),
                      ],
                    ),
                    Text(condicao ?? ""),
                  ],
                ),
              ),
      ],
    );
  }
}

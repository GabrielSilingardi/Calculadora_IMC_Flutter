import 'package:calculadora_imc/sqlite/manager.dart';
import 'package:flutter/material.dart';

class DadosPage extends StatefulWidget {
  const DadosPage({super.key});

  @override
  State<DadosPage> createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
  @override
  void initState() {
    super.initState();

    carregarDados();
  }

  List<Map<String, dynamic>> dados = [];
  int? quantidadeDeDados;

  void carregarDados() async {
    var dadosDatabase = await Manager().obterDados();
    setState(() {
      dados = dadosDatabase.cast<Map<String, dynamic>>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Column(
          children: dados.isEmpty
              ? [Text("Carregue dados")]
              : dados
                    .map(
                      (dado) => Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 61, 59, 59),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(dado["Nome"]),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Peso: ${dado["Peso"].toStringAsFixed(0)}",
                                      ),
                                      Text(
                                        "Altura: ${dado["Altura"].toStringAsFixed(2)}",
                                      ),
                                      Text(
                                        "IMC: ${dado["IMC"].toStringAsFixed(2)}",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await Manager().deletar(dado["id"]);
                                setState(() {
                                  carregarDados();
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 182, 35, 36),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                                ),
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.center,
                                child: Text("Excluir"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
        ),
      ],
    );
  }
}

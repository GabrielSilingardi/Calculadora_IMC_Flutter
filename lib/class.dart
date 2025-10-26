import 'dart:math';

class IMC {
  static double? _peso;
  static double? _altura;

  static set peso(double? value) => _peso = value;
  static set altura(double? value) => _altura = value;

  static List<dynamic> calculo() {
    String? condicao;
    double? resultado = _peso! / pow(_altura!, 2);

    if (resultado < 16) {
      condicao = "Magreza grave";
    } else if (resultado >= 16 && resultado < 17) {
      condicao = "Magreza moderada";
    } else if (resultado >= 17 && resultado < 18.5) {
      condicao = "Magreza leve";
    } else if (resultado >= 18.5 && resultado < 25) {
      condicao = "Saudável";
    } else if (resultado >= 25 && resultado < 30) {
      condicao = "Sobrepeso";
    } else if (resultado >= 30 && resultado < 35) {
      condicao = "Obesidade Grau I";
    } else if (resultado >= 35 && resultado < 40) {
      condicao = "Obesidade Grau II (Severa)";
    } else if (resultado > 40) {
      condicao = "Obesidade Grau III (Mórbida)";
    }

    return [resultado, condicao];
  }


}
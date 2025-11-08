import 'package:calculadora_imc/pages/calculadoraPage.dart';
import 'package:calculadora_imc/pages/dadosPage.dart';
import 'package:flutter/material.dart';

void main() async {
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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        backgroundColor: Colors.lightBlue,
        bottom: TabBar(
          controller: tabController,
          labelStyle: TextStyle(color: Colors.black),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          dividerColor: Colors.transparent,
          indicatorColor: Colors.black,
          tabs: [
            Tab(
              icon: Icon(Icons.calculate, color: Colors.black),
              text: "Calculadora",
            ),
            Tab(
              icon: Icon(Icons.person, color: Colors.black),
              text: "Dados",
            ),
          ],
          onTap: (value) {
            setState(() {
              tabController.index = value;
              pageController.jumpToPage(value);
            });
          },
        ),
      ),
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) {
            setState(() {
              tabController.index = value;
            });
        },
        children: [
          CalculadoraPage(),
          DadosPage()
        ],
      )
    );
  }
}

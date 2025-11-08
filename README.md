# Calculadora de IMC

Um projeto simples em Flutter para calcular o Índice de Massa Corporal (IMC).

## 📱 Visão Geral

Este aplicativo permite que os usuários insiram seu peso (em kg) e altura (em metros) para calcular o IMC. O resultado é exibido na tela juntamente com a classificação correspondente (por exemplo, "Abaixo do peso", "Peso normal", etc.).

*(Sugestão: Adicione um screenshot ou GIF do aplicativo aqui para uma melhor visualização!)*

## ✨ Funcionalidades

- Cálculo de IMC com base no peso e altura.
- Validação de campos para garantir que os valores inseridos são válidos.
- Exibição do resultado numérico e da condição de saúde correspondente.
- Interface de usuário limpa e simples, construída com widgets do Material Design.

## 📂 Estrutura do Projeto

O código-fonte principal está localizado na pasta `lib/` e está organizado de forma a separar a interface, a lógica de negócio e os componentes reutilizáveis.

```
lib/
├── class.dart
├── main.dart
└── StyledWidgets.dart
```

-   `main.dart`: Ponto de entrada da aplicação, configura o `TabBarController` para a navegação entre as páginas.
-   `pages/calculadoraPage.dart`: Contém a interface do usuário para inserção de dados e o botão para acionar o cálculo.
-   `pages/dadosPage.dart`: Exibe os registros de IMC salvos no banco de dados e permite a exclusão.
-   `class.dart`: Define a classe `IMC`, que encapsula a lógica de negócio para o cálculo e classificação do IMC.
-   `sqlite/`: Diretório que contém toda a lógica de interação com o banco de dados local SQLite.

## 💿 Instalação via APK

Se preferir, você pode instalar o aplicativo diretamente em um dispositivo Android usando o arquivo APK pré-compilado.

O arquivo está localizado em:
`build/app/outputs/flutter-apk/app-release.apk`

Basta transferir este arquivo para o seu dispositivo e permitir a instalação de fontes desconhecidas.

## 🚀 Como Executar o Projeto

Para executar este projeto localmente, siga os passos abaixo:

1.  **Clone o repositório:**
    ```sh
    git clone https://github.com/seu-usuario/calculadora_imc.git
    ```
2.  **Acesse a pasta do projeto:**
    ```sh
    cd calculadora_imc
    ```
3.  **Instale as dependências:**
    ```sh
    flutter pub get
    ```
4.  **Execute o aplicativo:**
    ```sh
    flutter run
    ```

## 🛠️ Tecnologias Utilizadas

-   Flutter
-   Dart

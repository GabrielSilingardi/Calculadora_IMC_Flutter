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

-   `main.dart`: Ponto de entrada da aplicação. Contém a lógica da interface do usuário (`HomePage`), o gerenciamento de estado dos campos de texto e a exibição dos resultados.
-   `class.dart`: Define a classe `IMC`, que encapsula toda a lógica de negócio para o cálculo do índice e a determinação da condição de saúde.
-   `StyledWidgets.dart`: Arquivo que contém widgets personalizados e estilizados, como o `TextLabel`, para manter a consistência visual e promover o reuso de código na aplicação.

## 🚀 Como Executar o Projeto

Para executar este projeto localmente, siga os passos abaixo:

1.  **Clone o repositório:**
    ```sh
    git clone <URL_DO_SEU_REPOSITORIO>
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

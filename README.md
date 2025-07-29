# Jogo de Dominó

Aplicativo simples desenvolvido em Flutter que simula uma partida de dominó contra um bot.
O jogo distribui as peças automaticamente e permite que o usuário jogue tocando nas peças disponíveis.

## Funcionalidades
- Distribuição aleatória de peças para o jogador, o bot e o monte.
- Mesa dinâmica com validação das jogadas.
- Bot executa jogadas automáticas após o usuário.
- Tela inicial com botão para iniciar o jogo.
- Integração básica com Firebase já configurada (podendo ser usada para registrar pontuações).

## Pré-requisitos
- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado na máquina
- Dispositivo ou emulador configurado
- Opcional: [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/) para configurar o Firebase

## Instalando dependências
Execute:
```bash
flutter pub get
```

## Executando o aplicativo
Inicie o app em um dispositivo ou emulador disponível com:
```bash
flutter run
```

## Testes
Os testes podem ser executados com:
```bash
flutter test
```

## Configuração do Firebase
Caso deseje registrar pontuações ou outras informações na nuvem, utilize o FlutterFire CLI para configurar o projeto:
```bash
flutterfire configure
```
Isso irá gerar arquivos como `firebase_options.dart`, que devem ser mantidos no controle de versão.

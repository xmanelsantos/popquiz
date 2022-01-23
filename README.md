# Pop Quiz

Aplicativo em desenvolvimento para processo seletivo para Desenvolvedor de aplicativos móveis, Checkmob.

## Iniciando
A príncipio foi estabelecido uma organização do projeto utilizando o slidy e a gerência de rotas com o Modular, ambos desenvolvidos pela a Flutterando.

## Layout do App (UI)
O próximo passo foi escolher as cores e desenvolver todo o protótipo do layout, utilizei para essa etapa elementos nativos do Flutter e para fontes o pacote do Google Fonts.

## Hive, local database !
Escolhi o hive para guardar todos os dados referentes aos questionários respondidos, foi meu primeiro contato com hive. O provider foi o package que escolhi para gerenciar o estado. Inovei em algo que nunca usei, isso me levou um tempo, foi uma substituição que encontrei ao que geralmente uso, que são as ferramentas do Firebase. Por isso todas ás vezes que o cache/dados do app for apagados, o app irá resetar.

## O primeiro Quiz
Fiz uma interação com o usuário explicando como funciona os quiz, o primeiro quiz pede duas informações simples e utilizo elas pra dar boas vindas ao usuário em outras partes do app, esse quiz sempre acontece a primeira vez que o app é inicializado e será exibido essa única vez.

## Estrutura dos Quiz
Tentei seguir a mesma estrutura a ser salva, para exibir no histórico:
    1. Id
    2. Título do Questionário
    3. Lista com as respostas
    4. Lista com as perguntas respectivamente
    5. Data de criação


## Pacotes

- [Slidy](https://pub.dev/packages/slidy)
- [Modular](https://pub.dev/packages/flutter_modular)
- [Google Fonts](https://pub.dev/packages/google_fonts)
- [Hive](https://pub.dev/packages/hive)
- [Provider](https://pub.dev/packages/provider)

Mais informações ao decorrer do desenvolvimento.

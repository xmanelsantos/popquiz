# Pop Quiz

Aplicativo em desenvolvimento para processo seletivo para Desenvolvedor de aplicativos móveis, Checkmob.

## IMPORTANTE
Há dois branches, ao terminar toda a parte do layout com o app totalmente funcionando, criei um backup e coloquei ele como main, o outro branch foi nomeado como old e tem todos os outros commits relacionados ao processo.

## Iniciando
A príncipio foi estabelecido uma organização do projeto utilizando o slidy e a gerência de rotas com o Modular, ambos desenvolvidos pela a Flutterando.

## Layout do App (UI)
O próximo passo foi escolher as cores e desenvolver todo o protótipo do layout, utilizei para essa etapa elementos nativos do Flutter e para fontes o pacote do Google Fonts.

## Hive, local database !
Escolhi o hive para guardar todos os dados referentes aos questionários respondidos, foi meu primeiro contato com hive. O provider foi o package que escolhi para gerenciar o estado. Inovei em algo que nunca usei, isso me levou um tempo, foi uma substituição que encontrei ao que geralmente uso, que são as ferramentas do Firebase. Por isso todas ás vezes que o cache/dados do app for apagados, o app irá resetar.

## O primeiro Quiz
Fiz uma interação com o usuário explicando como funciona os quizzes, o primeiro quiz pede duas informações simples e utilizo elas pra dar boas vindas ao usuário em outras partes do app, esse quiz sempre acontece a primeira vez que o app é inicializado e será exibido essa única vez.

## Estrutura dos Quiz
Tentei seguir a mesma estrutura a ser salva, para exibir no histórico:
    1. Id
    2. Título do Questionário
    3. Lista com as respostas
    4. Lista com as perguntas respectivamente
    5. Data de criação

## Detalhes de um questionário respondido
Cada questionário respondido aparecerá no histórico na página principal, lá conseguimos ver cada pergunta e a resposta que foi colocado, como também a data e o horário que foi respondido.

## Escolher, responder e visualizar
Na página inicial há um botão para respondermos outro quiz, lá mostra o tema e a quantidade de questões, lindo e funcionando, mas nem tudo é flores. O próximo passo é ler um quiz por uma requisição de uma API, essa requisição passará todos os quiz disponíveis para o app, é meu primeiro contato com teste assim e provavelmente levará um tempo pra fixar. Usarei JSON.





## Etapas

- [X] Responder novo quiz
- [X] Escolher novo quiz
- [X] Histórico do quiz respondido
- [ ] Leitura por API dos questionários

## Pacotes

- [Slidy](https://pub.dev/packages/slidy)
- [Modular](https://pub.dev/packages/flutter_modular)
- [Google Fonts](https://pub.dev/packages/google_fonts)
- [Hive](https://pub.dev/packages/hive)
- [Provider](https://pub.dev/packages/provider)

Mais informações ao decorrer do desenvolvimento.

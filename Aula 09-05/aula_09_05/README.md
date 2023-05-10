# Aula 09/05 - Aula sobre Form 

Principais Widgets: Form, TextFormField, Column, InputDecoration, Text e ScaffoldMessenger

O Form serve para conter os campos, e possui alguns métodos já implementados que serão úteis em uma aplicação de um Formulário;

A key de um Widget serve para poder acessar os metódos e attributos dessa widget como um objeto.

Controller: Variável que controla um field, é através dela que podemos acessar o valor do campo.

# Restrições do TextField
MaxLength: Define um tamanho máximo para o input.
Validator: Cria uma validação para um campo do formulário.
KeyboardType: Define o tipo de input que o campo espera receber, por exemplo números.
inputFormattes: Podemos definir quais inputs são permitidos e quais não no nosso campo.
RegExp: São expressões regulares que podemos criar explicitando quais são os caracteres que serão validados no nosso inputFormattes.

# Pub.Dev
Repositorio Oficial dos plugins do flutter disponibilizados pela comunidade. 

Os plugins são códigos prontos que podemos adicionar ao nosso projeto para facilitar e agilizar algumas implementações. Na hora de escolher um plugin é recomendado verificar a quantidade de downloads do mesmo, estrelas, comentários, etc. Também é importante verificar se o pacote é constantemente atualizado, assim prevenindo falhas de segurança.

Para adicionarmos um plugin ao projeto, adiciona-se sua dependência ao pubspec.yaml, ou podemos utilizar o flutter pub add nome_do_plugin. Após isso basta importá-lo no arquivo que deseja utilizá-lo.

Exemplo: podemos utilizar o mask_text_input_formatter para criar máscaras para os nossos TextFields
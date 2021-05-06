Feature: Testar as operações presentes em JSONPlaceholder

Background: Executa antes de cada teste.
* def url_base = "https://jsonplaceholder.typicode.com"
* def request_json = read('request_post0.json')
* def request_json1 = read('request_post1.json')
* def request_json2 = read('request_post2.json')

#Lembrando que: $ = response
# _ = variavel sendo testada
# # = objeto ou expressão javascript

Scenario: Testar a operação GET em /posts e verificar se o retorno é um array, possui tamanho correto e os campos title e id existem e são do tipo correto.
Given url url_base
And path '/posts'
When method get
Then status 200
And match $ == '#[]'
And match $ == '#[100]'
And match each $ contains {title: '#string', id: '#number'}


Scenario: Testar a criação de recursos com o metodo (operacao) POST na API /posts
Given url url_base
And path '/posts'
And request {title: 'aula_inatel_teste', body: 'Essa é uma demonstracao da aula no Inatel', userId: 1}
When method post
Then status 201
And match $.id == 101
And match $.title == '#string'
And match $.body == 'Essa é uma demonstracao da aula no Inatel'
And print karate.sizeOf(response)
And match karate.sizeOf(response) == 4

Scenario: Testar a criação de recursos com o metodo (operacao) POST na API /posts utilizando uma request (json) externa.
Given url url_base
And path '/posts'
And request request_json
When method post
Then status 201
And match $.id == 101
And match $.title == '#string'
And match $.body == 'Essa é uma demonstracao da aula no Inatel0'
And print karate.sizeOf(response)
And match karate.sizeOf(response) == 4

Scenario Outline: Testar a criação de recursos com o metodo (operacao) POST na API /posts utilizando uma request (json) externa com várias 3 requests diferentes.
Given url url_base
And path '/posts'
And request <request_json>
When method post
Then status 201
And match $.id == 101
And match $.title == '#string'
And match $.body == '<texto_body>'
And print karate.sizeOf(response)
And match karate.sizeOf(response) == 4

Examples:
|request_json               | texto_body                                    |
|request_json               | Essa é uma demonstracao da aula no Inatel0    |
|request_json1              | Essa é uma demonstracao da aula no Inatel1    |
|request_json2              | Essa é uma demonstracao da aula no Inatel2    |







# O Desafio
Todos os detalhes do desafio podem ser vistos no arquivo DESAFIO.md. Falando sobre ele de forma resumida trata-se de um sistema que deverá receber um arquivo de texto puro, cujos dados estão separados por tab - */t* - e deverá salvar esses dados no banco de dados de forma normalizada. Além disso, esses dados deverão ser exibidos para o usuário final. Um exemplo do arquivo pode ser visto em [example_input.tab](example_input.tab)
Toda interação do usuário com o sistema se dá através de uma interface web.

O estudo dessa solução é interessante, principalmente a programadores iniciantes, para verem o desacoplamento do ActiveRecord em relação ao Rails, e que é possível utiliza-lo com outros frameworks.

## Tecnologias
A linguagem de programação escolhida para este desafio é o Ruby. O Ruby foi escolhido porque a vaga para a qual eu estou aplicando é uma vaga de desenvolvedor Ruby.
Junto com o Ruby eu escolhi o framework [Sinatra](http://sinatrarb.com/) e para fazer a persistência dos dados eu optei por usar o [Sinatra ActiveRecord](https://github.com/janko-m/sinatra-activerecord).
Para a persistência do banco de dados optei por usar o sqlite3. O sqlite3 tem como característica ter todo o banco em um único arquivo. Ele tem problemas conhecidos de velocidade e perda de dados. Portanto não deve ser utilizado em produção, mas para testes e exemplos ele é perfeito pois dispensa a instalação de softwares externos.

### Por que Sinatra?
O primeiro framework para desenvolvimento web em Ruby que vem a mente da maioria dos desenvolvedores (e que veio a minha também) é o [Rails](http://rubyonrails.org/). O Rails é sem dúvida um framework sensacional e há várias comparações entre ele e o [Sinatra](http://sinatrarb.com). No entanto o Rails tem alguns downsides que para uma aplicação grande são completamente justificáveis, no entanto para aplicações pequenas o Sinatra (em minha experiência pessoal) se sai melhor.
O principal downside que o Rails tem é a quantidade de boilerplate necessário para que ele funcione e a quantidade de gems que ele tem por padrão. Optei pelo Sinatra pois com ele eu consigo ter um código mais enxuto e mais limpo, com menos arquivos, do que eu normalmente teria em uma aplicação rails.

## Sobre a aplicação Web
Tentei deixa-la o mais limpa possível e para as urls das rotas optei por seguir o padrão RESTful. As urls publicadas foram:
- GET / - renderiza o formulário para fazer o upload do arquivo;
- GET /purchase - retorna um json com os dados consolidados das compras feitas até então. Esses dados são: **valor total, data da primeira compra, data da última compra**;
- POST /purchase - essa url é utilizada pelo formulário para fazer o envio do arquivo.

## Sobre a normalização
Eu optei por ir somente até parte da primeira norma formal por se tratar de um problema simples e normaliza-lo além disso iria trazer mais pontos negativos do que positivos ao propósito da aplicação.

Alguns pontos nas classes criadas podem parecer estranhos. Por eu ter pouca informação sobre o problema, preferi simplificar algumas coisas.
Por exemplo, Cliente, apesar de ter apenas um campo, virou uma entidade. Já o endereço do comerciante não. Por que?

Eu entendo que o Cliente é uma entidade mais importante para uma aplicação desse tipo do que o endereço do comerciante. Além disso, dificilmente dois estabelecimentos terão o mesmo endereço, a incidencia de valores repetidos para o endereço será pequena.
É muito mais provável que o Cliente receba mais informações futuras do que o endereço. E caso o endereço passasse a ser utilizado com outras finalidades  - como fazer triangulação de lojas, definir distância de um dado ponto para aquele endereço, ou outras coisas - a solução de mante-lo em um banco de dados relacional se mostraria extremamente lenta e difícil de trabalhar. Caso você deseje fazer algo nessa linha, recomendo que olhe alguns outros bancos de dados NoSQL que já tem operações de geolocalização implementadas. Dentre eles recomendo o [Elasticsearch](https://www.elastic.co/products/elasticsearch) e o [Apache Solr](http://lucene.apache.org/solr/).

## Executando a aplicação
Esta aplicação tem alguns poucos pré requisitos e a instalação desses foge do escopo deste desafio. Para executa-la você precisará ter:
- [Ruby](https://www.ruby-lang.org/pt/documentation/installation/): a versão sobre a qual esta solução foi desenvolvida é 2.4.1
- [A gem Bundler](http://bundler.io/)

Para executa-la basta executar os seguintes passos:

1. Clone este repositório:
> $ git clone https://github.com/ricardovsilva/desafio-myfreecomm-ruby-sinatra-activerecord
2. Navegue até o diretório onde você clonou este repositório:
> $ cd ~/git/desafio-myfreecomm-ruby-sinatra-activerecord
3. Execute o bundle para baixar todas as gems utilizadas:
> $ bundle
4. Crie a base de dados e execute os migrations:
> $ rake db:migrate
5. Rode o Sinatra:
> $ ruby app.rb

Após a execução do Sinatra, o aplicativo estará disponível, por padrão, em http://localhost:4567 .

Enjoy =)

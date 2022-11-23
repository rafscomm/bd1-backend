<h1> Descrição dos requisitos </h1>


<h2> 1.Introdução </h2>

  Esse projeto de Banco de Dados é direcionado a uma ferramenta, na qual tem como
objetivo auxiliar na administração e no controle de produtos de uma concessionária,
evitando prejuízos para a empresa. Neste projeto existem dois tipos de usuários principais:
o gerente responsável por cadastro de produtos, vendedores e clientes e o Vendedor
cadastrar cliente, saída e entrada de mercadoria.

 <h2> 2. Descrição Geral </h2>
 
  O sistema a ser desenvolvido, é um sistema de venda e gerenciamento de produtos
de uma concessionária. Uma má administração de funcionários, produtos e clientes em uma
concessionária, pode causar uma alta diminuição dos lucros, até mesmo, desvio de caixa (
caixa 2). O software em questão, tem como principal característica, tornar mais fácil, tanto a
vida do vendedor, quanto a vida do dono da loja. Com recursos otimizados e de fácil
entendimento, será possível a realização de uma venda de forma simples e prática, e uma
melhor manipulação de estoque e de produtos oferecidos pela empresa, além de um fácil
gerenciamento de clientes, seja suas faturas pendentes à créditos na casa.

<h2> 3. Usuários </h2>

  3.1 Gerente
  
   É o responsável por administrar o sistema, os vendedores e os clientes. Fica
  responsável pelo cadastro no estoque e alterações mais específicas do sistema. Monitora o
  pagamento dos clientes e as vendas e preços manipulados pelos vendedores.
  
  3.2 Vendedor
  
   É o responsável pela venda dos produtos; cadastro de clientes; manipular entrada e
  saída de produtos no estoque; negociar valores;
  
  <h2> 4. Funcionalidades do sistema </h2>
  
   Primeiramente, o sistema disponibiliza de uma tela de Login, onde o funcionário ou gerente podem entrar no sistema através do CPF dos mesmos e uma senha definida.
Ao logar no sistema, temos diversos modulos, como Produtos, Venda, Clientes, Caixa, Fornecedor. No módulo produto, podemos cadastrar os produtos que estão disponiveis na loja para venda (podemos fazer tudo, criar, remover e editar o produto). Ao clicar em inserir na aba de produtos, uma tela será aberta pedindo as informações do produto a ser cadastrado, informações essas que são : Nome, marca, modelo, preço e imagem ( caso queira colocar). Após ser cadastrado, o produto irá aparecer na tela principal do modulo produtos juntamente com um botão em baixo do card do produto com o nome "Venda" é a partir desse botão que o funcionário vai realizar a venda do mesmo. 

  Partindo agora para o módulo de Clientes, nesse módulo, será possível cadastrar os clientes da empresa, terá um botão nesse módulo (igual em produtos) onde será possivel adicionar o mesmo, ao ser clicado uma tela será aberta pedindo informações do cliente como: um seleter para identificar se é umap essoa física ou juridica, a partir dessa informação os campos variam entre CPF e CNPJ, Razão Social e Nome, o resto mantém, como endereço e contato.

  Partindo agora para o módulo de fornecedores, é nesse módulo onde cadastramos os fornecedores da empresa, ao clicar no botão adicionar  uma tela será aberta pedindo informações do fornecedor como : CNPJ, Razão Social e nome fantasia.
  
  No módulo de vendas, teremos algumas informações que seram mostradas após o funcionário clicar no botão "Vender" no cad de produtos. Ao clicar nesse botão, será aberta uma tela pedindo certas informações como: valor, e o nome do cliente que vai ser feito a venda. Além disso, as vendas possuem um status que variam entre pendente de pagamento e pago. Esse status pode ser mudado ao clicar em um botão ao lado da venda escrtio como "Pagar".
  
  No módulo de caixa, temos justamente registrado as vendas com o status de paga, para um controle interno da empresa.
  
  <h1> Modelo Conceitual </h1> 
  
  ![Modelo_conceitual_100%](https://user-images.githubusercontent.com/73145524/203665676-3f307355-0ba7-439b-8a19-7f524c1aae85.png)
  
  <h1> Modelo Lógico </h1> 
  

  ![Modelo_logico](https://user-images.githubusercontent.com/73145524/203665740-111604dc-fdf7-4092-9f35-4f0152ebd67a.png)


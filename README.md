# Iac-project-rocketseat
Projeto de IAC usando Terraform para desafio da Rocketseat, passando pelas boas práticas aprendidas no curso de infraestrutura como código. O projeto tem como objetivo utilizar boas práticas e metodologias aprendidas, criando um código que, ao ser executado, provisiona uma EC2, uma VPC e um balanço de carga conectados entre si. Após muito aprendizado, abaixo está o projeto final.


## Índice
- [Iac-project-rocketseat](#iac-project-rocketseat)
  - [Índice](#índice)
  - [Visão Geral](#visão-geral)
  - [Requisitos](#requisitos)
  - [Estrutura do Projeto](#estrutura-do-projeto)
  - [Como executar](#como-executar)
  - [Recursos Criados](#recursos-criados)
  - [Conclusão e Desafios](#conclusão-e-desafios)
  - [Referências](#referências)

## Visão Geral
Este projeto visa demonstrar o provisionamento de infraestrutura em nuvem usando Terraform, com foco em boas práticas de automação e segurança. 

A solução cria os seguintes recursos:
- EC2
- VPC
- LC
- Security Group

## Requisitos
- Conta AWS com permissões para criação de VPCs e EC2.
- [Terraform instalado](https://learn.hashicorp.com/tutorials/terraform/install-cli).

## Estrutura do Projeto
```bash
iac-project/
├── modules/
│   ├── ec2/
│       ├── main.tf
│       ├── datasource.tf
│       ├── outputs.tf
│       ├── variables.tf
│   ├── vpc/
│       ├── main.tf
│       ├── datasource.tf
│       ├── outputs.tf
│       ├── variables.tf
│   ├── lb/
│       ├── main.tf
│       ├── outputs.tf
│       ├── variables.tf
│   ├── security_group/
│       ├── main.tf
│       ├── outputs.tf
│       ├── variables.tf
├── environments/
│   ├── dev/
│   ├── staging/
│   ├── prod/
├── main.tf
├── outputs.tf
├── providers.tf
├── README.md
```

## Como executar
1. Clone este repositório:
```bash
git clone https://github.com/dadagss/Iac-project-rocketseat.git
cd iac-project-rocktseat
```

2. Inicialize o Terraform:
```bash
terraform init
```

3. Defina o workspace em que deseja trabalhar:
```bash
terraform wockspace select dev
```

4. Planeje a infraestrutura:
```bash
terraform plan
```
5. Aplique o plano para criar a infraestrutura:
```bash
terraform apply -auto-approve
```

obs. Após a execução ira retornar os outputs com o ip da instancia entre outros.

obs. Sera necessario que você logue com um usúario IAM ou através de um SSO na primeira vez que for rodar.


importante! Para destruir a infraestrutura:
```bash
terraform destroy -auto-approve
```
## Recursos Criados

**VPC**: Configurada com CIDR ajustado ao ambiente.

**Sub-rede**: Sub-rede privada atribuída automaticamente.

**Load Balancer**: Conectado à EC2 e à VPC.

**Instância EC2**: Tipo ajustado ao workspace.

**Security Group**: Configuração de segurança personalizada.

## Conclusão e Desafios

- **Modulos**: Foi muito interessante trabalhar com modulos e aplica-los em um desafio onde eles tinha que criar recursos tão versateis.
- **Variaveis**: Saber tratar as variavéis foi um baita desafio, para deixa-las da melhor forma possivel para que o codigo possa criar oque eu quiser.
- **Workspaces**: fazer a alteração do codigo dependendo do workspace selecionado foi muito interessante, e acredito que me trouxe para perto de um desafio real de desenvolvimento de uma infraestrutura.
- **Conclusão**: Este foi um dos desafios mais interessantes que já enfrentei. Espero que seja apenas um passo em minha jornada como DevOps. Agradeço à Rocketseat pela oportunidade.


## Referências

- [Documentação do Terraform](https://www.terraform.io/docs)
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/index.html)


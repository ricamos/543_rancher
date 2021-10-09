# Curso 4linux - 543 Gerenciamento de Cluster Kubernetes com Rancher


## Sumário:

1. [Motivação](#motivacao)
2. [Descrição de arquivos](#file)
3. [Interação com o projeto](#interact)
4. [Autor e referências](#autor)
5. [Base de conhecimento](#ack)

## Motivação <a name="motivacao"></a>
O Vagrant é uma ferramenta simples e poderosa para construção de laboratórios de desenvolvimento. Para criação de ambiante em cloud no curso de Rancher o processo foi demostrado na interface da GCP. Para poder continuar utilizando das vantagens desta ferramenta, fiz uma configuração para provisionamento de instâncias na GCP através do Vagrant. Além de todas as vantagens técnicas, podemos documentar os passos realizados no projeto.       

## Descrição de arquivos <a name="file"></a>
LOCAL_SSH_KEY - Chave SSH para acesso as instâncias.

GOOGLE_JSON_KEY.json - Chave de acesso a conta da GCP

## Interação com o projeto <a name="interact"></a>
Criar um projeto

Ativar IAM e Kubernetes API

Adiciona regras de firewall

[Adiciona chave SSH](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys)

Instalar Vagrant Google Provider
```
vagrant plugin install vagrant-google	
```
```
vagrant up --provider=google
```
[Reservar IP estático](https://cloud.google.com/compute/docs/ip-addresses/reserve-static-external-ip-address#reserve_new_static)

Menu de navegação -> Rede VPC -> Endereços IP Externos -> Reservar um endereço estático 

### Se 'ArgumentError': 
User-Agent has field value "fog/0.0.9 google-api-ruby-client/0.8.6 Linux/5.11.22-100.fc32.x86_64\\n (gzip)", this cannot include CR/LF (ArgumentError)

```
mv ~/.vagrant.d ~/.vagrant.d_old
```
```
vagrant plugin install vagrant-google
```
```
vagrant up --provider=google

```

## Autor e referências <a name="autor"></a>
Ricardo Coelho

https://github.com/mitchellh/vagrant-google


## Base de conhecimento <a name="ack"></a>
Google Cloud Platform (GCP)

Vagrant 

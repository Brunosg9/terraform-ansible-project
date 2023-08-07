#PROVEDOR E ACESSO AWS
provider "aws" {
access_key = "SUA CHAVE AWS"            # sua chave de acesso
secret_key = "SECRET KEY AWS"           # secret key
region = "us-east-1"                    # regiao onde vai ser feita
}

resource "aws_instance" "instance1" {   # 
ami = "ami-0261755bbcb8c4a84"           # tipo de imagem
instance_type = "t2.micro"              # tipo de maquina
key_name = "virginia-key"               # chave de exemplo
user_data = <<-EOF
               #!/bin/bash
              cd /home/ubuntu
               echo "<h1>Feito pelo Terraform </h1>" > index.html
               nohup busybox httpd -f -p 8080 & 

               EOF
tags = {
Name = "terraform-teste"
}
}

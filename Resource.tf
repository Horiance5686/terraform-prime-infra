resource "aws_vpc" "prime" {
  cidr_block       =var.prime_vpc_cidir 
  instance_tenancy = "default"

  tags = {
    Name = "prime"
  }
}

#create internet gate way
#https://registry.terraform.io/providers/aaronfeng/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "prime-igw" {
  vpc_id = aws_vpc.prime.id

  tags = {
    Name = "prime-igw"
  }
}

#create public subnet1
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet.html
resource "aws_subnet" "prime-pub1" {
  vpc_id            = aws_vpc.prime.id
  cidr_block        = "variable 4 prime_put1_cidir"
  availability_zone = "variable availability_zone"

  tags = {
    Name = "prime-pub1"
  }
}

#create public subnet2
resource "aws_subnet" "prime-pub2" {
  vpc_id            = aws_vpc.prime.id
  cidr_block        = "prime_pub2_cidir"
  availability_zone = "variable availability_zone_pub2"

  tags = {
    Name = "prime-pub2"
  }
}

#creating a rout table
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table.html
resource "aws_route_table" "prime-pub-route-table" {
  vpc_id = aws_vpc.prime.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prime-igw.id
  }

  tags = {
    Name = "prime-pub-route-table"
  }
}

#associating rout table to public subnets
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "prime-pub1" {
  subnet_id      = aws_subnet.prime-pub1.id
  route_table_id = aws_route_table.prime-pub-route-table.id
}

# associating subnet 2
resource "aws_route_table_association" "prime-pub2" {
  subnet_id      = aws_subnet.prime-pub2.id
  route_table_id = aws_route_table.prime-pub-route-table.id
}

#creatind private subnets
resource "aws_subnet" "prime-private1" {
  vpc_id            = aws_vpc.prime.id
  cidr_block        = "variable for prime_prvt_cidir"
  availability_zone = "prime_prvt1_AZ"

  tags = {
    Name = "prime-private1"
  }
}

# creating a private subnet 2

resource "aws_subnet" "prime-private2" {
  vpc_id            = aws_vpc.prime.id
  cidr_block        = "variable for prime_prvt_cidir"
  availability_zone = "variable for prime_prvt1_AZ"

  tags = {
    Name = "prime-private2"
  }
}

#creating a private rout table
resource "aws_route_table" "private-route_table" {
  vpc_id = aws_vpc.prime.id

  route = []

  tags = {
    Name = "prime-private-route-table"
  }
}

#associating rout table to private subnet
resource "aws_route_table_association" "prime-private1" {
  subnet_id      = aws_subnet.prime-private1.id
  route_table_id = aws_route_table.private-route_table.id
}

# associating my private route-table
resource "aws_route_table_association" "prime-private2" {
  subnet_id      = aws_subnet.prime-private2.id
  route_table_id = aws_route_table.private-route_table.id
}

#prevent hardcoding
#prevent us from exposing companies important secret
#also make our code very dynamic


   variable "region" {
    description = "rgion where we provision our resources"
    type = string
    default = "us-east-1"
   }    

   variable "vpc_cidir" {
    description = "variable for vpc_cidir"
    type = string
    default = "10.0.0.0/16"
   }

    variable "prime_put1_cidir" {
        description = "variable 4 prime_put1_cidir"
        type = string
        default = "10.0.1.0/24"
    }

    variable "prime_put1_cidir" {
            description = "variable availability_zone"
            type = string 
            default =  "us-east-1a"
        }



    variable "prime_put2_cidir" {
        description = "variable for prime_put2_cidir"
        type = string
        default = "10.0.2.0/24"
    }

    variable "prime_put2_cidir" {
        description = "variable availability_zone"
        type = string
        default = "us-east-1b"
    }
    

    variable "prime_prvt_cidir" {
        description = "variable for prime_prvt_cidir"
        type = string
        default = "10.0.3.0/24"
    }    


    variable "prime_prvt2_cidir"{
        description = "variable for prime_prvt1_AZ"
        type = string
        default = "10.0.4.0/24"
    }











            
        

    

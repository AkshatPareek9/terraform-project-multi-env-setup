variable "instance_count" {
    description = "Number of instances"
    type = number
}

variable "ami" {
    description = "Image ID"
    type = string
}

variable "instance_type" {
    description = "Instane type"
    type = string
}

variable "env" {
    description = "Environment Name"
    type = string
}

variable "bucket_name" {
    description = "Name of the bucket"
    type = string

}

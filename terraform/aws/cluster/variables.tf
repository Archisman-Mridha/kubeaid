variable "master" {
  type = object({
    image_id     = string
    max_size     = number
    min_size     = number
    machine_type = string
  })
  description = "K8s master node spec"
  default = {
    image_id     = "099720109477/ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-20220404"
    max_size     = 1
    min_size     = 1
    machine_type = "t4g.medium"
  }
}

variable "worker" {
  type = object({
    image_id     = string
    max_size     = number
    min_size     = number
    machine_type = string
  })
  description = "K8s worker nodes spec"
  default = {
    image_id     = "099720109477/ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20220404"
    max_size     = 2
    min_size     = 1
    machine_type = "t3.medium"
  }
}

variable "region" {
  type        = string
  description = "location where the cluster needs to be created"
}

variable "cidr" {
  type        = string
  description = "CIDR for k8s cluster"
}

variable "availability_zone_names" {
  type        = list(string)
  description = "Availability zone for the region"
}

variable "environment" {
  type        = string
  description = "Env of k8s cluster"
}

variable "cluster_name" {
  type        = string
  description = "K8s cluster name"
}

variable "kops_state_bucket_name" {
  type        = string
  description = "K8s cluster name"
}

variable "kubernetes_version" {
  type        = string
  description = "K8s cluster version"
  default     = "1.22.8"
}

variable "tags" {
  type        = map
  description = "Tags for the k8s cluster"
  default     = ({})
}

variable "domain_name" {
  type        = string
  description = "Domain Name of the k8s cluster"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnet for the vpc"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnet for the vpc"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID of the kubernetes cluster"
}

variable "ingress_ips" {
  type    = list(string)
  default = ["10.0.0.100/32", "10.0.0.101/32"]
}

variable "subdomain" {
  type        = string
  description = "subdomain of the k8s cluster"
}

variable "api_dns_zone" {
  type        = string
  description = "DNS zone for the k8s api"
}

variable "admin_ssh_keys" {
  type        = list
  description = "Only one ssh key is supported as of now"
}

variable "kube_api_server" {
  type      = object({
    feature_gates      = optional(map(string))
    oidc_issuer_url    = optional(string)
    oidc_client_id     = optional(string)
    oidc_groups_claim  = optional(string)
    oidc_groups_prefix = optional(string)
  })
  description = "List of option suppored for kube_api_server"
  default     = {}
}

variable "kube_controller_manager" {
  type      = object({
    feature_gates = optional(map(string))
  })
  description = "List of option suppored for kube_controller_manager"
  default     = {}
}

variable "kube_scheduler" {
  type      = object({
    feature_gates = optional(map(string))
  })
  description = "List of option suppored for kube_scheduler"
  default     = {}
}

variable "kubelet" {
  type      = object({
    feature_gates = optional(map(string))
  })
  description = "List of option suppored for kube_scheduler"
  default     = {}
}

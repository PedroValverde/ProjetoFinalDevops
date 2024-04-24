variable "location" {
    type = string
    default = "brazilsouth"
}

variable "tags"{
    type = map
    default = {
        "ambiente" = "desenvolvimento"
        "integracaocontinua" = "ativada"
        "entregacontinua" = "ativada"
    }
}
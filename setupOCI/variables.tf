variable "oracle_api_key_fingerprint" {}
variable "oracle_api_private_key_path" {}

variable "ssh_public_key" {}
variable "ssh_private_key_path" {}

variable "compartment_ocid" {}
variable "tenancy_ocid" {}
variable "user_ocid" {}

variable "region" {}

variable "free_tier_availability_domain" {}

variable "instance_display_name" {
  default = "WireHole"
}

variable "vcn_cidr_block" {
  default = "10.1.0.0/16"
}

variable "availability_domain_number" {
  default = 1
}

variable "instance_shape" {
  # Free-Tier is VM.Standard.E2.1.Micro
  default = "VM.Standard.E2.1.Micro"
}


variable "instance_image_ocid" {
  type = map

  default = {
    # See https://docs.cloud.oracle.com/en-us/iaas/images/image/f54a6c52-ce85-4265-93c8-3f73a04e0417/
    # Oracle-provided image "Canonical-Ubuntu-20.04-Minimal-2021.02.16-0"
    ap-chuncheon-1   = "ocid1.image.oc1.ap-chuncheon-1.aaaaaaaasoepefsfk5vcccgovz37qcxijftc5k5hbtj4qwyyr4gzafxnh4cq"
    ap-hyderabad-1   = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaag5asha7c7ehdkk23on3pqjeovde5syupm5asqxvrhbdur6wqmeoq"
    ap-melbourne-1   = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaatweeg7igfb5yfcosqeywjpmkz34cpf6dnecuegxloo7qqimn25qa"
    ap-mumbai-1      = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaai4j3eg6bq377bi37h2j4jmlq32wditjvoyejj2xrwvdl2ygfmr4a"
    ap-osaka-1       = "ocid1.image.oc1.ap-osaka-1.aaaaaaaam2ainrw7wgqvo4ubhta5ir7yxayast5tnld5r2232zmrjn5oxt4a"
    ap-seoul-1       = "ocid1.image.oc1.ap-seoul-1.aaaaaaaawxh4jhr27mr6af33bn3onvvmjnk5t2q4ldrshjog4fk5k7bh5npq"
    ap-sydney-1      = "ocid1.image.oc1.ap-sydney-1.aaaaaaaarhsnbtfalurreeox3q2eygzc6uns6kvf52flwfmmi7e4v37g2oja"
    ap-tokyo-1       = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaato55by5l2yabyitrv62utowyisopehtvqbjrui6vympbi5b57k7q"
    ca-montreal-1    = "ocid1.image.oc1.ca-montreal-1.aaaaaaaakeex5ql5gg6y2x3xr6u25yn6o4mpsiyj7gawfih3jslqloqzcw2a"
    ca-toronto-1     = "ocid1.image.oc1.ca-toronto-1.aaaaaaaa5vryfwhhv53hsnwheub2orzaqz4wdxxwmmy2nmv2uqcj3mqoxlja"
    eu-amsterdam-1   = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaawlrfkqdc4fm4tco6ifgmd4pcbjg232hyo6gscvu6xcgnufdznqtq"
    eu-frankfurt-1   = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaajpczlxnx6zpft7itfrflhckne3cw73zazwcipmxwomkk7cs2pyta"
    eu-zurich-1      = "ocid1.image.oc1.eu-zurich-1.aaaaaaaa5qk4e6vjprmhayknfq6iqtykvapgt7ytjvxvguvyv56ftj6eb2ha"
    me-jeddah-1      = "ocid1.image.oc1.me-jeddah-1.aaaaaaaawgfukdnwyivzrweyge62er4x2qqqamhpp5odzwcjpus5dtu6sbia"
    sa-saopaulo-1    = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaa3yy545uhnmymyi6m36a4xnkoylkj7nnotxgwvpjwwyutrestcvrq"
    uk-gov-london-1  = "oci1.image.oc4.uk-gov-london-1.aaaaaaaagdq7eit7otaqpbo5tdeh2avqvrszszw3iqojva5kl5ztoxx7ypqa"
    uk-london-1      = "ocid1.image.oc1.uk-london-1.aaaaaaaara4pgzinh63jfejhjdsydrmusfg4qvr3a5psanwfqcrkvmewjbnq"
    us-ashburn-1     = "ocid1.image.oc1.iad.aaaaaaaatmpx5yaawwe45me3uvajmqfwfs34iwgalmyzlrvfi6jsr4h5cgva"
    us-gov-ashburn-1 = "ocid1.image.oc3.us-gov-ashburn-1.aaaaaaaaz6fvfik6o4pn2y5sfickqc54erwjdw3y2m4zqronv5qkchbslw5a"
    us-gov-chicago-1 = "ocid1.image.oc3.us-gov-chicago-1.aaaaaaaafamrtv7tme35flm6rh7np57tpy3kpjoynlbdawchgkkir5vjfdwa"
    us-gov-phoenix-1 = "ocid1.image.oc3.us-gov-phoenix-1.aaaaaaaamvyue7nluogi6hpe5t4mtb2k2n3xzwdmuva4kkhhcfagevmg42uq"
    us-langley-1     = "ocid1.image.oc2.us-langley-1.aaaaaaaamfqdjpirigiwupd2ky3eupvkib7tstra2ppr4q772dlt5ncdc77q"
    us-luke-1        = "ocid1.image.oc2.us-luke-1.aaaaaaaaiz2j5woo3qiqfenc4fjus2lqozyjsniq2o4crop3tq6qy5crj3pa"
    us-phoenix-1     = "ocid1.image.oc1.phx.aaaaaaaa7gmxggfqwyv2otfp35dn2qxfv3d3wou5mlbgqasc7zyhyuwvetca"
  }
}


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
    # See https://docs.oracle.com/en-us/iaas/images/image/1755009b-9f4d-45a4-8bcc-3b916ba95797/
    # Oracle-provided image "Canonical-Ubuntu-20.04-Minimal-2022.10.31-0"
    af-johannesburg-1   = "ocid1.image.oc1.af-johannesburg-1.aaaaaaaa2ffaf7bumgpiekm5wqpr4bzf43ce6l5hksdrw4oxnk3y3nbdik3a"
    ap-chuncheon-1      = "ocid1.image.oc1.ap-chuncheon-1.aaaaaaaa4q36fw3nv5x2d7vt4m4yy45oxo7uoq4s4yszwppavrzdk3fbkdvq"
    ap-hyderabad-1      = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaazcaahti5lxmmtvfkr6unzhdlocd77q7b2jj4qcche7kmxiqxm5oq"
    ap-melbourne-1      = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaauuhaeua2zcczujif6ygv3kmaukuxmecf2ygv5biygk3qthpah3ua"
    ap-mumbai-1         = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaaylmpb4hxkkia6w4s5tqxwlaml7fplqw3bpoc7fovdlr27jpniqoq"
    ap-osaka-1          = "ocid1.image.oc1.ap-osaka-1.aaaaaaaaemx7a3zqys5iiphoei4uj2p2hfr2ex2fbpjera7h47oyouj7iddq"
    ap-seoul-1          = "ocid1.image.oc1.ap-seoul-1.aaaaaaaafm75v66pjkgghntaelh34me22l5cgjltezqlydctbihn6wpnrbrq"
    ap-singapore-1      = "ocid1.image.oc1.ap-singapore-1.aaaaaaaa2utynox77oud2iomrpk376u6uwlcbxkxm6352r3zxoowncts2sfa"
    ap-sydney-1         = "ocid1.image.oc1.ap-sydney-1.aaaaaaaazqwqluyxgmwhlhcrr7ux6h62dppcgasnbjlz43v3cuzwq6z62a5q"
    ap-tokyo-1          = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaaeoy333pwiseascc7jmj67otwgm567o6vwgcfyxuw4a7g6i5lxwjq"
    ca-montreal-1       = "ocid1.image.oc1.ca-montreal-1.aaaaaaaanwnqagwiyxtwkqossbhehsuwsrsvwhhc7rknbvuuawrgpmzwxsrq"
    ca-toronto-1        = "ocid1.image.oc1.ca-toronto-1.aaaaaaaapn3xp4x7ifbxrogonaad4nibgc4mogfz23bdfgkbpjguynirdjzq"
    eu-amsterdam-1      = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaagx42bqyv26azumdusxy7ehkah76gbfkwkka46nq6u3kwt4tgxiha"
    eu-frankfurt-1      = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaklrz4q5bjkpzpspimiql5rhor6wct5mwja44xaahvvtckya2bjxa"
    eu-marseille-1      = "ocid1.image.oc1.eu-marseille-1.aaaaaaaa4ria6g56f2kn2u7ib7plcyxtdeqndygdvsbxpjvu57g3rmsyefeq"
    eu-milan-1          = "ocid1.image.oc1.eu-milan-1.aaaaaaaaqjkix4eutqhti6uv53pdzzga7udubmd3wlysr6fdf36axucicqdq"
    eu-paris-1          = "ocid1.image.oc1.eu-paris-1.aaaaaaaazvyxuv2etmlgjoifarv3qz2t5wbm4sekbdcelap4dgpq4gci52ga"
    eu-stockholm-1      = "ocid1.image.oc1.eu-stockholm-1.aaaaaaaaxkjambfzwjfarrkprpkpgnduxmyimfswjtno3fwo5q5ebdrmfeqa"
    eu-zurich-1         = "ocid1.image.oc1.eu-zurich-1.aaaaaaaa7zzfkngfygk3tqs3qzcctzmbp7mo7bflgfku2indmnxbypbdaciq"
    il-jerusalem-1      = "ocid1.image.oc1.il-jerusalem-1.aaaaaaaayyxcnvnxgekse5jz26hgk5b3wygonwvds5uqcbnezadonjkpdzka"
    me-abudhabi-1       = "ocid1.image.oc1.me-abudhabi-1.aaaaaaaaivwxphcw6nm7ewkrfcg4sgicsbypox6ja2lzlyowxknv6hlrmspq"
    me-dubai-1          = "ocid1.image.oc1.me-dubai-1.aaaaaaaareqt7fqd4bnss6ilp2vrcrbcpewwcsz5jfrzbqqznwgy25h5w72a"
    me-jeddah-1         = "ocid1.image.oc1.me-jeddah-1.aaaaaaaacmq2cd2yienkk5actp4t6btx7gyqkxzzyhglbzuuib22x2ezttya"
    sa-santiago-1       = "ocid1.image.oc1.sa-santiago-1.aaaaaaaalxvdnoinxoyqk6e4kcsml2cojetewqijq4xktbb7ghrvbk6xjoda"
    sa-saopaulo-1       = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaamwrfvdyhtb2fkvasenfuryxla4a7ugykkm3ntvnufy5dekb5cjsa"
    sa-vinhedo-1        = "ocid1.image.oc1.sa-vinhedo-1.aaaaaaaavptu5o3zarqdbvhs7xjb3phf6knufdvmncj76rt6cjun6svllzfq"
    uk-cardiff-1        = "ocid1.image.oc1.uk-cardiff-1.aaaaaaaabitky2fst6mxe43oh3ox2qage4ueuvyofpp5jqi6mjdufegztrtq"
    uk-london-1         = "ocid1.image.oc1.uk-london-1.aaaaaaaa535ds7qtvc6q5lvqkss77ztjj7ebrdapbhs5aaaumstwpg6lybpq"
    us-ashburn-1        = "ocid1.image.oc1.iad.aaaaaaaal4wjggisi4t7cnnb7kwilvo2qw62axvt4gm3qqjn2oe55lqahgxa"
    us-phoenix-1        = "ocid1.image.oc1.phx.aaaaaaaamuzmtfq6oafcclf6wfn7kc2gmilymf6sd2cs43msz3odibimqvtq"
    us-sanjose-1        = "ocid1.image.oc1.us-sanjose-1.aaaaaaaaowrkghyri6xepvh5eijne35pj6k2er2o52qyvprodthg2aoyzbfq"
  }
}


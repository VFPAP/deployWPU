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
    # See https://docs.oracle.com/en-us/iaas/images/image/8f0cbe71-0f53-49f7-894c-0d27d895fc65/
    # Oracle-provided image "Canonical-Ubuntu-20.04-Minimal-2022.03.04-0"
    af-johannesburg-1   = "ocid1.image.oc1.af-johannesburg-1.aaaaaaaa5ddov7ptul3wq3ptwg65w5xikirtx6sftgzg2yhaa724czjtlrpa"
    ap-chuncheon-1      = "ocid1.image.oc1.ap-chuncheon-1.aaaaaaaaqlyofhk4525mp7ksb36n7fuwrbychyfaf7w6oup4getbkjb4bzmq"
    ap-hyderabad-1      = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaadw2wzndxbluvosjaj4j4odcijx7c5zypdg3og22gc6ie2zimyw4q"
    ap-melbourne-1      = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaagn3ggfedzmgogki5fqkno7qm4zy64cnbeudxwmjxjlnyavn5jxva"
    ap-mumbai-1         = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaa4cqwsfpqdepa2th3rbrl5tpay73qey4qihx5lc6kw2ltc35sijua"
    ap-osaka-1          = "ocid1.image.oc1.ap-osaka-1.aaaaaaaaytf6vfq44bvohgbsuzhywt66fnx7dpqoyzvah7zfbxqqrhrq5nfq"
    ap-seoul-1          = "ocid1.image.oc1.ap-seoul-1.aaaaaaaaazue3a26ocdz66qvziil5bizupzkmnfnko5hkhk7du6ufzkfmmuq"
    ap-singapore-1      = "ocid1.image.oc1.ap-singapore-1.aaaaaaaah3kp3ldhzhpbtkmvfltfed3ikrnlslrke4ajbzjwr3atpx6uzxia"
    ap-sydney-1         = "ocid1.image.oc1.ap-sydney-1.aaaaaaaaio75ldyuskrmyjagsikwxkba6y2jdmggqipiardq2k3kkhtyl3xq"
    ap-tokyo-1          = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaah6itx6q764r4so6rhrppkdqif3pb4d2j2bp6etk6zdgcedidv7ga"
    ca-montreal-1       = "ocid1.image.oc1.ca-montreal-1.aaaaaaaas5e67bbewlu2wazmzqwlclrvv6qsuc53huhmbhvjgiuy7vop6eia"
    ca-toronto-1        = "ocid1.image.oc1.ca-toronto-1.aaaaaaaasdtwu6kerbvg6xfhzq7wt6ta4vrjooc4sgcasm5y3xoxu6fp3sua"
    eu-amsterdam-1      = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaaa2k6yltenqlzgapxubwqioufjxsvrbusjq7376flmdgiapeonfpq"
    eu-frankfurt-1      = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa2lrlzhaj5gsr7zrn3u4tzzh52usfnarabgjz7236hrrxaeomo5va"
    eu-marseille-1      = "ocid1.image.oc1.eu-marseille-1.aaaaaaaa6ymv2ooxrrx66s7nq6unjhnbypnf2tvlbubhj464zwwdt2v4toma"
    eu-milan-1          = "ocid1.image.oc1.eu-milan-1.aaaaaaaaxddc2gqxuiejnuae7i6pjwdc5h7wa5owbs2rm5zsrjduwdjjmspq"
    eu-stockholm-1      = "ocid1.image.oc1.eu-stockholm-1.aaaaaaaafzxbg2buyn7bjg6hkumawyhwttzilfov77q4rskkbth4nbzynwfa"
    eu-zurich-1         = "ocid1.image.oc1.eu-zurich-1.aaaaaaaaoux2vajrrjlseljnm4kttehcjmu4zs6easbgkesnseytrrsjur4a"
    il-jerusalem-1      = "ocid1.image.oc1.il-jerusalem-1.aaaaaaaaowzhfswhvt5mrih2zbyp65wz4rb7aojoadltrczcbjkivrf5p2jq"
    me-abudhabi-1       = "ocid1.image.oc1.me-abudhabi-1.aaaaaaaaplex4nkvsp2ih2fka7zcrnl6chta5el34mgeciur3a6zg6gcyagq"
    me-dubai-1          = "ocid1.image.oc1.me-dubai-1.aaaaaaaaacb55tvwnhsfvkxvslajjtq5bbubrhamddei72wicsrs6b4xjccq"
    me-jeddah-1         = "ocid1.image.oc1.me-jeddah-1.aaaaaaaa7x6bzaa27rhhc3lmxb2jstly765apgwr4criy6mwz4wjzrmyiqkq"
    sa-santiago-1       = "ocid1.image.oc1.sa-santiago-1.aaaaaaaaumi2yo3ysznjbnmv3hb3pl5sr3jpnfymmhvdx2ukbyrlz3bks6bq"
    sa-saopaulo-1       = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaztn3nqf55djlvi5e4u6bkprysjffblfuvoatviwrdgc2biamsgwq"
    sa-vinhedo-1        = "ocid1.image.oc1.sa-vinhedo-1.aaaaaaaar7onl2f2d7ypkvkxqlryzpnsrv4sxxlxrsumnzo6erpcskctordq"
    uk-cardiff-1        = "ocid1.image.oc1.uk-cardiff-1.aaaaaaaawvdqe5ohqbr33koaic3kmwhestj52uuuf4kqlp5wprmtbb3h7gqa"
    uk-london-1         = "ocid1.image.oc1.uk-london-1.aaaaaaaabtyai7rkxcirycov253c4bmju7zgi7lifl225255g3g2se2ez6wa"
    us-ashburn-1        = "ocid1.image.oc1.iad.aaaaaaaayhxy5ddwjz4hvhmc4mjcmjcgr3kkhhrhrysm3gzfp7chk5mr6dsa"
    us-phoenix-1        = "ocid1.image.oc1.phx.aaaaaaaajxl6tppy5qdc3q33tscqovia6czp6smdaa6gehwjr43y7jsxxuaq"
    us-sanjose-1        = "ocid1.image.oc1.us-sanjose-1.aaaaaaaajjq7qfj4n74r243p36hydqf6xk33fdy5lx3av2lyey7qd765zbua"
  }
}


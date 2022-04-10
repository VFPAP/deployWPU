# deployWPU
Deployment of WireGuard + PiHole + Unbound to Oracle Cloud Infrastructure

## Explaining What We're Using 

### Completely Free Ad-blocking VPN

Oracle offers an “Always Free” service where one can setup a Virtual Machine running Ubuntu 20.04 (more options are available but we're using this OS). Inside this Virtual Machine, we're going to setup a secure VPN server that's exposed to the Internet that will forward all DNS requests from the VPN users to the PiHole running locally, hence blocking ads.


### What is WireHole

WireHole is a combination of WireGuard, Pi-hole, and Unbound in a docker-compose project with the intent of enabling users to quickly and easily create a personally managed full or split-tunnel WireGuard VPN with ad-blocking capabilities thanks to Pi-hole, and DNS Caching, additional privacy options, and upstream providers via Unbound. 

### What is WireGuard

WireGuard is a security-focused Virtual Private Network (VPN) known for its simplicity and performance (up to four times better performance and connection speeds than OpenVPN). It uses state-of-the-art cryptography to protect the data being transmitted.

### What is PiHole

PiHole is an advertisement and Internet tracker blocking application that acts as a DNS sinkhole, meaning that whenever a device makes a DNS request, the PiHole checks if the domain being requested matches any domain present in a big list of blocked domain. If the domain is present in the list, it gets blocked and your device is unable to load the advertisement. This is called DNS Filtering and it's considered one of the most effectice ways of blocking ads, trackers and other annoyances.

### Why use Unbound

WireHole also uses Unbound which creates a recursive DNS server in the machine running PiHole, which improves considerably the speed of DNS responses. Read more about PiHole + Unbound [here](https://docs.pi-hole.net/guides/unbound/).

### Full Tunnel vs Split Tunnel

While configuring WireGuard, there are two different options. Using a Full Tunnel means that all your traffic will go through WireGuard (and Pihole), hence offering full encryption. With a Split Tunnel, just the DNS requests go through WireGuard (and PiHole) so you'll get the same level of advertisements blocking but your ISP can still see which websites your are visiting.
Using the first option (Full Tunnel) will result in a bit of a overhead (~10%), meaning that your connection speed will be a bit slower. This doesn't mean your Download/Upload speeds will decrease a lot, but there's a slight increase in your ping times (~10ms with Split Tunnel vs ~40ms Full Tunnel). This is not ideal for Online Gaming for example. 
Using the second option (Split Tunnel) is the fastest option and probably the one you'd want to use if you don't mind websites knowing your IP address and if you just want to block advertisements everywhere.

## Getting Started

### Signing up for Oracle Free Tier

Go to https://signup.oraclecloud.com and fill out with your details.

When selecting the "Home Region" option, try to pick the one closest to where you are.

You'll be required to provide a credit card number even though **you won't be charged at all**. You can use a disposable/virtual card with a limited amount so you don't give away your real card details and you can destroy/cancel that card later.

Finish the signup process (this requires them verifying your details so it can take some time).

### Generating a SSH key pair (the Linux way)

Go to a terminal a type:
```console
ssh-keygen -t rsa -N "" -b 2048   # and press enter.
```
You can use all the default values and you don't need to use a passphrase so just hit enter when prompted.

### Generating an API Signing Key (the Linux way)

Go to a terminal and type:
```console
mkdir ~/.oci 
openssl genrsa -out ~/.oci/oci_api_key.pem 2048
chmod go-rwx ~/.oci/oci_api_key.pem
openssl rsa -pubout -in ~/.oci/oci_api_key.pem -out ~/.oci/oci_api_key_public.pem
cat ~/.oci/oci_api_key_public.pem # You'll use the output of this command later
openssl rsa -pubout -outform DER -in ~/.oci/oci_api_key.pem | openssl md5 -c # You'll use the output of this command later
```


Got to https://www.oracle.com/cloud/sign-in.html and input your Cloud Account Name (the default is your email without "@something.com". Ex: \<Cloud Account Name\>@something.com, remove the @something.com and just use \<Cloud Account Name\>.

Then input your email and password used to create the Oracle Cloud account in the form on the right-hand side (Oracle Cloud Infrastructure)

Now you should be in the Oracle Cloud Console. (The URL should be: cloud.oracle.com/?region=\<location\>. Eg: https://cloud.oracle.com/?region=uk-london-1)

Now click on the button in the top right corner of the page (Profile) and click on your email. 

Scroll to the bottom of the page and under Resources on the left-hand side click on API Keys.

Click on the blue button to Add Public Key, select "Paste Public Keys" and paste the output of the first command where I said you'd need its output (see example below of what to copy) and click Add.
```console
-----BEGIN PUBLIC KEY-----
MKADHFSADVGHAVGXHAVAGASDFGHJKLlOIUYGFCVBNMxX6QeYPyD6g1
uQIENdha6nlhhBqLTwckQh5Oy8aUZEdCnLJc4TUiD8Tux4t7Cg1mlMRYfPqadmYZ
7AGHSND+AHYQKDNABNIQIUWIOEWJN
-----END PUBLIC KEY-----
```


Now you should compare the Fingerprint that is shown on the page with the output of the second command where I said you'd need its output (both Fingerprints must be the same).
Also, if you see a "Configuration File Preview" in your screen, take note of the values: **user**, **tenancy** and **region**. Ex:
```console
user=ocid1.user.oc1..aaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
fingerprint=xx:xx:xx:xx:xx:xx:xx
tenancy=ocid1.tenancy.oc1..aaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
region=uk-london-1
```

### Getting the OCIDs, Region and Availability Domain


**User's OCID**: 
Use the value copied from the "Configuration File Preview".

OR

Scroll all the way up in the same page where we left off in the last step of the last section and under User Information the first line (OCID) is what we want. Click Copy and then save that value somewhere (just paste it in your favourite text editor).

**Tenancy OCID**:
Use the value copied from the "Configuration File Preview".

OR

Click on the button in the top right corner of the page (Profile) and click on "Tenancy: \<Cloud Account Name\>". 
Similarly to the last step, just copy the OCID value under Tenancy Information and paste it in the same place where pasted the User's OCID.

**Region**:
Use the value copied from the "Configuration File Preview".

OR

To get the region identifier, just look at the URL of the page. It should be: cloud.oracle.com/tenancy?region=\<location\>. Your region is in the \<location\> value (Ex: uk-london-1). Copy that value and paste it in the same place where pasted the OCIDs. 
Alternatively, go to: https://docs.cloud.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm#About__entry__1 and copy the "Region Identifier" for the Home Region you selected when you created your account. Ex: if you chose "UK South (London)" you need to copy the value "uk-london-1".

**Availability Domain**:
Now, in the same page where you got the OCIDs, click on the "Oracle Cloud" logo in the top left corner of the page and click on "Create a VM Instance" under "Launch Resources" or go to "https://cloud.oracle.com/compute/instances/create", and click on the Edit button in front of "Placement".
There, you should see a purple rectangle with the following:

> You can create instances using the **VM.Standard.E2.1.Micro** shape in the \<Your Availability Domain\> availability domain.

Copy the value \<Your Availability Domain\> (Ex: "VBAL:UK-LONDON-1-AD-3") and paste it in the same place where pasted the OCIDs and the region identifier.
You can click on Cancel or just close the page because we're not actually creating a VM Instance just now.


### Installing Terraform 

Go to: https://www.terraform.io/downloads.html and click on the appropriate link for your machine. Ex: "64-bit" under "Linux" 

Extract the file inside the zip file somewhere and then open a terminal on that directory and type: 
```console
chmod +x terraform
sudo mv terraform /usr/local/bin/terraform
```

Now, close your terminal and open it again and type: 
```console
terraform
```
 you should see the usage instructions of Terraform.

### Setup a Terraform Plan

First of all, ensure you have git installed in your machine. In a terminal window type:
```console
sudo apt install -qqy git 
```
Then type: 
```console
git clone https://github.com/VFPAP/deployWPU.git
cd deployWPU/setupOCI
terraform init
bash updateRegions.sh
bash fillVars.sh
```

Next you need to go to the place where you stored the values in the [previous section](#getting-the-ocids-region-and-availability-domain), and then paste the User OCID and hit enter, the Tenancy OCID and hit enter, the Region and hit enter and finally the Availability Domain and hit enter.

After that you can check if your terraform.tfvars file looks right. To do so, open a terminal and type:
```console
cat terraform.tfvars.example
```
This is an example file so it won't have your details but you should check if the structure of yours is similar to this one.
Next, type:
```console
cat terraform.tfvars
```
This one is your file with your details. You can double check the details.

Finally, in the terminal type:
```console
terraform plan
```
If this completed with no errors, proceed to the next step.

### Deploy Solution

Next, just type the following in the terminal:
```console
terraform apply -auto-approve
```
This will take some time (up to 10min) and after this command executes, you'll see a big QR code in the terminal window that you can use to set up the first device (Ex: your phone) that will be using Wireguard + PiHole. You can close your Terminal window.

## Installing the Client Configuration

In the last section, we managed to install and setup our VPN server. Now we need to configure our clients (Ex: your PC or phone) to connect to the VPN server.
**Note**:
<small>By default, the VPN server will create configuration files for two clients (let's refer to them as Peer 1 and Peer 2). This can be changed by editing [this line](https://github.com/VFPAP/deployWPU/blob/6b38c9cc2a6db8b809207daafeb127208e05509a/setupWireHole/docker-compose.yml#L34) in the Docker Compose configuration file.<small>

To access the configuration files for all the Peers, we need to access the server through SSH. To do that, we need to use the Private Key we created in [this step](#generating-a-ssh-key-pair-the-linux-way). If you didn't change anything, your Private Key should be in `~/.ssh/id_rsa`.
Also, you need the IP address of your server. You can find the IP address by going to cloud.oracle.com/compute/instances?region=\<location\> (Ex: https://cloud.oracle.com/compute/instances?region=uk-london-1). You should then see an instance called "pihole-wireguard". If you don't see it, you may need to select a compartment under "List Scope" on the left-hand side of the page.
Once you find the “pihole-wireguard” instance, its IP address is shown under "Public IP".
Now you can SSH into the server by running the following command in a Terminal:
```console
ssh -i ~/.ssh/id_rsa ubuntu@<PublicIP>
```
Then, you can find the configuration files for your Peers in the directory `/deployWPU/setupWireHole/wireguard/`.
To access the configuration file for Peer 1, run:
```console
sudo cat /deployWPU/setupWireHole/wireguard/peer1/peer1.conf
```
To access the configuration file for Peer 2, run:
```console
sudo cat /deployWPU/setupWireHole/wireguard/peer2/peer2.conf
```
Copy the contents of the file you want and save it in your device with the name `peerX.conf` . (Replace the X with the number of your Peer).
Then, proceed to the next section depending on the OS of the device you want to connect to the VPN from.

### Windows Client
Download the Wireguard Client from [here](https://download.wireguard.com/windows-client/wireguard-installer.exe) and install it.
Then, open the Wireguard Client and click on "Import tunnel(s) from file". Browse to the folder where you saved the configuration file and open the `peerX.conf`.
And that's it! Now you can activate you tunnel to turn on the VPN.

### Linux Client
Download and install the Wireguard Client following the instructions [here](https://www.wireguard.com/install/), depending on your Linux Distribution.
Then, you need to go to the directory where you saved the configuration file `peerX.conf`, open a Terminal in that directory and run:
```console
# Install the configuration file in the correct directory
sudo install -o root -g root -m 600 peerX.conf /etc/wireguard/wg0.conf #Replace the X with the number of your Peer

# Start the WireGuard VPN:
sudo wg-quick up wg0

# Verify the connection to the VPN:
sudo wg
```
And that's it! The VPN tunnel is now active.
To stop the VPN, run the command:
```console
sudo wg-quick down wg0
```

## Configuration
### Split-Tunnel (recommended)

If you wish to use the Split-Tunnel mode (refer back to this [section](#full-tunnel-vs-split-tunnel)), go to the WireGuard client on your device (Ex: your Phone) and change the `AllowedIps` to `10.2.0.0/24, ::/0` to only tunnel the Pi-Hole Web Panel, DNS traffic and all IPv6 traffic to avoid DNS leaks via IPv6.

### Setting a DNS record for PiHole (optional)

Follow the steps below to access your PiHole Admin Console by going to http://pihole.lan/admin instead of having to type the IP address (http://10.2.0.100/admin):

1. Login to PiHole admin (http://10.2.0.100/admin)
2. Navigate to "Local DNS"
3. Type the domain you wish to use to access the PiHole dashboard in the "Domain" field. Eg: "pihole.lan"
4. Type the IP address of the PiHole in the "IP Address" field:  "10.2.0.100"
Now you can access the dashboard by going to http://pihole.lan/admin

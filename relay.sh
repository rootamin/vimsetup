read -p 'Enter your main server IP like (1.1.1.1): ' IP
echo "The main server IP is $IP"
sudo apt install iptables iptables-persistent
sudo sysctl net.ipv4.ip_forward=1
sudo iptables -t nat -A PREROUTING -p tcp --dport 25565 -j DNAT --to-destination $IP:443
sudo iptables -t nat -A POSTROUTING -j MASQUERADE
sudo mkdir -p /etc/iptables/
sudo iptables-save | sudo tee /etc/iptables/rules.v4

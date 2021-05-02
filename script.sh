export ipo=$(cat ip.txt)
sudo echo "sed -i '2s/./$ipo &/' inventory" > a.sh
sudo chmod 777 a.sh
sudo sh a.sh

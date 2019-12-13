# Installazione utility di base 

echo "[!] Nota: qualsiasi dei link che seguono potrebbero non funzionare in futuro, lo stesso vale per il nome dei pacchetti:"
echo "[i] Installo update, vim, vim-gtk, adb, apktool, git, python-pip, sqlite, dexdump..."
printf "[i] Premi un pulsante per continuare..."
printf "[i] Press a key to continue..."
read

sudo apt update 
sudo apt install vim vim-gtk -y
sudo apt install adb -y
sudo apt install apktool -y
sudo apt install git -y
sudo apt install python-pip -y # for InsecureBankv2, useless anyway
sudo apt install sqlite -y
sudo apt install python3-pip -y
sudo apt install dexdump

# Installazione di dex2jar
echo "[i] Installazione e impostazione di dex2jar..."
sleep 5

sudo apt install openjdk-8-jre
wget https://sourceforge.net/projects/dex2jar/files/dex2jar-2.0.zip/download 
mv download d2j.zip
unzip d2j.zip
rm d2j.zip
sudo mv dex2jar-2.0 /opt
sudo chown xubuntu:xubuntu -R /opt/dex2jar-2.0
chmod * -R /opt/dex2jar-2.0
echo export PATH=/opt/dex2jar-2.0:$PATH >> ~/.bashrc
source ~/.bashrc

# Installazione di jdgui
echo "[i] Installazione di JD-GUI..."
sleep 3

wget https://github.com/java-decompiler/jd-gui/releases/download/v1.6.5/jd-gui-1.6.5.deb
sudo dpkg --install jd-gui-*
rm jd-gui-*
echo alias jd-gui=\"java -jar /opt/jd-gui/jd-gui.jar\" >> ~/.bash_aliases

# Installazione di Android Studio 
echo "[i] Installazione di Android Studio..."
sleep 2

wget https://dl.google.com/dl/android/studio/ide-zips/3.5.3.0/android-studio-ide-191.6010548-linux.tar.gz
tar xvfz unzip android-studio-ide*
sudo mv android-studio /opt/
rm android-studio-*
echo export PATH=/opt/android-studio/bin:$PATH >> ~/.bashrc
source ~/.bashrc

# Installazione di Drozer
echo "[i] Instalazione di Drozer..."
sleep 2

wget https://github.com/mwrlabs/drozer/releases/download/2.4.4/drozer_2.4.4.deb 
sudo dpkg --install drozer*
wget https://github.com/mwrlabs/drozer/releases/download/2.3.4/drozer-agent-2.3.4.apk
mv drozer-agent-* ~/Desktop/drozer-agent.apk
sudo apt --fix-broken install -y
sudo dpkg --install drozer*
rm drozer*

# Installazione di mobsf
echo "[i] Installazione di mobsf..."
sleep 2

sudo git clone --depth 1 https://github.com/MobSF/Mobile-Security-Framework-MobSF /opt/mobsf
sudo chown xubuntu:xubuntu -R /opt/mobsf
sudo pip install -r /opt/mobsf/requirements.txt
sudo apt install python3-venv
/opt/mobsf/setup.sh
wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
sudo apt install xfonts-75dpi
sudo dpkg --install wkhtml* 
rm wkhtml*
echo export PATH=/opt/mobsf:$PATH >> ~/.bashrc
echo alias mobsf=\"cd /opt/mobsf && ./run.sh\" >> ~/.bash_aliases

# Installazione di baksmali
echo "[i] Installazione di baksmali..."
sleep 2

wget https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.3.4.jar
sudo chown xubuntu:xubuntu baksmali-2.3.4.jar
mv baksmali-2.3.4.jar /opt
echo export PATH=/opt:$PATH >> ~/.bashrc
echo alias baksmali=\"java -jar /opt/baksmali-2.3.4.jar\" >> ~/.bash_aliases

# Installazione di andbug (wrapper di jdwp)
echo "[i] Installazione di andbug..."
sleep 2

git clone --depth 1 https://github.com/swdunlop/AndBug /opt/andbug
cd /opt/andbug
sudo python setup.py install
echo export PYTHONPATH=`pwd`/lib >> ~/.bashrc
make 
echo alias andbug=\"/opt/andbug/andbug\" >> ~/.bash_aliases


# Installazione di jdb
echo "[i] Installazione di jdb..."
sleep 2

sudo apt install openjdk-8-headless -y

# Installazione Burp Suite
echo "[i] Dovrai scaricare la Burp suite manualmente da https://portswigger.net/burp/communitydownload"
echo "[i] Dopo averla scaricata digita nella directory dove è stata scaricata: \"sudo chmod +x burp* && ./burp*sh\""

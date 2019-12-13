# Introduzione all'Ethical Hacking di App Android

Lo script presente è da utilizzare in concomitanza al corso di Udemy associato dal momento che apktool su Android Tamer e diversi altri tool su Santoku restituivano problemi a causa probabilmente della fine del ciclo di vita delle rispettive distro. Lo script è stato testato su Xubuntu 18.04.3. La macchina virtuale (in formato OVA) è anche presente in download nelle risorse del corso.

Presento in questo README gli script di installazione per convenienza, basterebbe anche eseguire lo script shell presente in questa repo (nota: alcuni link potrebbero non funzionare in futuro):


## Installazione utility di base 
```shell
sudo apt update 
sudo apt install vim vim-gtk -y
sudo apt install adb -y
sudo apt install apktool -y
sudo apt install git -y
sudo apt install python-pip -y # for InsecureBankv2, useless anyway
sudo apt install sqlite -y
sudo apt install python3-pip -y
sudo apt install dexdump
```

## Installazione di dex2jar
```shell
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
```

## Installazione di jdgui
```shell
wget https://github.com/java-decompiler/jd-gui/releases/download/v1.6.5/jd-gui-1.6.5.deb
sudo dpkg --install jd-gui-*
rm jd-gui-*
echo alias jd-gui=\"java -jar /opt/jd-gui/jd-gui.jar\" >> ~/.bash_aliases
```

## Installazione di Android Studio 
```shell
wget https://dl.google.com/dl/android/studio/ide-zips/3.5.3.0/android-studio-ide-191.6010548-linux.tar.gz
tar xvfz unzip android-studio-ide*
sudo mv android-studio /opt/
rm android-studio-*
echo export PATH=/opt/android-studio/bin:$PATH >> ~/.bashrc
source ~/.bashrc
```

## Installazione di Drozer
```shell
wget https://github.com/mwrlabs/drozer/releases/download/2.4.4/drozer_2.4.4.deb 
sudo dpkg --install drozer*
wget https://github.com/mwrlabs/drozer/releases/download/2.3.4/drozer-agent-2.3.4.apk
mv drozer-agent-* ~/Desktop/drozer-agent.apk
sudo apt --fix-broken install -y
sudo dpkg --install drozer*
rm drozer*
```

## Installazione di mobsf
```shell
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
```

## Installazione di baksmali
```shell
wget https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.3.4.jar
sudo chown xubuntu:xubuntu baksmali-2.3.4.jar
mv baksmali-2.3.4.jar /opt
echo export PATH=/opt:$PATH >> ~/.bashrc
echo alias baksmali=\"java -jar /opt/baksmali-2.3.4.jar\" >> ~/.bash_aliases
```

## Installazione di andbug (wrapper di jdwp)
```shell
git clone --depth 1 https://github.com/swdunlop/AndBug /opt/andbug
cd /opt/andbug
sudo python setup.py install
echo export PYTHONPATH=`pwd`/lib >> ~/.bashrc
make 
echo alias andbug=\"/opt/andbug/andbug\" >> ~/.bash_aliases
```

## Installazione di jdb
```shell
sudo apt install openjdk-8-headless -y
```
## Installing burp suite

Scaricare la Burp Suite manualmente da [https://portswigger.net/burp/communitydownload](https://portswigger.net/burp/communitydownload).
Poi digitare nella directory dove è stata scaricata:
```shell
sudo chmod +x burp* && ./burp*sh
```

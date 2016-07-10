cd ~/Desktop

rm -rf bccAndroidController.zip

zip -q -r bccAndroidController.zip ~/Desktop/bccAndroidController

mkdir tmptmp

cd tmptmp

git clone https://github.com/ChinoMars/bccAndroidController.git

cd ~/Desktop/bccAndroidController

rm -rf res libs assets src

cd ~/Desktop/tmptmp/bccAndroidController

mv -f ./* ~/Desktop/bccAndroidController

cd ~/Desktop

rm -rf tmptmp

cd ~/Desktop

rm -rf bccAndroidController.zip

zip -r bccAndroidController.zip ~/Desktop/bccAndroidController

mkdir tmptmp

cd tmptmp

git clone git@github.com:ChinoMars/bccAndroidController.git

mv -f * ~/Desktop/bccAndroidController

cd ~/Desktop

rm -rf tmptmp

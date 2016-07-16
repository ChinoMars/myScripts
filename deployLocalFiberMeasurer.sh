cd ~/Desktop

rm -rf bccAndroidController.zip

zip -q -r bccAndroidController.zip ~/Desktop/bccAndroidController

mkdir tmptmp

cd tmptmp

git clone https://github.com/ChinoMars/bccAndroidController.git

cd ~/Desktop/bccAndroidController

cp ./src/com/chinomars/bccAndroidViewerCommon/Common.java ~/Desktop/Common.java

rm -rf res libs assets src

cd ~/Desktop/tmptmp/bccAndroidController

mv -f ./* ~/Desktop/bccAndroidController

mv ~/Desktop/Common.java ~/Desktop/bccAndroidController/src/com/chinomars/bccAndroidViewerCommon/Common.java

cd ~/Desktop/bccAndroidController

rm -rf README.md

cd ~/Desktop

rm -rf tmptmp

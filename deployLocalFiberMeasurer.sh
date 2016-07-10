cd ~/Desktop

zip -r bccAndroidViewer.zip ~/Desktop/bccAndroidViewer

mkdir tmptmp

cd tmptmp

git clone git@github.com:ChinoMars/bccAndroidController.git

mv -f * ~/Desktop/bccAndroidViewer

cd ~/Desktop

rm -rf tmptmp

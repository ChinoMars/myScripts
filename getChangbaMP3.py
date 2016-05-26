# considering to use threads to download media
import urllib
from urllib import request
import os
import re

def Schedule(a, b, c):
    '''
    a:已经下载的数据块
    b:数据块的大小
    c:远程文件的大小
    '''
    per = 100 * a * b / c
    print('Complete %.2f%%' % per, end = '\r')


def downloadSong(songSourceUrl, songName, localDir):
    fileName = songName
    localPath = os.path.join(localDir, fileName)

    urllib.request.urlretrieve(songSourceUrl, localPath, Schedule)


def getSongSourceUrl(songPageUrl):
    try:
        songpage = urllib.request.urlopen(songPageUrl)
    except:
        return -1

    if 'html' not in songpage.getheader('Content-Type'):
        return -1

    try:
        pageContent = songpage.read().decode('utf=8')
    except:
        return -1

    sourcePatten = re.compile(r'http://qiniuuwmp3.changba.com/[0-9]+.mp3')
    songSourceUrl = sourcePatten.search(pageContent)
    if songSourceUrl == None:
        return -1
    else:
        return songSourceUrl.group(0)


def getMP3(homePageURL, localDir):
    localfileList = os.listdir(localDir)
    # print(localfileList)

    homePageWB = urllib.request.urlopen(homePageURL)
    homePageContent = homePageWB.read().decode('utf-8')

    patten = re.compile(r'href="/s/\S+"\s+\S+\s+\S+\s+\S+\s+<')
    finishedSong = 0
    for x in patten.findall(homePageContent):
        xx = x.split('"')

        songPageUrl = 'http://changba.com' + xx[1]
        songName = xx[6].replace('\n','').replace('\t','').replace('\r','').replace('<','').replace('>','') + '.mp3'
        # print(songPageUrl + ' ' + songName)
        
        if songName in localfileList:
            print(songName + ' exists')
            continue

        songSourceUrl = getSongSourceUrl(songPageUrl)
        if songSourceUrl != -1:
            print('====== Begin downloading ' + songName + ' ======')
            downloadSong(songSourceUrl, songName, localDir)
            print('====== Complete! ======')
            finishedSong += 1
        else:
            continue
    print('%d files downloaded' %finishedSong)

if __name__ == '__main__':
    localDir = '/Users/Chino/Desktop/CB_mp3/'
    homePageURL = 'http://changba.com/u/81072145'

    getMP3(homePageURL, localDir)





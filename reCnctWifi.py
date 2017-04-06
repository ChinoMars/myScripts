# codingL: utf-8

import os
import time
import sys

from time import localtime, strftime

SSID = 'wifissid'
PASSWD = 'wifipasswd'

domainIdx = 0
reconnectCnt = 0

def log(text):
    nowTime = strftime("%Y-%m-%d %H:%M:%S", localtime())
    msg = nowTime + ': ' + text
    print(msg)
    fhandle = open("netMaintainer.log", 'a')
    fhandle.write(msg + '\n')
    fhandle.close()


def reStartWifi():
    retCode = os.system('networksetup -setairportpower en0 off')
    if retCode:
        print('error when shutting down en0')
    else:
        print('Shut down device of en0')
        retCode = os.system('networksetup -setairportpower en0 on')
        if retCode:
            print('error when start en0')
        else:
            print('Restart device of en0')
            retCode = os.system('networksetup -setairportnetwork en0 ' + SSID + ' ' + PASSWD)
            if retCode:
                print('error when joining '+SSID)


def checkNet():
    global domainIdx
    global reconnectCnt
    ping_list = ['www.baidu.com', 'www.weibo.com', 'www.qq.com']
    
    pingCmd = 'ping -c 1 '+ ping_list[domainIdx % len(ping_list)]
    print(pingCmd)
    domainIdx = domainIdx + 1
    ret = os.system(pingCmd)
    # time.sleep(2)
    if ret:
        # try next domain
        pingCmd = 'ping -c 1 '+ ping_list[domainIdx % len(ping_list)]
        domainIdx = domainIdx + 1
        print(pingCmd)
        ret = os.system(pingCmd)

        if ret:
            # try next domain
            pingCmd = 'ping -c 1 '+ ping_list[domainIdx % len(ping_list)]
            domainIdx = domainIdx + 1
            print(pingCmd)
            ret = os.system(pingCmd)

            if ret:
                # fail to connect Internet
                # restart en0
                reStartWifi()
                reconnectCnt = reconnectCnt + 1
                log(str(reconnectCnt) + 'th reconnecting')



if __name__ == '__main__':
    print('start maintain Internet connection')
    log('start maintain Internet connection')

    while True:
        checkNet()
        time.sleep(60)

    # reStartWifi()



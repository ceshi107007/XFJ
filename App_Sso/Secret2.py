# coding=utf-8
import base64
def ENCODE(str):
    #对字符串进行base64加密
     s=""
     s=base64.b64encode(str.encode('utf-8'))
     return s

def DECODE(str):
    #对字符串进行base64解密
    s=""
    s=base64.b64decode(str.encode('utf-8'))
    return s
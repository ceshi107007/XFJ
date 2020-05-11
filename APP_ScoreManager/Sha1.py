# coding:utf-8

from time import time
from hashlib import sha1,md5
import json

def sha(etype,member,time):
    """
    使用sha1加密算法，返回str加密后的字符串
    """
    s="{"+"eType="+etype+','+' '+'member='+member+','+' '+'time='+time+'}'
    sha=sha1(s.encode('utf-8'))
    encrypts=sha.hexdigest()
    print(encrypts)
    return encrypts


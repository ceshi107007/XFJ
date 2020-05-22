#coding=utf-8

import requests,re,os,json,sys
from requests_toolbelt import MultipartEncoder
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

def uploadPortrait(uid):
    url='http://appif.xiangyu-extranet.test1.fzyun.io/amuc/api/member/uploadPortrait'
    headers={
    }
    file_payload={"data":("touxiang.jpg",open("10.jpg","rb"),"multipart/form-data")}
    m=MultipartEncoder(file_payload)            #避免把大文件读取到内存中导致内存溢出，所以这里我将上传的文件转化为数据流的形式发送
    headers["Content-Type"]=m.content_type
    new_url=url+"?uid="+uid
    s=requests.session()
    s.headers.update(headers)
    req=s.post(new_url,data=m,verify=False)
    print(req)
    js=json.loads(req.content)
    return js

def upload(userid):
    url='https://api1.fjdaily.com/app_if/upload'
    headers={
    }
    file_payload = {
        "file1": ("filename1.jpg", open("App_Member\\10.jpg", "rb"),"multipart/form-data"),
        "file4": ("filename2.mp3", open(u"App_Member\\让我们荡起双桨.mp3", "rb"), "multipart/form-data"),
    }
    m=MultipartEncoder(file_payload)
    headers["Content-Type"]=m.content_type
    dict={
        "fileType":"file",
        "userId":userid,
        "siteId":"1",
    }
    new_url=url+"?fileType="+dict["fileType"]+"&userId="+dict["userId"]+"&siteId="+dict["siteId"]
    s=requests.session()
    s.headers.update(headers)
    req=s.post(new_url,data=m,verify=False)
    print(req)
    js=json.loads(req.content)
    return js
    # print(js)
    # if js['success']==True:
    #     return 'success'
    # else:
    #     return 'fail'
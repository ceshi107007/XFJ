# coding:utf-8

def str(event,score):
    s = "{msEvent:\"" + event + "\",msMemo:\"积分扣除测试\",msScore:\"" + score + "\"}"
    print(s)
    return s


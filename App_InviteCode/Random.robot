*** Settings ***
Library                                 Selenium2Library

*** Variables ***


*** Keywords ***
RandomImei
    ${random_imei}                      EVALUATE            random.randint(1000000000,9999999999999)                    random
    ${typeimei}                         EVALUATE            str(${random_imei})
#    Log                                 ${random_imei}
    [Return]                            ${typeimei}

RandomUid
    ${random_uid}                       EVALUATE            random.randint(128,3974087)             random
    ${typeuid}                          EVALUATE            str(${random_uid})
#    Log                                 ${random_uid}
    [Return]                            ${typeuid}


# *** Test Case ***
# 打印随机设备码
#     RandomImei

# 打印随机UID
#     RandomUid



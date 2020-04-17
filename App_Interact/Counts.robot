*** Settings ***
Documentation                           获取互动计数
Resource                                ../App_Interact/InteractCommon.robot
Force Tags                              冒烟集-新福建App     获取互动计数/互动其他（许雁良）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${ID0}                                  2049
${ID1}                                  2005
${SOURCE0}                              0
${SOURCE1}                              1

*** Keywords ***


*** Test Cases ***
查看普通稿件的稿件事件计数，接口返回结果成功（因为互动计数是动态的，所以此处只判断请求成功即可）
    Counts                              ${ID0}
    ...                                 ${SOURCE0}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed

查看直播稿件的直播事件计数，接口返回结果成功
    Counts                              ${ID1}
    ...                                 ${SOURCE1}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
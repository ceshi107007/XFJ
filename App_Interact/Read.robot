*** Settings ***
Documentation                           消除小红点
Resource                                ../App_Interact/InteractCommon.robot
Force Tags                              冒烟集-新福建App     消除小红点/互动其他（许雁良）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${TYPE0}                                0                   #读评论
${TYPE1}                                1                   #读话题提问
${TYPE2}                                2                   #读提问
${TYPE3}                                3                   #读活动
${TYPE4}                                4                   #读跟踪
${TYPE5}                                5                   #读问答
${RESULT}                               true

*** Keywords ***


*** Test Cases ***
消除我的评论处小红点，接口返回成功
    Read                                ${TYPE0}
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT}

消除我的活动处小红点，接口返回成功
    Read                                ${TYPE3}
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT}
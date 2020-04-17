*** Settings ***
Documentation                           意见反馈
Resource                                ../App_Interact/InteractCommon.robot
Force Tags                              冒烟集-新福建App     意见反馈/互动其他（许雁良）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${CONTENT0}                             新福建App客户端提交意见反馈测试
${CONTENT1}                             $%^&*()(*&^%$#@!#!@%^%&*)(*&^%$#!)
${IMGURL}                               https://img1.fjdaily.com/app/resource/xy/202004/15/t2_(44X201X440X333)93576ac3-9f23-4784-9404-bac8c1fe2511.jpg
${RESULT}                               true

*** Keywords ***

*** Test Cases ***
同时提交内容、图片反馈，均能够提交成功且后台可见
    Feed                                ${CONTENT0}
    ...                                 ${IMGURL}
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT}

同时提交字符内容、图片反馈，均能够提交成功且后台可见
    Sleep                               3
    Feed                                ${CONTENT1}
    ...                                 ${IMGURL}
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT}

仅提交内容时提交，均能够提交成功且后台可见
    Sleep                               3
    Feed                                ${CONTENT0}
    ...                                 ${EMPTY}
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT}

仅提交图片,均能够提交成功且后台可见
    Sleep                               3
    Feed                                ${EMPTY}
    ...                                 ${IMGURL}
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT}

即不提交内容也不提交图片,均能够提交成功且后台可见
    Sleep                               3
    Feed                                ${EMPTY}
    ...                                 ${EMPTY}
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT}
*** Settings ***
Documentation                           报料提交
Resource                                ../App_Interact/InteractCommon.robot
Force Tags                              冒烟集-新福建App     报料提交/互动其他（许雁良）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${USERNAME}                             工号9527
${CONTACTNO}                            13645396666
${TOPIC}                                客户端提交报料
${CONTENT}                              工号9527在客户端提交报料
${IMGURL}                               https://img1.fjdaily.com/app/resource/xy/202004/15/t2_(44X201X440X333)93576ac3-9f23-4784-9404-bac8c1fe2511.jpg
${RESULT}                               true


*** Keywords ***


*** Test Cases ***
匿名提交报料不上传附件，接口返回成功在后台可以查看提交的报料信息
    Sleep                               2
    Tipoff                              ${EMPTY}
    ...                                 ${EMPTY}
    ...                                 ${TOPIC}
    ...                                 ${CONTENT}
    ...                                 ${EMPTY}
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT}


匿名提交报料上传附件，接口返回成功在后台可以查看提交的报料信息
    Sleep                               2
    Tipoff                              ${EMPTY}
    ...                                 ${EMPTY}
    ...                                 ${TOPIC}
    ...                                 ${CONTENT}
    ...                                 ${IMGURL}
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT}


实名提交报料不上传附件，接口返回成功在后台可以查看提交的报料信息
    Sleep                               2
    Tipoff                              ${USERNAME}
    ...                                 ${CONTACTNO}
    ...                                 ${TOPIC}
    ...                                 ${CONTENT}
    ...                                 ${EMPTY}
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT}


实名提交报料上传附件，接口返回成功在后台可以查看提交的报料信息
    Sleep                               2
    Tipoff                              ${USERNAME}
    ...                                 ${CONTACTNO}
    ...                                 ${TOPIC}
    ...                                 ${CONTENT}
    ...                                 ${IMGURL}
    Should Be Equal As Strings          ${response_data.value}                  ${RESULT}

*** Settings ***
Documentation                           翔宇号订阅列表搜索
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     翔宇号订阅列表搜索/互动订阅(林升)
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***
${KEY}                                  福建发布了
${KEY1}                                 ${EMPTY}
${KEY2}                                 福建
${RESULT}                               福建
${LEN_LIST}                                  0

*** Keywords ***


*** Test Case ***
输入的关键字未匹配到数据，接口不返回数据
    Get Subcribe Xys                    ${KEY}
    Fapi Data Field Count Should Be     ${response_data.list}                   ${LEN_LIST}

输入的关键字为空时，接口不返回数据
    Get Subcribe Xys                    ${KEY1}
    Fapi Data Field Count Should Be     ${response_data.list}                   ${LEN_LIST}

输入的关键字匹配到数据，接口返回所有订阅的数据
    Get Subcribe Xys                    ${KEY2}
#    Should Be Equal As Strings          ${response_data.list[0].topic}          ${RESULT}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed



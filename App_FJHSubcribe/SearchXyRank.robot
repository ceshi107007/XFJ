*** Settings ***
Documentation                           翔宇号排名搜索
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     翔宇号排名搜索/翔宇号（林升）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***
${KEY0}                                 福建
${KEY1}                                 武汉加油
${KEY2}                                 福建交警
${LIST}                                 0


*** Keywords ***


*** Test Cases ***
输入的关键字（模糊匹配）匹配到数据时，接口返回相关的翔宇号信息
    Search Xy Rank                      ${KEY0}
    Should Be Equal As Strings          ${response_data[0].topic}               ${KEY2}

输入的关键字未匹配到数据时，接口返回为空
    Search Xy Rank                      ${KEY1}
    Fapi Data Field Count Should Be     ${response_data}                        ${LIST}

输入的关键字（精准匹配）匹配到数据时，接口返回相关的翔宇号信息
    Search Xy Rank                      ${KEY2}
    Should Be Equal As Strings          ${response_data[0].topic}               ${KEY2}

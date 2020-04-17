*** Settings ***
Documentation                           翔宇号排名搜索
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     翔宇号排名搜索/翔宇号（林升）
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions


*** Variables ***
${KEY0}                                 武汉
${KEY1}                                 中国新闻网
${KEY2}                                 武汉发布


*** Keywords ***


*** Test Cases ***
输入的关键字（模糊匹配）匹配到数据时，接口返回相关的翔宇号信息
    Search Xy Rank                      ${KEY0}
    Should Be Equal As Strings          ${response_data[0].topic}                  ${KEY2}

输入的关键字匹配到数据时，接口返回为空
    Search Xy Rank                      ${KEY1}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed

输入的关键字（精准匹配）匹配到数据时，接口返回相关的翔宇号信息
    Search Xy Rank                      ${KEY2}
    Should Be Equal As Strings          ${response_data[0].topic}                  ${KEY2}

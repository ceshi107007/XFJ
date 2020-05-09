*** Settings ***
Documentation                           积分管理模块业务关键字
Resource                                ../Common/Common.robot
Resource                                ../App_SSO/Random_Time.robot
Library                                 OperatingSystem
Library                                 String
Library                                 Sha1.py
Library                                 Str.py
# Force Tags                              冒烟集-翔宇         积分管理（广鹏举）
# ...                                     作者：张鹏


*** Variables ***
${EVENT1_URI}                           /amuc/api/event/event1              #积分行为入库
${SCORE_URI}                            /amuc/api/member/score              #获取会员当前积分
${SCORELIST_URI}                        /amuc/api/member/scoreList          #会员的积分记录
${CONVERT_URI}                          /amuc/api/event/convert             #积分扣减
${EVENTTYPES_URI}                       /amuc/api/event/eventTypes          #行为类型
${MEMBER}                               662
${YUNSITEID}                            1
${SOURCE}                               翔宇

*** Keywords ***
Event1
    [Documentation]                     积分行为入库
    [Arguments]                         ${etype}
    ...                                 ${member}=${MEMBER}
    ...                                 ${siteid}=${YUNSITEID}
    ${time} =                           Time
    ${sign} =                           Sha                 ${etype}            ${time}             ${member}
    Fapi Params Set                     curVersions         ${CURVERSIONS}
    Fapi Headers Set                    Content-Type        application/x-www-form-urlencoded
    ${bodyData} =                       Create Dictionary
    ...                                 eType               ${etype}
    ...                                 member              ${member}
    ...                                 time                ${time}
    ...                                 sign                ${sign}
    ...                                 siteID              ${siteid}
    Fapi Post                           ${APPIF_ALIAS}          ${EVENT1_URI}       data=${bodyData}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Score
    [Documentation]                     获取会员当前积分
    [Arguments]                         ${id}
    Fapi Params Set                     id                  ${id}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_YUN_ALIAS}          ${SCORE_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Score List
    [Documentation]                     会员的积分记录，客户端不常用

Convert
    [Documentation]                     积分扣减
    [Arguments]                         ${etype}
    ...                                 ${event}
    ...                                 ${score}
    ...                                 ${member}=${MEMBER}
    ...                                 ${siteid}=${YUNSITEID}
    ${time} =                           Time
    ${sign} =                           Sha                 ${etype}            ${time}
    ${info} =                           Str                 ${event}            ${score}
    Fapi Params Set                     curVersions         ${CURVERSIONS}
    Fapi Headers Set                    Content-Type        application/x-www-form-urlencoded
    ${bodyData} =                       Create Dictionary
    ...                                 eType               ${etype}
    ...                                 member              ${member}
    ...                                 time                ${time}
    ...                                 sign                ${sign}
    ...                                 info                ${info}
    ...                                 siteID              ${siteid}
    Fapi Post                           ${APPIF_YUN_ALIAS}          ${CONVERT_URI}      data=${bodyData}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Event Types
    [Documentation]                     查看积分行为类型
    [Arguments]
    Fapi Params Set                     curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${EVENTTYPES_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}
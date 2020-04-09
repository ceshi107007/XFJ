*** Settings ***
Documentation                           该文档是提交互动事件接口用例文档
Resource                                ../Common/Common.robot
#Force Tags                              冒烟集-新福建APP     提交互动事件（许雁良）
#...                                     作者：温怡春

*** Variables ***
${EVENT_URI}                             /event
${SITEID}                                1

*** Keywords ***
Article Like Event
    [Documentation]    文章详情页点赞
    [Arguments]                         ${id}
    ...                                 ${channel}
    ...                                 ${siteID}=${SITEID}
    Fapi Params Set                     id                  ${id}
    ...                                 type                0
    ...                                 eventType           1
    ...                                 siteID              1
    ...                                 channel             ${channel}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${EVENT_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

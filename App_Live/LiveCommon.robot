*** Settings ***
Documentation                           直播业务关键字
Resource                                ../Common/Common.robot
Force Tags                              冒烟集-新福建App     直播业务关键字
...                                     作者：张鹏


*** Variables ***
${LIVECOMING_URI}                       /liveComing
${LIVE_URI}                             /live
${LIVEVIEW_URI}                         /liveView
${LIVES_URI}                            /lives
${ALLLIVES_URI}                         /allLives
${LIVESTATUS_URI}                       /liveStatus
${QUERYLIVESTATUS_URI}                  /queryLiveStatus
${LIVESENDPRESENT_URI}                  /liveSendPresent
${GETLIVEARTICLES_URI}                  /getLiveArticles
${SITEID}                               1
${ID}                                   18


*** Keywords ***
Live Coming
    [Documentation]                     直播预告
    [Arguments]                         ${siteid}=${SITEID}
    Fapi Params Set                     siteID              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${LIVECOMING_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Live
    [Documentation]                     提交直播的报道

Live View
    [Documentation]                     客户端直播列表查看
    [Arguments]                         ${id}=${ID}
    Fapi Params Set                     id                  ${id}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${LIVEVIEW_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Lives
    [Documentation]                     直播列表
    [Arguments]

Get Live Articles
    [Documentation]                     直播稿件列表
    [Arguments]                         ${columnid}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     columnId            ${columnid}
    ...                                 siteId              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETLIVEARTICLES_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}
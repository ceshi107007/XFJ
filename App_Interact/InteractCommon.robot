*** Settings ***
Documentation                           互动其他模块业务关键字
Resource                                ../Common/Common.robot
Force Tags                              冒烟集-新福建App     互动其他模块业务关键字（许雁良）
...                                     作者：黄羽、张鹏

*** Variables ***
${REDDOT_URI}                           /redDot             #读小红点状态
${FEED_URI}                             /feed               #意见反馈
${TIPOFF_URI}                           /tipoff             #报料提交
${COUNTS_URI}                           /counts             #获取互动计数
${READ_URI}                             /read               #消除小红点
${VOTE_URI}                             /vote               #稿内投票
${VOTERESULT_URI}                       /voteResult         #投票结果
${VOTECOUNT_URI}                        /voteCount          #投票数
${APPPUSHMESSAGE_URI}                   /getAppPushMessage  #APP消息推送一览接口
${MYFAV_URI}                            /myFav              #获取我的收藏接口
${MESSAGE_URI}                          /message            #获取系统消息接口
${USERID}                               571
${USERNAME}                             工号9527
${SITEID}                               1
${PAGESIZE}                             20


*** Keywords ***
Red Dot
    [Documentation]                     读小红点状态
    [Arguments]                         ${userid}=${USERID}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     userID              ${userid}
    ...                                 siteID              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${REDDOT_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Feed
    [Documentation]                     意见反馈
    [Arguments]                         ${content}
    ...                                 ${imgurl}
    ...                                 ${username}=${USERNAME}
    ...                                 ${userid}=${USERID}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     curVersions         ${CURVERSIONS}
    Fapi Headers Set                    Content-Type        application/x-www-form-urlencoded
    ${bodyData} =                       Create Dictionary
    ...                                 content             ${content}
    ...                                 userID              ${userid}
    ...                                 userName            ${username}
    ...                                 imgUrl              ${imgurl}
    ...                                 siteID              ${siteid}
    Fapi Post                           ${APPIF_ALIAS}      ${FEED_URI}         data=${bodyData}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Tipoff
    [Documentation]                     提交报料
    [Arguments]                         ${username}
    ...                                 ${contactno}
    ...                                 ${topic}
    ...                                 ${content}
    ...                                 ${imgurl}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     curVersions         ${CURVERSIONS}
    Fapi Headers Set                    Content-Type        application/x-www-form-urlencoded
    ${bodyData} =                       Create Dictionary
    ...                                 siteID              ${siteid}
    ...                                 userName            ${username}
    ...                                 contactNo           ${contactno}
    ...                                 topic               ${topic}
    ...                                 content             ${content}
    ...                                 imgUrl              ${imgurl}
    Fapi Post                           ${APPIF_ALIAS}      ${TIPOFF_URI}       data=${bodyData}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Counts
    [Documentation]                     获取互动计数
    [Arguments]                         ${id}
    ...                                 ${source}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     id                  ${id}
    ...                                 source              ${source}
    ...                                 siteID              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}  ${COUNTS_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Read
    [Documentation]                     小红点消除
    [Arguments]                         ${type}
    ...                                 ${userid}=${USERID}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     userID              ${userid}
    ...                                 type                ${type}
    ...                                 siteID              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${READ_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Apppushmessage
    [Documentation]                     获取APP推送消息
    [Arguments]                         ${siteid}
    ...                                 ${currentpage}
    ...                                 ${pagesize}=${PAGESIZE}
    Fapi Params Set                     siteId              ${siteid}
    ...                                 currentPage         ${currentpage}
    ...                                 pageSize            ${pagesize}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${APPPUSHMESSAGE_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

My Fav
    [Documentation]                     获取我的收藏
    [Arguments]                         ${userid}
    ...                                 ${page}
    ...                                 ${siteid}=${SITEID}
    Fapi Headers Set                    Content-Type        application/x-www-form-urlencoded
    Fapi Params Set                     curVersions         ${CURVERSIONS}
    ${bodyData} =                       Create Dictionary
    ...                                 userID              ${userid}
    ...                                 siteID              ${siteid}
    ...                                 page                ${page}
    Fapi Post                           ${APPIF_ALIAS}      ${MYFAV_URI}        data=${bodyData}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Message
    [Documentation]                     获取系统消息
    [Arguments]                         ${siteid}
    ...                                 ${page}
    Fapi Params Set                     siteID              ${siteid}
    ...                                 page                ${page}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${MESSAGE_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}


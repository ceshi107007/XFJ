*** Settings ***
Documentation                           该文档是获取稿件详情模块接口用例文档
Resource                                ../Common/Common.robot
Force Tags                              冒烟集-新福建APP     活动相关接口（丁希）
...                                     作者：张鹏

*** Variables ***
${GETACTCATS_URI}                       /activityCats       #活动分类接口
${ACTDETAIL_URI}                        /activityDetail     #活动详情接口
${GETACTLIST_URI}                       /activityList       #活动列表接口
${ENTRYLIST_URI}                        /entryList          #活动报名名单
${MYACTIVITYLIST_URI}                   /myActivityList     #我的活动列表接口
${SAVEACTIVITY_URI}                     /saveActivity       #活动报名接口
${DEVICE}                               429A9EC0-58DE-41D6-B79A-4E073350FA38
${SITEID}                               1
${CATID}                                -1
${PAGE}                                 0

*** Keywords ***
Get Activity Cats
    [Documentation]                     获取活动分类
    [Arguments]                         ${siteid}=${SITEID}
    Fapi Params Set                     siteID              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETACTCATS_URI}
    ${data} =                           Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}


Get Activity Detail
    [Documentation]                     获取活动详情
    [Arguments]                         ${fileid}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     siteID              ${siteid}
    ...                                 fileId              ${fileid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${ACTDETAIL_URI}
    ${data} =                           Fapi Data To Object
    Set Suite Variable                  ${response_data}   ${data}

Get Activity List
    [Documentation]                     获取活动列表
    [Arguments]                         ${catid}=${CATID}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     siteID              ${siteid}
    ...                                 catID               ${catid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETACTLIST_URI}
    ${data} =                           Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get EntryList
    [Documentation]                     活动报名名单查看
    [Arguments]                         ${fileid}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     fileId              ${fileid}
    ...                                 siteId              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${ENTRYLIST_URI}
    ${data} =                           Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}


My Activity List
    [Documentation]                     我的活动列表接口
    [Arguments]                         ${userid}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${page}=${PAGE}
    Fapi Params Set                     userID              ${userid}
    ...                                 siteId              ${siteid}
    ...                                 page                ${page}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${MYACTIVITYLIST_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Save Activity
    [Documentation]                     活动报名接口
    [Arguments]                         ${fileid}
    ...                                 ${userid}
    ...                                 ${device}=${DEVICE}
    ...                                 ${siteid}=${SITEID}
    Fapi Headers Set                    Content-Type        application/x-www-form-urlencoded
    Fapi Params Set                     curVersions         ${CURVERSIONS}
    ${bodyData} =                       Create Dictionary
    ...                                 fileId              ${fileid}
    ...                                 userID              ${userid}
    ...                                 device              ${device}
    ...                                 siteId              ${siteid}
    Fapi Post                           ${APPIF_ALIAS}      ${SAVEACTIVITY_URI}                     data=${bodyData}

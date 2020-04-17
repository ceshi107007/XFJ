*** Settings ***
Documentation                           人物模块业务关键字
Resource                                ../Common/Common.robot
Force Tags                              冒烟集-新福建App     人物模块业务关键字（张进）
...                                     作者：张鹏

*** Variables ***
${LEADERCATS_URI}                       /leaderCats         #人物分类列表
${LEADERVIEW_URI}                       /leaderView         #全部人物列表
${REGIONLEADERVIEW_URI}                 /regionleaderView   #地区人物列表
${CATLEADERVIEW_URI}                    /catleaderView      #分类人物列表
${LEADER_URI}                           /leader             #人物详情
${SITEID}                               1

*** Keywords ***
Leader Cats
    [Documentation]                     人物分类列表
    [Arguments]                         ${catid}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     siteId              ${siteid}
    ...                                 catID               ${catid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${LEADERCATS_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Leader View
    [Documentation]                     全部人物列表
    [Arguments]                         ${hasarticles}
    ...                                 ${start}=${0}
    ...                                 ${count}=${20}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     start               ${start}
    ...                                 count               ${count}
    ...                                 siteId              ${siteid}
    ...                                 hasArticles         ${hasarticles}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${LEADERVIEW_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Leader
    [Documentation]                     人物详情
    [Arguments]                         ${id}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     id                  ${id}
    ...                                 siteId              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${LEADER_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Region Leader View
    [Documentation]                     地区人物列表
    [Arguments]                         ${regionid}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     regionID            ${regionid}
    ...                                 siteId              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${REGIONLEADERVIEW_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Cat Leader View
    [Documentation]                     分类人物列表
    [Arguments]                         ${catid}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${page}=${0}
    Fapi Params Set                     siteId              ${siteid}
    ...                                 catID               ${catid}
    ...                                 page                ${page}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${CATLEADERVIEW_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}
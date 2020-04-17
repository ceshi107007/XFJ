*** Settings ***
Documentation                           稿件收藏相关业务关键字
Resource                                ../Common/Common.robot
Force Tags                              冒烟集-新福建APP     稿件收藏（许雁良）
...                                     作者：张鹏

*** Variables ***
${FAV_URI}                              /fav
${FAVCANCEL_URI}                        /favCancel
${HASFAV_URI}                           /hasFav
${USERID}                               571
${SITEID}                               1
${TYPE}                                 0
${ARTICLEID}                            346
${CANCEL}                               1
${CHANNEL}                              2
${IMGURL}                               https://img1.fjdaily.com/app/resource/xy/202004/15/t2_(44X201X440X333)93576ac3-9f23-4784-9404-bac8c1fe2511.jpg

*** Keywords ***
Article Fav Api
    [Documentation]                     稿件收藏接口
    [Arguments]                         ${articleid}=${ARTICLEID}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${type}=${TYPE}
    ...                                 ${userid}=${USERID}
    ...                                 ${channel}=${CHANNEL}
    ...                                 ${imgurl}=${IMGURL}
    Fapi Params Set                     articleID           ${articleid}
    ...                                 siteID              ${siteid}
    ...                                 type                ${type}
    ...                                 userID              ${userid}
    ...                                 channel             ${channel}
    ...                                 imgUrl              ${imgurl}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${FAV_URI}
#    ${data} =               Fapi Data To Object
#    Set Suite Variable      ${app_data}                 ${data}
#    [Return]                ${app_data}

Article FavCancel Api
    [Documentation]                     稿件取消收藏接口
    [Arguments]                         ${articleid}=${ARTICLEID}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${type}=${TYPE}
    ...                                 ${userid}=${USERID}
    ...                                 ${cancel}=${CANCEL}
    ...                                 ${imgurl}=${IMGURL}
    Fapi Params Set                     userID              ${userid}
    ...                                 siteID              ${siteid}
    ...                                 type                ${type}
    ...                                 articleID           ${articleid}
    ...                                 cancel              ${cancel}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${FAVCANCEL_URI}
#    ${data} =               Fapi Data To Object
#    Set Suite Variable      ${app_data}                 ${data}
#    [Return]                ${app_data}

Article HasFav Api
    [Documentation]                     判断稿件是否收藏接口
    [Arguments]                         ${articleid}=${ARTICLEID}
    ...                                 ${userid}=${USERID}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${type}=${TYPE}
    Fapi Params Set                     userID              ${userid}
    ...                                 articleID           ${articleid}
    ...                                 siteID              ${siteid}
    ...                                 type                ${type}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${HASFAV_URI}
    ${data} =                           Fapi Data To Object
    Set Suite Variable                  ${app_data}         ${data}
    [Return]                            ${app_data}





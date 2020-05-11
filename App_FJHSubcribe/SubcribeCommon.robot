*** Settings ***
Documentation                           互动订阅相关接口业务关键字
Resource                                ../Common/Common.robot
Library                                 urllib3
Force Tags                              冒烟集-新福建App         订阅（林升）
...                                     作者：张鹏

*** Variables ***
${TOPICSUB_URI}                         /topicSub           #订阅
${TOPICSUBCANCEL}                       /topicSubCancel     #取消订阅
${SUBCRIBEVIEW}                         /subcribeView       #订阅列表
${GETSUBCRIBECOLS}                      /getSubcribeCols    #订阅栏目搜索
${SUBCRIBEXY}                           /subcribeXY         #翔宇号订阅列表
${GETSUBCRIBEXYS}                       /getSubcribeXys     #翔宇号订阅搜索
${GETCATS_URI}                          /getCats            #查看翔宇号全部分类
${GETCATXYS_URI}                        /getCatXys          #查看翔宇号分类列表
${GETXYINFO_URI}                        /getXyInfo          #查看翔宇号详情空间
${XYRANK_URI}                           /xyRank             #翔宇号影响力排行
${SEARCHXYRANK_URI}                     /searchXyRank       #翔宇号排名搜索
${HITXYBULLETIN_URI}                    /hitXyBulletin      #翔宇号打榜
${XYARTICLERANK_URI}                    /xyArticleRank      #翔宇号稿件影响力排行
${RECOMMENDXYS_URI}                     /recommendXys       #推荐翔宇号
${GETXYDYNAMIC_URI}                     /getXyDynamic       #翔宇号动态列表
${GETUSERHITINFO_URI}                   /getUserHitInfo     #获取当天打榜信息
${SITEID}                               1                   #新福建站点
${USERID}                               571
${TYPE}                                 4
${DEVICE}                               3FAC4E73-9345-4515-92FA-59616B1B218C
${ID}                                   27
${KEY}                                  福建
${COLUMNID}                             8
${CODE}                                 XYACCOUNT
${START}                                0
${COUNT}                                20
${XY_ID}                                82
${CATID}                                186
${TYPE}                                 0

*** Keywords ***
Topic Sub
    [Documentation]                     翔宇号订阅
    [Arguments]                         ${id}=${ID}
    ...                                 ${type}=${TYPE}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${userid}=${USERID}
    ...                                 ${device}=${DEVICE}
    Fapi Params Set                     curVersions         ${CURVERSIONS}
    ${bodyData} =                       Create Dictionary
    ...                                 siteID              ${siteid}
    ...                                 id                  ${id}
    ...                                 type                ${type}
    ...                                 userID              ${userid}
    ...                                 device              ${device}
    Fapi Headers Set                    Content-Type        application/x-www-form-urlencoded
    Fapi Post                           ${APPIF_ALIAS}      ${TOPICSUB_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Topic Sub Cancel
    [Documentation]                     取消订阅接口
    [Arguments]                         ${id}=${ID}
    ...                                 ${type}=${TYPE}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${userid}=${USERID}
    ...                                 ${device}=${DEVICE}
    Fapi Params Set                     curVersions         ${CURVERSIONS}
    ${bodyData} =                       Create Dictionary
    ...                                 siteID              ${siteid}
    ...                                 id                  ${id}
    ...                                 type                ${type}
    ...                                 userID              ${userid}
    ...                                 device              ${device}
    Fapi Headers Set                    Content-Type        application/x-www-form-urlencoded
    Fapi Post                           ${APPIF_ALIAS}      ${TOPICSUBCANCEL}   data=${bodyData}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Subcribe Xy
    [Documentation]                     查看翔宇号订阅列表接口
    [Arguments]                         ${colid}=${8}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${device}=${DEVICE}
    Fapi Params Set                     curVersions         ${CURVERSIONS}
    ...                                 colID               ${colid}
    ...                                 siteID              ${siteid}
    ...                                 device              ${device}
    Fapi Get                            ${APPIF_ALIAS}      ${SUBCRIBEXY}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Subcribe Xys
    [Documentation]                     翔宇号订阅列表查看
    [Arguments]                         ${key}=${KEY}
    ...                                 ${userid}=${USERID}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${device}=${DEVICE}
    Disable Warnings
    Fapi Params Set                     userID              ${userid}
    ...                                 key                 ${key}
    ...                                 siteID              ${siteid}
    ...                                 device              ${device}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETSUBCRIBEXYS}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}


Subcribe View
    [Documentation]                     订阅列表查看
    [Arguments]                         ${userid}=${USERID}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${columnid}=${COLUMNID}
    ...                                 ${device}=${DEVICE}
    Fapi Params Set                     userID              ${userid}
    ...                                 siteID              ${siteid}
    ...                                 columnId            ${columnid}
    ...                                 device              ${device}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${SUBCRIBEVIEW}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Cats
    [Documentation]                     获取翔宇号全部分类接口
    [Arguments]                         ${siteid}=${SITEID}
    ...                                 ${code}=${CODE}
    Fapi Params Set                     siteId              ${siteid}
    ...                                 code                ${code}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETCATS_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Cat Xys
    [Documentation]                     查询翔宇号分类列表接口
    [Arguments]                         ${id}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${start}=${START}
    ...                                 ${count}=${COUNT}
    Fapi Params Set                     siteID              ${siteid}
    ...                                 id                  ${id}
    ...                                 start               ${start}
    ...                                 count               ${count}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETCATXYS_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Xy Info
    [Documentation]                     查看翔宇号详情空间接口
    [Arguments]                         ${id}
    ...                                 ${siteid}=${SITEID}
    Disable Warnings
    Fapi Params Set                     id                  ${id}
    ...                                 siteID              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETXYINFO_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Xy Rank
    [Documentation]                     翔宇号影响力排行
    [Arguments]                         ${type}
    ...                                 ${userid}=${0}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${device}=${DEVICE}
    Fapi Params Set                     userID              ${userid}
    ...                                 siteID              ${siteid}
    ...                                 device              ${device}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${XYRANK_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Search Xy Rank
    [Documentation]                     翔宇号排名搜索
    [Arguments]                         ${key}
    ...                                 ${userid}=${0}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${device}=${DEVICE}
    Fapi Params Set                     userID              ${userid}
    ...                                 siteID              ${siteid}
    ...                                 device              ${device}
    ...                                 key                 ${key}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${SEARCHXYRANK_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Hit Xy Bulletin
    [Documentation]                     翔宇号打榜
    [Arguments]                         ${userid}=${USERID}
    ...                                 ${id}=${XY_ID}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     curVersions         ${CURVERSIONS}
    ${bodyData} =                       Create Dictionary
    ...                                 siteID              ${siteid}
    ...                                 id                  ${id}
    ...                                 userID              ${userid}
    Fapi Post                           ${APPIF_ALIAS}      ${HITXYBULLETIN_URI}          data=${bodyData}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Xy Article Rank
    [Documentation]                     翔宇号稿件影响力排行榜
    [Arguments]                         ${siteid}=${SITEID}
    Fapi Params Set                     siteID              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${XYARTICLERANK_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Recommend Xys
    [Documentation]                     推荐翔宇号
    [Arguments]                         ${userid}=${USERID}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     siteID              ${siteid}
    ...                                 userId              ${userid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${RECOMMENDXYS_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Xy Dynamic
    [Documentation]                     翔宇号动态列表查看
    [Arguments]                         ${xyid}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     siteId              ${siteid}
    ...                                 xyId                ${xyid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETXYDYNAMIC_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get User Hit Info
    [Documentation]                     获取当天打榜信息
    [Arguments]                         ${fjid}
    ...                                 ${userid}=${USERID}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${type}=${0}
    Disable Warnings
    Fapi Params Set                     siteID              ${siteid}
    ...                                 type                ${type}
    ...                                 userID              ${userid}
    ...                                 fjID                ${fjid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETUSERHITINFO_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}


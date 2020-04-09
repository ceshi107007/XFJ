*** Settings ***
Documentation                           该文档是评论接口用例文档
Resource                                ../Common/Common.robot
#Force Tags                              冒烟集-新福建APP     评论相关接口（许雁良）
#...                                     作者：温怡春

*** Variables ***
${EXPOSE_URI}                 		    /expose
${DELMYDISCUSS_URI}                     /delMyDiscuss
${DISCUSS_URI}                          /discuss            #提交评论
${EVENT_URI}                            //event
${GETDISCUSSHOT_URI}                    /discussHot
${SITEID}                               1
${SOURCETYPE}                           0
${CHANNEL}                              2
${LONGITUDE}                            116.397128
${LATITUDE}                             39.916527
${LOCATION}                             北京
${USERID}                               103
${USERNAME}                             用户108
${SOURCE}                               0
${LASTFILEID}                           1
${TYPE}                                 1
${EVENTTYPE}                            1
${CHANNEL0}                             1

*** Keywords ***
Expose Discuss
    [Documentation]                     评论举报
    [Arguments]                         ${rootid}	
    ...                                 ${type} 
    ...                                 ${sourcetype}
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     userID              ${userid}
    ... 								rootID 				${rootid} 
    ... 								sourceType 		    ${sourcetype}
    ... 							    type 				${type}
    ... 								userName 		 	${username}	 
    ... 								reason 				${reason}	 
    ...  			                    siteID              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Headers Set
    ...                                 Content-Type        application/x-www-form-urlencoded
    Fapi Post                           ${APPIF_ALIAS}      ${EXPOSE_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Delete My Discuss
    [Documentation]                     评论删除
    [Arguments]                         ${fileid}    
    ...                                 ${siteid}=${SITEID}
    Fapi Params Set                     userID              ${userid}
    ...                                 fileId              ${fileid}     
    ...                                 siteID              ${siteid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${DELMYDISCUSS_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}
	
Post Discuss
    [Documentation]                     提交评论，为简化，只需要输入评论的稿件ID和评论内容
    [Arguments]                         ${rootid}
    ...                                 ${content}
    ...                                 ${userid}=${USERID}
    ...                                 ${username}=${USERNAME}
    ...                                 ${longitude}=${LONGITUDE}
    ...                                 ${latitude}=${LATITUDE}
    ...                                 ${location}=${LOCATION}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${sourcetype}=${SOURCETYPE}
    ...                                 ${channel}=${CHANNEL}
    ${bodyData} =                       Create Dictionary
    ...                                 rootID              ${rootid}
    ...                                 content             ${content}
    ...                                 userID              ${userid}
    ...                                 userName            ${username}
    ...                                 longitude           ${longitude}
    ...                                 latitude            ${latitude}
    ...                                 location            ${location}
    ...                                 siteid              ${siteid}
    ...                                 sourceType          ${sourcetype}
    ...                                 channel             ${channel}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Headers Set
    ...                                 Content-Type=application/x-www-form-urlencoded
    Fapi Post                           ${APPIF_ALIAS}      ${DISCUSS_URI}      data=${bodyData}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}
	
Get Discuss Hot
    [Documentation]                     查看热门评论接口
    [Arguments]                         ${id}
    ...                                 ${source}=${SOURCE}
    ...                                 ${lastfileid}=${LASTFILEID}
    Fapi Params Set                     id                  ${id}
    ...                                 source              ${source}
    ...                                 lastfileid          ${lastfileid}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETDISCUSSHOT_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Event
    [Documentation]                     稿件评论点赞接口
    [Arguments]                         ${id}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${type}=${TYPE}
    ...                                 ${eventtype}=${EVENTTYPE}
    ...                                 ${channel}=${CHANNEL0}
    Fapi Params Set                     id                  ${id}
    ...                                 siteID              ${siteid}
    ...                                 type                ${type}
    ...                                 eventType           ${eventtype}
    ...                                 channel             ${channel}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${EVENT_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

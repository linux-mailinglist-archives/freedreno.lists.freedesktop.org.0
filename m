Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C78839674
	for <lists+freedreno@lfdr.de>; Tue, 23 Jan 2024 18:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E89510E7EF;
	Tue, 23 Jan 2024 17:31:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528AC10E7EF
 for <freedreno@lists.freedesktop.org>; Tue, 23 Jan 2024 17:31:40 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40NFraCT025543; Tue, 23 Jan 2024 17:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=2S60bvD9HDKP0e7fFbsOYhU4WmIv60ZhzHyIeDavY9g=; b=b9
 lyOtOzseMsKl2SyZEpfj+DFQm5buhJyQtjnRwAxvktmyqS6RbjTO97caTeT0ur/o
 DjZd4cxaIOexp7afOGGTgAfgBdqQDzgIV6W0qeXCE0T8lkGPOfqA2lBGHjDXSfrs
 XBu6s7BiNdo//GoFTpIswwpBNd7C1SdQMfw3cLwOVXbNxZVVAadRPXdF+APtUhK7
 jxaKTmkuos7uS+VBhcwok/bob4a2rU+2gVUpBUAQd3qVl6EdlLFduZY2PSnGVD84
 7fINU3hGr3NvmIa+2Obp//g3tvMiL5fIqY3X79of/ZzwNSTFGSrdGREOEKmlWVdA
 r2yLPoGj+QPJPqOhETCA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtft88chu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 17:31:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40NHVcR3009022
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 17:31:38 GMT
Received: from [10.110.92.156] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 23 Jan
 2024 09:31:38 -0800
Message-ID: <6525bfd7-4478-81c1-33cd-dd4dac76aff5@quicinc.com>
Date: Tue, 23 Jan 2024 09:31:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 13/14] drm/msm/dp: move next_bridge handling to dp_display
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
 <20231229225650.912751-14-dmitry.baryshkov@linaro.org>
 <b5f571c6-dcf6-c416-ca86-fdbd0514676b@quicinc.com>
 <CAA8EJpqvyOsPErUE08mcCAcG41zRJS+Q6qQi83-ZNCBcwv3kCw@mail.gmail.com>
 <18b7e28c-c969-c5f4-28a9-74ff79c94aca@quicinc.com>
 <bb4cac9c-4de7-8ad0-5cdc-f7c089eaa75c@quicinc.com>
 <CAA8EJprpbtwzQc5LBOV8KurfHQvQW7SY4LLQpyMzVeyfmQ=dBw@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJprpbtwzQc5LBOV8KurfHQvQW7SY4LLQpyMzVeyfmQ=dBw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hVumP-9BpeI1zTrXC85CYkOLurB6zpKR
X-Proofpoint-ORIG-GUID: hVumP-9BpeI1zTrXC85CYkOLurB6zpKR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_10,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 clxscore=1015
 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401230128
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 1/22/2024 4:23 PM, Dmitry Baryshkov wrote:
> On Tue, 23 Jan 2024 at 01:20, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 1/22/2024 9:28 AM, Kuogee Hsieh wrote:
>>> On 1/19/2024 6:31 PM, Dmitry Baryshkov wrote:
>>>> On Fri, 19 Jan 2024 at 23:14, Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> wrote:
>>>>> Dmitry,
>>>>>
>>>>> I am testing this patch serial with msm-next branch.
>>>>>
>>>>> This patch cause system crash during booting up for me.
>>>>>
>>>>> Is this patch work for you?
>>>> Yes, tested on top of linux-next. However I only tested it with
>>>> DP-over-USBC. What is your testcase? Could you please share the crash
>>>> log?
>>> I tested it on chrome device (sc7280) which has eDP as primary and
>>> without external USBC DP connected.
>>>
>>> It crashes during boot.
>>>
>>> I will debug it more and collect logs for you.
>>>
>> Below  patch work for chrome with both eDP and external DP.
>>
>> We have to return failed if it is the external DP and return value of
>> devm_drm_of_get_bridge()  is !ENODEV since DP does not have next bridge.
>>
>> Otherwise should continues to component_add()
> We also should not continue if it is eDP in case of any error.
>
> So it is if (is_edp || (!is_edp && ret != -ENODEV)) which is exactly
> equivalent to (is_edp || ret != -ENODEV).

yes, you are correct.

I just found that the real fix of crash is "+ dp->next_bridge = NULL;" 
since dp->next_bridge will be used at dp_bridge_init() at dp_drm.c later.

Therefore it need to be restored to NULL at failed case.



>
> Could you please post the backtrace that you have observed?

I do not have serial console port to collect logs.

If you still need it, i will collect it tomorrow.

>
>> @@ -1210,7 +1210,9 @@ static int dp_display_probe_tail(struct device *dev)
>>           dp->next_bridge = devm_drm_of_get_bridge(&dp->pdev->dev,
>> dp->pdev->dev.of_node, 1, 0);
>>           if (IS_ERR(dp->next_bridge)) {
>>                   ret = PTR_ERR(dp->next_bridge);
>> -               if (dp->is_edp || ret != -ENODEV)
>> +               dp->next_bridge = NULL;
>> +
>> +               if (!dp->is_edp && ret != -ENODEV)
>>                           return ret;
>>           }
>>>>> On 12/29/2023 2:56 PM, Dmitry Baryshkov wrote:
>>>>>> Remove two levels of indirection and fetch next bridge directly in
>>>>>> dp_display_probe_tail().
>>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/dp/dp_display.c | 42
>>>>>> +++++++++--------------------
>>>>>>     drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ----------
>>>>>>     drivers/gpu/drm/msm/dp/dp_parser.h  | 14 ----------
>>>>>>     3 files changed, 13 insertions(+), 57 deletions(-)

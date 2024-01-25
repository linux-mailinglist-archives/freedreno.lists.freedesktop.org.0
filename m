Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A42F83C8E9
	for <lists+freedreno@lfdr.de>; Thu, 25 Jan 2024 17:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3833910EE21;
	Thu, 25 Jan 2024 16:57:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AF210E91F
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 16:57:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40PFLfBO031555; Thu, 25 Jan 2024 16:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=HzllMUvi5QW9WMhBpr/yS2Seya4wfq976EFujVMpIlg=; b=EI
 ksxMYiae3FjnYE5vsuvMiyXDqwyzitt1PpQ1vZvtUr5V/jZ5HoI9F9gsB0CgL3I5
 VUJE3GbE1XQYdLSfm2fujr3kt+05iINIqPruRSeCsq/1Gb/3vjeAi2HwjEuT++wS
 aP4eTzHxqw3wqZVsLE/bZhcuYgAkCztUDejv1v0vsckTyiMBGgK689y+hJx2zxW7
 aPygT8xvw6eUras69y8ODF6tlxKY1uhTHD+rGAwjyn7f9sICn1ld4idF3aGQIFIt
 PBC3RPp5/1ufD+spMAmAvhkjY2IF2QJ7ZQ/lEW7SaVPIQ4X1xwyY8dkwsVEIIs9T
 z6HKgDP64yQ+hvCqSMcw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vumcws8ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 16:57:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PGvDEA011075
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 16:57:13 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 08:57:13 -0800
Message-ID: <7d05d7c8-a75d-0f34-8049-2e524e85c43c@quicinc.com>
Date: Thu, 25 Jan 2024 08:57:12 -0800
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
 <6525bfd7-4478-81c1-33cd-dd4dac76aff5@quicinc.com>
 <CAA8EJpqdN2BmS+=Dh1-+8nzk6TqAbxHyuMuHjO8pa3eEkGP1PQ@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpqdN2BmS+=Dh1-+8nzk6TqAbxHyuMuHjO8pa3eEkGP1PQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: zA3bvcgl9MaGWHwN6WNotq6h-5I8K21G
X-Proofpoint-GUID: zA3bvcgl9MaGWHwN6WNotq6h-5I8K21G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_10,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401250121
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


On 1/24/2024 11:07 AM, Dmitry Baryshkov wrote:
> On Tue, 23 Jan 2024 at 19:31, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 1/22/2024 4:23 PM, Dmitry Baryshkov wrote:
>>> On Tue, 23 Jan 2024 at 01:20, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>> On 1/22/2024 9:28 AM, Kuogee Hsieh wrote:
>>>>> On 1/19/2024 6:31 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, 19 Jan 2024 at 23:14, Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>> wrote:
>>>>>>> Dmitry,
>>>>>>>
>>>>>>> I am testing this patch serial with msm-next branch.
>>>>>>>
>>>>>>> This patch cause system crash during booting up for me.
>>>>>>>
>>>>>>> Is this patch work for you?
>>>>>> Yes, tested on top of linux-next. However I only tested it with
>>>>>> DP-over-USBC. What is your testcase? Could you please share the crash
>>>>>> log?
>>>>> I tested it on chrome device (sc7280) which has eDP as primary and
>>>>> without external USBC DP connected.
>>>>>
>>>>> It crashes during boot.
>>>>>
>>>>> I will debug it more and collect logs for you.
>>>>>
>>>> Below  patch work for chrome with both eDP and external DP.
>>>>
>>>> We have to return failed if it is the external DP and return value of
>>>> devm_drm_of_get_bridge()  is !ENODEV since DP does not have next bridge.
>>>>
>>>> Otherwise should continues to component_add()
>>> We also should not continue if it is eDP in case of any error.
>>>
>>> So it is if (is_edp || (!is_edp && ret != -ENODEV)) which is exactly
>>> equivalent to (is_edp || ret != -ENODEV).
>> yes, you are correct.
>>
>> I just found that the real fix of crash is "+ dp->next_bridge = NULL;"
>> since dp->next_bridge will be used at dp_bridge_init() at dp_drm.c later.
>>
>> Therefore it need to be restored to NULL at failed case.
> Ack, this sounds logical.

ok, I will add tested-by and reviewed-by at next upload.

Thanks,

>
>>> Could you please post the backtrace that you have observed?
>> I do not have serial console port to collect logs.
>>
>> If you still need it, i will collect it tomorrow.
> No, I think it is fine now, thank you!
>
>>>> @@ -1210,7 +1210,9 @@ static int dp_display_probe_tail(struct device *dev)
>>>>            dp->next_bridge = devm_drm_of_get_bridge(&dp->pdev->dev,
>>>> dp->pdev->dev.of_node, 1, 0);
>>>>            if (IS_ERR(dp->next_bridge)) {
>>>>                    ret = PTR_ERR(dp->next_bridge);
>>>> -               if (dp->is_edp || ret != -ENODEV)
>>>> +               dp->next_bridge = NULL;
>>>> +
>>>> +               if (!dp->is_edp && ret != -ENODEV)
>>>>                            return ret;
>>>>            }
>>>>>>> On 12/29/2023 2:56 PM, Dmitry Baryshkov wrote:
>>>>>>>> Remove two levels of indirection and fetch next bridge directly in
>>>>>>>> dp_display_probe_tail().
>>>>>>>>
>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/msm/dp/dp_display.c | 42
>>>>>>>> +++++++++--------------------
>>>>>>>>      drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ----------
>>>>>>>>      drivers/gpu/drm/msm/dp/dp_parser.h  | 14 ----------
>>>>>>>>      3 files changed, 13 insertions(+), 57 deletions(-)
>
>

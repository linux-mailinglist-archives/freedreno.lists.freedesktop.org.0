Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA92D70E20F
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 18:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A46A10E470;
	Tue, 23 May 2023 16:48:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2D910E470
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 16:48:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34NDshll019302
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 16:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MwCwhzNSmSCZh57LMOlRRDHaE++tMsu3zKSz+63/LsM=;
 b=UmqdBb6/hxqMe8rfGCU/c8fOeXWII7Medc0VF5Oqb+RTrrTYXKRGCbLdA9OKLDTggL3J
 cfgnCtBKhhCkXhaArFe+s3tPZj7yMUV+7Sn7d+3DpdnDmYn4A6RDweW2/Rh3l/LycBX8
 FS+CG/BUQLzq2P+mGRp0NhDHe2Cv7qGbCegG0JngbO1l3cPHhXGaCh4Vi075NJV5ODaq
 r8HbCT3voQdsmBJjP6ngyPV6x7WcVvOc2/z7klCc7t1qTbXc/X4kCjKUb3/V35P9lNVN
 e3kp33yVNFLPeOLfimT3x+udFZmkKCfOepMKnTciK6f83Cv7JHfC9k+40me6fMaD73IQ Gw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qrq56hu02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 16:48:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34NGm5JH014635
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 16:48:05 GMT
Received: from [10.71.110.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 23 May
 2023 09:48:05 -0700
Message-ID: <101eebe0-2c8c-d346-bba4-8b714e82b33f@quicinc.com>
Date: Tue, 23 May 2023 09:48:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: <freedreno@lists.freedesktop.org>
References: <1684796565-17138-1-git-send-email-quic_khsieh@quicinc.com>
 <20230523123504.3xjssy6ktgrsdewi@ripper>
 <16c5ddb7-f5a4-d70b-ce0c-32aa6674fc98@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <16c5ddb7-f5a4-d70b-ce0c-32aa6674fc98@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: GXfqGRGHowwM3Zesbsi8UEUH1OukFpoM
X-Proofpoint-ORIG-GUID: GXfqGRGHowwM3Zesbsi8UEUH1OukFpoM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_10,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 mlxlogscore=499 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230133
Subject: Re: [Freedreno] [PATCH v4] drm/msm/dp: enable HDP plugin/unplugged
 interrupts at hpd_enable/disable
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 5/23/2023 5:34 AM, Dmitry Baryshkov wrote:
> On 23/05/2023 15:35, Bjorn Andersson wrote:
>> On Mon, May 22, 2023 at 04:02:45PM -0700, Kuogee Hsieh wrote:
>>> The internal_hpd flag is set to true by dp_bridge_hpd_enable() and 
>>> set to
>>> false by dp_bridge_hpd_disable() to handle GPIO pinmuxed into DP 
>>> controller
>>> case. HDP related interrupts can not be enabled until internal_hpd 
>>> is set
>>> to true. At current implementation dp_display_config_hpd() will 
>>> initialize
>>> DP host controller first followed by enabling HDP related interrupts if
>>> internal_hpd was true at that time. Enable HDP related interrupts 
>>> depends on
>>> internal_hpd status may leave system with DP driver host is in 
>>> running state
>>> but without HDP related interrupts being enabled. This will prevent 
>>> external
>>> display from being detected. Eliminated this dependency by moving 
>>> HDP related
>>> interrupts enable/disable be done at dp_bridge_hpd_enable/disable() 
>>> directly
>>> regardless of internal_hpd status.
>>>
>>> Changes in V3:
>>> -- dp_catalog_ctrl_hpd_enable() and dp_catalog_ctrl_hpd_disable()
>>> -- rewording ocmmit text
>>>
>>> Changes in V4:
>>> -- replace dp_display_config_hpd() with dp_display_host_start()
>>> -- move enable_irq() at dp_display_host_start();
>>
>> I think what Dmitry was asking for was that you remove the disable_irq()
>> from dp_display_request_irq(), but perhaps I missed some argumentation
>> for why that can't/shouldn't be done?
>>
>
> Yes, I was asking to get it removed. Kuogee, is there any reason for 
> keeping the enable_irq() / disable_irq() calls?

I do not know the story regard this.

I can only guess after devm_request_irq() irq is enabled which may cause 
some unexpected side effects.

I will remove both disable_irq() and enable_irq() and run more tests.





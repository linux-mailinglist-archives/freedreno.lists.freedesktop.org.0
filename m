Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA59709BB9
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 17:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE48C10E068;
	Fri, 19 May 2023 15:55:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A491110E068
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 15:55:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34JDQnqa030242
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 15:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+OXpJWkg2sYENm0I7vpOd1hXwby63qazsKeWJwyRpDg=;
 b=bts8HqZmQdhjqxrxNrVf0lrz6aRFqlvodT+A0BDRdrlpMYtkd4n6tv3ZwtB+NrwGI2V6
 H7B+pLKRG86UxcKscUpD2iHUBQ7A86z++EXJnN+UDSNkZIOkoDywCrvG3j9jg6dY7i2E
 lC/ZIuf+wgk8zIyYzVz/o9+CaqI+VkplT8Zgc51TrLDoPcjCVa3T+bKTGf+kQfDGPwTU
 6RxBrnip0LRlArhAyEN145wBsGId3qTTmg7hmuAQq6uW8r0cogoDeSR4GFAEReEtDbrR
 UDUcbKXKp4E3dmOaC68vkrJIJLsUzpJrYcm6SA6gryp0rxVMiRLv1zUpuvqgdedO9mS+ rQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qp0kesjgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 15:55:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JFtfUX006302
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 15:55:41 GMT
Received: from [10.110.69.155] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 19 May
 2023 08:55:41 -0700
Message-ID: <890cb047-83ac-989b-b3ed-919431305128@quicinc.com>
Date: Fri, 19 May 2023 08:55:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: <freedreno@lists.freedesktop.org>
References: <1684452816-27848-1-git-send-email-quic_khsieh@quicinc.com>
 <1684452816-27848-8-git-send-email-quic_khsieh@quicinc.com>
 <97ef8324-655c-a9fa-9722-9bd7054c25f4@linaro.org>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <97ef8324-655c-a9fa-9722-9bd7054c25f4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lhpiN3EbUg2tnD_mg35cvNqJt12F92Se
X-Proofpoint-ORIG-GUID: lhpiN3EbUg2tnD_mg35cvNqJt12F92Se
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_11,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=677 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190135
Subject: Re: [Freedreno] [PATCH v11 7/9] drm/msm/dpu: separate DSC flush
 update out of interface
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


On 5/18/2023 4:37 PM, Dmitry Baryshkov wrote:
> On 19/05/2023 02:33, Kuogee Hsieh wrote:
>> Currently DSC flushing happens during interface configuration at
>> dpu_hw_ctl_intf_cfg_v1(). Separate DSC flush away from
>> dpu_hw_ctl_intf_cfg_v1() by adding 
>> dpu_hw_ctl_update_pending_flush_dsc_v1()
>> to handle both per-DSC engine and DSC flush bits at same time to make it
>> consistent with the location of flush programming of other DPU 
>> sub-blocks.
>>
>> Changes in v10:
>> -- rewording commit text
>> -- pass ctl directly instead of dpu_enc to dsc_pipe_cfg()
>> -- ctx->pending_dsc_flush_mask = 0;
>>
>> Changes in v11:
>> -- add Fixes tag
>> -- capitalize MERGE_3D, DSPP and DSC at struct dpu_hw_ctl_ops{}
>>
>> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
>
> NAK. The fix should be in a separate patch. This has been written 
> several times during the review.

yes, i know that. but i just intended to keep this patch at same order 
as before.

are you want me to move this patch to the first?


>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 23 
>> +++++++++++++++++------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 13 +++++++++++++
>>   3 files changed, 38 insertions(+), 8 deletions(-)
>>
>

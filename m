Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A569E5077
	for <lists+freedreno@lfdr.de>; Thu,  5 Dec 2024 10:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CEB10EE00;
	Thu,  5 Dec 2024 09:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BlZPxUnp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4589710EE00
 for <freedreno@lists.freedesktop.org>; Thu,  5 Dec 2024 09:01:43 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4NAes2026206
 for <freedreno@lists.freedesktop.org>; Thu, 5 Dec 2024 09:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UBlV71/S/1hIrwvQvF8onkqeXPfF0uj7g0z4CXkoqgQ=; b=BlZPxUnp28Dgjs0R
 /rNkCFf77C5OYR2Vh528B5zj5I50k9LRNtUDRdg4IzP1bXPFmLJPNViNBOo6T3gO
 yAKTEocTFj9eu/YbTSAvPM2ffbPNl6ruovGzk32taSMzhrNvAyV3aMkbvnhcag28
 ehJPnxCjMEKWD2h2OySknEWxMkigU/t9b4rlQ9lu0j9VN+f8Tf8MVS/RwUTGLH2t
 qUcFd+eoEvRMFKK/nhSpXZGoB3Qf3F7XXBwmb3+YmYzkoIgCyPXuhhkyLZZn7XTm
 5ihRc+mnk9BhtSvrOqOSi+Py3K3cl3Qo5fpI+c+Z7r9AZFMUNrzVFQswI/cOVxVW
 NZUW3w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439yr9pdcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Dec 2024 09:01:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B591ftB009908
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 5 Dec 2024 09:01:41 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 01:01:40 -0800
Message-ID: <0bd19e44-f601-4035-ac87-13b3e646cdd5@quicinc.com>
Date: Thu, 5 Dec 2024 17:01:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add QCS8300 support
To: <freedreno@lists.freedesktop.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-4-29b2c3ee95b8@quicinc.com>
 <f5kqdxkhniwwxu6wm2q323vvlsfn3yyig7mfg3h5ctqo7jjxc7@7g32tirseuqs>
 <9821c4d5-8d1d-4bed-b3e0-879d0aeba017@quicinc.com>
 <CAA8EJppDomrYvtJ46pi1_hDsf3zFeeTfrkQfVwE8UTN01KfKpw@mail.gmail.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <CAA8EJppDomrYvtJ46pi1_hDsf3zFeeTfrkQfVwE8UTN01KfKpw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: nJUOC48CvLKQOAZst0jVH3vdHcyXYPNt
X-Proofpoint-GUID: nJUOC48CvLKQOAZst0jVH3vdHcyXYPNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=717 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050064
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



On 2024/11/29 21:32, Dmitry Baryshkov wrote:
> On Fri, 29 Nov 2024 at 12:01, Yongxing Mou <quic_yongmou@quicinc.com> wrote:
>>
>>
>>
>> On 2024/11/27 21:49, Dmitry Baryshkov wrote:
>>> On Wed, Nov 27, 2024 at 03:05:04PM +0800, Yongxing Mou wrote:
>>>> Add definitions for the display hardware used on the
>>>> Qualcomm QCS8300 platform.
>>>>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
>>>>    .../drm/msm/disp/dpu1/catalog/dpu_8_4_qcs8300.h    | 485 +++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>>>    4 files changed, 488 insertions(+)
>>>>
>>>>
>>>
>>> NAK, there is no need for this.
>> Got it,thanks. will modify it in next patchset.Compared to sa8775p, they
>> use same dpu but qcs8300 has one less intf and two fewer dp intfs. Other
>> configurations are the same.can we reuse it or a new catalog file to
>> show it.
> 
> Is it actually not populated in the silicon? What happens if one
> access those INTF_n registers?
> 
yes, intf_n and ctrl is present in silicon.it is fine to dump intf/ctrl 
registers.

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C757CA3B9FD
	for <lists+freedreno@lfdr.de>; Wed, 19 Feb 2025 10:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EECD10E7A2;
	Wed, 19 Feb 2025 09:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EOR7xp8X";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D017810E7A2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 09:38:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J891VJ008437
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 09:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VLi+Ho7sKOpTK2LzB78PvM0skWUedwsqkaAuoUuT18I=; b=EOR7xp8XAOOCXPZY
 45HASIleuMgF37JgNK7kRBVT/wGQ2uNdt7LOVKZh0Rg4sOgQxlIQR3NM8FJ7EvYA
 SxhrnA6ojEm8CIdGh63ZhveFBJERVEfIm6pDiD7FbelFWf6j4Jjo656376Uij+ux
 uTunO0i8mEGbVKP/3dlPr8dIg5uMFSedwtIRA1zK7MLaoEaPDBmkM+UnkO42RkuV
 2wGXh+yuRzid5xCXfFHJH3WLPWo0OLn0hAlrHz1UhHOcv6154NYDaBp4qFK+3Jdy
 ZfN4wjsnI8bgfV/ctWdkHs8QxrcIVXUrSYdlJqDfElUaqLfuyHhaf81CoZN2Gx2e
 7J/hWQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy39yf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 09:38:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51J9cR9D026845
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 09:38:27 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 01:38:27 -0800
Message-ID: <7ead4172-d62f-409d-89ba-c8bf5d398d6b@quicinc.com>
Date: Wed, 19 Feb 2025 17:38:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
To: <freedreno@lists.freedesktop.org>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
 <531a23fe-940a-4e9a-b023-5f1789ac65a5@kernel.org>
 <10d83c88-9f72-4577-95ba-bb1fd1ef36d1@quicinc.com>
 <5fd75e3d-ee87-439e-b6d4-dd0dd9a0ea2d@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <5fd75e3d-ee87-439e-b6d4-dd0dd9a0ea2d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: u_9pDFVrxe30YFEPpU8W9PPtuZBjbbnT
X-Proofpoint-GUID: u_9pDFVrxe30YFEPpU8W9PPtuZBjbbnT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502190076
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



On 2025/2/12 19:28, Krzysztof Kozlowski wrote:
> On 12/02/2025 12:13, Yongxing Mou wrote:
>>
>>
>> On 2025/2/12 16:35, Krzysztof Kozlowski wrote:
>>> On 12/02/2025 08:12, Yongxing Mou wrote:
>>>> We need to enable mst for qcs8300, dp0 controller will support 2 streams
>>>> output. So not reuse sm8650 dp controller driver and will add a new driver
>>>> patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
>>>> to compatible with the qcs8300-dp.
>>>>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>> NAK. You just said qcs8300 is compatible with sm8650. I did not ask
>>> about drivers, I asked about hardware.
>>>
>>> This is messy approach. Describe properly the hardware first, instead of
>>> sending two conflicting patchsets.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Hi, Krzysztof, thanks for reviewing, i want to explain why i submitted
>> this patch. Patch
>> https://lore.kernel.org/all/20250114-dts_qcs8300-v3-1-d114cc5e4af9@quicinc.com/
>> and
>> https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-2-1687e7842125@quicinc.com/
>> is the qcs8300 display enablement changes. It base on current linux base
>> code and it only support SST mode, so in the SST mode, qcs8300 dp
>> controller driver is quite same with sm8650, struct msm_dp_desc only
>> have 3 members(io_start, id and wide_bus_supported) and they are same
>> both in qcs8300 and sm8650, so we reuse it. BTW, for dp phy hardware
>> version, qcs8300 and sm8650 is different.
> 
> No. In one patchset you claim hardware is like that, in other patchset
> you say hardware is different.
> 
> Sorry, hardware does not change based on your patchsets.
> 
> Sort out this before posting new versions.
> 
> Best regards,
> Krzysztof

Got it , thanks . The 4 clocks description will be updated in the new 
patch. Qcs8300 support 4 intfs in DP0, sm8650 supports 2 intfs in 
hardware.

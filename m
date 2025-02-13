Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039CA34B39
	for <lists+freedreno@lfdr.de>; Thu, 13 Feb 2025 18:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D48910E021;
	Thu, 13 Feb 2025 17:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="C9PKfxpL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7B310E021
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 17:06:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D8eDFR016698
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 17:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bS0vhULhoNWX5f1sJFAntEwyDsM5ciTvrgoCxSKKkoI=; b=C9PKfxpLcQ5kjvOx
 YBX69EUN3he7ggDVfwiL6CRrRm9qNuz3kLG7smueo7HbBPq2yCS6LptCBrPWyAyc
 qHU27ZfcjOEnRkvcPi7XgrDSfQlrJT1uNDI5en8CqwEXAXpMUI936lhJtfwBXX0Y
 aiyYzQzhFTzWJ1+OVKLzdJ9+5di7KC+AAxQiU6zXe7BvGkUjbdXUQFYyD8LB+kTq
 Q5cbjSpw1/xA9lHXE91ZQsk3LAmLQG3lImEWSawhZtiv1m2YcyMFCUMw4lWwlfeF
 xQyRlLqar4Wb1FHsOGHg4V4oX0JIeQrvIRhGqgzHhR7ezGkiFm/gHADmGiFGY7Ow
 MsaY+g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sde89amd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 17:06:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DH6iC3025018
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 17:06:44 GMT
Received: from [10.216.44.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 09:06:43 -0800
Message-ID: <72f30f76-26ee-4c7e-a8e9-8847a5f466bb@quicinc.com>
Date: Thu, 13 Feb 2025 22:36:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Fix gpucc register block for A621
To: <freedreno@lists.freedesktop.org>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
 <2bfaa1ce-0233-456d-ba2e-5b14533f3812@oss.qualcomm.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <2bfaa1ce-0233-456d-ba2e-5b14533f3812@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Q-HeDrdLHDrEWigBFIlIqFwW53_e_86F
X-Proofpoint-ORIG-GUID: Q-HeDrdLHDrEWigBFIlIqFwW53_e_86F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=684 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130122
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

On 2/13/2025 10:06 PM, Konrad Dybcio wrote:
> On 13.02.2025 5:10 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Adreno 621 has a different memory map for GPUCC block. So update
>> a6xx_gpu_state code to dump the correct set of gpucc registers.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
> 
> So GPU_CC is outside what we consider GPU register region upstream..
> 
> And I've heard voices (+Caleb) lately that we should get some clock register
> dumping infrastructure..
> 
> So while I'm not against this patch fixing a bug, perhaps we can get rid of
> dumping GPU_CC here in the near future

In A623's case, there are kernel panics due to invalid register access
here. So this register range need to be skipped or patched up. We chose
the later.

-Akhil.

> 
> Konrad


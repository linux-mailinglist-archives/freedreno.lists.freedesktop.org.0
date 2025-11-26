Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C67C87EF7
	for <lists+freedreno@lfdr.de>; Wed, 26 Nov 2025 04:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF7510E4FF;
	Wed, 26 Nov 2025 03:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkUQofnj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzNbP7K3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6D210E4FD
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 03:21:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APIdnk52659009
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 03:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pUSij966+HRiUH0i/n3DzHvXFNJRC2P5sPL2WyUURiI=; b=kkUQofnjt5WDQGaa
 hDSbJQvYF9Hqo/CIzg89Tud5/GIlC9KofKQZ7Gt2X/gXx2UZTd9oyVaNTtAIP0YJ
 Xdxy8n08L+RKfkfloxLk0+pYhCkCHWGKkQDJlpG+mWPXAICTW0uypgZITDq1YVlc
 f5CUr6hHxny324cDx1Fg+QRxOY/Nwx7FTxNMOWd/CC90jLkb5Fvam220sffIikUq
 sGKfKqa/QTNACvyVTAaCgLEMe9u+WZlb26zEkXhvMY2U0gNqhfXEvuJ6y+a0hTKU
 f3RQUsdl5T6NzOkaFHEuECvVKjdujUkjql2Zve9A96FEsZtD7FZYZxy/qGxM/NNi
 8VC8CA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9xam4r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 03:21:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297df52c960so156933735ad.1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 19:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764127264; x=1764732064;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pUSij966+HRiUH0i/n3DzHvXFNJRC2P5sPL2WyUURiI=;
 b=DzNbP7K3ZcJ9g3o6m3+U7EhI4CIXu12w78u3JJMjInniaGeLjBG/SuP/7R31RfDn7d
 VfnGPZA3c6z+vLhKfsARskThSGGFXylGswfNMzGHBXVk3zIXLejJebmBo3SjUpG4V6cf
 4+ZkcyqgLbhz0zRTDTRnvw3kNa9lxkhflMqiYKjsrl6UFXTOvzJARWW3JYIQsZTUF+sn
 RcMrCQlaiTs8G2fbJBxmxm611OneceRBiPjKecyMBVd4dciSh1dVpqEnXqZlUVkQKBU3
 ENK8EycGFLZmC1FcnPr7UplLoNjhgNlLVw1ByM4TGN4XnULw8Y1JDuSiqUsrduLj4EtB
 FvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764127264; x=1764732064;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pUSij966+HRiUH0i/n3DzHvXFNJRC2P5sPL2WyUURiI=;
 b=mhBfJ9gMZmhKcWXglJaa+ti19ngoO2P02XqbpdECvLN7Y6cTTlKs4+DFX//PV3jUYv
 hgbZXWVjTWarT72m3Y/3khsnS1HQ6G0rXtKEcFd6hBLBVENPEXbiU6U9+68YpoBDa1WG
 xU0P9L6uoAamlURe1Nc78V55i4ZEAZmdFq4KFSHSQZ/JcSJ8+g67b9CZFtlAFrAhg1VP
 DO9zYMY98SE6JT8EQzmehK83NZ16ZBh2usFS3Ba7hOxtdhztbm0a4GRD2l8wB6zPLxIe
 jRa9tNNdre/WXeKRSXObYwJrCE00uBOFvlR429MDbCrbU8zWeqF/E//eEHIiFTkRKMW3
 lYOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6my9ezfyG05xN4EZJJMpG19QY2Je6JlAo8f3QFMB4XvKC71zhAQfdbo3aEbgA/kuPdXrDB5Fbgpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwELjYkC3sgA95Zai0w6PVN+lxnfOPueyLnLuJOr4IQmq3sz2KB
 583Tr2a2mZTT9909zz25C35DqRVMPz8iBrHpr9K0GNnO0lZRKndBKT8tnxAqXn9UrkW3YPuKxnV
 iYU6d5QIRF7rms2y2RcCrTWEuobUcB/Li55qGtplAL1g42+Hv7WLfLHBRDzY3c/vlWANXOp4=
X-Gm-Gg: ASbGncszg7tHOmGAdhO6NTus+5rIw+lvbgvpwufwReIz7zx7oM0onvJCyIxvpiEdixk
 EIIWTDZVvAgekvTZxJRbnqi+Px9Ux0KdxxkgOG8HpkuueL3TGoi5AmOZbAnylzS7YG564gunMBH
 j3a+Iqnp4EKQBRudFMhcbStPm/iCSEBRTu+kG+jAbOWzmfkE/ODg06zXv+pOWhtuHNpNql5r+Rw
 /1ovbH3ewKyvrow/f04aa7DNOvszp0Ln5LX7aWBTAp+akyckYy1d16HK8fZClY5slzsyN/bW5Qs
 tYJ+GLc19V0WdERxUOmgUw0VSYau0vOMGy0k0q1dx+/E/AKyAWdMrsxTTDnjhF8Fik62IfAFXdo
 l1BV4i1yr/SIzaWu8bsR6qGRgDe5KFZyC03SyuuVDYQ8G9fR6xZzojmGIUo2UKjRsrk5EYQ==
X-Received: by 2002:a05:6a20:4311:b0:35b:ae01:a4cc with SMTP id
 adf61e73a8af0-3614eb27712mr21998835637.1.1764127263911; 
 Tue, 25 Nov 2025 19:21:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHY5GTmXB6LRIcB/8CKQbkXtSEMjcFcfmYhsgY/Tg9UhZJyBXxtYvylvK9lnxc5BwtLpd4OJQ==
X-Received: by 2002:a05:6a20:4311:b0:35b:ae01:a4cc with SMTP id
 adf61e73a8af0-3614eb27712mr21998793637.1.1764127263426; 
 Tue, 25 Nov 2025 19:21:03 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bd775ccabfdsm17447699a12.29.2025.11.25.19.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 19:21:03 -0800 (PST)
Message-ID: <48e5427b-a17f-42f6-9c04-ddba8f383d58@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:20:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/msm/dp: fix the intf_type of MST interfaces
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com>
 <3cnujrkkcui34wg3jrfoezradc5itm2paw5mgkii2d2snlac2a@lerj4ldbvf4l>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <3cnujrkkcui34wg3jrfoezradc5itm2paw5mgkii2d2snlac2a@lerj4ldbvf4l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7VG770CIO_n7WSRuQd5mFzgD7ns_6LNK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAyNCBTYWx0ZWRfX+hb7S+PS9Fsf
 gjuD8ogxJa4NUu+9C80EgxKBWAZYiXAWO5e+c5g5OfQEmGw+OVB06JVraodkOzwRXhLwCRqTq8I
 wn+93XLPprvbcmDmSpeB2bt3ISCD9IKSatBSzeao/YBTmnlBslZUrjRVRV8xQge6QnLCXfSjcUc
 Cfzs2wjuhJKx9vo6rZ6/uFEmhgtvTmsy9iNztX8AKuUaQ/paM3NPZiZx+wqProGKSdbbERUSYRb
 AOJWQ5I72ofXk7pf/crGGewP242ES9NKqxZCTGZGw/AhI5avD5nGb0lyM8VzWNRCAw7CtI3SGIf
 b96MbUMg8B3KHcCrWqaV33dnaQ2MFixZ+70o3D9aZCBLTz7i8vodnsVsfO66cBGcIUdjMiIUGsA
 G8YZWR1FRLE0Syww3YJM6vQiUeQdag==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=69267220 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=aISMk_G62U0n0vxTSHQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7VG770CIO_n7WSRuQd5mFzgD7ns_6LNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260024
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



On 11/26/2025 8:36 AM, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 04:22:12PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Interface type of MST interfaces is currently INTF_NONE. Update this to
>> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
>> dpu_8_4_sa8775p.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>> This patch was split out from the MST V3 patch series:
>> https://lore.kernel.org/all/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com/
>> ---
>> Changes in v4:
>> - Splite chagne out from the MST V3 series.
> 
> Why?
> 
I would like to send out some patches that are independent and have no 
dependencies on the overall series, to make maintenance and review 
easier. For example, in V3, patches 1, 29, 33, and 37. I mentioned this 
approach in the first patch of V3 before. Please let me know if this is 
appropriate. If not, I will stop immediately.

>> - Link to v3: https://lore.kernel.org/all/20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com/
>>
>> Changes in v3:
>> - Fix through the whole catalog
>> - Link to v2: https://lore.kernel.org/all/20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com/
>>
>> Changes in v2:
>> - Change the patch order in the series.
>> - Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com/
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
>>   3 files changed, 12 insertions(+), 12 deletions(-)
>>
>> @@ -363,15 +363,15 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>>   	}, {
>>   		.name = "intf_6", .id = INTF_6,
>>   		.base = 0x3A000, .len = 0x280,
>> -		.type = INTF_NONE,
>> +		.type = INTF_DP,
>>   		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>>   		.prog_fetch_lines_worst_case = 24,
>> -		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
>> -		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
> 
> This is a separate fix, it should be a separate patch.
> 
Got that, thanks..


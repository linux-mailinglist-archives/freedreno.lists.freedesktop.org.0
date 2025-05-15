Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEE9AB8D49
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 19:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD58110E1A8;
	Thu, 15 May 2025 17:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5GcOq9j";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B3710E2A6
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 17:13:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFDpu007863
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 17:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yYY5LgPRLIrcdKBo4sFGaqpoE0nGNKtVE2RVccwfFlg=; b=Y5GcOq9jFeWOZVDD
 Wp0cXL7yUw4LnTspT78KA03rujBHrF7cXUO/6KD3mzlgkEHiicB0Ytq2lQtoQad8
 4N1SAwIhxX3Aa/Gc1l6xPR1ZVa6Vp8idrnEOYmgSDkv3HAWUZYbnuNF5z4voWMAP
 hd1ei+t35uiJmG9EHY5U8Mqds8UbUKC6b7oGUpGjU8Kld0SbCP/qna4vc4jsApIP
 vc85l6eaNVSYhHGxJcl3qDn5/lkIpNwKx8Op+w696lD4gX5ihJd+t4LKP4CjnwXm
 oK20wWCxR7rVJgqVnKKMzTPBNC5eJ0hv3LGC205kIEfZTh1TjBjuQjiCePRfru+/
 nAn7Lg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpy0y3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 17:13:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-30a80fe759bso1943597a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 10:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747329200; x=1747934000;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yYY5LgPRLIrcdKBo4sFGaqpoE0nGNKtVE2RVccwfFlg=;
 b=XxzT9afeKt9DBUUzmLZrTwyvDdnGI+CyLXCT7BkK9ISe5hBk0PCGVibRfaLYnq7DAv
 rhq8AU7PocstEPzfq2knmoX0+ZZIA/TfyKlfxJpBgU+CdHrMZxyR8GXrz1A7kWcrG9uC
 mZNe579GzEtIR3DhK2ssxgKhkN1vj09qShIKYhAam7DVl5SzigIrKsfEdYsOeU8qNCog
 giI94SIclGYQcMhOU192t8zVFnltIYX+Ri0JNMXYGsaI0mjuy7Rvtp3J+G4vLYBhrPsh
 HWtPeQOnSdUuuD7lv4cniFu5t/Jeufl7hbwnH5K/R+7hX2sl+ysSPJlUqJlb6ZnGrXmE
 CL3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXagTO+3YnHu/EKRxX9vbEhbM1ChaTIJUjRZL0DP9eGnGbVgsJTUN7ID1Mjjla5/+rt+eb1hfBXZk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzv9gQX1+pd7LQ3wsL0Zbc38FkrJ90ZJJiTjqbHsZKehCAEILIH
 JSJG1kX4gRZpLYO3mPcGt9e8YknkeurSCqHVQuyU3RtR9hRz7CjoxChWyCvpAFKbrN1WdVI4jPG
 ZP+W9mK1t/e9dj6crMpWeL69V7Ykq21AC7MJXlYqzDK9KWCFrxvZqqdIlVCSOIHEXyZYi2rI=
X-Gm-Gg: ASbGncsouQQR42XYlBzBC9V7asvdsd9eCUCB672OdXZ+76rmi3RLhUfawSqARR+2xQg
 RAbll1HOxPIZILA8CycOoo4YUilgK8JGpMQlot2aLAHHNxi9n4Jp5FMeyB/8wAtVp0QsW0QBAxt
 aqAn4wa1Q8GfiGXuKW/VpqNBjHNau4GYXE/kUor98QXPDwhjrj3yQeeiUF2TQw93rmjQ5Ux2nwq
 1H6CMCej0oZRhZOnN/NV7ATPv1ih2FzZEZUYki3xBX7fjPl3tYVd8y8yQ0A0T9tkfk11HLL25yX
 2YJnlCYpKopo3UI5xsXzdxIlQB3AmGW6GZjASW1Zhk2WNpPBVNAxTF9p8Eock6JhVOCUsw==
X-Received: by 2002:a17:90b:33c2:b0:2ff:6608:78cd with SMTP id
 98e67ed59e1d1-30e7d544fd4mr288086a91.9.1747329199742; 
 Thu, 15 May 2025 10:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNDu7NvHwl9BxUYwJis4ASPQgBchI/AV8+LYPCkrCV2kofbKQRnSnmom5F9mPfzufGWwElaA==
X-Received: by 2002:a17:90b:33c2:b0:2ff:6608:78cd with SMTP id
 98e67ed59e1d1-30e7d544fd4mr288065a91.9.1747329199310; 
 Thu, 15 May 2025 10:13:19 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e7d5918aesm64070a91.49.2025.05.15.10.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 10:13:19 -0700 (PDT)
Message-ID: <abc767ff-acb9-47c3-8b6e-6c6150f7b19e@oss.qualcomm.com>
Date: Thu, 15 May 2025 10:13:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/msm/dpu: Add max pingpong and dsc width to HW
 catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-2-c8ba0d9bb858@oss.qualcomm.com>
 <txn2anohfbrymaseeo55slmzimstietsrmhx3mhigw4fcx3ow4@b42b3n53et6l>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <txn2anohfbrymaseeo55slmzimstietsrmhx3mhigw4fcx3ow4@b42b3n53et6l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y63dwPLOwSvFkzlWtJIvDXwgGQuWj4Tv
X-Proofpoint-ORIG-GUID: y63dwPLOwSvFkzlWtJIvDXwgGQuWj4Tv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3MCBTYWx0ZWRfX+o9O04OUjZOq
 ePd+bypo5kchGKwJL40S95fV76L6ynuqWAov85ysVUDIVNgaeP92QIbnt5l64hnVfU+s418ADka
 2daBHzj0xkVI5q/ucvK0tKpY2EIz1Gf53p3PKdld0mYyWB/MAOs/JQoGaX6tgBqIgHTeqe/MpAX
 jcW6AWUguvWev3rXUGWaq7dybVx4BOGtcGSbCpuQzl4kxOEuNn1uffH3tlor3ymDcnHxMxGFsQX
 iwpnpXqzRXnFLS7aC4EZoxinH4r//f6qfspnD5BTY2o45OFmXuqNaKvQTrw6mQebX5QN0auEjxY
 Qs8t7/yV9aKj+jIqWnqbcbS92CWw7xqa+JXMgxyuqkPA2l68BkrPSjbjkn1pUKkapRzA/6oYbDq
 bJrrokXBE2+NxlGCib/dWWYUmMBpJrfpcnjFnopawhX28Mg21SsoF7p5Nx4S96H65qtDzHxl
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=682620b1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=_YleJFLcT2wxSgV-J2oA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150170
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



On 5/14/2025 5:21 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 04:52:30PM -0700, Jessica Zhang wrote:
>> Add max_dsc_encoder_width to dpu_caps struct and max_linewidth to
>> dpu_pingpong_cfg for all chipsets within the HW catalog.
>>
>> Note: The max supported PINGPONG width was 4096 but increased to 5120
>> after DPU 6.x. In addition, DPU 8.x+ increases the max supported width
>> of PINGPONG_0 specifically to 8960.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 11 +++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  7 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  5 +++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  7 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 10 ++++++++++
> 
> This needs to be rebased on top of linux-next, otherwise you've missed
> dpu_9_1_sar2130p.h .

Ah yes, forgot to update my local working branch.

Thanks,

Jessica Zhang

> 


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5979EA82ADA
	for <lists+freedreno@lfdr.de>; Wed,  9 Apr 2025 17:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212E510E1E0;
	Wed,  9 Apr 2025 15:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWRAM9wL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C5010E146
 for <freedreno@lists.freedesktop.org>; Wed,  9 Apr 2025 15:44:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398DknF026736
 for <freedreno@lists.freedesktop.org>; Wed, 9 Apr 2025 15:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jf9Ry+p2QQQupfgw9vOlP3Ifvgj581gqI0fqXPxyhMg=; b=TWRAM9wLBxqUMUOp
 936fUT/TBvmCbxUFWKW/cG7VqA8rE+UhFA/ur7uT0cj7S+cipzBvhPb/KBmwrU36
 TQLv6z1O2ntFSPaxOXgRIJ+B36Die/6n8xZ/Rg3PbRA8+xz+KRglopxtYQPQfgze
 wXNtWUFaQi9pwbA0fo0GsPNuvD+YLiRfF3KhO0IL/4qPvo3ezADfziS7dr+Pky2l
 8comIh1oY3UbvXJxx6Uw9UHMr0OvSZ0a+dqBf6YsULlZzLj+850W8VHIpYNxSmvs
 E8ywtn6Xnk8wvyXYf3BHhJ3fNzvtqQ4xjo++qhO8bS0N1bZmRO5OBx2iambMT7YN
 goH6SQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgkyh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 09 Apr 2025 15:44:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so1222732685a.3
 for <freedreno@lists.freedesktop.org>; Wed, 09 Apr 2025 08:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213476; x=1744818276;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jf9Ry+p2QQQupfgw9vOlP3Ifvgj581gqI0fqXPxyhMg=;
 b=XUnqmbgnQCENKd7gWY7BBtimetr7ESNW7pgOQQtgu6C5Rm/zFiaNXaAOU3bozxOn9j
 Tg+dibE+T9s5Kncz2dsuvBxsGYgnt6YUb+IeJR4xINf/XvUAIowSu/g8gL9yd8omJwL5
 8vBc/gD1azcKO6FDhwTbb0Xgev52K3Xq8Xkb41Cy6LfHPh+14dtkODU/3/fyXgHylx0Z
 0Bwmw+k07cehKFCTchbiZ5F3hOjLhpm0qatEsgzqyKE3tej90O/BaLij1blZIAHz6/n9
 IFt2RBHQW0L69L00pD2iV9Z9E+vOKwPFc3cckSOF8X+8jBLllSNgULr/hVYVb8dhqUbc
 ctTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu1U9kj3mQkSvhLYr/43izFhZLahsqHGRwMbqUk+lIechHsbA2rC3j7aFsD1McWvsNkUPCGymkDuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDRcztz+SdcJEq7VM6Kz9US9W95mfZ5a6Vv40crHBdBqUpJRG9
 eNj4tyHtJk0axjRgkY0bzb91q2d9HYrvV0jKE1He2LvQWijp26/+CGP3qxO0qSwDlFA4DDqCPcs
 NzMHqt05Dpx2xzguv7sfGDgXYx7Jo3/amrV0p+zVyIHoE65HfDOAKBupfnIXlF4rxKDI=
X-Gm-Gg: ASbGncsMHLBgJSxwjNjFSA/0WPQ64i9/iJ91Ib0ywXVUM13AuqKAgkpYZFm0dsorc68
 AXUr+ABQxCcKFG+Fo6bv9bEJ899JRMoILMiH0jSJYuu7jxVpwqrIxYMnBhLDOgsZIXVwb89Rvy0
 YrMbXPqoXwGerQ6c9q6WBBAevRw0yk7OXPRx1QyU+hAWS7iCuG8RbMMHgRajgLwaHmqQXa9EzKG
 jZNWHzzT6ZFodDispFb1iFjpdvTKXX6YK9mL+RjHoZg2xSCIo8A6dtbj5wezx7IB/H/C8k2vQN0
 8gwyDczp5YW3apEdBFy5XZK0ExkVE+tKGzJ/Qpyd/48dfgBbo4Xsf3etM/4F1cOCLsQ=
X-Received: by 2002:a05:620a:6223:b0:7c7:a212:d1e7 with SMTP id
 af79cd13be357-7c7a212d215mr251123185a.32.1744213475111; 
 Wed, 09 Apr 2025 08:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR79I/nR+rW+zjtLRr7uRkQezm/LzIKrYmKHQlSC0gniwNCOb3Sxvl8FOipevKYywu+GxHkQ==
X-Received: by 2002:a05:620a:6223:b0:7c7:a212:d1e7 with SMTP id
 af79cd13be357-7c7a212d215mr251120085a.32.1744213474747; 
 Wed, 09 Apr 2025 08:44:34 -0700 (PDT)
Received: from [10.187.209.180] (37-33-188-210.bb.dnainternet.fi.
 [37.33.188.210]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f465f7b0asm2007281fa.98.2025.04.09.08.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 08:44:34 -0700 (PDT)
Message-ID: <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 18:44:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f695e4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gh1egkeLKbPt9jDVRuYeUQ==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=9wHiH3TPsHwm208gvmQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 68DqFYBLHaVe72v1_omZLyt-4YOnkQ_c
X-Proofpoint-GUID: 68DqFYBLHaVe72v1_omZLyt-4YOnkQ_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=729 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090100
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

On 09/04/2025 17:47, Konrad Dybcio wrote:
> SMEM allows the OS to retrieve information about the DDR memory.
> Among that information, is a semi-magic value called 'HBB', or Highest
> Bank address Bit, which multimedia drivers (for hardware like Adreno
> and MDSS) must retrieve in order to program the IP blocks correctly.
> 
> This series introduces an API to retrieve that value, uses it in the
> aforementioned programming sequences and exposes available DDR
> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> information can be exposed in the future, as needed.

I know that for some platforms HBB differs between GPU and DPU (as it's 
being programmed currently). Is there a way to check, which values are 
we going to program:

- SM6115, SM6350, SM6375 (13 vs 14)
- SC8180X (15 vs 16)
- QCM2290 (14 vs 15)


> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (4):
>        soc: qcom: Expose DDR data from SMEM
>        drm/msm/a5xx: Get HBB dynamically, if available
>        drm/msm/a6xx: Get HBB dynamically, if available
>        drm/msm/mdss: Get HBB dynamically, if available
> 
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  13 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  22 ++-
>   drivers/gpu/drm/msm/msm_mdss.c        |  35 ++++-
>   drivers/soc/qcom/Makefile             |   3 +-
>   drivers/soc/qcom/smem.c               |  14 +-
>   drivers/soc/qcom/smem.h               |   9 ++
>   drivers/soc/qcom/smem_dramc.c         | 287 ++++++++++++++++++++++++++++++++++
>   include/linux/soc/qcom/smem.h         |   4 +
>   8 files changed, 371 insertions(+), 16 deletions(-)
> ---
> base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
> change-id: 20250409-topic-smem_dramc-6467187ac865
> 
> Best regards,


-- 
With best wishes
Dmitry

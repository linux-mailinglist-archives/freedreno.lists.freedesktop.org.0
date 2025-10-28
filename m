Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AABC16F7F
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 22:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665ED10E671;
	Tue, 28 Oct 2025 21:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OstP8fKM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGpVh3Qf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF33E10E671
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:26:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJllDo2525735
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vb6dVEBF1GsrTqvUi/V9O4Oe
 gNy8kFowkn6bq/8s4Qw=; b=OstP8fKM1OdJjzrC0fYc/V3QRu5HUJQJ6KPqVswF
 ZtdSTSs/dDuwJIrnG+kRESf2fAKb9wWMO2b/XI3bKWanEJTdG8c5bN3w5sZJ/LOH
 E5IWqEuV2AfPsGKvo81T+58eFaL/kfwmbZ+jc2bEZTC/B/fJ9OCwIVL3d0uTsb+1
 /g64V2YyWY1MYpHnwyr6UYLUx2Qt68tqUa9yj/5SirENKyq1jmkWysLOS6HrM7df
 No5LbEWEZsax5CBhwg95Q2911BPQk8LqX6pnVKTESI2ZTaF7Bd3733gwpOnTwx6B
 eW5iHNpmIoMVftAuHVh1a8PzlMfWEGf8BvBdujcjwps4ug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3r7wb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:26:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e8984d8833so296016571cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 14:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761686794; x=1762291594;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vb6dVEBF1GsrTqvUi/V9O4OegNy8kFowkn6bq/8s4Qw=;
 b=cGpVh3Qfr0uqsNAEAgIv0NGZAzATOLjYQqPvUXojVWHwqzGo/x/6HYt4vOD347e59L
 ndqEL2LucsRv6ey+CdOIv1+Wn4mMY0ZGqcPJbVAIfp7ggUAw+FiouX3zL/qkLs5M7/WK
 VERmaZyyQ+5YWBikixlCKPWx7GOPvUP0r5oso0f7PAlc4k0ndR9dHwbXLNHAu45HDdav
 O21Rcvm5B6h8p7p27LfFRU0GAQ4clF5sbFUu8h13GJMbKuRoddEBxlGgwxOVeJY8dvqv
 VGQ97uvsy45JtjOWCgnZSLTha+d4izq8Xin2lVDWYZKtZ3rZE9zQLt212fblxjN9KT2x
 oxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761686794; x=1762291594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vb6dVEBF1GsrTqvUi/V9O4OegNy8kFowkn6bq/8s4Qw=;
 b=cn4Z0fOJae9CyIw9LZAadirt376S5IpQD1GeXqZN3Ybew5aexH4vvE0utyIf8LWinI
 hY864br8OeLZMlzAdIgI91Cna7AmOgYF4GuTuoJ+l+hl/AzC5frFwObLPejAnfOuPSNK
 /mdL+Vurt/ibYNsFmZ4YsOPLsSrse8W4ciw2fkNODTYhL6ZqfVUxYAAfVMncJ69tv4+V
 48zAuAUgmnXzJwdpnvau7aDh1eHa9nJFJ3I4q8+AgnHpNUW/SaqkMrDdUHwG1jV1m4Hj
 R0b/ZKPQi8bCKIFUC8wLxjNgKG3zQRR9JAqh7oFkh5wTd89meGOjXFLraFz/i8aDYQqY
 haEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUspcj3Rd1WdsX4pjN7gwI519JGKw5z0ruCyxRQurvGaKnSMLhcQAX4+E9DPNwsyLGxfvJn2XEbWw0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2OCtlwRPWBKb8BoAGPWGinz/pwIrHZqPfXUOgdnXYWoJo5d30
 mYV+4PpQ9qdIQfYHmCmS3NSUcohKEH+MsLb5uw/V/rhQImPprOPC2wpqrcgVYuhlhf8AxSKTeuw
 DnhBvLkQ/8HRPfA5aMtLASJO+xb45pDry2xx1LeUJs6J0pU0BJ9y0aa8qVfCufjexxI004yA=
X-Gm-Gg: ASbGncskX5Php3Fep3vZcnqrlWOI6fg4QZ5RrJ9ewSG7JLpAU/8jc0r8wVq8JbVFNkw
 ueV5Gj8Hy4B5K7CMJlwAFHuliCckSV2XmY9T5u+YF6N/ZQpruZ1fVs9MRSawjg6meF0k91pEQXv
 eKslqHajzqQ/1c/1MreVPPLIc5A0WiiLyFqWNoxxOtUtgA1mybH/jv/h7NLYy3k1IcRM1fvDy8e
 5irXmj3RvLoMY0M6a3WTs5YUU1eVBGEwKAnmGvDUYk55G2g2WecRPv574Av2DqkkVyQVpuqGnbg
 XIpapT3Cz2SMB2iXeiOF+rUPPWbz/nMkubruoyh0MQzR/tHlcU45oR9wxHFhAPwbse1NFlNL53T
 ROEU1AXv5Vyak4SbeN7jmQVdw/VcZG7CDJMwp3HWdGvQOP15RZcGL/r5Df2cqNCcEnJRf64ypl/
 wpIZadGcffkYJl
X-Received: by 2002:a05:622a:1105:b0:4eb:7807:1816 with SMTP id
 d75a77b69052e-4ed15b5ab08mr9646181cf.35.1761686794431; 
 Tue, 28 Oct 2025 14:26:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoc7W3OAdXR6z0ZRmTUyu9evmiDq4dbWddJKVeKeXcDDjGijRuSjVD978ICY7up4qhMEzYew==
X-Received: by 2002:a05:622a:1105:b0:4eb:7807:1816 with SMTP id
 d75a77b69052e-4ed15b5ab08mr9645881cf.35.1761686794002; 
 Tue, 28 Oct 2025 14:26:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f864aasm3284263e87.109.2025.10.28.14.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:26:33 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:26:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] drm/msm/dpu: Require linear modifier for writeback
 framebuffers
Message-ID: <6qev23tgzl3b2nkxgxgjkgd5tjljop37zhfm64unla46angtek@2fychx75wsqy>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-5-40ce5993eeb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-5-40ce5993eeb6@gmail.com>
X-Proofpoint-ORIG-GUID: QhZvOuJ5Tc1JkScjv6oqqDqb9gPjEYxJ
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=6901350b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=AghEqMNuFSJYpPmXAAYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfX4VcOfmvxnOp/
 OMeAvAjBwvUlS/bekZCr8/MTrUZn/JWb8lVi8ifpT3LefsRWMW90yrHt6bJxa+JmxmZuizHfEZU
 prpu+5YaxBgHh9AEq/hpcqxFe2vfjrM0K2hLtu1ON9HBc+OCp2JWC/NtQUzk/ujk446UQHjJwgf
 rTp4cWnoiaIuXHYOSRi+ZQJLgGbd72X5um/dV1W6FZQ4EB11ntGJaS4YTO/Q4zzWf3BRHI8YS2s
 LjNsz1fpIc3m5YOrPjkh/ZFL2JlRlNgYRUPSjBpMyEWy/eEacx5Bh2Q2SNKAQjNAhXPviHDeqsy
 jx1BEhNT5f3auhMeCz42Z8IMseW3knDsb+x2k/VOqNTMGf2JLWoLOCc6t0Y2W9iJ97uPvo2PTLg
 tQDx7GgYR0ULwiX5FS/gSBQVnuFSxg==
X-Proofpoint-GUID: QhZvOuJ5Tc1JkScjv6oqqDqb9gPjEYxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280180
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

On Fri, Oct 17, 2025 at 07:58:39PM +0000, Vladimir Lypak wrote:
> UBWC-related register configuration for writeback is not implemented in
> the driver yet but there aren't any checks for non-linear modifiers in
> atomic_check. Thus when compressed framebuffer is attached to writeback
> connector it will be filled with linear image data. This patch forbids
> non-linear modifiers for writeback framebuffers until UBWC support for
> writeback is properly implemented.
> 
> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

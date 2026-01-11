Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29816D0E094
	for <lists+freedreno@lfdr.de>; Sun, 11 Jan 2026 03:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0390989E47;
	Sun, 11 Jan 2026 02:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYpJW09A";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCd41F9t";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF434895CA
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 02:17:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60ALtOr42566966
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 02:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qLoao6kS2SqJEVQ2hvvi+uaT
 Ze5ArxvcEk7/jP14InM=; b=ZYpJW09Ao/OvSGFe4c93Mkqb34mydm0Cmim9QU+m
 pq2jkDJmcqeaiKk5n09hXAK1o46PQ1tNXnX1D+uB0LlGr9y0JRawMUc5A8zgJ930
 Fs0kf2WuqELAS7kxSlZElpgs1XOohIKOKvxsXNti4It41Zuo988alyYuii9pYHO5
 vnIAAIeMFOkSDHobM3c8dvDtx1YKMwIgawu+JPqSqarOaHqwlr7EyDMzRQGOrRTY
 Vkqt8TFvJJNfh3DGq4FAeth3/iYaQoBg3q2dm8kd+hcgCHwLBJUozyWkPLrsl4Jn
 vnjOKrCIs7KePzCMOZqK5vzF4HuaLzgbXl51vOHEhfCLJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfsg6q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 02:17:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-890805821c0so157445926d6.3
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 18:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768097844; x=1768702644;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qLoao6kS2SqJEVQ2hvvi+uaTZe5ArxvcEk7/jP14InM=;
 b=hCd41F9toMcgoHxWYFLF0YUbkdPFrHgJqw159FCMwX6f1nfLFVtRwXkAf54V54tZ79
 vHQilKu7lr6RQCUmUNrSw85X83CyZYM0A7crre4yiVWwdKEwiTYI3ST+y32wQbjbzbnG
 5jkwK+oZlzXIYdJkmy3BRwX+bFRdpaCTKsrh7ZLawB4RSGjwRastz4BSIHRID8gNAPYf
 nly0JAvafFt6SgmRDZcSiIfZ0Q9gHH8HrFYeWdGRJUNJHJXyRtp0KVYo3N7kzrfqYGtC
 u98jAF2/PMGeOBwVAbqrOC/SJgneV7+iwFdf+FMX0o0Rcd3tICX4yDyCENyO3dDAhagD
 nihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768097844; x=1768702644;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qLoao6kS2SqJEVQ2hvvi+uaTZe5ArxvcEk7/jP14InM=;
 b=pGMf5zt/QMP/h3axp0MdEF+D3K+gMACjue2rhkK4+NQh74fFzr0iEmp9+TFIO2zaOP
 zkPI4ilm1a164hVJjNQ4FD38qHTOX3f9zORh81OhIWdtNn24TdX1uhO0ZR5lh5n0ncPY
 6WeJmo3vTkKgV8sw1Elt7lEyGgv1fZxN7030d5SWuU8MszA9DAGYSDKad7N8xShZlzpI
 O39V2citVLK0R1AqwuWKw7dXvAlZJZiCtRA2NrpUi73SywEZSjqWsozYbFhpkpoIwiK8
 b0IAFR72UjSplyfGBYuIILvgAZSxlGKJSuNJU9Rc8k5DqAtVK1Ttgf1sSNDQdmpcSOhj
 q7VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnr7YQUyAZC12Usq153v8SZklvA21VPwG4QfxY+Vid397MWW/LA8QMUqVusqQYqAPpQia58SSv3Q8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5z9HtCWJdRQmJEdzMfF1c/su9M/GTVhoJvUbRhTd70aJAU5Pz
 vlpDvb8f2FDkZdKuTReDlFd63D16kXvNDzmh0suqXEtob4brEG54f9JjEmP4EdGab/jKcrz+4aY
 GJkLbfZpbPigzKVJ3/yhpomoYd1HoovU1nvpgiiOAQtxIjbCPwPMfg4HI0suvvmV18HXUbps=
X-Gm-Gg: AY/fxX4S5axlxp9QikZVVX5axH+oe5vocggpIlV8TGvHhNnE3OaLF986sfOoy/2sQbY
 Do0uIsFQ8TOq7gsLEiBa+NGxJXMithgeEoBcJQtgbQEWaj/C3eBJ2iaaUlcxNvQ79w7FZt1m4y1
 21h+MGUsEF07pw8waTD+IxHKgfq3LUAPQ/HHv0n1RkuCePLpt5/LpjHP8jc6jkHgrevz3SohQfC
 ccyf9pMvhOAP2yecb4gI2Wy7AHXImLg3F7CFY6nsWjx7LiQElk77cwfsMl9rDu+2DEj1gxA2czY
 +YVid+MUrdp33Wr3iNARnfhsFAqnimsfZmarnkqMgQvtbtdVsLEUNcw1LC61jI9SqAQMdZvZq0C
 a8crsmk1oruTiLgtBJ5e6u+NXSeJnyARC/AKj7x/hioaH5qha3Ec3bHHd7/ERYJ4YskkuWhDycM
 y06XwGPJiSa1qUCU7gJbSxVYg=
X-Received: by 2002:a05:6214:234b:b0:88a:34dc:9933 with SMTP id
 6a1803df08f44-890842aafeemr218054976d6.56.1768097844359; 
 Sat, 10 Jan 2026 18:17:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqQA5LZXpRDzF7mZkW5SnWzW2XokQ4Pumny/S0ypla4mR+vkow1xMAbJvOV3UwuvqWPLqhGw==
X-Received: by 2002:a05:6214:234b:b0:88a:34dc:9933 with SMTP id
 6a1803df08f44-890842aafeemr218054676d6.56.1768097843881; 
 Sat, 10 Jan 2026 18:17:23 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b71b7eb22sm2756548e87.41.2026.01.10.18.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 18:17:22 -0800 (PST)
Date: Sun, 11 Jan 2026 04:17:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm: Fix GMEM_BASE for gen8
Message-ID: <iwmyig2v6lk47gnbimut2qkmp3swscqjxpj2h472q2tqtes5sj@hwlajed33h2t>
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
 <20260109153730.130462-3-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109153730.130462-3-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lvb4i3FrCsg5la8FCxk9hA6PAjKKWWpA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDAxOCBTYWx0ZWRfX6nX0OBHCSiB3
 XTzMrF+jbkxigsMwPGpMaKrQXXb8W32Z7IGvuwSbsqE+1aS+rNLSwrVCODL8W3iRL+rXsFEje9S
 0UAL5hmDhqQmp2YvwRG2IaRqCD4sS87WtI7Jwcmei/MVcVcAuTuwS5eM3ncYf+42K/FAUjHhRtx
 D1zbANhX6iisKDCDMSvIi1b7B70O5Uw/YE9386DGwoOLsaDLQTxkZfF5mYci5hNsyyH56VcMq49
 26CHwLcBmnLum5CD2ODZLOat4/Gaiwjo+EwFBOOCZllVosdt8Ankzpqw4oKDw7JpJRqjW0ZQ0CW
 cWiK6SX0Bgz8LFASfgnTH3ydrwKNt64rZpe04qVRMRIx7HQ4XpVaWqkaXMlozUz1ynXU7ZNIu+P
 rAfhE7IUMnhWJMuxPfpxJv5W7JhqNfDXR0UnamGax1HNpBg6bOjEurklXt4rYftflnOwOP563kR
 cpxBjF7afc5mGMIf7SQ==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=69630835 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7AxDZKSYRuUxSVEY4VYA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: lvb4i3FrCsg5la8FCxk9hA6PAjKKWWpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110018
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

On Fri, Jan 09, 2026 at 07:37:29AM -0800, Rob Clark wrote:
> This should also be zero for gen8.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 1c80909e63ca..d5fe6f6f0dec 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -376,8 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>  		*value = adreno_gpu->info->gmem;
>  		return 0;
>  	case MSM_PARAM_GMEM_BASE:
> -		if (adreno_is_a650_family(adreno_gpu) ||
> -		    adreno_is_a740_family(adreno_gpu))
> +		if (adreno_gpu->info->family >= ADRENO_6XX_GEN4)

What about a7xx gen1? should it also be 0?

>  			*value = 0;
>  		else
>  			*value = 0x100000;
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry

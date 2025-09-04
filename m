Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7F3B448A0
	for <lists+freedreno@lfdr.de>; Thu,  4 Sep 2025 23:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8FC10EAEA;
	Thu,  4 Sep 2025 21:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdqixAeo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3BB10EAEA
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 21:35:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IJDbN013622
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 21:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1XSGHjK5H5x+hvh6MnHParrtMNDsdad7xw0PkjMbZ+g=; b=mdqixAeoCJkWbooj
 iV81lDSVcjKJFNLnue60LYvsuNufsVhkyrkaHuZjCQ6xdYNP0O0KXjdv9VSrg0/Y
 2U46AT+05RG7V4DeTZRgeoss2aKXORmiJ4Apy79wl7F1DhF1jUfQLRjU5aiN8+EY
 8iOhu7ngq99teEifZeWsPCbYCe/Ow7tt710HQu6FDbfMfV6htbPCgfNXasAwRtYZ
 OEa4srooUnaggtqJ+z6gYfZHNtB7slNFqhoA2PL2fVx5SYXD6fniBIyhfbIesPX+
 SYYWl3K4zlwSwj0RUJWjJzlu6Q8biP0dNmLR2tUn4FF1+45ELwPLftvheg1mu9Od
 /9Nlsg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wycw10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 21:35:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24ce3e62946so9045255ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 14:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757021715; x=1757626515;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1XSGHjK5H5x+hvh6MnHParrtMNDsdad7xw0PkjMbZ+g=;
 b=GqwMYuPdVDouwl71VxBiyzrNakVdoj3rtyL5p93vLg00sHU43A7bkXsNOHB3irPD6P
 nzokBaUhqdYh+4EuFYN4zOZzE344irBOezwCX2RMzWn9TOb7fEzc8pck387cybIg1rSZ
 /XNhnAYgMtXEKc0Hdu3+HX4iVZWFFjvKnl1tOQ6BvohuimPtWkfeTyokslwoD3KW/bWW
 zALBO1wjcVJp7Q7L3odRUxoXKEJOm6JUFCM497lEBJnGXjI7OXAYBiaS+CCpPGQdv5ph
 8id42yESU9gc7F7yfMqAiemte4KTkKBZ4rLQjNiSkYURnE+JTnckRjpYkochYWBMETRh
 nsPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViLVBGPZU9DJwWDbg4OLVsWOr8rqh0XA46gk4dBfUCm2M+3B1ajhgdVrwXRHF36OzTwnCXftUxyrQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyr7h1heFKLVFmg8qH3yrw0QpMFP+A/W09hodUw0+pH7gRHK3Pt
 l7nsat4SkPUNqtWxSEX2lfPVOG0nz2uax9vVKdyyW1/DAqXlUrmXDDhos7qGvySHrrnd6dEP5Qi
 iwYbI0583U7OCESqO/7B19zrogPn4N/eBTNvzZONxT38mWW75RsbXCQ/Kt8qei6oTelNgogVHMt
 bdzBc=
X-Gm-Gg: ASbGncs7lFkkYsMPAqFM4GFTgKa8VIKNJ0G+kJHLQU3z9GZkq/phT0XdsS1mLFWdeWT
 S3oX+e7+20Jl1VqZAm8G8Zu7cj7VU/BiWHV9FsZfnuzbwwbSUkMnweYgN+5yxBLl3kAG+3FsZiQ
 5agmGCFB17L1eTdp+ixa66LNdzaVQMHHl1le3vvmyUjHYTpOAj1DZUVulFrT/hQ02d2jEFCPKxq
 0ZlvuNX1ZcrNlc44oJ33mbA8eZmcdH2YbeZ7IGDYy3i2GIlX50jBIB/4q4REyq283xbb3kjP9ZK
 iVPJmhtQ1+YAI52xaNL8XrkSoGFY6/BaYJ6g8UamCtJMsp7XyuuvuieabearEoO4td4f5E6Jote
 gO+VdaPGdiBNGHUxUVt3Qvw==
X-Received: by 2002:a17:903:2383:b0:246:570:2d9a with SMTP id
 d9443c01a7336-24944b1fc6emr283192235ad.59.1757021714792; 
 Thu, 04 Sep 2025 14:35:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp3igpntYcHLO4XqweUiLyIuxXfhO1KED/bu92vbMqGflTJz2eGcJkzb2pbmcEUuUIo7WMCQ==
X-Received: by 2002:a17:903:2383:b0:246:570:2d9a with SMTP id
 d9443c01a7336-24944b1fc6emr283191985ad.59.1757021714309; 
 Thu, 04 Sep 2025 14:35:14 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24ccd76e157sm22652365ad.107.2025.09.04.14.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 14:35:13 -0700 (PDT)
Message-ID: <c80e6933-8985-4da4-8498-66cedaa87b1f@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:35:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] drm/msm/disp: set num_planes and fetch_mode in
 INTERLEAVED_RGB_FMT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
 <20250705-dpu-formats-v1-2-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-2-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68ba061b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2YQhiLfsl84BKudLmi8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: QHU7Zav_b1b3FNLcywHCD04abWvp0-zR
X-Proofpoint-ORIG-GUID: QHU7Zav_b1b3FNLcywHCD04abWvp0-zR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX8cxKx5o7ZBz6
 zoG4mpnuYP6Ro81NtwKo7Y5RVh6Jz6OdNQsj1tyWhn2bTg8na+Ewe8thSHEst5hyFGdWHGpYy6M
 xATduyvRSfTFd4byY7zJoWpquC83kgm1TFtpjdkzcTOeuj7UhhX+9F2QvjeZFVoe6Njy2pqU9BF
 7gEHDDZECdTKMJXXpNLVOBMr428HbN4XKXicLVbhD4p5QBS67/yMXoePTmRz6GVM9CsDFvOjUy+
 gQL8/Rmt/jFGpwL626RAuJLKGdVDgaEGh3T6bd86MUXmy2xUuJVj37m6Y905QhCxXj7Nrjt31k2
 nYQNvDIOMc53LAyJldZocLlxnjvMTQXec0os2YE/SjeWWDg+4Rwn5FZet611rv3NUykl2som16p
 n5TElJy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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



On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> All interleaved RGB formats use only 1 plane and MDP_FETCH_LINEAR.
> Specify num_planes and fetch_mode directly in the macro and remove
> unused parameters.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 114 ++++++++++++----------------------
>   1 file changed, 39 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index eebedb1a2636e76996cf82847b7d391cb67b0941..26be35572fd2ee7456401aa525cc36025bc52ee4 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -67,7 +67,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   #define MDP_TILE_HEIGHT_NV12	8
>   
>   #define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
> -bp, flg, fm, np)                                                          \
> +bp, flg)                                                                  \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> @@ -80,9 +80,9 @@ bp, flg, fm, np)                                                          \
>   	.chroma_sample = CHROMA_FULL,                                     \
>   	.unpack_count = uc,                                               \
>   	.bpp = bp,                                                        \
> -	.fetch_mode = fm,                                                 \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
>   	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> -	.num_planes = np,                                                 \
> +	.num_planes = 1,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> @@ -228,218 +228,182 @@ static const struct msm_format mdp_formats[] = {
>   	INTERLEAVED_RGB_FMT(ARGB8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(ABGR8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(XBGR8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBA8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRA8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRX8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(XRGB8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBX8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGB888,
>   		0, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
> -		false, 3, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 3, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGR888,
>   		0, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> -		false, 3, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 3, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGB565,
>   		0, BPC5, BPC6, BPC5,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGR565,
>   		0, BPC5, BPC6, BPC5,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(ARGB1555,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(ABGR1555,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBA5551,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRA5551,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(XRGB1555,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(XBGR1555,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBX5551,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRX5551,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(ARGB4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(ABGR4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBA4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRA4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(XRGB4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(XBGR4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBX4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRX4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRA1010102,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(RGBA1010102,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(ABGR2101010,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(ARGB2101010,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(XRGB2101010,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(BGRX1010102,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(XBGR2101010,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(RGBX1010102,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, MSM_FORMAT_FLAG_DX),
>   
>   	/* --- RGB formats above / YUV formats below this line --- */
>   
> 


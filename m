Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035CBB44A2E
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 01:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2FB10EAF8;
	Thu,  4 Sep 2025 23:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sggjo2rn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58B910EAFA
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 23:07:08 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584HsaVm031741
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 23:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VQxgtvqlq0HzxRDkP5I5PrVUOxES5Rbtim81FxX4br8=; b=Sggjo2rnmTJNkjGq
 S46CyRNFro+vFR8zL2uwM4EP7SArfGwrsatiZ+jzKxuktCM/uN2TgeAR6JIfzCbn
 dACUqifR102jbX+Udb6eoSWuOT0K+GCiE5ZA/jvrtvC7B//z7hWyy838KV+TzwwR
 IXW1TYw1ZlhnACSRS26O6G1vV21IUCFZ8pf+NJEA6dou/uZ5kHQzPOUJEuDFvVO4
 KtQ83P8eZ0UpEWixZPB0hhmcF13o5FSZjxIdFHG8wQeYU5w+YaoN9Or/X1ZO76rY
 2pnM5V1LvQuLh0hkQwuLZ0faqxoo8E1rrcM03dT9RwetUKNQbRTnz/mYWAAKw+M/
 5M4IMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw09761-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 23:07:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24456ebed7bso22853185ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 16:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757027227; x=1757632027;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VQxgtvqlq0HzxRDkP5I5PrVUOxES5Rbtim81FxX4br8=;
 b=uarH+3nZrAIKrK/ejLmbsJm8pCJgF2K828T+t+tdJV6oMp9DANS+/Inuwb7aNqIZqI
 Zu136Y43EWWn+L6sXpD5FDQUzbcPcXgUGyaQpbG6AAStFGVoDB9SeXmvPdrGjQxLhz2k
 CerCNKRmKb4EmfVsUCATVydZEsUex+aqx6N/s+IpRPOqxllh+OopuX2jBHbkMYybbpjF
 vXDQOoVgAQui9tuvfk7vAR697w9bKBjKdKNWWi3xuIC1zXJYX6+Q93LVnmuOZL6/GZ0w
 W97ZCal98BnSL4MjyoCDlia6sH6r/49V3chhOhE4ljO/ny+NBaeyfAj9UV9cjaGmdsYw
 AdXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOPaOeQzp6Ziz5tsLFPm4lwQNNvpBezhyyi8JvIDiQaS2Qw/AEJmlXJAA5GlkggmD1zKmCEnL+a44=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS2/bCv35aRtdnFTmrXp0f11WnOy7EfKzE24FS760NX7j4Pq3K
 EV6CE7abizBuJA/uaT+oIv11XTdvYBVrg2MOzbAV3fWB8RmwQ4KoKKhgLmwqVo6CCwRWG4bidLc
 C1034bc17FlyhITXmK3xQ+S+URoafn/m+Xzd+fZCwOZle4cF4apYpTsTHQR7/iNYuYmwhU/U=
X-Gm-Gg: ASbGnctMYR+dGzD75d4Zt3BentAB/M77ENNx3Fj40SfGyxf1pR1EeMXo5ZiQpl0JQt3
 ytxN7xK825DnVBfJeqYI34G3IMVCJGz24pTLgVRVTsqRuCLGL7wdHfZ6+zo2/2qxiiCfas0muWW
 oag0hoPp4UmKJeinHSDTqgXMEy0Pag91Uk+xe8DzC3vUW+ZDEf/fX1e8Qjxj9N5NWt985zen/m9
 yVasfsDZPTwuFB+Al99gSPUUKiELxrJcI53pcgfJMbiGXmtLphhBF2kVYA8pYgzXMYCKCdLOutY
 5bzewM1nCPP8OvvQDh9MqqBFgpJRuKXIsqqFHwMntYQLoWpJyPVwKr7tBpOeGzTsdAnaOF5/BTh
 lVzlk3eVgw2SjoQWh4126Kw==
X-Received: by 2002:a17:903:244f:b0:246:cf6a:f010 with SMTP id
 d9443c01a7336-24cedfa9098mr16776675ad.13.1757027226467; 
 Thu, 04 Sep 2025 16:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3a9adXc+OPNFqInEjRcz8beQaf9/kI61UkTE5l3c0GN008HPPd0XCUECzEsnDCx8AkRCd9A==
X-Received: by 2002:a17:903:244f:b0:246:cf6a:f010 with SMTP id
 d9443c01a7336-24cedfa9098mr16776305ad.13.1757027225874; 
 Thu, 04 Sep 2025 16:07:05 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24cb28c3110sm38258035ad.120.2025.09.04.16.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 16:07:05 -0700 (PDT)
Message-ID: <1865e8a7-9d9d-4671-8429-bff121ab6ac4@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:07:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] drm/msm/disp: pull in common YUV format parameters
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
 <20250705-dpu-formats-v1-6-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-6-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uE77VL5xQObwFG-9EndQIcuSiFWahsjz
X-Proofpoint-ORIG-GUID: uE77VL5xQObwFG-9EndQIcuSiFWahsjz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX+P7YDps5ljnd
 FsivI/Jw8biLm0sBAK7udqB1F0q6ORXKREsLv+JCRGtXarX98rt/VwcBUe81h7sOzUwL3Xr/L2d
 TYCrEB/z5+RN8Zad2EWFldcbDK4yxXaHkLA8AHUKdryMxuXr0oa02FfqzgCyxFqUQCgvHUNdVdO
 M0QQjGjiEwO1wPe7DRNfcUYaFJ16c5D6vA3FRFCLnFiQxLFPjbAzb/JfAjR0gMe4wkPMEN5MD7X
 aMqOQFHw3dSzEfBPolHeYCeBBEAtIWnnXFTkLIjHycFukaLTRXzvD5q22XmhtzIlvufOw1ZRQMA
 pc8mlLjHKMrgXWP+DveP2EMi7wk/GIlqbCSCnE5Am8g9GXFvD4VbKT1g3zU2R2r5Ho/4buKTErR
 H6tYwFMG
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68ba1b9b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NxCvQ7sPRDO8UjZhUV8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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
> Pull common params of YUV formats into corresponding macro definitions,
> simplifying format table.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 120 ++++++++++++++++------------------
>   1 file changed, 56 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index d577b3d53fbebced63792b5c65f50dd45211c8ea..900b2de252a6eb2eac3d0670f1aaa77f7520fd77 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -244,27 +244,27 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
>   }
>   
> -#define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
> -alpha, chroma, count, bp, flg, fm, np)                                    \
> +#define INTERLEAVED_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, e3, chroma)     \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> -	.alpha_enable = alpha,                                            \
> +	.alpha_enable = false,                                            \
>   	.element = { (e0), (e1), (e2), (e3)},                             \
>   	.bpc_g_y = g,                                                     \
>   	.bpc_b_cb = b,                                                    \
>   	.bpc_r_cr = r,                                                    \
> -	.bpc_a = a,                                                       \
> +	.bpc_a = 0,                                                       \
>   	.chroma_sample = chroma,                                          \
> -	.unpack_count = count,                                            \
> +	.unpack_count = 4,                                                \
>   	.bpp = bp,                                                        \
> -	.fetch_mode = fm,                                                 \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> -	.num_planes = np,                                                 \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_YUV,                                     \
> +	.num_planes = 1,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> -#define PSEUDO_YUV_FMT(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)      \
> +#define PSEUDO_YUV_FMT(fmt, r, g, b, e0, e1, chroma)                      \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
> @@ -273,13 +273,14 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
>   	.bpc_g_y = g,                                                     \
>   	.bpc_b_cb = b,                                                    \
>   	.bpc_r_cr = r,                                                    \
> -	.bpc_a = a,                                                       \
> +	.bpc_a = 0,                                                       \
>   	.chroma_sample = chroma,                                          \
>   	.unpack_count = 2,                                                \
>   	.bpp = 2,                                                         \
> -	.fetch_mode = fm,                                                 \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> -	.num_planes = np,                                                 \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_YUV,                                     \
> +	.num_planes = 2,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> @@ -303,7 +304,7 @@ flg, fm, np, th)                                                          \
>   	.tile_height = th                                                 \
>   }
>   
> -#define PSEUDO_YUV_FMT_LOOSE(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)\
> +#define PSEUDO_YUV_FMT_LOOSE(fmt, r, g, b, e0, e1, chroma)                \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
> @@ -312,13 +313,15 @@ flg, fm, np, th)                                                          \
>   	.bpc_g_y = g,                                                     \
>   	.bpc_b_cb = b,                                                    \
>   	.bpc_r_cr = r,                                                    \
> -	.bpc_a = a,                                                       \
> +	.bpc_a = 0,                                                       \
>   	.chroma_sample = chroma,                                          \
>   	.unpack_count = 2,                                                \
>   	.bpp = 2,                                                         \
> -	.fetch_mode = fm,                                                 \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
> -	.num_planes = np,                                                 \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB |                       \
> +		 MSM_FORMAT_FLAG_DX |                                     \
> +		 MSM_FORMAT_FLAG_YUV,                                     \
> +	.num_planes = 2,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> @@ -342,23 +345,23 @@ flg, fm, np, th)                                                          \
>   	.tile_height = th                                                 \
>   }
>   
> -#define PLANAR_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, alpha, chroma, bp,    \
> -flg, fm, np)                                                      \
> +#define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_PLANAR,                                   \
> -	.alpha_enable = alpha,                                            \
> +	.alpha_enable = false,                                            \
>   	.element = { (e0), (e1), (e2), 0 },                               \
>   	.bpc_g_y = g,                                                     \
>   	.bpc_b_cb = b,                                                    \
>   	.bpc_r_cr = r,                                                    \
> -	.bpc_a = a,                                                       \
> +	.bpc_a = 0,                                                       \
>   	.chroma_sample = chroma,                                          \
>   	.unpack_count = 1,                                                \
>   	.bpp = bp,                                                        \
> -	.fetch_mode = fm,                                                 \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> -	.num_planes = np,                                                 \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_YUV,                                     \
> +	.num_planes = 3,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> @@ -511,72 +514,61 @@ static const struct msm_format mdp_formats[] = {
>   
>   	/* 2 plane YUV */
>   	PSEUDO_YUV_FMT(NV12,
> -		0, BPC8, BPC8, BPC8,
> +		BPC8, BPC8, BPC8,
>   		C1_B_Cb, C2_R_Cr,
> -		CHROMA_420, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		CHROMA_420),
>   
>   	PSEUDO_YUV_FMT(NV21,
> -		0, BPC8, BPC8, BPC8,
> +		BPC8, BPC8, BPC8,
>   		C2_R_Cr, C1_B_Cb,
> -		CHROMA_420, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		CHROMA_420),
>   
>   	PSEUDO_YUV_FMT(NV16,
> -		0, BPC8, BPC8, BPC8,
> +		BPC8, BPC8, BPC8,
>   		C1_B_Cb, C2_R_Cr,
> -		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		CHROMA_H2V1),
>   
>   	PSEUDO_YUV_FMT(NV61,
> -		0, BPC8, BPC8, BPC8,
> +		BPC8, BPC8, BPC8,
>   		C2_R_Cr, C1_B_Cb,
> -		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		CHROMA_H2V1),
>   
>   	PSEUDO_YUV_FMT_LOOSE(P010,
> -		0, BPC8, BPC8, BPC8,
> +		BPC8, BPC8, BPC8,
>   		C1_B_Cb, C2_R_Cr,
> -		CHROMA_420, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		CHROMA_420),
>   
>   	/* 1 plane YUV */
> -	INTERLEAVED_YUV_FMT(VYUY,
> -		0, BPC8, BPC8, BPC8,
> +	INTERLEAVED_YUV_FMT(VYUY, 2,
> +		BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
> -		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 1),
> +		CHROMA_H2V1),
>   
> -	INTERLEAVED_YUV_FMT(UYVY,
> -		0, BPC8, BPC8, BPC8,
> +	INTERLEAVED_YUV_FMT(UYVY, 2,
> +		BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
> -		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 1),
> +		CHROMA_H2V1),
>   
> -	INTERLEAVED_YUV_FMT(YUYV,
> -		0, BPC8, BPC8, BPC8,
> +	INTERLEAVED_YUV_FMT(YUYV, 2,
> +		BPC8, BPC8, BPC8,
>   		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
> -		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 1),
> +		CHROMA_H2V1),
>   
> -	INTERLEAVED_YUV_FMT(YVYU,
> -		0, BPC8, BPC8, BPC8,
> +	INTERLEAVED_YUV_FMT(YVYU, 2,
> +		BPC8, BPC8, BPC8,
>   		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
> -		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 1),
> +		CHROMA_H2V1),
>   
>   	/* 3 plane YUV */
> -	PLANAR_YUV_FMT(YUV420,
> -		0, BPC8, BPC8, BPC8,
> +	PLANAR_YUV_FMT(YUV420, 1,
> +		BPC8, BPC8, BPC8,
>   		C2_R_Cr, C1_B_Cb, C0_G_Y,
> -		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 3),
> +		CHROMA_420),
>   
> -	PLANAR_YUV_FMT(YVU420,
> -		0, BPC8, BPC8, BPC8,
> +	PLANAR_YUV_FMT(YVU420, 1,
> +		BPC8, BPC8, BPC8,
>   		C1_B_Cb, C2_R_Cr, C0_G_Y,
> -		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 3),
> +		CHROMA_420),
>   };
>   
>   /*
> 


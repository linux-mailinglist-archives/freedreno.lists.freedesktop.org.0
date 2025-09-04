Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2966EB44A19
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 01:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0043210E286;
	Thu,  4 Sep 2025 23:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndKRIeWU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FC910E286
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 23:04:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584ISb8f022174
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 23:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JTGAHvO3dzWq+EoS5uNJA1yAwMH+0tq3Qa7fTg/qeOs=; b=ndKRIeWUxsKm4r9B
 fkR9Vy4opdUjNOAoEUZCVRmZlDZuAKklzixJtOmrH8fKyqYbXmyPWsPHQTY4SUu8
 MT+ksulpUrWVX40qXOYEKmL8Uw65PveiomSAnElpPjGbMaIfpwYpkEQpNB/6usos
 Z5G7xCR+qq/3q4LOhnUrSWMzF2GX8243GvuRAQaRe+UTYI/JohHQaXBWOw92Fazw
 YyeTL8VcvQnIPFKZoNSd8lAw3mJ3sS475UXikkpgQGiiExFkGvH99JKsOCwrdDMF
 ktZxVHPlcAl96ALRYvdQ78+GwROlQzZlxiCbmFg6dM376m/I/KTwlsk7IMzEqw8T
 u0UWyw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk98ywg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 23:04:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b47156acca5so1281877a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 16:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757027083; x=1757631883;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JTGAHvO3dzWq+EoS5uNJA1yAwMH+0tq3Qa7fTg/qeOs=;
 b=voyhJAsaFNTw/X8OKPqwS7zLpJd1I+moQ2LE8ECUh3PzzxZhUdqxn5E1L7UDoF5h1A
 bGT4t0JttrGZFjz+zbkmKwl/h7XRnSIBIa0UwPgY+5g+XRjuCESOjT5uifFkpl0gCsyL
 VRUZqYye2A43o/ppreEdQwBP5AAgwxLg4VNlPBtrMFFjcfQ32ARZrdHnBDtAC+fcw4OP
 PPm7849nUGnFWpvRIfX2/jvT8t6V5ZNGLBcAObMNapitbtRh9bj2kC1fo2kimfMXnI9b
 oyZD6/ItzMrBuhEDa99S5yzemmVnzzmNeEZeBOoaXQavHHT223yzmgntlM7rEFvDfUS3
 VhSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4LAHfDRXGpSGik7EZLQpzqmZn5ciy+3rEXTcThuB/Pcd3hZQs8XNd9/OA2yqBD1MY8P8PSfZlmwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpwReA73rXWmvtiJ5lM+nEHrupXLTGNudMmV8i/t8hbp2f8IOL
 2sdBis9dUufIHk5UKYnGFatXA9jyrXfPJ5tL0eDz/DY1EQjwRORi9PQ/6wfNGXT6AVi+1Ai9WRG
 CVrEQcGjwt07YatHNjcUr/mfY1NLJXeHXt+wzMpZ2no2rYFiVbYgSYI4gjJCrr8jbfck7x4w=
X-Gm-Gg: ASbGnctQQDekxemyCwC6UOGNUUic9Mwhrbq1vStkMKo6AvnKID24TCEfQ15++9Zdjke
 ktROFyFYvURFQeq64Pqc2dP5bxobBJGRSzgMaPCJpaMqbnIMqeEWcHMizB5jAM2F5PfKH1PCDEE
 4msW3p/h023jJFZ9YqJaMdKuLWkqI5ENagerCo09ZfXIM8YV0amcGsn52QKWBxrmrBrRIntRLpg
 9gTOgMRqXuDqEE/D9F2Kh+Ri5P5Dn/ezUPlG46o4UZMN5rSusrmQ1gcFobsUC2oegq4ENsU8jBx
 FXbqIrj32q9Vo/yY6UGZuUF1kyv7v+CcICnJ4ThxyGNlrsglFou8/9/j7YwM3OoT8lzlkDCuX7g
 SIA/EQw0LPMVDzrLOVGnnlw==
X-Received: by 2002:a05:6a20:2585:b0:24e:3021:dbca with SMTP id
 adf61e73a8af0-24e7cc21f79mr1728588637.4.1757027082865; 
 Thu, 04 Sep 2025 16:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+iA5dJCDJ6EKl6d9KKQ/arjY5Bfhgn5AoMxnI2wmHjrjJTPiDNbZX78JO/uNCpw5DqrwAAA==
X-Received: by 2002:a05:6a20:2585:b0:24e:3021:dbca with SMTP id
 adf61e73a8af0-24e7cc21f79mr1728238637.4.1757027077247; 
 Thu, 04 Sep 2025 16:04:37 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4edf7ed519sm14309145a12.28.2025.09.04.16.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 16:04:36 -0700 (PDT)
Message-ID: <7ac0c9f2-754c-4ba3-bde1-fbde9f3aab33@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:04:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
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
 <20250705-dpu-formats-v1-8-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-8-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yNkdzVtUIG7tlMG4_CvjZ7zQBgVXxRdQ
X-Proofpoint-ORIG-GUID: yNkdzVtUIG7tlMG4_CvjZ7zQBgVXxRdQ
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68ba1b0c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=djW4e6U6kngvZURYzKAA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXwyeNOoh/Am6c
 VPQLvoJDRhucOdEXwP+QdWpq0Oxog2astO8f1USjBGP66vF4AZ6VKf1yZLPKrIDsXCoIS541nzK
 NXS/S5HUy3Tm0x7kdMRONiEFVKI4qKxKkUytI3VhoE1TiKn5JSi6ew5zkVHhySp7YmEJERjSXaX
 RsdnDSzTYdGUgRTH10VGxFEqIyFgng8K2V9FLOgazYw0gZi6YyuQyNoiLpvRWSPa8avQxOq0OLd
 fzWpPxO7CbR44q1WD938WGw825MxgCgtjeVrqRh+WQwfCAZp55LwaG7XkMqyzf7tCimrDNBSpoz
 uMVrF4borPKPZRCsvZnfJbVSdsM7nTMBss+tfj+qzuu5Fe6Ow6OcgkDLbRh4JIkojUNQsywyxz+
 D2HAqv3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042
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
> Drop PSEUDO_YUV_FMT_LOOSE_TILED(), the macro is unused.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 20 --------------------
>   1 file changed, 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 6f5af26d4e2d43414281197bf541e1ea3fe211f5..f949810567d83c5924f9dd127261e7d523921724 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -326,26 +326,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> -#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
> -flg, fm, np, th)                                                          \
> -{                                                                         \
> -	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> -	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
> -	.alpha_enable = 0,                                                \
> -	.element = { (e0), (e1), 0, 0 },                                  \
> -	.bpc_g_y = g,                                                     \
> -	.bpc_b_cb = b,                                                    \
> -	.bpc_r_cr = r,                                                    \
> -	.bpc_a = a,                                                       \
> -	.chroma_sample = chroma,                                          \
> -	.unpack_count = 2,                                                \
> -	.bpp = 2,                                                         \
> -	.fetch_mode = fm,                                                 \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
> -	.num_planes = np,                                                 \
> -	.tile_height = th                                                 \
> -}
> -
>   #define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> 


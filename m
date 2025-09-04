Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4355B44A24
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 01:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D30910E289;
	Thu,  4 Sep 2025 23:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EYqMwgio";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EC910E289
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 23:06:14 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IbH9E024727
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 23:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2BBqhUruX490OCtbVD9cWmg1K80ZzKKNurd2FslWoTo=; b=EYqMwgio38pAPk2q
 hPjE816685J0Aia1yPn4/2c0EtWPBOKhXi9oEP9dNrZlUaL6+WAX3UTxVqh3uRK8
 2K9OnUkVdUo4I4LSGRW8d7yeI8whByjPwnJ1ys01dwJiIX0i2x2vMsBJT+7xWlif
 ciOtZDeeZ3bI0uWaYiZ+6wzTU5r1GHC9eYUGkCk+8EZQyRTP0jEoXLdZ84Hn09PO
 tcCWG9/wigFRL1suR4xyFt7gP3lZ7azJxwFpFjgYL15yIzk6VfZeORQ8j8KZgh9Y
 RywsafUdpPsV3qLNhfRHiTBEuQJT01kvwyPp8LD0RCp0Q3Fuzp3NC51g0OrRZ6rF
 svffMw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fryu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 23:06:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-77250c660d3so1680313b3a.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 16:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757027173; x=1757631973;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2BBqhUruX490OCtbVD9cWmg1K80ZzKKNurd2FslWoTo=;
 b=Fikw8wbX07FNUxafxBtseyw1T3NCMVgEJUDi0QRZEES3vmm2B2rXvT5wDXdRodU2j8
 Nioo8+uDYzl1bFfxEvfA1qwZgnbsoVqiNGhXseft2EF7Km4fvqxTN+hNcPFN+K8LQSWK
 8W7njtyCTxfbFcPMkx4MvN1MRbnsV9LqKmGGQin9YwN5L/cFT2RUYlmrYZgkVhlsyc6Q
 cuMXt/GU3jRhHmgMKTQ1GPrqn7BF9kCYFuS4sV7JmlZws+BoslkKoHJmyPlAmNFE1/pl
 ln9pWpV47bHZmdQS/vqqhrzdNvJoLsORG47QKhc6iWVOZ7iQdpqLvxW1L9EyF/MOE5Kp
 WPaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOqEKEr1y1Owxti+WKMFas12+TcyLGt6WsNf1iYcRttiS6Feo/FYe+L+IE2ANPbD/1gLDmvOHXDAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIUcb2UGFCscbXgCuC6ldsnDzNh+beyYVXOyw0wJxzUPFZWgK+
 qBa6nOPpDj70mRLxJTmR85Jum6yJyR7TsBVKBrN386v/Z8Pk8dqMYCK+Om8TuoNXUnll+pe+23v
 RIItp34eK3XYE+5jjlGyTGMvzp2VFZPQCydw50keBAbtGjHkPkkBZ+WBhc5nh1AlZOsU3gPQ=
X-Gm-Gg: ASbGncuTeTvxFPBKayLJGaevnMTl/cKDqySXMmpRNdATthwUuDF4ngrKdK97mFUlOUN
 7++dRAe//9+F8TUvb4XHP2H5ryPi8NVdG8Jb48pNK8zGJoEH1dhRTMVek2PRYUe8RTzqvrH5Fng
 2UjzI+3OZU5VHYaSLIwsVzSOtwSFM4I63v/v6eB9WRv9ByiK4brMvf81WZ896TALMR9O1vyKZan
 oe8oLxA1gw83jAay/OQIcnp1wX0zqdzIuvO13eJFZmAQV0vgwLsdugBiFekoR4dHcavFsyH2pJg
 KoHVG+md87O6kVyT8YiQR8KDajKpteMJp8fbaX9LxHmZrbLOTcYVX4ZaDrmS+fvULTzvtcIeS+M
 hDa8kOx/1TWIT2SrcGTbEVg==
X-Received: by 2002:a05:6a00:1495:b0:772:3010:82da with SMTP id
 d2e1a72fcca58-7723e309edcmr21931530b3a.19.1757027173310; 
 Thu, 04 Sep 2025 16:06:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqyuEkRevLhX9mmgJs8Y19O8ZIwAo2K9TlXRGtyI3jWl6oukPdrHQZOctJyIPFTdY0p6AcPg==
X-Received: by 2002:a05:6a00:1495:b0:772:3010:82da with SMTP id
 d2e1a72fcca58-7723e309edcmr21931500b3a.19.1757027172803; 
 Thu, 04 Sep 2025 16:06:12 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77241f08a73sm16290542b3a.29.2025.09.04.16.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 16:06:12 -0700 (PDT)
Message-ID: <3cb48245-526c-4907-99e6-e79a31cca88c@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:06:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] drm/msm/disp: simplify RGB{,A,X} formats definitions
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
 <20250705-dpu-formats-v1-4-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-4-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX3rasL2oRgXFT
 1GUucz66oIbiWrlD6Bhh7muzk8HO6FnM1q9NhXONaYPrki7BRA858yx9w0Dg78o11RUTrohiBI8
 U38QovvM89KLHr82duh6nVl+HCVQhrq/ezRD98mQlYQOmGOxk4bbgfHB5QWv8jiTSnzrPh3q673
 qgV2qBWPxh4FTAuL6FJ2yVfnAQzZQkCwllyMt4vfndU0l+uA5Kp28ImG8mw330JL+53vQNP0zvR
 WzclxXSgVPYhjYcHJdEafD6K6gbniMJAJQ7qRgo5+p+bpDhfE4IAXg6vND814xtkNMvMuxJxtFF
 1xWGFnr78GWP7jlpBR1kPGusx1MRNXaJuUpri5gnKLf8JbBtSi3gEGMxIZcwfvsKvShHLxZzxHu
 7GwKWPZX
X-Proofpoint-ORIG-GUID: kTKdL7FFDT_cBeBoWWuklPE0zHv1T9hs
X-Proofpoint-GUID: kTKdL7FFDT_cBeBoWWuklPE0zHv1T9hs
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68ba1b66 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=D8afDwXF6kNTcx-T2tEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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
> Define several additional macros, capturing RGB format classes, in order
> to simplify defining particular RGB* format.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 275 +++++++++++++++++++---------------
>   1 file changed, 158 insertions(+), 117 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 09a5bffd838b8a4fd3c22622e82dcf9fb99b5117..28cef986f2d662484afd47440a79393c48256ff5 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -66,22 +66,99 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   #define MDP_TILE_HEIGHT_UBWC	4
>   #define MDP_TILE_HEIGHT_NV12	8
>   
> -#define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
> -bp, flg)                                                                  \
> +#define INTERLEAVED_RGB_FMT(fmt, bp, r, g, b, e0, e1, e2)                 \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> -	.alpha_enable = alpha,                                            \
> +	.alpha_enable = false,                                            \
> +	.element = { (e0), (e1), (e2), 0 },                               \
> +	.bpc_g_y = g,                                                     \
> +	.bpc_b_cb = b,                                                    \
> +	.bpc_r_cr = r,                                                    \
> +	.bpc_a = 0,                                                       \
> +	.chroma_sample = CHROMA_FULL,                                     \
> +	.unpack_count = 3,                                                \
> +	.bpp = bp,                                                        \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
> +	.num_planes = 1,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
> +}
> +
> +#define INTERLEAVED_RGBA_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)         \
> +{                                                                         \
> +	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> +	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> +	.alpha_enable = true,                                             \
>   	.element = { (e0), (e1), (e2), (e3) },                            \
>   	.bpc_g_y = g,                                                     \
>   	.bpc_b_cb = b,                                                    \
>   	.bpc_r_cr = r,                                                    \
>   	.bpc_a = a,                                                       \
>   	.chroma_sample = CHROMA_FULL,                                     \
> -	.unpack_count = uc,                                               \
> +	.unpack_count = 4,                                                \
>   	.bpp = bp,                                                        \
>   	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
> +	.num_planes = 1,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
> +}
> +
> +#define INTERLEAVED_RGBX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)         \
> +{                                                                         \
> +	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> +	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> +	.alpha_enable = false,                                            \
> +	.element = { (e0), (e1), (e2), (e3) },                            \
> +	.bpc_g_y = g,                                                     \
> +	.bpc_b_cb = b,                                                    \
> +	.bpc_r_cr = r,                                                    \
> +	.bpc_a = a,                                                       \
> +	.chroma_sample = CHROMA_FULL,                                     \
> +	.unpack_count = 4,                                                \
> +	.bpp = bp,                                                        \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
> +	.num_planes = 1,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
> +}
> +
> +#define INTERLEAVED_RGBA_DX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)      \
> +{                                                                         \
> +	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> +	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> +	.alpha_enable = true,                                             \
> +	.element = { (e0), (e1), (e2), (e3) },                            \
> +	.bpc_g_y = g,                                                     \
> +	.bpc_b_cb = b,                                                    \
> +	.bpc_r_cr = r,                                                    \
> +	.bpc_a = a,                                                       \
> +	.chroma_sample = CHROMA_FULL,                                     \
> +	.unpack_count = 4,                                                \
> +	.bpp = bp,                                                        \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_DX,                                      \
> +	.num_planes = 1,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
> +}
> +
> +#define INTERLEAVED_RGBX_DX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)      \
> +{                                                                         \
> +	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> +	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> +	.alpha_enable = false,                                            \
> +	.element = { (e0), (e1), (e2), (e3) },                            \
> +	.bpc_g_y = g,                                                     \
> +	.bpc_b_cb = b,                                                    \
> +	.bpc_r_cr = r,                                                    \
> +	.bpc_a = a,                                                       \
> +	.chroma_sample = CHROMA_FULL,                                     \
> +	.unpack_count = 4,                                                \
> +	.bpp = bp,                                                        \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_DX,                                      \
>   	.num_planes = 1,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
> @@ -225,185 +302,149 @@ flg, fm, np)                                                      \
>   }
>   
>   static const struct msm_format mdp_formats[] = {
> -	INTERLEAVED_RGB_FMT(ARGB8888,
> +	INTERLEAVED_RGBA_FMT(ARGB8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 4, 0),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(ABGR8888,
> +	INTERLEAVED_RGBA_FMT(ABGR8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, 0),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(XBGR8888,
> +	INTERLEAVED_RGBX_FMT(XBGR8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, 0),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBA8888,
> +	INTERLEAVED_RGBA_FMT(RGBA8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 4, 0),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGRA8888,
> +	INTERLEAVED_RGBA_FMT(BGRA8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 4, 0),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(BGRX8888,
> +	INTERLEAVED_RGBX_FMT(BGRX8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 4, 0),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(XRGB8888,
> +	INTERLEAVED_RGBX_FMT(XRGB8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 4, 0),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBX8888,
> +	INTERLEAVED_RGBX_FMT(RGBX8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 4, 0),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(RGB888,
> -		0, BPC8, BPC8, BPC8,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
> -		false, 3, 0),
> +	INTERLEAVED_RGB_FMT(RGB888, 3,
> +		BPC8, BPC8, BPC8,
> +		C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGR888,
> -		0, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> -		false, 3, 0),
> +	INTERLEAVED_RGB_FMT(BGR888, 3,
> +		BPC8, BPC8, BPC8,
> +		C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(RGB565,
> -		0, BPC5, BPC6, BPC5,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
> -		false, 2, 0),
> +	INTERLEAVED_RGB_FMT(RGB565, 2,
> +		BPC5, BPC6, BPC5,
> +		C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGR565,
> -		0, BPC5, BPC6, BPC5,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> -		false, 2, 0),
> +	INTERLEAVED_RGB_FMT(BGR565, 2,
> +		BPC5, BPC6, BPC5,
> +		C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(ARGB1555,
> +	INTERLEAVED_RGBA_FMT(ARGB1555, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 2, 0),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(ABGR1555,
> +	INTERLEAVED_RGBA_FMT(ABGR1555, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 2, 0),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBA5551,
> +	INTERLEAVED_RGBA_FMT(RGBA5551, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 2, 0),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGRA5551,
> +	INTERLEAVED_RGBA_FMT(BGRA5551, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 2, 0),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(XRGB1555,
> +	INTERLEAVED_RGBX_FMT(XRGB1555, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 2, 0),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(XBGR1555,
> +	INTERLEAVED_RGBX_FMT(XBGR1555, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 2, 0),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBX5551,
> +	INTERLEAVED_RGBX_FMT(RGBX5551, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 2, 0),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGRX5551,
> +	INTERLEAVED_RGBX_FMT(BGRX5551, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 2, 0),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(ARGB4444,
> +	INTERLEAVED_RGBA_FMT(ARGB4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 2, 0),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(ABGR4444,
> +	INTERLEAVED_RGBA_FMT(ABGR4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 2, 0),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBA4444,
> +	INTERLEAVED_RGBA_FMT(RGBA4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 2, 0),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGRA4444,
> +	INTERLEAVED_RGBA_FMT(BGRA4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 2, 0),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(XRGB4444,
> +	INTERLEAVED_RGBX_FMT(XRGB4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 2, 0),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(XBGR4444,
> +	INTERLEAVED_RGBX_FMT(XBGR4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 2, 0),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBX4444,
> +	INTERLEAVED_RGBX_FMT(RGBX4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 2, 0),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGRX4444,
> +	INTERLEAVED_RGBX_FMT(BGRX4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 2, 0),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(BGRA1010102,
> +	INTERLEAVED_RGBA_DX_FMT(BGRA1010102, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(RGBA1010102,
> +	INTERLEAVED_RGBA_DX_FMT(RGBA1010102, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(ABGR2101010,
> +	INTERLEAVED_RGBA_DX_FMT(ABGR2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(ARGB2101010,
> +	INTERLEAVED_RGBA_DX_FMT(ARGB2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(XRGB2101010,
> +	INTERLEAVED_RGBX_DX_FMT(XRGB2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(BGRX1010102,
> +	INTERLEAVED_RGBX_DX_FMT(BGRX1010102, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(XBGR2101010,
> +	INTERLEAVED_RGBX_DX_FMT(XBGR2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBX1010102,
> +	INTERLEAVED_RGBX_DX_FMT(RGBX1010102, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
>   	/* --- RGB formats above / YUV formats below this line --- */
>   
> 


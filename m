Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB724B44A5D
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 01:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EAB10E347;
	Thu,  4 Sep 2025 23:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9h/gTcS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F43510E347
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 23:19:41 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584HeMnc013631
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 23:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GjXzmroxVc7W3pRobSL6XDJ/1WKmFcemVZ9/sKNXNgc=; b=A9h/gTcSU2NuNCH2
 f1Tc56bfvcRiCZecECQ/zqj7hAH6fNGp4QD2icBNHfp2+t3ZzVJyPwMRiUiG6XEE
 J+iOCoKfSgMMCe+pYlBPcUBEpmH5VNiOzm6S+TjicLprMP3MLh/in+18l0uY/pwW
 OkjB9Tme+J0hlriHHZdl8tCvpQU/x8jJvperowKG/+hOHWz7AVYkvqG7djqo/Ofc
 lCxanKnv2gJI4JobWYoQqw3v8+xgd3nJdDCxbrxLJxE+3ZH5XM2bQ3IMEE8QChwX
 hFng7MS0y5whtaDVEmzhgfdvjCpSn/6hC+Zpvr4WwESeJXzphEibAqhSX/OeHy1G
 8Cm3MA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyd3kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 23:19:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7725a76dcb4so1881053b3a.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 16:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757027979; x=1757632779;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GjXzmroxVc7W3pRobSL6XDJ/1WKmFcemVZ9/sKNXNgc=;
 b=Kkb3i69mSOCE+kGMbP19TBzpNNwqHQyn5o9QE0z/Ro0tKrTtCH1QWB3Fh2xkJ1VRxj
 2rbnNk34nHWbuIXgI9S12TZdrLiGBJdaUDXnylXGEHfU6Pywnj+kVJ1z7Y31KCrI7qp3
 vUUprGF2ccYspQQpTShuvqvrVb+gX8NwFa6o4SHm/CWJMOSz4ZWBjWxDgScxTO1cHLHh
 ZImwH3747pFNjbccgASdq/4DIcrfb7J1dxNAONhnrLmiujZiYNvPqDmVSboksAIrzbvB
 HyChD6ZfnK1536IiqxdnhdbGdEhDPB5D4QJoM3o7HdcGyAfOAoyIqE2z9OwQZSwYztbm
 d/Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO6Ni/WboRa9V4eValEINzlmRrDCSFQvJ/MY624CGHxbmSCvpGlYZe7A3OvGj1W6A+crxHgs4I32s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoTqcuGrqsBo0WX3VgRWEY2jsxVVDKGAH+pehwhA5csjvOVUNG
 q6fnRfkNbH0SE8jTL65IR7FtWUOCmBf5pW30lVpGeKQW/PTmi9Yao2fXoKvicb7EO66nkX6aBqv
 +pvGZlafhj+GuszAOYYEDnJIYEGeiDWHAZmNEK3i1XJNjqNA9Pwb6GsUoGtoMc7qG4rvp2kg=
X-Gm-Gg: ASbGncsfIzzYUX+ZXI/KsI11e0tgbUgD92kPcD0NBVUb5JdhTyVHrHKIWJ9c+lagY2x
 IddKshh9RmxL1sle9Udlzp4yb8JPCht0n4lMU5Nerir6OLWajywAGCm394G2jQxuo5ZQbWR7xZZ
 Pu19g+ra9LAlUUu3KwV5tqlYYy9eeewE/tfM9hNI8JmAptFJsYcm1XRJdjn24Ew27FnRWvRXMUB
 eR9wqxvXgfAsPBfBuQUMfUxeKt7+KdZ9X8KkEfRHkjyXAoNBuqep6zgfHFZ/On7mQw3XuwkdnQ8
 SCMelMuFeWgLC5eMH10Kq9YRasBLXv7rSJMdDZf/bOTMc2gZuEC+xmtcEA86sBYtv85GC1boaM4
 dwpiq3CWNMtJ9UvAwtggJSg==
X-Received: by 2002:a05:6a20:a122:b0:248:7e43:b6b8 with SMTP id
 adf61e73a8af0-24e7d6d06a1mr1953603637.3.1757027978782; 
 Thu, 04 Sep 2025 16:19:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrHCCGVk/XlfrJjM6BYUjkw3Vbu+2UMzqA2nRl5Xh8C+tfH4Qk8it3kQKN3uatJyzD/U8qDA==
X-Received: by 2002:a05:6a20:a122:b0:248:7e43:b6b8 with SMTP id
 adf61e73a8af0-24e7d6d06a1mr1953575637.3.1757027978303; 
 Thu, 04 Sep 2025 16:19:38 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32b8ba6e145sm3378630a91.22.2025.09.04.16.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 16:19:37 -0700 (PDT)
Message-ID: <29ae5bb3-092a-48fb-9d47-f23c92ac4616@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:19:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] drm/msm/dpu: drop redundant num_planes assignment
 in _dpu_format_populate_plane_sizes*()
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
 <20250705-dpu-formats-v1-10-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-10-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68ba1e8c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MRz67vdl03j5fkBFI1YA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: BYiQbmYfQIK5cN0t54atFsEiQI9byJ_T
X-Proofpoint-ORIG-GUID: BYiQbmYfQIK5cN0t54atFsEiQI9byJ_T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX2GFDxMOAcSUI
 ppvsQRj77R48RZ8RWpIojH3kxvV3XxfgbUNf1+QKBUSUq1B8XJKzFBtoLoF1R+MsdjmdZpulPhi
 zpyL0uSIO4gsH4PsaDBbkUwVISFYf4b718uue338xjE+xVW5zf7j6QqdTVMtNGGnHg0/dAUu42x
 xApWMsGsa/WJSWbvaSLTr6O8/s1Q8DjY43xPZ29YmfGwD6vpVPka3oVXFMdfg0favApC0VX0rs7
 bxGRiBszjtH3mlNXgMSROgCzMXOX/vjwF8RAGbfhIP2Wv3byDzNv1S+KksFbwwAc0NIj5e9T9CF
 RK7Ye6GeMjVa9MWXRjyP2itOhJhTFXMb4IivtWkjwN/kqgEuUZq0bEsuEzf80FtioAxY/EtZf64
 OnUVzcsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
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
> Drop redundant layout->num_planes assignments, using the value assigned
> from the formats table. RGB UBWC formats need special handling: they use
> two planes (per the format table), but the uAPI defines plane[1] as
> empty.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index 195a6b7c4075eef40e7a5d0fee208168421cee35..e1fb7fd3b0b97a38880bc80aec26003d65a3a310 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -110,7 +110,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   		uint32_t y_meta_scanlines = 0;
>   		uint32_t uv_meta_scanlines = 0;
>   
> -		layout->num_planes = 2;
>   		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, fb->width);
>   		y_sclines = VENUS_Y_SCANLINES(color, fb->height);
>   		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
> @@ -124,7 +123,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   		if (!meta)
>   			return 0;
>   
> -		layout->num_planes += 2;
>   		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
>   		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, fb->height);
>   		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
> @@ -138,8 +136,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   	} else {
>   		uint32_t rgb_scanlines, rgb_meta_scanlines;
>   
> -		layout->num_planes = 1;
> -
>   		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, fb->width);
>   		rgb_scanlines = VENUS_RGB_SCANLINES(color, fb->height);
>   		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
> @@ -148,7 +144,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   		if (!meta)
>   			return 0;
>   
> -		layout->num_planes += 2;
> +		/* uAPI leaves plane[1] empty and plane[2] as meta */
> +		layout->num_planes += 1;
> +
>   		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
>   		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
>   		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
> @@ -167,7 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
>   
>   	/* Due to memset above, only need to set planes of interest */
>   	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
> -		layout->num_planes = 1;
>   		layout->plane_size[0] = fb->width * fb->height * fmt->bpp;
>   		layout->plane_pitch[0] = fb->width * fmt->bpp;
>   	} else {
> @@ -194,12 +191,10 @@ static int _dpu_format_populate_plane_sizes_linear(
>   				(fb->height / v_subsample);
>   
>   		if (fmt->fetch_type == MDP_PLANE_PSEUDO_PLANAR) {
> -			layout->num_planes = 2;
>   			layout->plane_size[1] *= 2;
>   			layout->plane_pitch[1] *= 2;
>   		} else {
>   			/* planar */
> -			layout->num_planes = 3;
>   			layout->plane_size[2] = layout->plane_size[1];
>   			layout->plane_pitch[2] = layout->plane_pitch[1];
>   		}
> 


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D188B44A2A
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 01:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D02A10EAF8;
	Thu,  4 Sep 2025 23:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CrdUwGyI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F67A10EAF9
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 23:06:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584I0YVR007619
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 23:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pY9gK+ThVgdI5BFWW5e5N19jUdr6ztEXbR+lsuj6qWk=; b=CrdUwGyI84hs96ga
 0JaoYzxVoEoh9RJQRiRs7mEEnOsMTWRzPhIaSBH3pwAHc2MwGDe/tcMJXVQ6ehhc
 1caTBAbDcyWD7uX2T0vxSGjDNr0IkD7kMiV8PWC2NKu0YI9xY3at8keHzI9OPuLV
 P3J2TSBoFmOd2YWr//2sfTpH8YIUwnL6QMqxX3R9u1wDAGK0VbUdl6SIP3/GZJcQ
 2r8DCuDcr7wNijLTUnmtgg0ScCsypSahmAv6dmrZdh8R82vuTrguyi3KBHlBKHIJ
 cKFASzWqjSwL94WH2xaJHXSZrfs1i/Mp1fZX8/PHdQ6ofMG2V3JhRA51WU805p98
 WRsjGQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura91235-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 23:06:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2490768ee5fso12431295ad.3
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 16:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757027205; x=1757632005;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pY9gK+ThVgdI5BFWW5e5N19jUdr6ztEXbR+lsuj6qWk=;
 b=jp+E39yUQFuFuvVUokF9rE4ldRi7f/cRN/I/DqKyAlK7lVqjqFFNGo6A4/0z3l1MkR
 zldUbxUOJX7wlp+813M4uTiJ94LjgGeL8+0AvX2K+BAkY3Pjrchj0P055W7EZcHo+lqQ
 Lko/9HHfn1dNixG57KT2oKaikKcl7nAOCNPsVMDYf3ta3PkqgnsOC9/jEUXJws4mS7cJ
 KcVD7WSlbz6fGoVmBvPdkwP4Sz4PTO+Wfxo0TV34xS0ecfn+ttJowgzasFms1f9FXXqq
 vdj4VYK9R60Fj3o8YhUKE7iOWx+HimMFKxIx5yui2KKlKtDYTEdLNCB6yhoMjlvUdvrH
 Dfxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFk6cbM+NzLXF41I6ettE5y9jvDsUCyD616Mv+1lpiYTo4P+KWwJkDnTE/jQmKhqAn9T2lrehRZQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxr7D3QUn/dubcySPAl1wTXBsMEOlBchcEFWIUeOfeJxsBVumD5
 yorEPojDKxOBTfxvV/wv/Pd+620iKZJ2Djf9FSDNTOH9A6pQDWBgTGFGWzi9M3h56JNSwUBbKn1
 J0BebMr/4VhWNwisRMOpJ5FfEVTFtrGt0M0ol7jK45aS6Tl7pkhG9nhp5B7ZLXM+QY+NsBys=
X-Gm-Gg: ASbGncuO6bZBrcvZDk+VEm8BL1Br/A8WEqGWrcOvSlZx9VrnuxA7WoMWgqujqWO+lm6
 RF6fqLjyvJX7WJoJ56NsxKWRSRIlwGOhNVcCX8HZBtrt7UE3nGC7pZCUb/ODIsDooWdL2VL4JWJ
 BWTE7chNgZwIBU609XtDNsFt92OjOckJvTBxf74zDmt3iLc0+uZ1AoxsYbZeQo15CCi5AW6Fbwl
 IwQkD/OlseJheFIX9ePGUtTRau9VnGz7y3PiECW6qbYEJTa9FkB9WmqVIwefrzy4O3Vd7Fna+Rw
 bYEbgOxbyS9QM52dZyQfaL0kJ/6P1CkkoJaHVyieRso2t8WWVHUcEfG9YBh16SG/yMz6KqdJV9t
 S9POdPW/OUfqp1KQvigGnKg==
X-Received: by 2002:a17:902:c40c:b0:24c:b2a4:7089 with SMTP id
 d9443c01a7336-24cb2a4744fmr96647885ad.31.1757027204622; 
 Thu, 04 Sep 2025 16:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAW4qcjG7Y8A2utGWv8f38r6vB8fRI7Y1MOVvBYSZsUgaoyRNVFvDzjj+8gtnXDUuWGYNuWw==
X-Received: by 2002:a17:902:c40c:b0:24c:b2a4:7089 with SMTP id
 d9443c01a7336-24cb2a4744fmr96647415ad.31.1757027204091; 
 Thu, 04 Sep 2025 16:06:44 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24c7f3b762fsm62808245ad.44.2025.09.04.16.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 16:06:43 -0700 (PDT)
Message-ID: <8ce859b6-c4de-44c4-8fc4-f1edeae1c06f@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:06:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] drm/msm/disp: simplify tiled RGB{,A,X} formats
 definitions
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
 <20250705-dpu-formats-v1-5-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-5-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b7JiSZNnn56z64WUTRTYUXrUQUErLGqZ
X-Proofpoint-GUID: b7JiSZNnn56z64WUTRTYUXrUQUErLGqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXxJr+/rOgvaEt
 Bys93jozM/UqkP5DOgozUOzrDTRqZRjK15zenzjSRvEtXSOaZwV8Zj+xiifPC7GZcJzz1Htfi5z
 EoCrlW8bOJZTGAsTKZ9GtRYwsHbTsw6f1MOWHya9AFdc3BBA1J727dXuEiU2jY0dUpBBfK5OLv0
 sxj5USq7hpXpdMOB8WW/Qnk8ua/oipmuYnqUo1LrRM2WYyqmo82vAzVa3EDwuTFxLaLlH2/vKEv
 jQm/fZYKDJPFNh4bEPs86e1yJtCAK21VxPvYeBW5fDKsYxBhGj0si0SfRRtUlj7WKYBchnQTI1I
 Ux86vOhYQQ1LeKsRtt6eQy0L2Mcw4GCY1udRbzOgEzulKVzNzXopLtt10lrQXMh4O2YYdg5EAyo
 fTOmgrV0
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68ba1b86 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QKBbl6H3c_T8Obeb1L4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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
> Define several additional macros, capturing tiled RGB format classes, in
> order to simplify defining particular RGB* format.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 118 ++++++++++++++++++++++++----------
>   1 file changed, 85 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 28cef986f2d662484afd47440a79393c48256ff5..d577b3d53fbebced63792b5c65f50dd45211c8ea 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -163,22 +163,83 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> -#define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
> -alpha, bp, flg)                                               \
> +#define INTERLEAVED_RGB_FMT_TILED(fmt, bp, r, g, b, e0, e1, e2)           \
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
> +	.fetch_mode = MDP_FETCH_UBWC,                                     \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_COMPRESSED,                              \
> +	.num_planes = 2,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
> +}
> +
> +#define INTERLEAVED_RGBA_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
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
>   	.fetch_mode = MDP_FETCH_UBWC,                                     \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_COMPRESSED,                              \
> +	.num_planes = 2,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
> +}
> +
> +#define INTERLEAVED_RGBX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
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
> +	.fetch_mode = MDP_FETCH_UBWC,                                     \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_COMPRESSED,                              \
> +	.num_planes = 2,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
> +}
> +
> +#define INTERLEAVED_RGBA_DX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3) \
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
> +	.fetch_mode = MDP_FETCH_UBWC,                                     \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_DX |                                     \
> +		 MSM_FORMAT_FLAG_COMPRESSED,                              \
>   	.num_planes = 2,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
>   }
> @@ -525,58 +586,49 @@ static const struct msm_format mdp_formats[] = {
>    * the data will be passed by user-space.
>    */
>   static const struct msm_format mdp_formats_ubwc[] = {
> -	INTERLEAVED_RGB_FMT_TILED(BGR565,
> -		0, BPC5, BPC6, BPC5,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> -		false, 2, MSM_FORMAT_FLAG_COMPRESSED),
> +	INTERLEAVED_RGB_FMT_TILED(BGR565, 2,
> +		BPC5, BPC6, BPC5,
> +		C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
> +	INTERLEAVED_RGBA_FMT_TILED(ABGR8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
>   	/* ARGB8888 and ABGR8888 purposely have the same color
>   	 * ordering.  The hardware only supports ABGR8888 UBWC
>   	 * natively.
>   	 */
> -	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
> +	INTERLEAVED_RGBA_FMT_TILED(ARGB8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
> +	INTERLEAVED_RGBX_FMT_TILED(XBGR8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
> +	INTERLEAVED_RGBX_FMT_TILED(XRGB8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
> +	INTERLEAVED_RGBA_DX_FMT_TILED(ABGR2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
> +	INTERLEAVED_RGBA_DX_FMT_TILED(XBGR2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
> +	INTERLEAVED_RGBA_DX_FMT_TILED(XRGB2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
>   	/* XRGB2101010 and ARGB2101010 purposely have the same color
>   	* ordering.  The hardware only supports ARGB2101010 UBWC
>   	* natively.
>   	*/
> -	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
> +	INTERLEAVED_RGBA_DX_FMT_TILED(ARGB2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
>   	PSEUDO_YUV_FMT_TILED(NV12,
>   		0, BPC8, BPC8, BPC8,
> 


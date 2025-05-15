Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2CDAB7A8F
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 02:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB37B10E75F;
	Thu, 15 May 2025 00:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dx+XTGRP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1565B10E76E
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 00:28:10 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F02oek006686
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 00:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=B2cvFYkDiNTcJpepfH9pXulh
 1NUdq2hXaOLZdeTdJc0=; b=dx+XTGRPNXPEIu5UdnahImaAP9VxwgudhGUBxdiq
 XlXFf2qiIiJkkTg9mC132unm/Yrk/n1R7BzQA7obddC3YkWEXuT+Zz2URarbI69X
 BwNr9msMUNqwhAYtCUjkg1GTyUStZURsIJ05M//4lyrsptkS1AbUGLoAKseF15Yz
 ZSf1wuuYa2jsQfxTSqvQytTwGdwm9YZaAJ+Q9aafVrs5UeEVDaaFT/+xDWPhPVRo
 Fz6YV2b2vVBYEfftW8Co5ZSI2ncZWEUJSVCo3yiUy7cqk/d4/6JFAuyoqGxIX3qq
 +yl5SCcK9LWwtP7vLWEwq3B0ArnMkHVb32GPvzJ7JgEvfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew4cdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 00:28:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7cabd21579eso52880585a.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 17:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747268888; x=1747873688;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B2cvFYkDiNTcJpepfH9pXulh1NUdq2hXaOLZdeTdJc0=;
 b=eTE3joxsA6uKGdLPOtJDB/98Y/95OGiGlYwdJTI0qfFc6i0Bls2bhmnbwafTi6B5ly
 Nfb+wwEm3YlVSebyOYqQ26jlaPTPAol8KUvr1gyD9rkT9iw/STSsY3Cf1Do2ms29Q9I+
 L9LozMfTn8Z2UzQk+8KemnvFM5HU+MU0AdeYZMeyGM29Q9sl8CtZjYiZGUUIjIcnWQL2
 pUqwHXPRu8FPk61ZwaZN8JifZanywpBe4QVuw6zr+CixbDiRk2cOyROjcfMCtRa/i+7p
 ggxruhg8eLl8SFkh2I/aqJZaF49+yUnklI//MckfgBEcj7GB1Sy/uKcONnai9mmz7vsa
 KIEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIPG2udn1xcJCjdyDxrjJoRS7dalS4Vz0Ji1pFSzN0dzbu+YjYOtdqRgUAsoa78535SzxH2rV8myY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmXa4D+68BbMpyAuv0y8RHxZ5IFSkMZhua+G6UXSdOm7J4b08R
 mMvHvV6dDk1NawpJ/S5A5QeII2Tsh6ASTqCcj6xRlLATqruvMH/ySbS8mcQZOwLh281nJUuGkJg
 zJqb4lrIesZN3eR13XpsykBRhjonLqpjQH1pHbfLbhqFtS66X3aP7NRaeyPXWruUtk9U=
X-Gm-Gg: ASbGncvicBebYBm6UM55l+u/pSChr7gWz2HJyZ+hKLmtRnStYdon/eunw9e6YYSuK3c
 V/9FWd2mXVYwBEYGyAzp79LTTvu5/62dC/PVppYY7v25Qa3LsVFTRdgIvBHi79gexlDc2iJZRXi
 wqpKnVMASfCmP3rlYhUwPk5CvNTqzXoIvPN7TRKfHrqBndEj6qRJymzlmSpuMKJTnsx/qMLPTrc
 znJr6H+iOal1B4aiJRi2RqcoLjRH2eOm+FQpVBfHmOyInFcO7AjmHEy1Hl4zd/dc3qzsBhqo/W8
 +2IRj3FmXhOl5lzdIXkuT6HExQ745j1vXwfbsTPRASq1QR/oY3UNmR+7m2DkaFEQL3X9fmxmzlw
 =
X-Received: by 2002:a05:620a:294f:b0:7ca:f65c:2032 with SMTP id
 af79cd13be357-7cd287df0e3mr755664585a.5.1747268888159; 
 Wed, 14 May 2025 17:28:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt2xaXNowfMYXBT44y4aANaDgJRpOyGL+qTVAMGUeuxqwInoNRP+sTL7AzLDhnS1ZiX9uKoA==
X-Received: by 2002:a05:620a:294f:b0:7ca:f65c:2032 with SMTP id
 af79cd13be357-7cd287df0e3mr755660485a.5.1747268887560; 
 Wed, 14 May 2025 17:28:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64b6f96sm2433950e87.142.2025.05.14.17.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 17:28:06 -0700 (PDT)
Date: Thu, 15 May 2025 03:28:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
Message-ID: <f2brfgvsnwqu5rudr32fkjx6qiuut2im546mjqrk2ouego4npx@g6avls6o7kws>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-GUID: _bXGFGKrwNVPq-QyvmFqrQiT_E4IVpxs
X-Proofpoint-ORIG-GUID: _bXGFGKrwNVPq-QyvmFqrQiT_E4IVpxs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMiBTYWx0ZWRfXxXVJffd7alpV
 +rvkOrVbZG/Y+lAFzbD/THl5Ft+hLp3yH8mZ+4jnBQsoxJjBXxCZPDGLR+WKzHkHf5xp5XtJtrh
 bdjVz5GOE4rkZEc+TCwpdS11r3HhMAOA2dp8o0i9+2Gx51+XnrH2Ia3Fs+ajvrNpjlxe8fVt6aw
 u2b41SWsY/puKsWjnCoA3uMfpYNycG/GcEfRhQ7xmVf5Z59w1gwIGBX9h2/kKTNFH4WhV8xgQd+
 S2Ou1Ao/6NIH+yfTQpw58CahaMbDquEyzsnwyNDBKbBUwKy1nda4EDgf4bYc0c+QbEWQfb/hkIC
 2hAFRkle32gbX8NWNECTN0zvy3Crv3w2EfHRZgvbGIgAfG6ms4XhEz06L5ANVKKbmZjCujFCOM1
 tsTCO5kptsxahLOkxp1+P3v+fgl3Vc8TEoH5xgzAx9AlrWmrYoULp/oHdh/6gI0zX7xsgTRD
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68253518 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=s1QDowjoCeJB2mqXB6oA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150002
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

On Wed, May 14, 2025 at 04:52:31PM -0700, Jessica Zhang wrote:
> Validate requested mode and topology based on the PINGPONG or DSC encoder
> max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
> off of PINGPONG or DSC encoder max width

Separate commit for num_lm, please.

> 
> As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
> for PINGPONG_0, there is some additional logic that needs to be added to
> the resource manager to specifically try and reserve PINGPONG_0 for
> modes that are greater than 5k.
> 
> Since this is out of the scope of this series, add a helper that will
> get the overall minimum PINGPONG max linewidth for a given chipset.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 0714936d8835..6131d071b051 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -723,6 +723,31 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
>  	_dpu_crtc_complete_flip(crtc);
>  }
>  
> +static int msm_display_get_max_pingpong_width(struct dpu_kms *dpu_kms)
> +{
> +	const struct dpu_pingpong_cfg *pingpong;
> +	u32 max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;
> +
> +	/*
> +	 * Find the smallest overall PINGPONG max_linewidth in the catalog since
> +	 * max_linewidth can differ between PINGPONGs even within the same
> +	 * chipset.
> +	 *
> +	 * Note: While, for DPU 8.x+, PINGPONG_0 can technically support up to
> +	 * 8k resolutions, this requires reworking the RM to try to reserve
> +	 * PINGPONG_0 for modes greater than 5k.
> +	 *
> +	 * Once this additional logic is implemented, we can drop this helper
> +	 * and use the reserved PINGPONG's max_linewidth
> +	 */
> +	for (int i = 1; i < dpu_kms->catalog->pingpong_count; i++) {
> +		pingpong = &dpu_kms->catalog->pingpong[i];
> +		max_pingpong_width = min(max_pingpong_width, pingpong->max_linewidth);
> +	}

Since we are skipping PINGPONG_0, wouldn't it be enough to return
max_linewidth of PP_1 ?

I think, it would be easier to follow .max_dsc_encoder_width and store
.max_pingpong_linewidth in dpu_caps (and later add special
.max_pp0_linewidth).

> +
> +	return max_pingpong_width;
> +}
> +
>  static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>  		struct drm_crtc_state *state)
>  {

-- 
With best wishes
Dmitry

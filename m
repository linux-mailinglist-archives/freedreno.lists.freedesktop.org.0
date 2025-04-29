Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720DFAA1823
	for <lists+freedreno@lfdr.de>; Tue, 29 Apr 2025 19:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1390710E45A;
	Tue, 29 Apr 2025 17:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5V4SqfO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA9710E453
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 17:56:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9rPan015584
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 17:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rS5vG6Ykrsa1zW3Ud275kbku
 3FMpDAYZKUwwcOX3+Qs=; b=L5V4SqfOxfRjSoAvXu9F1fb31nUL+7WBBsoqfm4M
 kgMQEPVuITFrCsaw2zQr7bHSp9yDuYHcomGlM8QnvflKiaMDHByIcosrIPf3z3m0
 ebdc3GhH4IeGPQrYBWLYcyHUAu6OXNlCx1a2RYF7/k3qHKAxXviOoCUgQyhjggno
 CJzXKHZzjKCS2O4Gc/Fn0SkE2CnfMn3PWOafOZAGNm+YPwGxKY6T7Uv+w3dCQVpm
 IFLGJeQBDQEio4voMOuUPJEz0qafkQ6uw7ypTXJ5I6fzkog9NagaPJnMz61dA7cO
 BzZ+o6XudIN7hJgKbz5G6ExpnN0UI3B6uLOkeAJ8Xk3a5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwwedy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 17:56:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5c9abdbd3so585039985a.1
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 10:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745949362; x=1746554162;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rS5vG6Ykrsa1zW3Ud275kbku3FMpDAYZKUwwcOX3+Qs=;
 b=uSDP9Pg05jefXCSuQjGLi3uuj6MJF6xSgTICngvrPm4dxB4SmvTWB8AiD9cIPS+SM8
 W19MMYTU/gTa4ghi32DiecfQcYCmJpjOUxwKN3U83p0c1M1umBBF6m12L8obTbNDzKzS
 SY6YZBf9As5BUEkHjVjF7OnTUA8NVscJGhSsOu6RuBJAm+MdidFtQAtwbnvg9uH9e+zt
 +MFHPDn3KPnuI9cgoSU4xnIEbEX6p2c3NK4PS0JSE4WzstY08v6oN3Zcbej4AOVcZjHi
 bDbK2sltyHbBRhQ+JcDmQK/h1oU7max7LC0NcD2znpsYbdzM9xLV4rsPY/ccY/sbkRqH
 4fdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQTaYoIUCe/4a9sL/FvugQyyIfVGsROV2qMnljc0cAJZ/USInfTSGU5/iCTBqJF9ZXE4A10Qaq0RM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx30lXWH2pof6ekeu5J8eRlJWK6xwsyhbv6kvVvCUa86PWhj80L
 goDPiBRqndI4SHbwpnUNyohXW/yCQHxaQk4TjxFWOpA8ueJ/pGzuhKdQoU1I+MiZqLrF8NsiI/J
 EwTLt3exqzZRb8MnUbxq5awsz0lgS5SsCG99V+wuA0OEG24RsjdTOWolye6hT6HiTLnM=
X-Gm-Gg: ASbGnct+nBgbElqOug6RURq+lTGqgjucHpHTHQnlDyBW3SG/N5DsbKY7QNl3spEBTbP
 gBzoERZyOuCG6iBUpqTeLmCylOCK8MQjt2izORNpEr2xHYBvUzjUkktlWv42HIHfUW446mNqutm
 iycGUSqenjd1meTIJOJglMjlAQ1sFMg668m3UF+8FriICwxwsHZVrpSmcOZ+g4JGhMNNezBkX29
 Fd9+Gw6chPPidiHA3Q/bl4OK3zF1k39hws4NYh/vgJZ5AmAJqODAR6kMuwLbrYQ8WR7rgtBG8or
 W7l3SKM7ClUtBT3F0Agg/bDIVMlZm0bpLagKANTBPMoAyna7YP0It4ZSCVOrUa7Qg9dVJjJjYuk
 =
X-Received: by 2002:a05:620a:17a2:b0:7c5:54d8:3d43 with SMTP id
 af79cd13be357-7cabddd8535mr597329285a.58.1745949362469; 
 Tue, 29 Apr 2025 10:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRha005ciPmWQvQ7hrDFPUg9VvCfnjF+1wobmE3CtP2HMJ9VopYx0EY6VOvVx1uhZKTX5kvQ==
X-Received: by 2002:a05:620a:17a2:b0:7c5:54d8:3d43 with SMTP id
 af79cd13be357-7cabddd8535mr597325085a.58.1745949362083; 
 Tue, 29 Apr 2025 10:56:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccab19bsm1948330e87.207.2025.04.29.10.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 10:56:01 -0700 (PDT)
Date: Tue, 29 Apr 2025 20:55:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Filter modes based on adjusted mode clock
Message-ID: <k4le6lz2bwdxqc3jw4ctndybkongynexr6j7p7afc2h5mzktxm@ov26hfmi3puj>
References: <20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com>
X-Proofpoint-ORIG-GUID: 9NKuldw7PA0m-6GW86WzgbUpDVUMQPjF
X-Proofpoint-GUID: 9NKuldw7PA0m-6GW86WzgbUpDVUMQPjF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEzMiBTYWx0ZWRfX1l3JGxBbNKuJ
 /vaTpsj39CqFErzPLQfsGOVj5WUACBQgqhEC9GwtoqEefnxXS3Hh5k22CYFVTMRodbidDTB9rHp
 ItWO0W2uiDFhw+oEXJlbMVo9j/7eU1OPvc8wJZDq8RSE0kR+e3jk3kjDX54/ukRsl0JfnBQxbkm
 +Me3ZNGHL4wqiN7xQadt5rdWI7nMZk7L/vGLPj85eYMAucbOvh1dejAzJuG2V6ykxmXNpDWOIai
 XAWUX01tP+NnMJ6jj1KU3vq0Sc+TCF2xDEKAl2uQyq/NlcxbnLaeJhZMdCEF25xhRugXWqTf9bt
 kcNgcYSg1JBpGNZE1vlpFXYmi8Tc/kN1c1thAbPKe8hbgfuAaS18QRHWB14ycL7JzAnbcDAcLF+
 BlqIjuJEBzCPjeJDURMyQDwcaXr7vJu8jcIDxGODTQ0fq6t/Tkx0vCFOiHcbPEdvSnqQKx+g
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=681112b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=p-WgCerdHsfys2ORyzkA:9
 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290132
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

On Thu, Dec 12, 2024 at 11:11:54AM -0800, Jessica Zhang wrote:
> Filter out modes that have a clock rate greater than the max core clock
> rate when adjusted for the perf clock factor
> 
> This is especially important for chipsets such as QCS615 that have lower
> limits for the MDP max core clock.
> 
> Since the core CRTC clock is at least the mode clock (adjusted for the
> perf clock factor) [1], the modes supported by the driver should be less
> than the max core clock rate.
> 
> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 +++++++++++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++++
>  3 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 6f0a37f954fe8797a4e3a34e7876a93d5e477642..0afd7c81981c722a1a9176062250c418255fe6d0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -31,6 +31,26 @@ enum dpu_perf_mode {
>  	DPU_PERF_MODE_MAX
>  };
>  
> +/**
> + * dpu_core_perf_adjusted_crtc_clk - Adjust given crtc clock rate according to
> + *   the perf clock factor.
> + * @crtc_clk_rate - Unadjusted crtc clock rate
> + * @perf_cfg: performance configuration
> + */
> +u64 dpu_core_perf_adjusted_crtc_clk(u64 crtc_clk_rate,
> +				    const struct dpu_perf_cfg *perf_cfg)
> +{
> +	u32 clk_factor;
> +
> +	clk_factor = perf_cfg->clk_inefficiency_factor;
> +	if (clk_factor) {
> +		crtc_clk_rate *= clk_factor;
> +		do_div(crtc_clk_rate, 100);
> +	}
> +
> +	return crtc_clk_rate;
> +}
> +
>  /**
>   * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>   * @perf_cfg: performance configuration
> @@ -76,7 +96,6 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
>  	struct dpu_plane_state *pstate;
>  	struct drm_display_mode *mode;
>  	u64 crtc_clk;
> -	u32 clk_factor;
>  
>  	mode = &state->adjusted_mode;
>  
> @@ -90,13 +109,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
>  		crtc_clk = max(pstate->plane_clk, crtc_clk);
>  	}
>  
> -	clk_factor = perf_cfg->clk_inefficiency_factor;
> -	if (clk_factor) {
> -		crtc_clk *= clk_factor;
> -		do_div(crtc_clk, 100);
> -	}
> -
> -	return crtc_clk;
> +	return dpu_core_perf_adjusted_crtc_clk(crtc_clk, perf_cfg);
>  }
>  
>  static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..c3bcd567cdfb66647c83682d1feedd69e33f0680 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -54,6 +54,9 @@ struct dpu_core_perf {
>  	u64 fix_core_ab_vote;
>  };
>  
> +u64 dpu_core_perf_adjusted_crtc_clk(u64 clk_rate,
> +				    const struct dpu_perf_cfg *perf_cfg);
> +
>  int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>  		struct drm_crtc_state *state);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index ad3462476a143ec01a3b8817a2c85b0f50435a9e..cd7b84ab57a7526948c2beb7c5cefdddcbe4f6d9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1257,6 +1257,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>  						const struct drm_display_mode *mode)
>  {
>  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> +	u64 adjusted_mode_clk;
>  
>  	/* if there is no 3d_mux block we cannot merge LMs so we cannot
>  	 * split the large layer into 2 LMs, filter out such modes
> @@ -1264,6 +1265,17 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>  	if (!dpu_kms->catalog->caps->has_3d_merge &&
>  	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
>  		return MODE_BAD_HVALUE;
> +
> +	adjusted_mode_clk = dpu_core_perf_adjusted_crtc_clk(mode->clock,
> +							    dpu_kms->perf.perf_cfg);
> +
> +	/*
> +	 * The given mode, adjusted for the perf clock factor, should not exceed
> +	 * the max core clock rate
> +	 */
> +	if (adjusted_mode_clk > dpu_kms->perf.max_core_clk_rate / 1000)
> +		return MODE_CLOCK_HIGH;

This breaks arm32 builds:

ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!

Please replace division with multiplication.

> +
>  	/*
>  	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
>  	 */
> 
> ---
> base-commit: 423c1c96d6b2d3bb35072e33a5fdd8db6d2c0a74
> change-id: 20241212-filter-mode-clock-8cb2e769f05b
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 

-- 
With best wishes
Dmitry

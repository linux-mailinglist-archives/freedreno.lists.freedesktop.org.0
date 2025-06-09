Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E51AD1E97
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 15:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3A610E11E;
	Mon,  9 Jun 2025 13:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxRqhYtI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F95F10E11E
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 13:17:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599vrIl023336
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 13:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LqafI7UpDS2G2nMa59iMzkyR
 7WPx8aM+c9eWQscV7b4=; b=MxRqhYtIwoD2339euRI1eVA5/1yoh2y6a3NGPpRh
 OTibOgclf8nstd3PPA30xWY3rVTqqmR4Y/EZ1Kgu+oc7QPWBJW6AkboMDP+OHuHw
 qIIyY6eG1ab744wQXZ8R7KRqFLPovgmGKOSoxFGzWrPktJFu8q8aoFaScztnNoex
 X23yyvwYox3jzQ7p0GpPskOdW6iX898aCWzrTs2u6S2r6QFBKQw9znEAu4IL+z93
 fhNXsWQIAeO2iRxOz0ZxOqvBDL395YrmZK/MsTt/zM6Ppv8lswrcBlAWp1zLd/9V
 nW1I5QBm8WRzIbholXtjHeO2JpuZIiZh3NwCETep3vz8aw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jdw72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 13:17:01 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-2e3b719adeeso1654016fac.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 06:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749475020; x=1750079820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LqafI7UpDS2G2nMa59iMzkyR7WPx8aM+c9eWQscV7b4=;
 b=bNOe4iE5sgS2IEJSc5I5E6/iUGUivejVOmkJrKuRkHRpFZQNrvYznD3hMhgG3xu8Ta
 okv9eOYMco61V/46n1Xj9BrpTIwSIwMwSDSgC36FFp511Vc5U82nCe1H2hbkI4O0KPGR
 RhD0hEkcyEbTlw2gSYIgbk1+w6ydA4AJGACXYKP8Uf+TQAup9+orN6IrhL20EYb8zMNC
 4yQTUGgxzncmBgc52kx3NlvVwtJxzlZa6aBD7wGkioVvgcbEe89ix7Yj5ZsehyvB16kP
 LrWMF3ID6r4b62Yzc5UrUFi7NPfF+C9QOvSFqikxk6srldsTjg578RhCwgfm//urjpnw
 b16g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnl1MCmGUDpp1OYXRybssW9VOfij3c09yT2gVL4ZwKR+D8Hv1KnALINQBtbVIfag7e+oPHniEXugg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvCCFC+PbzLG+Qo4bf56Ccq9fo6Bu0DGZ1Sjv41Ds4evNiEozF
 ARk2n4CGArqifmOi7gmQVNf/TFh/eF1MdMyOtRgBqiM5vzuOVHM5jkPvrqquKE1uRsIvYd+Cynl
 oSfQcmsHOm6rTVkDxQhNUhnX6abY2OtRbsKaZpa7SqkMBaYCg0OsXupiNlU/03Ze600wM8BlG+4
 qLb7w=
X-Gm-Gg: ASbGncu/7qDUFKAxnu5ui9sjDvStyRZYD0Gip+BWBDy14lWQeAaVu3vvnTMPWkpTVOD
 8bIKrSOfKebyOgkQxTQYe5Uh0b2ncUg7zWpI31oVm2HSMeRA64hzG9GCllQgirK9DfDao2YRjFd
 jB1hlO99jE7fiQgOnRzurrSDaoOwlcIY0wpUvIZYoOBoqSeKs62z2RGGPRymGTjeXZx/kABEMFT
 FjdIqKSJRM8KbZFsR4mkFJbJDbS03OCuljerPCSo/Ap+yrc/DVbJP3p7fTeVMtQQuQgi5kF04EK
 yjbzNge12UVnwVL/g3BJU2/wGbFv4jz3pcqUNWJUtzgFnFlMyDjbFmFBmwLY92y5ewGT/2GxEC8
 =
X-Received: by 2002:a05:6830:490b:b0:72a:1625:ef11 with SMTP id
 46e09a7af769-73888f44b26mr9865245a34.27.1749475008528; 
 Mon, 09 Jun 2025 06:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdXJjdZDljViV4FdBjdzNy5cmzSfLLgDg6pGta3W3UTkuyEnx8yRKEOFsY04mEbYRFh+EByA==
X-Received: by 2002:a05:6830:6681:b0:72b:80b4:dbca with SMTP id
 46e09a7af769-73888d9e9b4mr10164715a34.5.1749474996438; 
 Mon, 09 Jun 2025 06:16:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a899sm1134523e87.170.2025.06.09.06.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 06:16:34 -0700 (PDT)
Date: Mon, 9 Jun 2025 16:16:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 06/38] drm/msm/dp: move the pixel clock control to its
 own API
Message-ID: <5b2lpjd2raqmowi466avustasdjsssl2tjwogd3ixjg7gi3dxv@cqtkbtcijnlc>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-6-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-6-a54d8902a23d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=6846decd cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=Spwbhj-UJuWzIqB0iS8A:9 a=CjuIK1q_8ugA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vQQw9WthcA7CQWh-aC671rLSby_-kxs4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NiBTYWx0ZWRfXzvUuVXepEhvg
 IrNKPu42o6POQZJHkzKv00v5QFcbwOWVpOxnyA6tteo0skZSx5B/s2DMR3vrv8FM3pVdKGPAkuS
 iJhAUyA4XC/LIP7hb46K1CwT8Z3eCe5tjPpqAP3hC0KNHuUlzzzyKPR974fuR7W69TogfpRkttZ
 iSyeo1l0fJH87d7lv7jvWe3w/lZ4VQe8QjNl6Uf5atSk+N8m6P4xZqrlULrwuXjlaWXWqcitmsj
 jrncv4Y/ddVaRnBoD+z8WXV6XHv3pHeLxjOn4pm2nfBKKLqO855KA01CqS3g1gv5nc9TaW9h8Qq
 z0848egIWKRovWDUkGFcHH1jfZJNhRlH8+89oX6+ACh/vqlTBI1W9sIQ5kGggZ6Ha/OE+eDIAlf
 thcZMTJ8UV4fHkoCBZHKralNSaaNNxRELZEI6ZM3oCdjhQRV6h4SdkewWnCLAJlBA4SbwDdy
X-Proofpoint-GUID: vQQw9WthcA7CQWh-aC671rLSby_-kxs4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090096
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

On Mon, Jun 09, 2025 at 08:21:25PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Enable/Disable of DP pixel clock happens in multiple code paths
> leading to code duplication. Move it into individual helpers so that
> the helpers can be called wherever necessary.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 98 +++++++++++++++++++++-------------------
>  1 file changed, 52 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index aee8e37655812439dfb65ae90ccb61b14e6e261f..ed00dd2538d98ddbc6bdcbd5fa154fd7043c48d6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -97,7 +97,7 @@ struct msm_dp_ctrl_private {
>  
>  	bool core_clks_on;
>  	bool link_clks_on;
> -	bool stream_clks_on;
> +	bool pixel_clks_on;

As you are touching this part, how many paths lead to pixel clock being
enabled and/or disabled? Can we sort them out and drop this flag, making
sure that the clock can be enabled only in one place and disabled in
another one (hopefully)?

>  };
>  
>  static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> @@ -1406,8 +1406,8 @@ int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl->core_clks_on = true;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> -		   str_on_off(ctrl->stream_clks_on),
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> +		   str_on_off(ctrl->pixel_clks_on),
>  		   str_on_off(ctrl->link_clks_on),
>  		   str_on_off(ctrl->core_clks_on));
>  
> @@ -1425,8 +1425,8 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl->core_clks_on = false;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> -		   str_on_off(ctrl->stream_clks_on),
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> +		   str_on_off(ctrl->pixel_clks_on),
>  		   str_on_off(ctrl->link_clks_on),
>  		   str_on_off(ctrl->core_clks_on));
>  }
> @@ -1456,8 +1456,8 @@ static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl->link_clks_on = true;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> -		   str_on_off(ctrl->stream_clks_on),
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> +		   str_on_off(ctrl->pixel_clks_on),
>  		   str_on_off(ctrl->link_clks_on),
>  		   str_on_off(ctrl->core_clks_on));
>  
> @@ -1475,8 +1475,8 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl->link_clks_on = false;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> -		   str_on_off(ctrl->stream_clks_on),
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> +		   str_on_off(ctrl->pixel_clks_on),
>  		   str_on_off(ctrl->link_clks_on),
>  		   str_on_off(ctrl->core_clks_on));
>  }
> @@ -1737,6 +1737,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>  	return success;
>  }
>  
> +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> +{
> +	int ret;
> +
> +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	if (ret) {
> +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	if (ctrl->pixel_clks_on) {
> +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> +	} else {
> +		ret = clk_prepare_enable(ctrl->pixel_clk);
> +		if (ret) {
> +			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +			return ret;
> +		}
> +		ctrl->pixel_clks_on = true;
> +	}
> +
> +	return ret;
> +}
> +
> +static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	if (ctrl->pixel_clks_on) {
> +		clk_disable_unprepare(ctrl->pixel_clk);
> +		ctrl->pixel_clks_on = false;
> +	}
> +}
> +
>  static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
>  						struct msm_dp_panel *msm_dp_panel)
>  {
> @@ -1763,22 +1799,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	}
>  
>  	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> -	if (ret) {
> -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> -		return ret;
> -	}
> -
> -	if (ctrl->stream_clks_on) {
> -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> -	} else {
> -		ret = clk_prepare_enable(ctrl->pixel_clk);
> -		if (ret) {
> -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> -			return ret;
> -		}
> -		ctrl->stream_clks_on = true;
> -	}
> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>  
>  	msm_dp_ctrl_send_phy_test_pattern(ctrl);
>  
> @@ -1998,8 +2019,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
>  		   ctrl->link->link_params.num_lanes);
>  
>  	drm_dbg_dp(ctrl->drm_dev,
> -		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> -		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
> +		   "core_clk_on=%d link_clk_on=%d pixel_clks_on=%d\n",
> +		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->pixel_clks_on);
>  
>  	if (!ctrl->link_clks_on) { /* link clk is off */
>  		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
> @@ -2038,21 +2059,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
>  
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>  	if (ret) {
> -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> -		goto end;
> -	}
> -
> -	if (ctrl->stream_clks_on) {
> -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> -	} else {
> -		ret = clk_prepare_enable(ctrl->pixel_clk);
> -		if (ret) {
> -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> -			goto end;
> -		}
> -		ctrl->stream_clks_on = true;
> +		DRM_ERROR("failed to enable pixel clk\n");
> +		return ret;
>  	}
>  
>  	/*
> @@ -2080,7 +2090,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  	drm_dbg_dp(ctrl->drm_dev,
>  		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
>  
> -end:
>  	return ret;
>  }
>  
> @@ -2154,10 +2163,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	msm_dp_catalog_ctrl_reset(ctrl->catalog);
>  
> -	if (ctrl->stream_clks_on) {
> -		clk_disable_unprepare(ctrl->pixel_clk);
> -		ctrl->stream_clks_on = false;
> -	}
> +	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
>  
>  	dev_pm_opp_set_rate(ctrl->dev, 0);
>  	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

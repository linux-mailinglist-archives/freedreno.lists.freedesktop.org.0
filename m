Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5632AB9BAC6
	for <lists+freedreno@lfdr.de>; Wed, 24 Sep 2025 21:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF6010E7C5;
	Wed, 24 Sep 2025 19:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYt3irBd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA8A10E7C5
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 19:21:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODIXfn029565
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 19:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0iu1Wjnwv+f5AYYfHw58qhf/
 bG3HYMyGpWsuOD72KVE=; b=OYt3irBdhpx9aAiIMdbkqDlTw+/XKF7xO+0lhAON
 cEPYRnzCWanMF+8BQc0OnILdjgc9xSUkvQpbkXk+z8XSJ77l131fsYU6AaDvzqtd
 K4XSBQX5yz3mnzO8w9FBT6U0j1end7RQjLG5622rl8qYnGY6qUlMXuYoOQ8sl981
 yltphA8af1Bqh0PoOlEykCKHpJ+8v52Gjb859XYpOaAS0O67NWPIhBpvxDgGSGC3
 ewau2muRbr95q2NycC1Bwu806tZaERN4Ic8ZraY/bGk0sGhzc4Sc5OvJZuEr/Xpa
 P6kbDBGpUeoR+/x2jiBwU4o8BhxZAejcnzf+cy/IRrvW7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fndps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 19:21:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d374dd29d1so4948621cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 12:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758741710; x=1759346510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0iu1Wjnwv+f5AYYfHw58qhf/bG3HYMyGpWsuOD72KVE=;
 b=YUMo5r+l4r2h/bQgcxkilMKENut3boY1sozb+q7U+RQaNQWFdyeIVFpn+MDZFeTAcU
 pmjwlyvUc0NBDfDkp5cJohheTk1MyZQlkgPK8o4V8NhKEIjgChDNRQq8qhV2oK9pz2Qn
 yIww3uZKOHTPcBOQ0uKQRwhNgYzlCbvGa9+vJR4tnQxDTSCLM7j8kA9qJm2FJTAkIyTj
 xFnU2mW6Bc7nhpK8J8yrWVUiFUQo32segA9tktsonUT1p4MzrMc+ZGri1vAtzJjXSrA1
 82LVYfp5/pzpsO/Sm2HhUMpGAf1MhyhtM7/cUVHhCzOZQOUKzQfFMxubg+tOWipjdL9w
 SXhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxzqWIJgveVNXrPwPMSCjqSbltrFlD6ieCJGZbcLLfRaulI02uu5HToCENfqpZPpIcXDY1FTj3BkY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjVVEIDLUuVgqWZb36aWwptURYaarnRhsE2NJ9uT1qur4i/6MW
 U3/p9p+m+YNzRn1woK20Dd7p826CDRSueD5xm7pORONRMVtH8a2FJ3ygNJXDVS3a1wA7RuAIvxH
 aahy+yXaaSBC31koh9xYLDvPMQ2261HEFnvdzpr0UfeuOY/zKinFA0Eg1/aOfttsiKnPaD2M=
X-Gm-Gg: ASbGncv3PA5dRAmPB4PsKCGNmG3tBoaR77W7xYTZu3uY5RGY8jVaK9vStTMYR5pXVph
 8HM9jFoldfxuDEAgdMeA+gcz6cVjjHwc6+ha6x6tTFRWgxBoVFOYa9QvrxlM1dA1mKToFVM5y0u
 bl9si6wPEOzy4tJSZOaUAuzX7TBM339bRU4luU50JUTSFyWlQpIH7uLjWv9e6Z4Co16ZWeqv1nZ
 +OftThJHbBgMg+tUzsuvljzBFBGIAaPxU5wNO9Sdgl6IXwDuWmigNTY8Y//RVvf9J9KSBtNtAWh
 /dy18H3EEuQ7bFepXxYrcdpAtaOlEuyosgA/DpRHbh5vMxpwBNQCA/cOWyELAeEuRaJbFJHa0a/
 lvJ2mEXhggZO27Yif5czt6kZb4n0ohcbHWLfp37duW+OITfQjA0Yr
X-Received: by 2002:ac8:7c42:0:b0:4c7:e39a:388b with SMTP id
 d75a77b69052e-4da4b428df9mr11723461cf.47.1758741709894; 
 Wed, 24 Sep 2025 12:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaFsspAyH/V3Y+WNKmm+luXg2sxoUJuUxgT3PD4jQ2JdvLW6f6tdlPbuRxY0RMCgn1FJCFVg==
X-Received: by 2002:ac8:7c42:0:b0:4c7:e39a:388b with SMTP id
 d75a77b69052e-4da4b428df9mr11723151cf.47.1758741709377; 
 Wed, 24 Sep 2025 12:21:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57f477153bdsm2419549e87.29.2025.09.24.12.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 12:21:48 -0700 (PDT)
Date: Wed, 24 Sep 2025 22:21:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] drm/msm/dsi: Support dual panel use case with
 single CRTC
Message-ID: <v3tfzspjck2oqppelx7bmi5uflhs47ixw6tjmq2d7inauzfo7k@gxebj3buyuni>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-3-6927284f1098@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-dsi-dual-panel-upstream-v3-3-6927284f1098@linaro.org>
X-Proofpoint-ORIG-GUID: VmhYJFNN930-0q0kuXSpVgx3UTMtc3H3
X-Proofpoint-GUID: VmhYJFNN930-0q0kuXSpVgx3UTMtc3H3
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d444cf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=BVByBJJp0cfCRiHu0pEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX+cM7maVCJ9pp
 1TtTv1a2U8zoU/wdPMTDOHspErIwBAiVyT08eGZfDJ8vcEjj+qAGsGdtoEpfqyZto1GDSEN72u6
 5cpMD3CCELIOcoxpi9XK6AZGqnoFuhd11MfQgN5UnFtuW4KJvpbKM4Z2e+8+SYlZLSJElKOSIJC
 3rtSMpdRwx23jGZRslh8lHZNPv4NocX8y9NS9qiunsPuQ06EZKpdRhkUTsdu/cAO7tCRudiaP+6
 Q2rGvfARHd/JN0nwB2YGLYmPc8w+Nva97bx7/OXRHyFRgDKMI2ZxX19w83ts535JLrIGDduP1/i
 A+jAFcV8/+EYjBhbb1F3b/+KcgXBTAnBeG29pAmiway+TGa/Iu7pzFNPP+U9fKQ70FTbHp5rzL6
 OyWw2tpM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037
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

On Wed, Sep 24, 2025 at 11:08:12PM +0800, Jun Nie wrote:
> Support a hardware configuration where two independent DSI panels are
> driven by a single, synchronous CRTC. This configuration uses a bonded
> DSI link to provide a unified vblank for both displays.
> 
> This allows application software to treat the two displays as a single,
> wide framebuffer with a synchronized refresh cycle, simplifying rendering
> logic for side-by-side panel arrangements.

I'd like to understand how is it framed on the overall system design
level. If it's a panel controlled over the DSI interface, it's fine
since we can broadcast commands over two DSI links. What if the panel
(or bridge) is controlled via I2C / SPI?

> 
> At the DSI host level, the frame width for each link must be that of an
> individual panel. The driver therefore halves the CRTC's horizontal
> resolution before configuring the DSI host and any DSC encoders, ensuring
> each panel receives the correct half of the framebuffer.

> 
> While the DSI panel driver should manage two panels togehter.
> 1. During probe, the driver finds the sibling dsi host via device tree
> phandle and register the 2nd panel to get another mipi_dsi_device.
> 2. Set dual_panel flag on both mipi_dsi_device.
> 3. Prepare DSC data per requirement from single panel.
> 4. All DSI commands should be send on every DSI link.
> 5. Handle power supply for 2 panels in one shot, the same is true to
>    brightness.
> 6. From the CRTC's perspective, the two panels appear as one wide display.
>    The driver exposes a DRM mode where the horizontal timings (hdisplay,
>    hsync_start, etc.) are doubled, while the vertical timings remain those
>    of a single panel. Because 2 panels are expected to be mounted in
>    left/right position.
> 
> To maintain synchronization, both DSI links are configured to share a
> single clock source, with the DSI1 controller using the clock provided
> to DSI0 as below.
> 
> &mdss_dsi1 {
>    assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> 		     <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
>    assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> }
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index de51cb02f267205320c5a94fc4188413e05907e6..1fddcea7f86547258be18a51a0a3e3f96f6c3838 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -177,6 +177,7 @@ struct msm_dsi_host {
>  	bool registered;
>  	bool power_on;
>  	bool enabled;
> +	bool is_dual_panel;
>  	int irq;
>  };
>  
> @@ -935,7 +936,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  			return;
>  		}
>  
> -		dsc->pic_width = mode->hdisplay;
> +		if (msm_host->is_dual_panel)
> +			dsc->pic_width = hdisplay;
> +		else
> +			dsc->pic_width = mode->hdisplay;
>  		dsc->pic_height = mode->vdisplay;
>  		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>  
> @@ -1609,6 +1613,7 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>  	if (dsi->lanes > msm_host->num_data_lanes)
>  		return -EINVAL;
>  
> +	msm_host->is_dual_panel = dsi->dual_panel;
>  	msm_host->channel = dsi->channel;
>  	msm_host->lanes = dsi->lanes;
>  	msm_host->format = dsi->format;
> @@ -2492,6 +2497,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>  	if (!msm_host->dsc)
>  		return MODE_OK;
>  
> +	if (msm_host->is_dual_panel)
> +		pic_width = mode->hdisplay / 2;
> +
>  	if (pic_width % dsc->slice_width) {
>  		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
>  		       pic_width, dsc->slice_width);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

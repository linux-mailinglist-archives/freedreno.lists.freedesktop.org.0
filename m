Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EFF83CE7B
	for <lists+freedreno@lfdr.de>; Thu, 25 Jan 2024 22:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D0010E901;
	Thu, 25 Jan 2024 21:24:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F3810E901
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 21:24:38 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2cddb2c2b54so74408811fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 13:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706217817; x=1706822617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eMti9UqjOHIvwe2jkr93A4vWwlT/U719vjlZLK4IDo0=;
 b=u0UbFlzKcZKZhyumx9bkvQFwqoRKHOVbu8/1jDojNxFBfwkJ5qDP9OfOxDewLweRve
 5kUe/VoNHzz60uhpEVfr08hA9muNQNRv1O1ZmaZqOBWwbJmeWOjW1RcCt8BG//daGSVT
 hJwJuQM3jlVm5sgYzc1p5o4yOITOCT3dleYS449at3pJP9qma9dpZDfMa6mRvTvifn6T
 4eHNbvdT/DcrHr43HkYStHkZE6hF3MoVrXLjkXyQrpiCvZCBSJz5zAD09zLw7PZab93i
 V4b9gKC3mTt1dg/yIKNLaJPxcvgt+vjFXPEj0EhPgNJ0gYjXobpS7H78JYUK9b0+o6Zu
 CXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706217817; x=1706822617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eMti9UqjOHIvwe2jkr93A4vWwlT/U719vjlZLK4IDo0=;
 b=VO0AcJFJyJ+F2BncmCftD6T2+PODPjOJfQ9CpxU208AjkK3x1hcsAPVV61c7syB7k3
 HUzpXLjw7zhUcIzsZUv1FYLTs3ZN3A4H+P2tpQVWi5KWyz8nNLKQUecwopZIhAq0W7g2
 Fu7ZPgEGVUBiQvxSiytEpJxGjNgzPwVWs1pxC51AW5MA6GbS+62Ko6c/DdC+eM1CU8MM
 De/be22lOKw7IuIH7N3q7w2Gy9WEGb9TquwZzfsRK12HzcvN7goqZ7ggLLf1TmGMgjTg
 /SL0LKoDypPmeAF22g3MGKS4IU5NPbpLmowpe1+PwTMpYNGgjYKfmA0e+05zwL/ZhRdg
 gziA==
X-Gm-Message-State: AOJu0Yy5dFoUTloWnyC0Uw5bI3cOaf9CNwJdpBaGz1h5fPR1Dtm2bNRA
 MdOpFW+2huqxz4SDbSByhZnCeQDN5cjEYxExSOOVj/vBKrsVRXZnnnKvtZz/kL8=
X-Google-Smtp-Source: AGHT+IG5FAYG5wdjdwQXIRiGG2+Js2nBfyyOCgeA+kg/BErh0akK2PU+mxWO9A2x4+tVNk08XmNyAQ==
X-Received: by 2002:ac2:5383:0:b0:510:c31:f6f2 with SMTP id
 g3-20020ac25383000000b005100c31f6f2mr458862lfh.25.1706217817142; 
 Thu, 25 Jan 2024 13:23:37 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a05651234d300b005101f0166b6sm199472lfr.14.2024.01.25.13.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:23:36 -0800 (PST)
Message-ID: <e1a13e45-e87c-4c7b-a5cb-f46d51e66058@linaro.org>
Date: Thu, 25 Jan 2024 23:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] drm/msm/dp: add an API to indicate if sink supports
 VSC SDP
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-6-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-6-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> YUV420 format is supported only in the VSC SDP packet and not through
> MSA. Hence add an API which indicates the sink support which can be used
> by the rest of the DP programming.

This API ideally should go to drm/display/drm_dp_helper.c

> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 35 +++++++++++++++++++++++++----
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>   3 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ddac55f45a722..f6b3b6ca242f8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1617,7 +1617,8 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>   		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
>   
>   	dp_display->dp_mode.out_fmt_is_yuv_420 =
> -		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
> +		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
> +		dp_panel_vsc_sdp_supported(dp_display->panel);
>   
>   	/* populate wide_bus_support to different layers */
>   	dp_display->ctrl->wide_bus_en =
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 127f6af995cd1..af7820b6d35ec 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -17,6 +17,9 @@ struct dp_panel_private {
>   	struct dp_link *link;
>   	struct dp_catalog *catalog;
>   	bool panel_on;
> +	bool vsc_supported;
> +	u8 major;
> +	u8 minor;
>   };
>   
>   static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
> @@ -43,9 +46,10 @@ static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
>   static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   {
>   	int rc;
> +	ssize_t rlen;
>   	struct dp_panel_private *panel;
>   	struct dp_link_info *link_info;
> -	u8 *dpcd, major, minor;
> +	u8 *dpcd, rx_feature;
>   
>   	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>   	dpcd = dp_panel->dpcd;
> @@ -53,10 +57,19 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   	if (rc)
>   		return rc;
>   
> +	rlen = drm_dp_dpcd_read(panel->aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature, 1);
> +	if (rlen != 1) {
> +		panel->vsc_supported = false;
> +		pr_debug("failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
> +	} else {
> +		panel->vsc_supported = !!(rx_feature & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);
> +		pr_debug("vsc=%d\n", panel->vsc_supported);
> +	}
> +
>   	link_info = &dp_panel->link_info;
>   	link_info->revision = dpcd[DP_DPCD_REV];
> -	major = (link_info->revision >> 4) & 0x0f;
> -	minor = link_info->revision & 0x0f;
> +	panel->major = (link_info->revision >> 4) & 0x0f;
> +	panel->minor = link_info->revision & 0x0f;
>   
>   	link_info->rate = drm_dp_max_link_rate(dpcd);
>   	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
> @@ -69,7 +82,7 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   	if (link_info->rate > dp_panel->max_dp_link_rate)
>   		link_info->rate = dp_panel->max_dp_link_rate;
>   
> -	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
> +	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", panel->major, panel->minor);
>   	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
>   	drm_dbg_dp(panel->drm_dev, "lane_count=%d\n", link_info->num_lanes);
>   
> @@ -280,6 +293,20 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
>   	dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
>   }
>   
> +bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel)
> +{
> +	struct dp_panel_private *panel;
> +
> +	if (!dp_panel) {
> +		pr_err("invalid input\n");
> +		return false;
> +	}
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +
> +	return panel->major >= 1 && panel->minor >= 3 && panel->vsc_supported;
> +}
> +
>   void dp_panel_dump_regs(struct dp_panel *dp_panel)
>   {
>   	struct dp_catalog *catalog;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 6ec68be9f2366..590eca5ce304b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -66,6 +66,7 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>   		struct drm_connector *connector);
>   void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
>   void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
> +bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel);
>   
>   /**
>    * is_link_rate_valid() - validates the link rate

-- 
With best wishes
Dmitry


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 770E84B5D4D
	for <lists+freedreno@lfdr.de>; Mon, 14 Feb 2022 22:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD51610E302;
	Mon, 14 Feb 2022 21:53:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E9E10E302
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 21:53:50 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id bn33so9078804ljb.6
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 13:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5UYOLxh4TlD6ViuNIkg6Jb9xRmU+W8ec1/tWgAbtnt8=;
 b=jZPWRFcDx1nna/L5OgRKUorwPX0ZWcMYlnY+MuXnln5sXYos8tRoKFsDrWHm//3epp
 UxgcdI+OzIQZlz3cyb1quqLEKsnuIuBFprWOyMO6S5mxyw/1dPYsleLs8e6v93h773TA
 q9ze9xjGvz/mzhKDdeUQQSSuSY7jedH5KfGdiyYNmkQEFab0hPv99tUNRo8enlw5wD5a
 mQHN26mf2lUmA4SvvMuGUKKaiY3IpGKtUgaxmbE5iR8UYuOrcPomI8roxBVgrn5ATmfi
 QqP66pdPJmJkQ2MVizSCNXKi3zANoS2hUQKQNM7r4tr/AgjPfEzVD/6NPgbjFVaCecYG
 x9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5UYOLxh4TlD6ViuNIkg6Jb9xRmU+W8ec1/tWgAbtnt8=;
 b=BX8RIRYkM0tKQQfi2ER7BH8WjFdIqnPiWWYwlKxk1AQlq/SOPxyuxhyjteJ3WlWJxW
 vm/XMBwOLV/VRbwF+Db0Lxja813LzPKdXn5UsAJELh0SluMbrNAYo3qScEIgNjC1W2L4
 g6Rb1y63MdczIcrjE94ZLx+09V0Ml6v3qVy7EoWFeetHuRVsdqYicyeaoAW8N8tvocdH
 BiyIxCj3JxSZOuNGVQZhtuApLx6OEdxjKe/r1b8yWt4nzq+4LSBXtX4pBnua5fAdOQaA
 CdhhWck+5tr0XjHsLdp9o3GdUvs39WG4d6kDCTBr+/6lVZD8RcbvvQlMdVR6Y6YhGBUz
 ZKPw==
X-Gm-Message-State: AOAM532SJAOZOQ4YKBlQ8OTmhI3oohArHlRF6PxaAzf0F9SLziwFb+FO
 oFyHDBhfQuceRrd2jq1uyUm9AQ==
X-Google-Smtp-Source: ABdhPJwm3GIZiCT8lvk98vyqmyMz9gjEsoBR3ML8UtMUVeiNpyTh7N6IYQlg3dD08Eszj4zvEMV9KA==
X-Received: by 2002:a05:651c:2121:: with SMTP id
 a33mr499102ljq.35.1644875629173; 
 Mon, 14 Feb 2022 13:53:49 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v18sm2300931lft.281.2022.02.14.13.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 13:53:48 -0800 (PST)
Message-ID: <2643f247-f9d7-2d28-3f39-490939ef8137@linaro.org>
Date: Tue, 15 Feb 2022 00:53:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@linux.ie, agross@kernel.org, bjorn.andersson@linaro.org
References: <1644875214-12944-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644875214-12944-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm: populate intf_audio_select()
 base on hardware capability
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 15/02/2022 00:46, Kuogee Hsieh wrote:
> intf_audio_select() callback function use to configure
> HDMI_DP_CORE_SELECT to decide audio output routes to HDMI or DP
> interface. HDMI is obsoleted at newer chipset. To keep supporting
> legacy hdmi application, intf_audio_select call back function have
> to be populated base on hardware chip capability where legacy
> chipsets have has_audio_select flag set to true.
> 
> Changes in V2:
> -- remove has_audio_select flag
> -- add BIT(DPU_MDP_AUDIO_SELECT) into dpu_mdp_cfg
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c     | 4 +++-
>   3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 272b14b..9c2df26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -265,7 +265,7 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
>   	.base = 0x0, .len = 0x45C,
> -	.features = 0,
> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.highest_bank_bit = 0x2,
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>   			.reg_off = 0x2AC, .bit_off = 0},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index e5a96d6..fb7b5b5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -87,6 +87,7 @@ enum {
>   	DPU_MDP_BWC,
>   	DPU_MDP_UBWC_1_0,
>   	DPU_MDP_UBWC_1_5,
> +	DPU_MDP_AUDIO_SELECT,
>   	DPU_MDP_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index 282e3c6..ab3ef16 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -268,7 +268,9 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>   	ops->get_danger_status = dpu_hw_get_danger_status;
>   	ops->setup_vsync_source = dpu_hw_setup_vsync_source;
>   	ops->get_safe_status = dpu_hw_get_safe_status;
> -	ops->intf_audio_select = dpu_hw_intf_audio_select;
> +
> +	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
> +		ops->intf_audio_select = dpu_hw_intf_audio_select;
>   }
>   
>   static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,


-- 
With best wishes
Dmitry

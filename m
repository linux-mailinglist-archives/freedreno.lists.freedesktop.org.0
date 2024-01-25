Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2876F83CE67
	for <lists+freedreno@lfdr.de>; Thu, 25 Jan 2024 22:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14F910EC9F;
	Thu, 25 Jan 2024 21:21:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F4310EC11
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 21:21:28 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2cf33b909e8so11011951fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 13:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706217627; x=1706822427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BLrlWFYstTsTJtWHkx0V41MjP6qrBm8WjHVjemyC3G0=;
 b=rtFkgG1xN2UE/H6ZRjspmE+DrdZNMngfSBjfQR15pW2qafdw4Wl6Y8PJJBk3iBzMEm
 oqQu4gbN1HiPwBllMJOWPaLDClJNqX2sI/jB6ApnVnTl7yngCwuuzlmQIrPlnW+kDthG
 H22KUwSlfeBYXIR4MXepyYWKD2qLfNrsF+goJWQPvY26gQBmYeDq//iRXYkblXX8k1/V
 VGgss2nSGrpGlyk8Wp4uW/e/7Zy/y6MFE0hDhzor3sQb4D0jKQg8QZqMqrC4Xxcjhavv
 MkYgUXlN2b8oLlbEmJCu0mYiq8mHpbCxBSS0Rr2BK1PjjihjjEO57EEtNQHk+F67JuaV
 7Rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706217627; x=1706822427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BLrlWFYstTsTJtWHkx0V41MjP6qrBm8WjHVjemyC3G0=;
 b=OtIitx08nNngKjBKYiDfPOKWkxC1yiqKFIB4FZnU924HUUHtynJrNb2uKo0Bdb7c1/
 MrOpFZ0Ghg9bjprKTGE4eaZZTK8iyGgyvRMmeHI3Yq3ZpS0fIvry2wV9RGLALU6fln6s
 bOwexLE2UrD+ELU0fDqhp58MTJUaw1AKNH4dk2ak0epM2fc8WxeVpsmMVGk/tE7/Ndy3
 nY5ntL7llXKdqMrPE4nHTwbA2eWF0qMj116ZLbXNcDIj9aXG6+bemDVt8UCMKXq/pKkV
 wkI753IZyFk412liHiOhGhVbECDzNgiUlCYaqTjar6NCHPqPpszwPQa7R6mMd5spT+ek
 ojRQ==
X-Gm-Message-State: AOJu0Yx6rkBmAHYCDdAXNZ1YAZDFzZ1E/VazN7I5sM4ZSBSzMyUy/EDY
 fzVUUyiZGYZO3h40+Od3xpRXDcMlJENDMArAZlBH8SiUFXDWhyvHwj520eU2U8E=
X-Google-Smtp-Source: AGHT+IH3i6HTno+Z6faG1+5ez7O4xYJPP++BGsJbxl78zsvgPngWzFj9zIjiBtKxDIIcDyQxV/S8sg==
X-Received: by 2002:a2e:b5d7:0:b0:2cf:73b:26ae with SMTP id
 g23-20020a2eb5d7000000b002cf073b26aemr66424ljn.22.1706217627223; 
 Thu, 25 Jan 2024 13:20:27 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a2e8043000000b002cd91d0ceefsm376763ljg.33.2024.01.25.13.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:20:26 -0800 (PST)
Message-ID: <0c6e94ef-4e9f-420b-92d9-785ee9f6ae30@linaro.org>
Date: Thu, 25 Jan 2024 23:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/dp: store mode YUV420 information to be
 used by rest of DP
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-5-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-5-quic_parellan@quicinc.com>
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
> Wide bus is not supported when the mode is YUV420 in DP. In preparation
> for changing the DPU programming to reflect this, the value and
> assignment location of wide_bus_en for the DP submodules must be
> changed. Move it from boot time in dp_init_sub_modules() to run time in
> dp_display_mode_set.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++----
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 9df2a8b21021e..ddac55f45a722 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -784,10 +784,6 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   		goto error_ctrl;
>   	}
>   
> -	/* populate wide_bus_supported to different layers */
> -	dp->ctrl->wide_bus_en = dp->wide_bus_supported;
> -	dp->catalog->wide_bus_en = dp->wide_bus_supported;
> -
>   	return rc;
>   
>   error_ctrl:
> @@ -808,6 +804,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
>   	drm_mode_copy(&dp->panel->dp_mode.drm_mode, &mode->drm_mode);
>   	dp->panel->dp_mode.bpp = mode->bpp;
>   	dp->panel->dp_mode.capabilities = mode->capabilities;
> +	dp->panel->dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;

Why do we need it in dp_panel too?

>   	dp_panel_init_panel_info(dp->panel);
>   	return 0;
>   }
> @@ -1402,6 +1399,9 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>   
>   	dp = container_of(dp_display, struct dp_display_private, dp_display);
>   
> +	if (dp->dp_mode.out_fmt_is_yuv_420)
> +		return false;
> +
>   	return dp->wide_bus_supported;
>   }
>   
> @@ -1615,6 +1615,15 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>   
>   	dp_display->dp_mode.h_active_low =
>   		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> +
> +	dp_display->dp_mode.out_fmt_is_yuv_420 =
> +		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
> +
> +	/* populate wide_bus_support to different layers */
> +	dp_display->ctrl->wide_bus_en =
> +		dp_display->dp_mode.out_fmt_is_yuv_420 ? false : dp_display->wide_bus_supported;
> +	dp_display->catalog->wide_bus_en =
> +		dp_display->dp_mode.out_fmt_is_yuv_420 ? false : dp_display->wide_bus_supported;
>   }
>   
>   void dp_bridge_hpd_enable(struct drm_bridge *bridge)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index a0dfc579c5f9f..6ec68be9f2366 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -19,6 +19,7 @@ struct dp_display_mode {
>   	u32 bpp;
>   	u32 h_active_low;
>   	u32 v_active_low;
> +	bool out_fmt_is_yuv_420;
>   };
>   
>   struct dp_panel_in {

-- 
With best wishes
Dmitry


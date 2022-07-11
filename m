Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3D4570543
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 16:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76DD14A26D;
	Mon, 11 Jul 2022 14:18:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0D314A8A0
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 14:18:42 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id bx13so6391483ljb.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=b7SdKMYg4SycbRSH1mMmTVYESP88FDzn0X5ZB9E+lyY=;
 b=kVbTSc+CYmzNm6oox7k33Ru8QpP56OKO/76x+uEbG+KMsOVUxMZTdqnnkavvwQvnbg
 wSXQ9O22gYvP/TGdptZFJ8WlXHmgKOyLaj5MWc0NZCgHBLxDMHkPpH2PfD/w6o+JERtb
 Y+39KDrNkqZZ/3y5Rxg8FbfsVjSUldB5qf3k1awmm4yjmJHViFndEA8D5oqhdp1GoaFq
 yPH5qedGvjQ3wIs4eE/N51uoyqbRsdPjG5I1e4PCWQXS6GAC1tNuF2akyOT5A3WYB3H1
 6lNuczaq+KYoYkmMtaG49tX+N3AwjxG9CCCYpBl1ERwYzCgnKGGdBz92DTeT3gtjaD5b
 Dc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b7SdKMYg4SycbRSH1mMmTVYESP88FDzn0X5ZB9E+lyY=;
 b=CmdHp4SHzVInvG1xl7//dUrtdIKtjcQxyzp0uJWv6sLMAzdCQPBovnWkP9Tf7uq1G2
 JkbcqXw4FJE9+bIMZNY5NdTa854a1dD3OFr2JEEo+Vm1qCQqPhfK5K3NX4TT59MMLK+U
 T3M8dEqKM0yzK8UqkA6trytC6lS5maOL7MN3uqaYuRtwuqVDl+JkDldr0Fo4Azt/6nIU
 b22yyq8cE2+kbpkprHAkBkus3A98VFTh11t0RTKKwcEa+bBWjBKd5ufPdPWCayMWDo3y
 pqmatRyhstUWyHXOlibLuN5IHylLHrKjQYHC8iHrEu9zGfzZQCZjXVUGI5mP4R3M5g3p
 9PaQ==
X-Gm-Message-State: AJIora/O05wzjemDZl79LJGssJhKAMwMhSt/GeP9/vnzHD9oBRNWW7Vv
 9eADS57kquP90O4jyoI/70wECg==
X-Google-Smtp-Source: AGRyM1t+rcO7zLukhnTeAtr9wIv+TuBRN1t7cwF6Uf/ZBblf78k0lNSJjmUIwhyMfpXMCyvCTeD9Ig==
X-Received: by 2002:a2e:240e:0:b0:25d:71af:f9b5 with SMTP id
 k14-20020a2e240e000000b0025d71aff9b5mr1582330ljk.253.1657549120884; 
 Mon, 11 Jul 2022 07:18:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a05651203e100b0047255d21124sm1573863lfq.83.2022.07.11.07.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 07:18:40 -0700 (PDT)
Message-ID: <ef5d82ec-22ab-298f-740d-e86cb7fe3046@linaro.org>
Date: Mon, 11 Jul 2022 17:18:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-6-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657544224-10680-6-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 05/10] drm/msm/dp: use the eDP bridge ops
 to validate eDP modes
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-kernel@vger.kernel.org, quic_khsieh@quicinc.com, robdclark@gmail.com,
 bjorn.andersson@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/07/2022 15:56, Vinod Polimera wrote:
> The eDP and DP interfaces shared the bridge operations and
> the eDP specific changes were implemented under is_edp check.
> To add psr support for eDP, we started using a new set of eDP
> bridge ops. We are moving the eDP specific code in the
> dp_bridge_mode_valid function to a new eDP function,
> edp_bridge_mode_valid under the eDP bridge ops.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  8 --------
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 34 +++++++++++++++++++++++++++++++++-
>   2 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 64a6254..2b3ec6b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -986,14 +986,6 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>   		return -EINVAL;
>   	}
>   
> -	/*
> -	 * The eDP controller currently does not have a reliable way of
> -	 * enabling panel power to read sink capabilities. So, we rely
> -	 * on the panel driver to populate only supported modes for now.
> -	 */
> -	if (dp->is_edp)
> -		return MODE_OK;
> -
>   	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
>   		return MODE_BAD;
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 8ca0b37..2bf8c8d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -181,12 +181,44 @@ static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>   	dp_bridge_atomic_post_disable(drm_bridge, old_bridge_state);
>   }
>   
> +/**
> + * edp_bridge_mode_valid - callback to determine if specified mode is valid
> + * @bridge: Pointer to drm bridge structure
> + * @info: display info
> + * @mode: Pointer to drm mode structure
> + * Returns: Validity status for specified mode
> + */
> +static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
> +					  const struct drm_display_info *info,
> +					  const struct drm_display_mode *mode)
> +{
> +	struct msm_dp *dp;
> +	int mode_pclk_khz = mode->clock;
> +
> +	dp = to_dp_bridge(bridge)->dp_display;
> +
> +	if (!dp || !mode_pclk_khz || !dp->connector) {
> +		DRM_ERROR("invalid params\n");
> +		return -EINVAL;
> +	}
> +
> +	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
> +		return MODE_CLOCK_HIGH;
> +
> +	/*
> +	 * The eDP controller currently does not have a reliable way of
> +	 * enabling panel power to read sink capabilities. So, we rely
> +	 * on the panel driver to populate only supported modes for now.
> +	 */
> +	return MODE_OK;
> +}
> +
>   static const struct drm_bridge_funcs edp_bridge_ops = {
>   	.atomic_enable = edp_bridge_atomic_enable,
>   	.atomic_disable = edp_bridge_atomic_disable,
>   	.atomic_post_disable = edp_bridge_atomic_post_disable,
>   	.mode_set = dp_bridge_mode_set,
> -	.mode_valid = dp_bridge_mode_valid,
> +	.mode_valid = edp_bridge_mode_valid,
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>   	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,


-- 
With best wishes
Dmitry

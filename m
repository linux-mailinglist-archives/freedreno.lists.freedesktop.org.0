Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58DE730AE9
	for <lists+freedreno@lfdr.de>; Thu, 15 Jun 2023 00:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709DC10E469;
	Wed, 14 Jun 2023 22:45:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A27B10E469
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 22:45:05 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f6170b1486so237362e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 15:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686782703; x=1689374703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pFmEys4UP/BgwQm19UOfZJrlXyJD3pmyho65CpiqnbY=;
 b=P0xkljwPwEIx9AiLfTQ52OF2brfwDB4iX2e7Jv+LzXTgBkI/ZnBRbTtlAc7Bh4YMqO
 EEXq38ZzvaHMHJqQFYknBcSu1UmHdfOedsuvIeYhAjrX2BUHKUhF4JKDySzJ2dpDa4O1
 STA9E2hLePlmYiY0a091mZSsm6CrsqbcOEAoUMjJrGOKOxZwID0WFgNlrlrZuv+7hxBp
 nSnm2wB/3L1FKvBLMexFx0C69lhhJjibpN6Ovyg7JgXz9G6RI9jBkY8tWtHIPelfdvEb
 aFmtko2M4jIJNuyG5LafYw9GiVLS0Be1FFpoHkLSH1Xi/ZnAWrbMpv21T9t3/VmELmeO
 +GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686782703; x=1689374703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pFmEys4UP/BgwQm19UOfZJrlXyJD3pmyho65CpiqnbY=;
 b=PTMwIwIGF5SdLyJrAvoKXeoGBEpGb1+HCuIQPZky5dQ2F0soRacsv+7WdrzbBgQFif
 Em6avjWzC/0Dx1etnaR/S/LtRNES4zL8BlHouMzhj+PjbS7TI9job3A3EexlXRmoTXqJ
 SvGJ93HXuchvmPbmQG4IDuAcaM8+Nn5rKGI3GgOAKmp+n3JLPDi/jvl21GTsQW2CwUqc
 nGtBmwaI40nc5l+q8xAjOlRXRiS98D2XuRVYrhEzXE4EUzel5Hz8R2kt7TR/MhKANgPl
 uI/GMNyT4kTLI2vAZJgzl5u0HOVdBllxUiz2EZ54Vaxb1tSMb2aomu7pxecNHh31nxmY
 3LKg==
X-Gm-Message-State: AC+VfDy7IBs2ilfqGWg3e2ln9OObkIbSdSsw7XPVUU+CSmDUGb/XoeYF
 NKUNU0zNBiYNxlNcCCZfV3ShHw==
X-Google-Smtp-Source: ACHHUZ41d/xGmuzPjif6jwX/W74Tm1loth6hzxERHcbhrFmHVvv22kop8/IE1XX6TbWVmyC2w1FOkQ==
X-Received: by 2002:a05:6512:45a:b0:4f6:5473:7bf0 with SMTP id
 y26-20020a056512045a00b004f654737bf0mr1184339lfk.21.1686782703414; 
 Wed, 14 Jun 2023 15:45:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r23-20020ac252b7000000b004f2ce4b0f2esm2288991lfm.168.2023.06.14.15.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 15:45:02 -0700 (PDT)
Message-ID: <a1322d43-d1e6-059d-6428-f0da843a00b1@linaro.org>
Date: Thu, 15 Jun 2023 01:45:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230608-b4-add-burst-mode-v1-1-55dfbcfada55@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230608-b4-add-burst-mode-v1-1-55dfbcfada55@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Enable BURST_MODE for command
 mode for DSI 6G v1.3+
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/06/2023 02:37, Jessica Zhang wrote:
> During a frame transfer in command mode, there could be frequent
> LP11 <-> HS transitions when multiple DCS commands are sent mid-frame or
> if the DSI controller is running on slow clock and is throttled. To
> minimize frame latency due to these transitions, it is recommended to
> send the frame in a single burst.
> 
> This feature is supported for DSI 6G 1.3 and above, thus enable burst
> mode if supported.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 744f2398a6d6..8254b06dca85 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -994,6 +994,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_TOTAL,
>   			DSI_CMD_MDP_STREAM0_TOTAL_H_TOTAL(hdisplay) |
>   			DSI_CMD_MDP_STREAM0_TOTAL_V_TOTAL(mode->vdisplay));
> +
> +		if (msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
> +				msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3)
> +			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2,
> +					DSI_CMD_MODE_MDP_CTRL2_BURST_MODE);

Please move this to dsi_ctrl_config(), the place where we set all the 
configs. Also please change this to RMW cycle.

>   	}
>   }
>   
> 
> ---
> base-commit: dd969f852ba4c66938c71889e826aa8e5300d2f2
> change-id: 20230608-b4-add-burst-mode-a5bb144069fa
> 
> Best regards,

-- 
With best wishes
Dmitry


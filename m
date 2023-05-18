Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6F67076EA
	for <lists+freedreno@lfdr.de>; Thu, 18 May 2023 02:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E2110E4BB;
	Thu, 18 May 2023 00:29:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97C910E4BC
 for <freedreno@lists.freedesktop.org>; Thu, 18 May 2023 00:29:19 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ac7462d9f1so15210851fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 17:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684369757; x=1686961757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pMLuQJkkWUIG735JKAhMLw4oEj/3anAW1mVncUC7mjw=;
 b=H7z5cBIXpN5FTsSanBfGOB4kpl2eaokFry+HmgUTCbqdbsMplob9BgYmIsblq6MO0e
 QycaO+g7ndT18ra6EiX+xig90XMcM8mIr5Rf1CpvcBDmXvSGhIz9byb9RS0H9xZnD+R0
 yMwe0pWpw3tJ+A+MH5V/lEIbxUoH8I9Mr5n8w43yk7mG6mUPvHQB/5NVCqhXaA6f0+UL
 H7UYywEJIb6qj56HnsJ2HGnZs39gLXk27KWQLxVKnVu0Fok1ifLmaHeprLcGTLlMqBlI
 f1gsmAlsC5ddBSKJgUXTrQHcwUaP2osfa3Q4kHKhwQMpm6BRpvEvWNy6cQQp67Dts5+B
 F+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684369757; x=1686961757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pMLuQJkkWUIG735JKAhMLw4oEj/3anAW1mVncUC7mjw=;
 b=ZRg3qXnTZ35XjcqzAjyUbKAbg7bkOzvk4kjt8vuQm5scts9O5cuHJBPGIkc23VBLGG
 KUHWcCumDx3lgw1uo93+eMJZnyIXAgvpRrEWKRXCro+pKHiXsrwqDG4ai/+coEP0f8I6
 O/Evngh0EgZjV68ZmZ+F/qZMmIodWro1V/ekzlgut0J2lvceQviw+ExwPpT/uJAUhzNE
 JwS1QNsYa46XPVyX033iC0F6Y5CuQ3eSO+yglgNV+ZUYEyGMP8Te7B9gWGEBs0EeIjJV
 esJ4/CeZx6V/K+ZCPIF6xGh57TRlXNAT1qPT2cKqzVFMkBIFdTRNbZdwPvNu3r5OPLbS
 StOQ==
X-Gm-Message-State: AC+VfDw1xUXqIN3dbN4QP10nobyfFMIAcaHTpvX+//T98HzU4JnZQpo8
 Ygm5VaSVKC1QKP9jOWIFoSc+4w==
X-Google-Smtp-Source: ACHHUZ4egjksffobtvh370QPgDyVzW0IVj9dAA8nRwiQGzhHSKt2nIOlgjpfefT1edJmhhnt1zgM5w==
X-Received: by 2002:a19:7005:0:b0:4f2:6a9d:9a31 with SMTP id
 h5-20020a197005000000b004f26a9d9a31mr577428lfc.51.1684369757439; 
 Wed, 17 May 2023 17:29:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h3-20020ac25963000000b004f2543be9dbsm64733lfp.5.2023.05.17.17.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 17:29:16 -0700 (PDT)
Message-ID: <4f8807d7-f16f-2a5c-c319-c7cdea56d737@linaro.org>
Date: Thu, 18 May 2023 03:29:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1684360919-28458-4-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v10 3/8] drm/msm/dpu: Guard PINGPONG DSC ops
 behind DPU_PINGPONG_DSC bit
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/05/2023 01:01, Kuogee Hsieh wrote:
> DPU < 7.0.0 has DPU_PINGPONG_DSC feature bit set to indicate it requires
> both dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() to be
> executed to complete DSC configuration if DSC hardware block is present.
> Hence test DPU_PINGPONG_DSC feature bit and assign DSC related functions
> to the ops of PINGPONG block accordingly if DPU_PINGPONG_DSC bit is set.
> 
> Changes in v6:
> -- split patches, this patch has function handles DPU_PINGPONG_DSC bit
> 
> Changes in v9:
> -- the original code of assigning dsc related functions to the ops of pingpong

line too long

>     block without testing the DPU_PINGPONG_DSC feature bit was restored back
>     due to rebase error which defeat the purpose of this patch. Remove those
>     error code.
> 
> Changes in v10:
> -- change commit title
> -- correct texts at changes in v9
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 79e4576..437d9e6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -291,9 +291,12 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>   		c->ops.get_line_count = dpu_hw_pp_get_line_count;
>   		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
>   	}
> -	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> -	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> -	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +
> +	if (test_bit(DPU_PINGPONG_DSC, &features)) {
> +		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +	}
>   
>   	if (test_bit(DPU_PINGPONG_DITHER, &features))
>   		c->ops.setup_dither = dpu_hw_pp_setup_dither;

-- 
With best wishes
Dmitry


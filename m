Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EB86DE71B
	for <lists+freedreno@lfdr.de>; Wed, 12 Apr 2023 00:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C28010E107;
	Tue, 11 Apr 2023 22:17:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED2610E047
 for <freedreno@lists.freedesktop.org>; Tue, 11 Apr 2023 22:17:21 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id i6so560046lfp.1
 for <freedreno@lists.freedesktop.org>; Tue, 11 Apr 2023 15:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681251439; x=1683843439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YZyUOASgExhF30LjNQ41eGkCS/vfjzdSaSnhxhM63Ck=;
 b=lcvg1vWS/bkdJlOWf8z6hh5bj/Yu9IFc5rBB2HZ4EcdOWmSBi1qepkWi+zVad/LQKx
 E50NrOUdnoXoPbrWK0/4ji5eBoH4RJCfKrhORZnFVp1h0nAqldt04QZS4WqeQ6/wicww
 LwHNnB3fi3NcOIhg4n6VD1mL01c9M32Xc6yApX8akulyI3b+aklUynPu1124W1qOzIlD
 NLbNFWVac8pZjaxqvhPTvWhANWtBlt4EdexU6Eur0CrqluwNLj370L/jVL7IKfqGqjLg
 DIsY6358PgeDbx/rntImSIywdOQyaNSMD1ITbNfLGOnIH7BRUbNsufWgpAjdFDnU0VOy
 WgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681251439; x=1683843439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YZyUOASgExhF30LjNQ41eGkCS/vfjzdSaSnhxhM63Ck=;
 b=trEDYqyTU6piXTOm9uYxOlX6sJ4y1Vb1QttJ22eHgvsKsgJCqa8zznr3VqpZy9wm+w
 lQYiofCN/icJ0hGeh1JbOVX7cmo6JZmoi4gR0hNjIDLhXasZOjrQM60YtpspRcayN08k
 kQuXiwgIqCAy0Pz20pStzsf/FWDqbYvQmrCCcsiUsvzTs48eAxBPAfp2Z4N8Sm9yvaez
 kPW/F4pgTY8WPSuk7uX7WyxcTXwunnY6CzgFjWMy6LXz/mOsVLLp5SCFi3REIdvZKLNU
 oHUPGQqNMXBwk6TzZsrHhrsFNlSheBXBxSySDHILAdHCxboQHv4AGVGTHVm0JuvbrJ4E
 wMbw==
X-Gm-Message-State: AAQBX9dd/RnMSnTkeSYm5EnOgAJdJvGkn7pglO4jb943Vot95Z0RXg9m
 cuTDpFuuf91WoyVdGHHqP8KLUw==
X-Google-Smtp-Source: AKy350ZBOK0SaKJPGnFnIZHsueajzDe6qTwVnM7E1/+6bHqNmgIm8oaBqfNP7Q6f05CXQ1eplHfRAQ==
X-Received: by 2002:ac2:55a4:0:b0:4ec:857d:9c94 with SMTP id
 y4-20020ac255a4000000b004ec857d9c94mr36989lfg.15.1681251439037; 
 Tue, 11 Apr 2023 15:17:19 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o28-20020ac2495c000000b004eb0eafaa02sm2709428lfi.243.2023.04.11.15.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 15:17:18 -0700 (PDT)
Message-ID: <30585d08-88ca-e3a9-6f83-128d49d1d1fc@linaro.org>
Date: Wed, 12 Apr 2023 01:17:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org
References: <1681247095-1201-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1681247095-1201-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: always program dsc active bits
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/04/2023 00:04, Kuogee Hsieh wrote:
> In current code, the dsc active bits are set only if the cfg->dsc is set.
> However, for displays which are hot-pluggable, there can be a use-case
> of disconnecting a DSC supported sink and connecting a non-DSC sink.
> 
> For those cases we need to clear DSC active bits during teardown.

Please correct me if I'm wrong here, shouldn't we start using 
reset_intf_cfg() during teardown / unplug?

> 
> Fixes: ede3c6bb00c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index bbdc95c..88e4efe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -541,10 +541,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->merge_3d)
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
> -	if (cfg->dsc) {
> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> -		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> -	}
> +
> +	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> +	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>   }
>   
>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,

-- 
With best wishes
Dmitry


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C280565AEA4
	for <lists+freedreno@lfdr.de>; Mon,  2 Jan 2023 10:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F01210E1A0;
	Mon,  2 Jan 2023 09:29:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDED10E1A0
 for <freedreno@lists.freedesktop.org>; Mon,  2 Jan 2023 09:29:08 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id i19so15672018ljg.8
 for <freedreno@lists.freedesktop.org>; Mon, 02 Jan 2023 01:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=54SvQg7V4G/yUh34P1HenewD+ErkpsXyiXw5J7ZoDjA=;
 b=W1dFFFJQ94xENzXF4W1kr5P5CDMV8x20VuJoghbLlglWHn8ADNBIL1ONLGH6XssNvK
 MmNu50NfeWZOPQWTnAJzGDkxCHPZwPtcZ6rNWwHAQDDmAqROm5vmUFaAQ5PFi3fKfwbA
 xhI+mjiOf3ELU3c8DGzfPxENe1Egg34m+dkG1X/JF6XvGHU8pFJuygYiE7V8OudPWTOJ
 lR/MDOBNGq6xFTZse/m7bzxf3Mq2fpo2qOFXFNe7BQLgz2twsRpKbgt7iKQjqihx0FR5
 KRUq5hR4Iqz4DKedaBFWF3vDe7hwwuMA1FnJ/GwMMgzuH/YT0BK2iqDO/hO8nKQy02KO
 s35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=54SvQg7V4G/yUh34P1HenewD+ErkpsXyiXw5J7ZoDjA=;
 b=xvagDyCZ/2B9kcwqHjDhs1uJ6kSsQq5QQlmrYSWeADXGgi8jwwiZVQnpwAnLbTIEzn
 PCwwE/Er9mEtfuZtbDilwhAb/dLS+XD3K8Snur/27cINpt1zq5ncd7FHypxmgyKrOF6t
 2b4ryMTqn0aLl03G6ep1Pv2kiBMKAjmpbtRudX0caRY3rkyQOzs3ZK6e0CVGHzr3M3jJ
 HzaN3+QKsSoocvABp+W1rLcc3j4cVXYcazcm5hdt16JW5ybD8KMcPOxNyhzGvOcwbx1y
 rEIJ0YBEc4adMJ6/KJbjDQgWePtn1moSOZHr3EwpTdqa0vCr9olZga/B8+FK06PmdzPs
 qCfA==
X-Gm-Message-State: AFqh2krspphplCP+ctEj4Z7dM0VOq8c4YoLSvZgBv+Bza7OEvh5CVr4e
 CJ6/GN/k18IuCA3y3AY+ASRU+A==
X-Google-Smtp-Source: AMrXdXtedchdcPFKbA0yA741M6X/8cIi4PDMmyDbu2yHmKpgVk0+RWUIRZS0TRgijzMsK4XvP6/xTA==
X-Received: by 2002:a2e:8396:0:b0:27b:5596:1e4d with SMTP id
 x22-20020a2e8396000000b0027b55961e4dmr9977811ljg.34.1672651746779; 
 Mon, 02 Jan 2023 01:29:06 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a2ea495000000b00279e41de7e6sm3216902lji.3.2023.01.02.01.29.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 01:29:06 -0800 (PST)
Message-ID: <62310fb8-4159-36e1-07cc-21b248daf198@linaro.org>
Date: Mon, 2 Jan 2023 10:29:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-2-marijn.suijten@somainline.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221231215006.211860-2-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 1/7] drm/msm/dpu: Remove unused INTF0
 interrupt mask from sm6115/qcm2290
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Adam Skladowski <a39.skl@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 31.12.2022 22:50, Marijn Suijten wrote:
> Neither of these SoCs has INTF0, they only have a DSI interface on index
> 1.  Stop enabling an interrupt that can't fire.
Double space.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Konrad
> 
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 2196e205efa5..9814ad52cc04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -90,6 +90,11 @@
>  			 BIT(MDP_AD4_0_INTR) | \
>  			 BIT(MDP_AD4_1_INTR))
>  
> +#define IRQ_QCM2290_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF1_INTR))
> +
>  #define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>  			 BIT(MDP_SSPP_TOP0_INTR2) | \
>  			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> @@ -1884,7 +1889,7 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sm6115_perf_data,
> -	.mdss_irqs = IRQ_SC7180_MASK,
> +	.mdss_irqs = IRQ_QCM2290_MASK,
>  };
>  
>  static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
> @@ -2008,7 +2013,7 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
>  	.reg_dma_count = 1,
>  	.dma_cfg = &sdm845_regdma,
>  	.perf = &qcm2290_perf_data,
> -	.mdss_irqs = IRQ_SC7180_MASK,
> +	.mdss_irqs = IRQ_QCM2290_MASK,
>  };
>  
>  static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {

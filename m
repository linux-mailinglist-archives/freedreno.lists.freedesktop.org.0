Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8C36FEAAA
	for <lists+freedreno@lfdr.de>; Thu, 11 May 2023 06:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC1E10E593;
	Thu, 11 May 2023 04:32:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AE910E593
 for <freedreno@lists.freedesktop.org>; Thu, 11 May 2023 04:32:22 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ac81d2bfbcso87169001fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 10 May 2023 21:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683779540; x=1686371540;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/fZFm+JnD3HFWQBsOX43ZNxNVH7brnnd/ur7Hm3Pkxg=;
 b=CXZF7Z20QEgTREai8N9LOpTty5Bke8VUoaSb4+5TPg7hT50ChZJe5n7yWLr5AYkzcJ
 NxzoVOV0qfE4O0If5SsIqh2q1xAnlUXPcfnS9a7TLy3FOdXdeUT2yBkV3UgFl18fyJ3E
 bfgDZwzrzwmh5caYfpbSBmgk+BEcWl2atgdmoOAaKv76cazSNpOQBPj+nvfZtFfrVZz3
 tW+Y1hMjtMpvYmN3UuiI6cAiDCk0VEepY4O71h37FY09xOXJrttRsC6MjSelRSwiuCJL
 wJhoz5yvsRSVFpn4PNIAicxgELINAdXwFLRAQHjxvM8AIgG9BCQk5YYzOHxQT6LwLcVY
 vGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683779540; x=1686371540;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/fZFm+JnD3HFWQBsOX43ZNxNVH7brnnd/ur7Hm3Pkxg=;
 b=kltIXupJ+IG6h8mjrRdiMB4DeRBUZNvW5AcPiNiaEc9KjFxeXwRBNr91AXbE/RQAil
 IZr6oeIN3/HjLlAjRKFSsEK/dqB9/tFLEBkzHzI24UrAXx4lR5UENz+Q6Wv+1zF9KzQ4
 QrAzG1LQOs+SRHRYbgqSL1KvHZn/j5Rq8tkBmZv9dxs4hu+M6piXkT/72ncTGgWZbleN
 /723ZdfI4ud1qRNKVKqvSf2CfGY4WUKdj80I93+iDlST83tsbytoHKbdtnZFc12zIKE+
 Tro+2VZGmuVMXl7t3umI4NGdtaqHFBkgyDp7XJjWcDZu06ZRHkbYNvs5RnQT0b7QSNHd
 5d4w==
X-Gm-Message-State: AC+VfDytYdjZQVQad0e9uqrr5s1CLc+e0sBUSkm8T3msd3KyEoNttIl7
 xshxa4AtuCfvPVJLZ7W19yysiw==
X-Google-Smtp-Source: ACHHUZ6apjC2HOcRzLnDFGzNFE7HRyDFwjWl+ULrE2cF5wbMaZ5Aj7O+iD+E7Y4dMT5duaVR9DWVKw==
X-Received: by 2002:a2e:884e:0:b0:2ac:7304:c94d with SMTP id
 z14-20020a2e884e000000b002ac7304c94dmr2976098ljj.41.1683779540595; 
 Wed, 10 May 2023 21:32:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b004db1a7e6decsm966447lff.205.2023.05.10.21.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 21:32:20 -0700 (PDT)
Message-ID: <f3685a18-7431-dfd5-ce84-f0ad3a21fc57@linaro.org>
Date: Thu, 11 May 2023 07:32:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
 <1683756453-22050-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683756453-22050-4-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 3/8] drm/msm/dpu: test DPU_PINGPONG_DSC
 bit before assign DSC ops to PINGPONG
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

On 11/05/2023 01:07, Kuogee Hsieh wrote:
> DPU < 7.0.0 has DPU_PINGPONG_DSC feature bit set to indicate it requires
> both dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() to be
> executed to complete DSC configuration if DSC hardware block is present.
> Hence test DPU_PINGPONG_DSC feature bit and assign DSC related functions
> to the ops of PINGPONG block accordingly if DPU_PINGPONG_DSC bit is set.
> 
> changes in v6:
> -- split patches and keep the function file handles DPU_PINGPONG_DSC bit at this patch
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 6 ++++++
>   1 file changed, 6 insertions(+)

For the patch itself:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 79e4576..e7f47a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -295,6 +295,12 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>   	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>   	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>   
> +	if (test_bit(DPU_PINGPONG_DSC, &features)) {
> +		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +	}
> +
>   	if (test_bit(DPU_PINGPONG_DITHER, &features))
>   		c->ops.setup_dither = dpu_hw_pp_setup_dither;
>   };

-- 
With best wishes
Dmitry


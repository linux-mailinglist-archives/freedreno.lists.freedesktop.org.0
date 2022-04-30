Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26433515FD3
	for <lists+freedreno@lfdr.de>; Sat, 30 Apr 2022 20:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC7710E3FE;
	Sat, 30 Apr 2022 18:33:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173B410E1F1
 for <freedreno@lists.freedesktop.org>; Sat, 30 Apr 2022 18:33:46 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id p12so19192766lfs.5
 for <freedreno@lists.freedesktop.org>; Sat, 30 Apr 2022 11:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AV6sbWrPg6V/b41EM5Ank+SmBTXdaOFBjgTZNzUyUgQ=;
 b=b6uDRXUhwKdVNAHjuXeRGJr1L8RJoJTUkc0FOKTL4j1+kGJNbWujysc9OYA9AlQT2O
 ceodXdjqUfKxyySwd58WMsf6GAcB2riotDaAWikKc7E46e80CEybqLvZK3jmzLMEXZjy
 1i+yI40myeaxY4nrzTdDFBh4459pbgPxdYP8s3wtRAOg+sj/RPaJILML4i+Q6H066T/W
 YoVBJXT80eNvz/zHSepbFBP/zhv+Ff3LrglVzHXGvhhmOo3WIfEeFzb9svwkgdIb8xvQ
 tSB7eBcYW/Ce9djCUAq1kKPoiNlnEOa5/0NvdxOMb90sr8Xbmczyu/xVK2DNrpLlyYIk
 GFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AV6sbWrPg6V/b41EM5Ank+SmBTXdaOFBjgTZNzUyUgQ=;
 b=q8RfCSj7glEPrHsKuQruwSA+SjPc6r+6GGTTB+uFgiJObMyhcZYfo3HZTZD+KmPb0q
 vkLbNxyulC3joXxH1SmtXSkaAtd85loL1khrRxJ7XrSfWnXjCv3mWdljzbOjKIEEwftF
 nve7NP8PqNQ3NPn/cHIcSsiE4WbapbEnwQdFfJQZINibGVrcEqL0NudzWjW4zdkpA1DF
 Y+YKzSbSwXRoB3bTWIksE5iykdjY11Aup4qG5gLPq+ns22jDTRtKQagKBTpxVQPOyf5K
 HmGi+UBe1xbk/B7YlPEEYHAhmYw/pjz2ol25XaoSc7PZ6KFWR30vL1NP0Q8SFIRCOImW
 FekA==
X-Gm-Message-State: AOAM5302yNNUOgt9nzgwrMPrSVdVEv+cBXg2EZRVLchm3xbyXm33XN5F
 TVCpoqggfc5l25MQxolBDbKdAw==
X-Google-Smtp-Source: ABdhPJwJ5dKEwnh34HUKsP4FEsNgfA56bMSwplFlXMbVBq/CC01S0eEHH0kx6Pw3h4V0hF3lOrfw5g==
X-Received: by 2002:a05:6512:1516:b0:448:39b8:d603 with SMTP id
 bq22-20020a056512151600b0044839b8d603mr3662345lfb.599.1651343624430; 
 Sat, 30 Apr 2022 11:33:44 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a05651c038600b0024f3d1dae88sm603515ljp.16.2022.04.30.11.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:33:44 -0700 (PDT)
Message-ID: <9b3891d6-4553-5757-e4b0-9900723267f7@linaro.org>
Date: Sat, 30 Apr 2022 21:33:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20220430161529.605843-1-konrad.dybcio@somainline.org>
 <20220430161529.605843-3-konrad.dybcio@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220430161529.605843-3-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/disp: dpu1: Properly sort
 qcm2290_dpu_caps
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Loic Poulain <loic.poulain@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, jamipkettunen@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 martin.botka@somainline.org, Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/04/2022 19:15, Konrad Dybcio wrote:
> Due to MSM8998 support having been stuck in review for so long,
> another struct was added nearby, which confused git and resulted
> in the definitions not being sorted alphabetically. Fix it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 22 +++++++++----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0a217b5172bd..6e904d28824c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -254,6 +254,17 @@ static const struct dpu_caps msm8998_dpu_caps = {
>   	.max_vdeci_exp = MAX_VERT_DECIMATION,
>   };
>   
> +static const struct dpu_caps qcm2290_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x4,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = 2160,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
>   static const struct dpu_caps sdm845_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0xb,
> @@ -417,17 +428,6 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
>   	},
>   };
>   
> -static const struct dpu_caps qcm2290_dpu_caps = {
> -	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> -	.max_mixer_blendstages = 0x4,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> -	.ubwc_version = DPU_HW_UBWC_VER_20,
> -	.has_dim_layer = true,
> -	.has_idle_pc = true,
> -	.max_linewidth = 2160,
> -	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> -};
> -
>   static const struct dpu_mdp_cfg sdm845_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,


-- 
With best wishes
Dmitry

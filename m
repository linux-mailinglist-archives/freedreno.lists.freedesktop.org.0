Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C029C693136
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 14:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BF810E0E3;
	Sat, 11 Feb 2023 13:19:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA0510E0E3
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 13:19:12 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id rp23so22018102ejb.7
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 05:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QoCibpSqg2rz3F023zEQU7EC9jiWBnWIK3VDqI2xikw=;
 b=nN5YFYUg/UBSTsTyuYNbFNNjUAw4XYL1W8wijeqs6KHgCMJz5zjOLoi5txXFBfEUmA
 yPWeNpe0rBv7OkeDEoOjYttPq8OngGp1zdQnc13aos0XvDwEEVHu6NwXQeX3ScGVtr/h
 uFt/keHjYcQyz/ePck4cKiGGeOhiZaMNDvc7HNFlkirB2A0ISX8psje/UVkjoA9rdoym
 7nbQAcD/9alt2htUYhxx0RPvnVZC6YMsdYyY4ge3hJmAxyk7q4HzEkj0KYfpBnyV6ivg
 S1QjdhJJlozxi95oiWvlXCMUXjImE8IY4W4FsfIv/4siVypYQM0pY5J7/p0E/Y5SOaL0
 kS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QoCibpSqg2rz3F023zEQU7EC9jiWBnWIK3VDqI2xikw=;
 b=ZfEmaYzc5orKCKpha1Tr/Ln7utlHBLn7jr5AF62QB3Us00d6ulezFGJXoXIgjK2U/w
 HJQ3Yxu0eBA18ihYWR1UksGKs2Bce7feTYRsGQfehguQRoFY3OKWeXvCznFC/RplWvfs
 SXtd9K9Cz8z3l19FUAOMrxrB2h1G2nzi11V1Cvg/6XkYbMkFXl4jkIM6wgrLt3uXTT9m
 AjlC/WhYwjzs9M4VfSeHnpqDu23KGGjKhS91MvSq+n2T3oOawB0tWv1GaomsKKoc02Jf
 uO2XtFAY1musrkxg/MVSIg05KEKS8Vxi2JnP6C0bTFrTINOyLKGwwYdX9dLM5wRalu5B
 1sRA==
X-Gm-Message-State: AO0yUKWtfGYyQkUNiPvHUmV62I0fecWsT+k+5oORrxmfNyiJk0LHmcRw
 T9q8TlxHvNu9XB9hUxGmOv7eJQ==
X-Google-Smtp-Source: AK7set/QtagN9d/76+8jrm/L7TGfLWwfG7p4rczHRYj2w7dbNQAdsDmKkIIsucDulPPQoUOuyIpllA==
X-Received: by 2002:a17:907:720b:b0:8a5:8620:575 with SMTP id
 dr11-20020a170907720b00b008a586200575mr25527352ejc.3.1676121550728; 
 Sat, 11 Feb 2023 05:19:10 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a170906469200b007c0f217aadbsm3819770ejr.24.2023.02.11.05.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 05:19:10 -0800 (PST)
Message-ID: <71b63ae5-1b2c-b0a9-913c-99b657133f0f@linaro.org>
Date: Sat, 11 Feb 2023 15:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
 <20230211115110.1462920-4-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211115110.1462920-4-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 03/10] drm/msm/dsi: Zero-terminate
 msm_dsi_config::io_start
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 David Airlie <airlied@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/02/2023 13:51, Konrad Dybcio wrote:
> In preparation for supporting multiple sets of possible base registers,
> Zero-terminate the array that contains them to remove the need of
> specifying num_dsi for each set.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 39 ++++++++++--------------------
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  4 +--
>   drivers/gpu/drm/msm/dsi/dsi_host.c |  2 +-
>   3 files changed, 16 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 068d45b3a8f0..5f62c563bd1c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -22,9 +22,8 @@ static const struct msm_dsi_config apq8064_dsi_cfg = {
>   	.bus_clk_names = dsi_v2_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_v2_bus_clk_names),
>   	.io_start = {
> -		{ 0x4700000, 0x5800000 },
> +		{ 0x4700000, 0x5800000, 0 },
>   	},
> -	.num_dsi = 2,
>   };
>   
>   static const char * const dsi_6g_bus_clk_names[] = {
> @@ -44,9 +43,8 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
>   	.bus_clk_names = dsi_6g_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
>   	.io_start = {
> -		{ 0xfd922800, 0xfd922b00 },
> +		{ 0xfd922800, 0xfd922b00, 0 },
>   	},
> -	.num_dsi = 2,
>   };
>   
>   static const char * const dsi_8916_bus_clk_names[] = {
> @@ -65,9 +63,8 @@ static const struct msm_dsi_config msm8916_dsi_cfg = {
>   	.bus_clk_names = dsi_8916_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
>   	.io_start = {
> -		{ 0x1a98000 },
> +		{ 0x1a98000, 0 },
>   	},
> -	.num_dsi = 1,
>   };
>   
>   static const char * const dsi_8976_bus_clk_names[] = {
> @@ -86,9 +83,8 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
>   	.bus_clk_names = dsi_8976_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
>   	.io_start = {
> -		{ 0x1a94000, 0x1a96000 },
> +		{ 0x1a94000, 0x1a96000, 0 },
>   	},
> -	.num_dsi = 2,
>   };
>   
>   static const struct regulator_bulk_data msm8994_dsi_regulators[] = {
> @@ -107,9 +103,8 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
>   	.bus_clk_names = dsi_6g_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
>   	.io_start = {
> -		{ 0xfd998000, 0xfd9a0000 },
> +		{ 0xfd998000, 0xfd9a0000, 0 },
>   	},
> -	.num_dsi = 2,
>   };
>   
>   static const char * const dsi_8996_bus_clk_names[] = {
> @@ -129,9 +124,8 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
>   	.bus_clk_names = dsi_8996_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
>   	.io_start = {
> -		{ 0x994000, 0x996000 },
> +		{ 0x994000, 0x996000, 0 },
>   	},
> -	.num_dsi = 2,
>   };
>   
>   static const char * const dsi_msm8998_bus_clk_names[] = {
> @@ -150,9 +144,8 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
>   	.bus_clk_names = dsi_msm8998_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
>   	.io_start = {
> -		{ 0xc994000, 0xc996000 },
> +		{ 0xc994000, 0xc996000, 0 },
>   	},
> -	.num_dsi = 2,
>   };
>   
>   static const char * const dsi_sdm660_bus_clk_names[] = {
> @@ -170,9 +163,8 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
>   	.bus_clk_names = dsi_sdm660_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
>   	.io_start = {
> -		{ 0xc994000, 0xc996000 },
> +		{ 0xc994000, 0xc996000, 0 },
>   	},
> -	.num_dsi = 2,
>   };
>   
>   static const char * const dsi_sdm845_bus_clk_names[] = {
> @@ -194,9 +186,8 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>   	.bus_clk_names = dsi_sdm845_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
>   	.io_start = {
> -		{ 0xae94000, 0xae96000 },
> +		{ 0xae94000, 0xae96000, 0 },
>   	},
> -	.num_dsi = 2,
>   };
>   
>   static const struct regulator_bulk_data sm8550_dsi_regulators[] = {
> @@ -210,9 +201,8 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>   	.bus_clk_names = dsi_sdm845_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
>   	.io_start = {
> -		{ 0xae94000, 0xae96000 },
> +		{ 0xae94000, 0xae96000, 0 },
>   	},
> -	.num_dsi = 2,
>   };
>   
>   static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
> @@ -226,9 +216,8 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
>   	.bus_clk_names = dsi_sc7180_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
>   	.io_start = {
> -		{ 0xae94000 },
> +		{ 0xae94000, 0 },
>   	},
> -	.num_dsi = 1,
>   };
>   
>   static const char * const dsi_sc7280_bus_clk_names[] = {
> @@ -246,9 +235,8 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>   	.bus_clk_names = dsi_sc7280_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
>   	.io_start = {
> -		{ 0xae94000, 0xae96000 },
> +		{ 0xae94000, 0xae96000, 0 },
>   	},
> -	.num_dsi = 2,
>   };
>   
>   static const char * const dsi_qcm2290_bus_clk_names[] = {
> @@ -266,9 +254,8 @@ static const struct msm_dsi_config qcm2290_dsi_cfg = {
>   	.bus_clk_names = dsi_qcm2290_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
>   	.io_start = {
> -		{ 0x5e94000 },
> +		{ 0x5e94000, 0 },
>   	},
> -	.num_dsi = 1,
>   };
>   
>   static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index df9f09876ccb..03493cc6b772 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -41,8 +41,8 @@ struct msm_dsi_config {
>   	int num_regulators;
>   	const char * const *bus_clk_names;
>   	const int num_bus_clks;
> -	const resource_size_t io_start[VARIANTS_MAX][DSI_MAX];
> -	const int num_dsi;
> +	/* Allow + 1 entry for the zero-terminator */
> +	const resource_size_t io_start[VARIANTS_MAX][DSI_MAX + 1];
>   };
>   
>   struct msm_dsi_host_cfg_ops {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 22ba8726b0ea..f5092b4d0757 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1868,7 +1868,7 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
>   	if (!res)
>   		return -EINVAL;
>   
> -	for (i = 0; i < cfg->num_dsi; i++) {
> +	for (i = 0; cfg->io_start[0][i]; i++) {
>   		if (cfg->io_start[0][i] == res->start)
>   			return i;
>   	}

I think we have the easier way to do this: always loop towards DSI_MAX. 
Empty cells will contain the value of 0 which can not match against 
valid starting address.

Also please shift this patch to the first place, it will be logical to 
add VARIANT_MAX after removing num_dsi.

-- 
With best wishes
Dmitry


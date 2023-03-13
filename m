Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C746B8667
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 00:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31EC10E67A;
	Mon, 13 Mar 2023 23:55:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5FD10E67D
 for <freedreno@lists.freedesktop.org>; Mon, 13 Mar 2023 23:55:54 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0577F2013B;
 Tue, 14 Mar 2023 00:55:51 +0100 (CET)
Date: Tue, 14 Mar 2023 00:55:50 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <20230313235550.zo243m5qn23yadey@SoMainline.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
 <20230307-topic-dsi_qcm-v3-4-8bd7e1add38a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-topic-dsi_qcm-v3-4-8bd7e1add38a@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 04/10] drm/msm/dsi: dsi_cfg: Deduplicate
 identical structs
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
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-03-07 14:01:42, Konrad Dybcio wrote:
> Some structs were defined multiple times for no apparent reason.
> Deduplicate them.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Seems a bit inconsistent to name some of these with their DSI host
revision, and keep some named after the SoC.  Also in the name of
msm_dsi_config.  Regardless:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 77 +++++++++++++--------------------------
>  1 file changed, 26 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 6c192963c100..d39521850018 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -47,41 +47,32 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
>  	},
>  };
>  
> -static const char * const dsi_8916_bus_clk_names[] = {
> +static const char * const dsi_v1_3_1_clk_names[] = {
>  	"mdp_core", "iface", "bus",
>  };
>  
> -static const struct regulator_bulk_data msm8916_dsi_regulators[] = {
> +static const struct regulator_bulk_data dsi_v1_3_1_regulators[] = {
>  	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
>  	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
>  };
>  
>  static const struct msm_dsi_config msm8916_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
> -	.regulator_data = msm8916_dsi_regulators,
> -	.num_regulators = ARRAY_SIZE(msm8916_dsi_regulators),
> -	.bus_clk_names = dsi_8916_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
> +	.regulator_data = dsi_v1_3_1_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_v1_3_1_regulators),
> +	.bus_clk_names = dsi_v1_3_1_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v1_3_1_clk_names),
>  	.io_start = {
>  		{ 0x1a98000 },
>  	},
>  };
>  
> -static const char * const dsi_8976_bus_clk_names[] = {
> -	"mdp_core", "iface", "bus",
> -};
> -
> -static const struct regulator_bulk_data msm8976_dsi_regulators[] = {
> -	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
> -	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
> -};
> -
>  static const struct msm_dsi_config msm8976_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
> -	.regulator_data = msm8976_dsi_regulators,
> -	.num_regulators = ARRAY_SIZE(msm8976_dsi_regulators),
> -	.bus_clk_names = dsi_8976_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
> +	.regulator_data = dsi_v1_3_1_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_v1_3_1_regulators),
> +	.bus_clk_names = dsi_v1_3_1_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v1_3_1_clk_names),
>  	.io_start = {
>  		{ 0x1a94000, 0x1a96000 },
>  	},
> @@ -107,10 +98,6 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
>  	},
>  };
>  
> -static const char * const dsi_8996_bus_clk_names[] = {
> -	"mdp_core", "iface", "bus", "core_mmss",
> -};
> -
>  static const struct regulator_bulk_data msm8996_dsi_regulators[] = {
>  	{ .supply = "vdda", .init_load_uA = 18160 },	/* 1.25 V */
>  	{ .supply = "vcca", .init_load_uA = 17000 },	/* 0.925 V */
> @@ -121,8 +108,8 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.regulator_data = msm8996_dsi_regulators,
>  	.num_regulators = ARRAY_SIZE(msm8996_dsi_regulators),
> -	.bus_clk_names = dsi_8996_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
> +	.bus_clk_names = dsi_6g_bus_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
>  	.io_start = {
>  		{ 0x994000, 0x996000 },
>  	},
> @@ -167,24 +154,20 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
>  	},
>  };
>  
> -static const char * const dsi_sdm845_bus_clk_names[] = {
> +static const char * const dsi_v2_4_clk_names[] = {
>  	"iface", "bus",
>  };
>  
> -static const char * const dsi_sc7180_bus_clk_names[] = {
> -	"iface", "bus",
> -};
> -
> -static const struct regulator_bulk_data sdm845_dsi_regulators[] = {
> +static const struct regulator_bulk_data dsi_v2_4_regulators[] = {
>  	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
>  };
>  
>  static const struct msm_dsi_config sdm845_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
> -	.regulator_data = sdm845_dsi_regulators,
> -	.num_regulators = ARRAY_SIZE(sdm845_dsi_regulators),
> -	.bus_clk_names = dsi_sdm845_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
> +	.regulator_data = dsi_v2_4_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>  	.io_start = {
>  		{ 0xae94000, 0xae96000 },
>  	},
> @@ -198,32 +181,24 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.regulator_data = sm8550_dsi_regulators,
>  	.num_regulators = ARRAY_SIZE(sm8550_dsi_regulators),
> -	.bus_clk_names = dsi_sdm845_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>  	.io_start = {
>  		{ 0xae94000, 0xae96000 },
>  	},
>  };
>  
> -static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
> -	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
> -};
> -
>  static const struct msm_dsi_config sc7180_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
> -	.regulator_data = sc7180_dsi_regulators,
> -	.num_regulators = ARRAY_SIZE(sc7180_dsi_regulators),
> -	.bus_clk_names = dsi_sc7180_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
> +	.regulator_data = dsi_v2_4_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>  	.io_start = {
>  		{ 0xae94000 },
>  	},
>  };
>  
> -static const char * const dsi_sc7280_bus_clk_names[] = {
> -	"iface", "bus",
> -};
> -
>  static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
>  	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
>  };
> @@ -232,8 +207,8 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.regulator_data = sc7280_dsi_regulators,
>  	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
> -	.bus_clk_names = dsi_sc7280_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>  	.io_start = {
>  		{ 0xae94000, 0xae96000 },
>  	},
> 
> -- 
> 2.39.2
> 

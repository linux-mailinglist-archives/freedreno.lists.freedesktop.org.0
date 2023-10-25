Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E577F7D646C
	for <lists+freedreno@lfdr.de>; Wed, 25 Oct 2023 10:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9080810E56E;
	Wed, 25 Oct 2023 08:04:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AE510E588
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 08:04:06 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7788fb06997so368616385a.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 01:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698221045; x=1698825845; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3fwMcGLJ7nYe8SSHVZ+HO50S7Dp0i12qC/S3ZP8EfBY=;
 b=kD63pOgO/fPAffTym8Ar47X3BwyQsS36mhqDtgCSR9COnA8ZMhyT/feIaV/oQAJAX9
 kFBPfbFSJSt/1+tuIfeb5174whLpS8URvRU2id8OLFhwCRMxGGNJAnP4M4mlGtGGFYO5
 shYxEGkXbXTponvDhfxqJ5VSgLJKKUqnCIWM/4Z1MddmHkhm+OIHnHUE80/LQX04dQJf
 bLhS+RNdjsbx0EiB9cSDWD55rJFeX1USJTqY7NdOr396bPN5+UWYIIIxBB+KuhBuiSmv
 nsh1Edttop1cDJXJTYg9ZaQyZ3hZtBhzNuSFl/hV1inFEvPDARIMaBG6jrIlwC6/+VLw
 WlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698221045; x=1698825845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3fwMcGLJ7nYe8SSHVZ+HO50S7Dp0i12qC/S3ZP8EfBY=;
 b=bSoRGry6ec9Sft14M0td+JaCmihQKdcUKphD+o2j0AYaCtH7kq5teKcZNthVi8FaP8
 yZJmMoyA78zSv1XcqF59/SiOoPV+BrBO1Sm+qemTd29eqmIspm3nGaqMN4QtlcCq1F2k
 UV3lARWHv988NKuZ2hew4Oci6wBB76w2xY7E9ARm6B0QfjhodaVtqVqxTf490VDGbX3c
 F+HS7F2EXAtRqF45awZVaMaVC6c+F8rXy0ap1Bype0C7jKMO7Lu+D1uK89kWas+GC51e
 fC29Ed4NmRCrxDtO/ekBvDsSjZhwAN4Uj8Is7IuKVuCHyelH1BDR8vXXdVdljoETsV09
 u64Q==
X-Gm-Message-State: AOJu0YxvN5xYs26A9kkdYTlbWEqQjYQtF9ChnPYA76hxGR1uRxnT/+QK
 m3B3oz2c0MQmdoRoG+H+akwlfpiONZi17VDMuO5qtg==
X-Google-Smtp-Source: AGHT+IHGl11EIegvL/m7wJAmFPHRjo9ndjP1xqa+xYpJHUe09/aZADzdf21iKb/J6OYzZwnVFQxLUhc6iEzbpmkMiPM=
X-Received: by 2002:a05:620a:164a:b0:778:96eb:e7d9 with SMTP id
 c10-20020a05620a164a00b0077896ebe7d9mr14770645qko.19.1698221045386; Wed, 25
 Oct 2023 01:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
 <20231025-topic-sm8650-upstream-mdss-v1-7-bb219b8c7a51@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-mdss-v1-7-bb219b8c7a51@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Oct 2023 11:03:54 +0300
Message-ID: <CAA8EJpr+QGBFchG9aXJLxyhbMwMWZF6RjSVOpORkP_KFrV=P1A@mail.gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 7/8] drm/msm: dsi: add support for DSI-PHY
 on SM8650
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 25 Oct 2023 at 10:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add DSI PHY support for the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 27 +++++++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 05621e5e7d63..7612be6c3618 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -585,6 +585,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>           .data = &dsi_phy_5nm_8450_cfgs },
>         { .compatible = "qcom,sm8550-dsi-phy-4nm",
>           .data = &dsi_phy_4nm_8550_cfgs },
> +       { .compatible = "qcom,sm8650-dsi-phy-4nm",
> +         .data = &dsi_phy_4nm_8650_cfgs },
>  #endif
>         {}
>  };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 8b640d174785..e4275d3ad581 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -62,6 +62,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
>
>  struct msm_dsi_dphy_timing {
>         u32 clk_zero;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 3b1ed02f644d..c66193f2dc0d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -1121,6 +1121,10 @@ static const struct regulator_bulk_data dsi_phy_7nm_37750uA_regulators[] = {
>         { .supply = "vdds", .init_load_uA = 37550 },
>  };
>
> +static const struct regulator_bulk_data dsi_phy_7nm_98000uA_regulators[] = {
> +       { .supply = "vdds", .init_load_uA = 98000 },
> +};
> +
>  static const struct regulator_bulk_data dsi_phy_7nm_97800uA_regulators[] = {
>         { .supply = "vdds", .init_load_uA = 97800 },
>  };
> @@ -1281,3 +1285,26 @@ const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
>         .num_dsi_phy = 2,
>         .quirks = DSI_PHY_7NM_QUIRK_V5_2,
>  };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs = {

So, this is the same as sm8550 config, just using 400 uA less? I
wonder if it makes sense to go for setting the regulator mode instead
of setting the load.

Nevertheless (unless you'd like to reuse sm8550 config entry):

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +       .has_phy_lane = true,
> +       .regulator_data = dsi_phy_7nm_98000uA_regulators,
> +       .num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
> +       .ops = {
> +               .enable = dsi_7nm_phy_enable,
> +               .disable = dsi_7nm_phy_disable,
> +               .pll_init = dsi_pll_7nm_init,
> +               .save_pll_state = dsi_7nm_pll_save_state,
> +               .restore_pll_state = dsi_7nm_pll_restore_state,
> +               .set_continuous_clock = dsi_7nm_set_continuous_clock,
> +       },
> +       .min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +       .max_pll_rate = 5000000000UL,
> +#else
> +       .max_pll_rate = ULONG_MAX,
> +#endif
> +       .io_start = { 0xae95000, 0xae97000 },
> +       .num_dsi_phy = 2,
> +       .quirks = DSI_PHY_7NM_QUIRK_V5_2,
> +};
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

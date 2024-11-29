Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEBF9DE802
	for <lists+freedreno@lfdr.de>; Fri, 29 Nov 2024 14:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92DB10E524;
	Fri, 29 Nov 2024 13:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R2eV/khG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4897010E524
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 13:50:46 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e3985aabf43so659152276.3
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 05:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732888245; x=1733493045; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7WQXtZAjWFqN8mKK3853FsLiUq722zhwbqGIVz24roM=;
 b=R2eV/khG4oLg8GBs6FW7eqNgYaXSsBBN1lSBFqyLvoC24XmENkU+OGDpidiIN4KnSX
 m65lVilXJ0ZTAGfxsmYZB/nINutj1Rb6Wvh/C3/fMmN9OpolXmjnZyQHsa56H3gc1cBS
 onNeRHtdACZY6H+9x2d/Q1cCtfVwX8VeWmCd6XeQEzR1CyLPT1lbmhE23SMtvQSfTrb3
 AR8uRBoUjtVVYEK/HmbhRZhyO/Yg/LxUxLVfDZpdB0aY7hb7ZZxD4JCiAdPw8u0YvP3p
 iG6Fk1LcehJT2fSlXfI08u0tuHsQIgnojOZSOxF1RkGHgIaO/R0t4aeCDsqU3Fj8LcSL
 Eisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732888245; x=1733493045;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7WQXtZAjWFqN8mKK3853FsLiUq722zhwbqGIVz24roM=;
 b=vsBLloQ2thy5JY0gLeS1k/KE9tkiTMgMayHSXiTV7ke/izbBIzzzEHRdIpQHPF0/IQ
 mwaVFPvgl7Qc3uzk7ifSy16Xu6P3PQRV67r3TjhdiDSBiepXtVL0LveW946uylv97Qc+
 8xBol3UxMAx2W+cHQVPlc4/JryhFhrQoWyzY7bXkgyojmKFTt2l22nkGeGoVmo2Zam8z
 IagH1KUaVO8TTomWXEMe0xHTGH3FEJIwa/hWWMCs/xCAmVMemtWUCvtdLM5f3cQQzT7u
 5G5ydittezoC64/OvkuAHqUqd4qeqlliwXs1W2tucJWgita+3Vth1jPnbEr9B8yV+yWH
 PTZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFv1VmDyEf2rI7DIylmH1dktKnjcvigtrzFZxOVsqrf2CRYrlKDDdASUYL4nRQiu82Sul+iuBe7Pk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMgdV/ZtWPwmK74NSSniy0P4VARoPGm1vFvONy1m9dsYyByaxT
 6LkzzV6sGFtY5rfBtv8yR21Hb47kYKmg3GKENqrwSTPjo9h1sC7eIQ5Aay0QsQ2fzRelzlr1sCS
 Giq6JPtR8JUdAsM4EBcmpL3Yu2M9AuaydT5Ifng==
X-Gm-Gg: ASbGnctaJn/i5D1cmT4/QcSJxto5qGat9B2JBN7YgBKcgizEJ4kCBVKtfqHpw8EuTfr
 19oyFWRWV0rwd0xEqZiH+ILKu/Sj7EC8=
X-Google-Smtp-Source: AGHT+IE0BIIdCa1JDpOjyTRYlwlbjuOqEl95UYxl+xvUnPElLVGBvG1eFLCUkRkyHmX0HZXqS4NsAg2SmNUQAHEPcuE=
X-Received: by 2002:a05:6902:2b0e:b0:e38:f30e:9b52 with SMTP id
 3f1490d57ef6-e395b8698e0mr9367911276.4.1732888245294; Fri, 29 Nov 2024
 05:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-5-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-5-09a4338d93ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:50:40 +0200
Message-ID: <CAA8EJpoY8hySQd00yODGeHjSpVZpEBLjF3aBiKGJPUhpr-2mgw@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/msm/dp: Add support for lane mapping configuration
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>
> Add the ability to configure lane mapping for the DP controller. This is
> required when the platform's lane mapping does not follow the default
> order (0, 1, 2, 3). The mapping rules are now configurable via the
> `data-lane` property in the devicetree. This property defines the
> logical-to-physical lane mapping sequence, ensuring correct lane
> assignment for non-default configurations.
>
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 11 +++++------
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 ++++++++++---
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +++
>  5 files changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index b4c8856fb25d01dd1b30c5ec33ce821aafa9551d..34439d0709d2e1437e5669fd0b995936420ee16f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -361,17 +361,16 @@ void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32
>         msm_dp_write_link(catalog, REG_DP_CONFIGURATION_CTRL, cfg);
>  }
>
> -void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog)
> +void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog, u32 *l_map)

lane_map, not l_map.

>  {
>         struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
>                                 struct msm_dp_catalog_private, msm_dp_catalog);
> -       u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
>         u32 ln_mapping;
>
> -       ln_mapping = ln_0 << LANE0_MAPPING_SHIFT;
> -       ln_mapping |= ln_1 << LANE1_MAPPING_SHIFT;
> -       ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
> -       ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
> +       ln_mapping = l_map[0] << LANE0_MAPPING_SHIFT;
> +       ln_mapping |= l_map[1] << LANE1_MAPPING_SHIFT;
> +       ln_mapping |= l_map[2] << LANE2_MAPPING_SHIFT;
> +       ln_mapping |= l_map[3] << LANE3_MAPPING_SHIFT;
>
>         msm_dp_write_link(catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
>                         ln_mapping);
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index e932b17eecbf514070cd8cd0b98ca0fefbe81ab7..8b8de2a7d3ad561c1901e1bdaad92d4fab12e808 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -69,7 +69,7 @@ u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
>  /* DP Controller APIs */
>  void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 state);
>  void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 config);
> -void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog);
> +void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog, u32 *l_map);
>  void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog, bool enable);
>  void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable);
>  void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index bc2ca8133b790fc049e18ab3b37a629558664dd4..49c8ce9b2d0e57a613e50865be3fe98e814d425a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -177,7 +177,7 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
>  {
>         u32 cc, tb;
>
> -       msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
> +       msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog, ctrl->panel->lane_map);
>         msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
>         msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 5d7eaa31bf3176566f40f01ff636bee64e81c64f..8654180aa259234bbd41f4f88c13c485f9791b1d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -11,7 +11,6 @@
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>
> -#define DP_MAX_NUM_DP_LANES    4
>  #define DP_LINK_RATE_HBR2      540000 /* kbytes */
>
>  struct msm_dp_panel_private {
> @@ -461,6 +460,7 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>         struct msm_dp_panel_private *panel;
>         struct device_node *of_node;
>         int cnt;
> +       u32 lane_map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3};
>
>         panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>         of_node = panel->dev->of_node;
> @@ -474,10 +474,17 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>                 cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>         }
>
> -       if (cnt > 0)
> +       if (cnt > 0) {
> +               struct device_node *endpoint;
> +
>                 msm_dp_panel->max_dp_lanes = cnt;
> -       else
> +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
> +               of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
> +       } else {
>                 msm_dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> +       }

Why? This sounds more like dp_catalog or (after the refactoring at
[1]) dp_ctrl. But not the dp_panel.

[1] https://patchwork.freedesktop.org/project/freedreno/series/?ordering=-last_updated

> +
> +       memcpy(msm_dp_panel->lane_map, lane_map, msm_dp_panel->max_dp_lanes * sizeof(u32));
>
>         msm_dp_panel->max_dp_link_rate = msm_dp_panel_link_frequencies(of_node);
>         if (!msm_dp_panel->max_dp_link_rate)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 0e944db3adf2f187f313664fe80cf540ec7a19f2..7603b92c32902bd3d4485539bd6308537ff75a2c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -11,6 +11,8 @@
>  #include "dp_aux.h"
>  #include "dp_link.h"
>
> +#define DP_MAX_NUM_DP_LANES    4
> +
>  struct edid;
>
>  struct msm_dp_display_mode {
> @@ -46,6 +48,7 @@ struct msm_dp_panel {
>         bool video_test;
>         bool vsc_sdp_supported;
>
> +       u32 lane_map[DP_MAX_NUM_DP_LANES];
>         u32 max_dp_lanes;
>         u32 max_dp_link_rate;
>
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry

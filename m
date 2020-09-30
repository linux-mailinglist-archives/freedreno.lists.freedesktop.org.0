Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C6D27E3A0
	for <lists+freedreno@lfdr.de>; Wed, 30 Sep 2020 10:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390756E4D0;
	Wed, 30 Sep 2020 08:25:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315D26E4D0
 for <freedreno@lists.freedesktop.org>; Wed, 30 Sep 2020 08:25:00 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id gm14so108992pjb.2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Sep 2020 01:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=Ih3Pf7dIckvl94DJrioHSJL6mLp1o8KK854dwJlM+Rs=;
 b=Em/QYk4SOtwtQfC93qj80aLMdohAEkXpKPQMNnnimYd6cibrUc0PP6c6gTiXNuwndZ
 F91fPBs2LSDnssoHox5OuIFhJo9o5hf4fVOqt/CfCbUfcgQIlc5rN8nOipdZGlVJGYJp
 aAXZhUHLRrdirwWia/mxcXUmKrjoli8f5LzZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=Ih3Pf7dIckvl94DJrioHSJL6mLp1o8KK854dwJlM+Rs=;
 b=fnwafgVwQ4Y5gkvadc0/X6cHEz0HsP5z8GdMr7aQjkBQ6G/xCun1HplqzgCDjIJ2le
 Yn25TeEBjE8/4yZk4PF6yc4+ZW1xS+m0IOMpUfBxxi25y12KFrzPcFt7/hLhlziB6DFv
 Tu6+eoZq6ejMNC4P/U88/Fk+yJd0C/j/rgqkDMq7WGqKH2JoAFfj4MwqLW4bzf2jlobm
 5iPsVu8Qrt9CUlhaaCRdNi+qYDzxeTHLPczwBCYFM7K3sJJDndbCuqwAwiDwivbPO00z
 38iuzmf+3XM2lC5xZPkowaxQBGs5D5j5G38qrTuiLkfrS7b9pgj8AIFM/HZmw5WCfQqF
 yT7Q==
X-Gm-Message-State: AOAM532+xQfk3xjoV6cr9KWpZRkYSq/JsZOJ7hopJGZpetaJ5AcUVt1v
 jdBNt7n3rIaGMbNtHGkEbwlOJw==
X-Google-Smtp-Source: ABdhPJwIjYUNfZxO9sE2E4scR1kFmz0HCtyEz7PYrdueptBYstuv8MxM5HVdr6ppqtp8M8tTYAFMLg==
X-Received: by 2002:a17:90b:384c:: with SMTP id
 nl12mr1418467pjb.205.1601454299646; 
 Wed, 30 Sep 2020 01:24:59 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id e207sm1483922pfh.171.2020.09.30.01.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 01:24:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200929171026.30551-1-khsieh@codeaurora.org>
References: <20200929171026.30551-1-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Wed, 30 Sep 2020 01:24:57 -0700
Message-ID: <160145429763.310579.786737478429183087@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: add voltage corners voting
 support base on dp link rate
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
Cc: rnayak@codeaurora.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-09-29 10:10:26)
> Set link rate by using OPP set rate api so that CX level will be set
> accordingly base on the link rate.

s/base/based/

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 2e3e1917351f..e1595d829e04 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1849,6 +1853,21 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>                 return ERR_PTR(-ENOMEM);
>         }
>  
> +       ctrl->opp_table = dev_pm_opp_set_clkname(dev, "ctrl_link");
> +
> +       if (IS_ERR(ctrl->opp_table)) {
> +               dev_err(dev, "invalid DP OPP table in device tree\n");
> +               ctrl->opp_table = NULL;
> +       } else {
> +               /* OPP table is optional */
> +               ret = dev_pm_opp_of_add_table(dev);
> +               if (ret && ret != -ENODEV) {
> +                       dev_err(dev, "add DP OPP table\n");

This is debug noise right?

> +                       dev_pm_opp_put_clkname(ctrl->opp_table);
> +                       ctrl->opp_table = NULL;
> +               }
> +       }
> +
>         init_completion(&ctrl->idle_comp);
>         init_completion(&ctrl->video_comp);
>  
> @@ -1864,6 +1883,18 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>         return &ctrl->dp_ctrl;
>  }
>  
> -void dp_ctrl_put(struct dp_ctrl *dp_ctrl)
> +void dp_ctrl_put(struct device *dev, struct dp_ctrl *dp_ctrl)
>  {
> +       struct dp_ctrl_private *ctrl;
> +
> +       if (!dp_ctrl)

Can this happen?

> +               return;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +       if (ctrl->opp_table != NULL) {

This is usually written as

	if (ctrl->opp_table)

> +               dev_pm_opp_of_remove_table(dev);
> +               dev_pm_opp_put_clkname(ctrl->opp_table);
> +               ctrl->opp_table = NULL;
> +       }
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index f60ba93c8678..19b412a93e02 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -31,6 +31,6 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>                         struct dp_panel *panel, struct drm_dp_aux *aux,
>                         struct dp_power *power, struct dp_catalog *catalog,
>                         struct dp_parser *parser);
> -void dp_ctrl_put(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_put(struct device *dev, struct dp_ctrl *dp_ctrl);

Is 'dev' not inside 'dp_ctrl'?

>  
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index 17c1fc6a2d44..3d75bf09e38f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -8,12 +8,14 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/pm_opp.h>
>  #include "dp_power.h"
>  #include "msm_drv.h"
>  
>  struct dp_power_private {
>         struct dp_parser *parser;
>         struct platform_device *pdev;
> +       struct device *dev;
>         struct clk *link_clk_src;
>         struct clk *pixel_provider;
>         struct clk *link_provider;
> @@ -148,18 +150,49 @@ static int dp_power_clk_deinit(struct dp_power_private *power)
>         return 0;
>  }
>  
> +static int dp_power_clk_set_link_rate(struct dp_power_private *power,
> +                       struct dss_clk *clk_arry, int num_clk, int enable)
> +{
> +       u32 rate;
> +       int i, rc = 0;
> +
> +       for (i = 0; i < num_clk; i++) {
> +               if (clk_arry[i].clk) {
> +                       if (clk_arry[i].type == DSS_CLK_PCLK) {
> +                               if (enable)
> +                                       rate = clk_arry[i].rate;
> +                               else
> +                                       rate = 0;
> +
> +                               rc = dev_pm_opp_set_rate(power->dev, rate);

Why do we keep going if rc is non-zero?

> +                       }
> +
> +               }
> +       }
> +       return rc;
> +}
> +
>  static int dp_power_clk_set_rate(struct dp_power_private *power,
>                 enum dp_pm_type module, bool enable)
>  {
>         int rc = 0;
>         struct dss_module_power *mp = &power->parser->mp[module];
>  
> -       if (enable) {
> -               rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
> +       if (module == DP_CTRL_PM) {
> +               rc = dp_power_clk_set_link_rate(power, mp->clk_config, mp->num_clk, enable);
>                 if (rc) {
> -                       DRM_ERROR("failed to set clks rate.\n");
> +                       DRM_ERROR("failed to set link clks rate.\n");
>                         return rc;
>                 }
> +       } else {
> +
> +               if (enable) {
> +                       rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
> +                       if (rc) {
> +                               DRM_ERROR("failed to set clks rate.\n");

Not sure we need the period on these error messages.

> +                               return rc;
> +                       }
> +               }
>         }
>  
>         rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
> 
> base-commit: 3c0f462da069af12211901ddf26f7e16e6951d9b
> prerequisite-patch-id: a109eaf08147f50149ad661a58122b6745a52445

Can you rebase this on Rob's msm-next tree
(https://gitlab.freedesktop.org/drm/msm.git) and test? It doesn't apply
for me because I have the dp phy patch from there.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

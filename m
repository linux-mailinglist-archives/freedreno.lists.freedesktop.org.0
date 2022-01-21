Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC6F4958E9
	for <lists+freedreno@lfdr.de>; Fri, 21 Jan 2022 05:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EFA10E383;
	Fri, 21 Jan 2022 04:30:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD64A10E383
 for <freedreno@lists.freedesktop.org>; Fri, 21 Jan 2022 04:30:24 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s22so11978624oie.10
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jan 2022 20:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=LYTEoc7rHyCXH1oH9BtjH0WArodUqZMGF/Aa2JALJcg=;
 b=jAuD4Q4d0AYZ/PEDXtbz04htFL1EN6grlsqGnAIkDVE2E4pO7M/1oqZYiMPi2SvG5v
 iJPsX46rPq+RVPYyPhX9ofHmWWtOugLIVyRKnZeGldfGzx3X5m4HMzbXt/xHEpYRzKei
 USuN1Cw0SThUY1CAkZK+oIWKE/6I7c9tJPnkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=LYTEoc7rHyCXH1oH9BtjH0WArodUqZMGF/Aa2JALJcg=;
 b=WX/QCmdcszC2ClLCv3jrUqb3lackk8GpGmGEXAErEZJd2lvsJqtmQAaIDj4Uzkvvi4
 9IiFjd0cC+/MAMAvKvdwgAqlEDLnNeyMCYuJNzVRa38MC9Mrh337ewHcKWmdzoXn04VH
 zJgMeCOeFov01Jm37DrvO+PN5LhxjKCGL4TtVh47T+Z8cChZwu3Iq5HdTwPbUafcCXWE
 NShUpkhi39z+AsKiC93AoQTL0tNSdayyShgTZbSXt1DI0x4kFXGc9vDAviINZh2cVLIU
 8NI/kp2C7KktcG9iBtqoCifjR2WskKTc4La3y4emmvoki7JC5dn8izXfjWQG8+hoNXFA
 iJhQ==
X-Gm-Message-State: AOAM532unbP6GIgTsQy7BkScVS87w/V3qmh7XS+FPlfzBQYeJPx22JTd
 eUp6eb+5HfNtSfaqFCklbTz8scXn8Rb33sOmco075w==
X-Google-Smtp-Source: ABdhPJy29RK3pnK83q6mbJuyMkA8rNx2S0loo1Mj2IuzvYlvMss7+Mu29C5GZPkKe7ElF4wm5ZCKgzQaRd232lKC8xU=
X-Received: by 2002:a05:6808:cc:: with SMTP id
 t12mr10524563oic.32.1642739423002; 
 Thu, 20 Jan 2022 20:30:23 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Jan 2022 20:30:22 -0800
MIME-Version: 1.0
In-Reply-To: <20220119221616.3089119-3-dmitry.baryshkov@linaro.org>
References: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org>
 <20220119221616.3089119-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 20 Jan 2022 20:30:22 -0800
Message-ID: <CAE-0n53=vj53a_u-5rUmrhV79_-c=F5gtjbejoVs+=PR=hc1Nw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 2/3] drm/msm/dpu: simplify clocks handling
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-19 14:16:15)
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index 7b504617833a..5533c87c7158 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -5,6 +5,8 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>
> +#include <linux/clk/clk-conf.h>
> +
>  #include "msm_drv.h"
>
>  /*
> @@ -47,6 +49,54 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>         return clk;
>  }
>
> +int msm_parse_clock(struct platform_device *pdev, struct clk_bulk_data **clocks)
> +{
> +       u32 i, rc = 0;
> +       const char *clock_name;
> +       struct clk_bulk_data *bulk;
> +       int num_clk = 0;

No need to assign and then reassign before testing. Same goes for 'rc'.

> +
> +       if (!pdev)
> +               return -EINVAL;
> +
> +       num_clk = of_property_count_strings(pdev->dev.of_node, "clock-names");
> +       if (num_clk <= 0) {
> +               pr_debug("clocks are not defined\n");
> +               return 0;
> +       }
> +
> +       bulk = devm_kcalloc(&pdev->dev, num_clk, sizeof(struct clk_bulk_data), GFP_KERNEL);
> +       if (!bulk)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < num_clk; i++) {
> +               rc = of_property_read_string_index(pdev->dev.of_node,
> +                                                  "clock-names", i,
> +                                                  &clock_name);
> +               if (rc) {
> +                       DRM_DEV_ERROR(&pdev->dev, "Failed to get clock name for %d\n", i);
> +                       return rc;
> +               }
> +               bulk[i].id = devm_kstrdup(&pdev->dev, clock_name, GFP_KERNEL);
> +       }
> +
> +       rc = devm_clk_bulk_get(&pdev->dev, num_clk, bulk);

Use devm_clk_bulk_get_all()?

> +       if (rc) {
> +               DRM_DEV_ERROR(&pdev->dev, "Failed to get clock refs %d\n", rc);
> +               return rc;
> +       }
> +
> +       rc = of_clk_set_defaults(pdev->dev.of_node, false);

Why is this needed?

> +       if (rc) {
> +               DRM_DEV_ERROR(&pdev->dev, "Failed to set clock defaults %d\n", rc);
> +               return rc;
> +       }
> +
> +       *clocks = bulk;
> +
> +       return num_clk;

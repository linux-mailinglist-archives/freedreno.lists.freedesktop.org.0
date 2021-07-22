Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0AD3D2D72
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 22:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECD36EA43;
	Thu, 22 Jul 2021 20:13:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDE36EA43
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 20:13:47 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 t4-20020a05683014c4b02904cd671b911bso6497820otq.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 13:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qKsLbl4ftBxDVGL+8Xv3wy3RrHHwlm4ZdwpMuB2e6Zc=;
 b=cy6RGI0upWuDzcIDJDjrUbeixGYdyNHqcCew2PK2EHben9nudlwMPCXkjfSN2o79c3
 ZYmprGRdOn2pLrnxHwntcjZiK4dSTHQWBTPSC0vHgpu0EtmrIFBG2Tj/GPb7QQtAidJ+
 Ud1oETARJqm2UB9Q0wyijdKSyTZkyTI7sbu2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qKsLbl4ftBxDVGL+8Xv3wy3RrHHwlm4ZdwpMuB2e6Zc=;
 b=J9si99e0TqctObD3EPgRKfLv+e/VdEkLF/VwzYsXbQh4/7/vPKo7j9mVtrQvJhj5wf
 eiazgnBmjKJIHJVxJJeUGqgpIka5/Ine3rU/awWNjo0Ata7QM+TTJxD1BNUP/tHq67Np
 3Oq3NzKmAn/6KytQaXRjV0Q6gNxw2k/KuPYq9aNJgxEa6BO+C6tLE1rS9GVutZ0Mmnfb
 k7ejUfHduTlFVdqdvC71t5dQo6tw5b1cJ5VdGkMBKnq5T0RzfhukmMvTYMmFbHS5PgtV
 RPfSJT5QDOdy/+mus/TSurwnI2PEc0AlZabfda7ETpvfePn/BUq50HXtFQvf1sa72gTF
 Jf1A==
X-Gm-Message-State: AOAM530EyN4H2oxkEqj0wOGkjPnL8BAx6hm8sLwpKOuKlted3AyvVTXi
 yAqx6H6tR6x7dsO1ZYjwBDP1PVIK02pgzEY7n1mhww==
X-Google-Smtp-Source: ABdhPJwIl16lQ2mmX4iprXcdHpT0Zqsdlm8fGu+ct18LB1YcWieMT7VWuxhGrTSnANkJ6R8Bx+l5kozaI+tRboNiEPA=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr979364otl.233.1626984827240; 
 Thu, 22 Jul 2021 13:13:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:13:46 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024227.3313096-5-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-5-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 20:13:46 +0000
Message-ID: <CAE-0n50Lbt0fnhRCnrcaZrM5+sn6giM9meJBEJOZdCS1z98Jzg@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 4/5] drm/msm/dp: Store each subblock in the
 io region
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-21 19:42:26)
> Not all platforms has DP_P0 at offset 0x1000 from the beginning of the
> DP block. So dss_io_data into representing each of the sub-regions, to

"So dss_io_data into" doesn't make sense to me. Is some word or words
missing?

> make it possible in the next patch to specify each of the sub-regions
> individually.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 64 +++++++++--------------------
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 30 ++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_parser.h  | 10 ++++-
>  3 files changed, 54 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index e68dacef547c..1a10901ae574 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -11,6 +11,15 @@
>  #include "dp_parser.h"
>  #include "dp_reg.h"
>
> +#define DP_DEFAULT_AHB_OFFSET  0x0000
> +#define DP_DEFAULT_AHB_SIZE    0x0200
> +#define DP_DEFAULT_AUX_OFFSET  0x0200
> +#define DP_DEFAULT_AUX_SIZE    0x0200
> +#define DP_DEFAULT_LINK_OFFSET 0x0400
> +#define DP_DEFAULT_LINK_SIZE   0x0C00
> +#define DP_DEFAULT_P0_OFFSET   0x1000
> +#define DP_DEFAULT_P0_SIZE     0x0400
> +
>  static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
>         .num = 2,
>         .regs = {
> @@ -48,12 +57,25 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>         struct dp_io *io = &parser->io;
>         struct dss_io_data *dss = &io->dp_controller;
>
> -       dss->base = dp_ioremap(pdev, 0, &dss->len);
> -       if (IS_ERR(dss->base)) {
> -               DRM_ERROR("unable to remap dp io region: %pe\n", dss->base);
> -               return PTR_ERR(dss->base);
> +       dss->ahb = dp_ioremap(pdev, 0, &dss->ahb_len);

So many layers of gunky goo!

> +       if (IS_ERR(dss->ahb)) {
> +               DRM_ERROR("unable to remap ahb region: %pe\n", dss->ahb);
> +               return PTR_ERR(dss->ahb);
>         }
>
> +       if (dss->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
> +               DRM_ERROR("legacy memory region not large enough\n");
> +               return -EINVAL;
> +       }
> +
> +       dss->ahb_len = DP_DEFAULT_AHB_SIZE;
> +       dss->aux = dss->ahb + DP_DEFAULT_AUX_OFFSET;
> +       dss->aux_len = DP_DEFAULT_AUX_SIZE;
> +       dss->link = dss->ahb + DP_DEFAULT_LINK_OFFSET;
> +       dss->link_len = DP_DEFAULT_LINK_SIZE;
> +       dss->p0 = dss->ahb + DP_DEFAULT_P0_OFFSET;
> +       dss->p0_len = DP_DEFAULT_P0_SIZE;
> +
>         io->phy = devm_phy_get(&pdev->dev, "dp");
>         if (IS_ERR(io->phy))
>                 return PTR_ERR(io->phy);
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index dc62e70b1640..3266b529c090 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -26,8 +26,14 @@ enum dp_pm_type {
>  };
>
>  struct dss_io_data {
> -       size_t len;
> -       void __iomem *base;
> +       void __iomem *ahb;
> +       size_t ahb_len;

Maybe make another struct and have a few of them here

	struct dss_io_region {
		void __iomem *base;
		size_t len;
	};

then the code reads as aux.base and aux.len and we know they're closely
related.

> +       void __iomem *aux;
> +       size_t aux_len;
> +       void __iomem *link;
> +       size_t link_len;
> +       void __iomem *p0;
> +       size_t p0_len;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

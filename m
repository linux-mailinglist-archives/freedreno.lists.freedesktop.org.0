Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAD851E2BD
	for <lists+freedreno@lfdr.de>; Sat,  7 May 2022 02:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B10410E01F;
	Sat,  7 May 2022 00:29:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775D110E01F
 for <freedreno@lists.freedesktop.org>; Sat,  7 May 2022 00:29:36 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id r1so9243670oie.4
 for <freedreno@lists.freedesktop.org>; Fri, 06 May 2022 17:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=BfXIYuTjESdwCcwnM3M8fBVsvHWnXl3HX1TNkGVkeNM=;
 b=Hj7bOIh95GPwij//9n8NwUm1Iyp50iOpugsjgNphXDJgxGmxKiY0vlKUeyMxhIi2K2
 6VXze4xJSRJ2kDbt4uS7zYk6Qr7yImNb8t9GihFG4WjcRLbXWUEoPHYoi87oTDjtqQx/
 dOcVT7uJgYR1HQRorqxvT5KUTQxczWwGabjn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=BfXIYuTjESdwCcwnM3M8fBVsvHWnXl3HX1TNkGVkeNM=;
 b=HFWWWh/rDPnzC/kGqHEEHn1vucylYLYmwSBCS5217mE/W9Uhd3cUUgf2X+inGp9oQ8
 sP1bNFMHhtUknsa0fwHpuaFQPDotR+liHPpRC/qlvg45+JRzs7Ydr1MCIKm4hvVHewsB
 M01ga1AhNnh/wDOiWppcR/quSQgvZF76/vLShAWPNzvVwptDufbBGgpS4DlgXFltzXs3
 geyxxQsFtXMr7gVPG0PJGKe+8pBJNgkxlgEyYJLXof0YIjTdrumF9czFrFg4FPtOzKOr
 5k5W5rVOOkw2U/zWAF93XKUzCeiHKuPzlblZTPJlPiWSI0Z1A7D1FhDFVwUICWkkwk9S
 efyA==
X-Gm-Message-State: AOAM532Gsuq0QdK25aQkA6OvkPfSKiFR4Ul8y14m+aMbNjubrzqhwvRT
 h13/G6TV4/KoP7VGChyG5+9liU7WrExdihXf545Rsg==
X-Google-Smtp-Source: ABdhPJxy2rjvHnXRgZkg73o/CmbSvZTI1SbRFqdP1g9gdFeFf/h84x2in8Rewwao0QtsPr/lxD+NoSJdi+JC2LVdHf4=
X-Received: by 2002:a05:6808:23ce:b0:326:6698:c271 with SMTP id
 bq14-20020a05680823ce00b003266698c271mr2647939oib.193.1651883375667; Fri, 06
 May 2022 17:29:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 May 2022 20:29:34 -0400
MIME-Version: 1.0
In-Reply-To: <1651873267-18220-1-git-send-email-quic_khsieh@quicinc.com>
References: <1651873267-18220-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 6 May 2022 20:29:34 -0400
Message-ID: <CAE-0n52HvhT_RFbJHhijKCCt8jQM70fo6ceAbnYEfOfO-dRxVA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Always clear mask bits to
 disable interrupts at dp_ctrl_reset_irq_ctrl()
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-05-06 14:41:07)
> dp_catalog_ctrl_reset() will software reset DP controller. But it will
> not reset programmable registers to default value. DP driver still have
> to clear mask bits to interrupt status registers to disable interrupts
> after software reset of controller. This patch removes the enable flag
> condition checking to always clear mask bits of interrupt status
> registers to disable interrupts if enable flag is false.

Another paragraph is needed which is that this (partially?) fixes the
suspend path where we call dp_catalog_ctrl_reset() but the irq is still
unmasked and can come in while we're suspending. This leads to bus hangs
if the irq is handled after we power down the DP hardware because we run
the irq handler and access a device register assuming that no irq could
ever come in if we powered down the device. We don't know when the irq
will be handled though, so it's possible the irq is pending from before
we disable the irq in the hardware. Don't we need some irq synchronize
to make sure it doesn't run?

>
> Fixes: ba0a422be723 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 38026f2..cbf3399 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1379,8 +1379,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
>
>         dp_catalog_ctrl_reset(ctrl->catalog);
>
> -       if (enable)
> -               dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
> +       /*
> +        * all dp controller programmable registers will not
> +        * be reset to default value after DP_SW_RESET
> +        * therefore interrupt mask bits have to be updated
> +        * to enable/disable interrupts
> +        */
> +       dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
>  }
>
>  void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>

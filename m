Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F9B49EC1E
	for <lists+freedreno@lfdr.de>; Thu, 27 Jan 2022 21:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3808510E271;
	Thu, 27 Jan 2022 20:04:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C573A10E306
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jan 2022 20:04:56 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id w6so3470691qtk.4
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jan 2022 12:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=411z1vQK/uyJWyTA0mh5NoWT3UN44dWhOArvuxGcycY=;
 b=oqRkdvd05f1e+XOO+JL4So5nZNRq09NGBnqQML56y2IHYB2M7bFhId/11Tca1Aj5S4
 ED4cp4aEOW88tsIH707iF2iLcRhJeLhqc7G8uPFq36JBhPk2QtQE7vet9vRYJP9Nw38j
 zHY0sGW1Wuk9tkBp1drE/8KJRmGr2HtC5EH/XYpvvFJD265ufrr4ID11f0Kf5l7jbiU8
 YKFAjQ8McWwDhnsO1sMqI/2TbNwJrryEDi4imukFHLSLdr7G6cz76YxV5XdZyBW0RDkW
 wiQRqKcD0QWK71lJkas0XCt2Pk3oc1TKjQ5OY/+nL3QJtb+CxYKJygokfdonUOL/rliM
 N32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=411z1vQK/uyJWyTA0mh5NoWT3UN44dWhOArvuxGcycY=;
 b=tovufm1RV4Gd6XG7dyOO5IRN/uCw15Zj6VHCPkkt8b0yAQ12wYJGuk8HJckE0YcygQ
 T7l4iUMAyYDbjQ+xmcnt8Tc+Jt9zN+GoDdSX3VTVUCqKbBr9fgmGuRyZteXlhjgHt8Ga
 8vbctiEVX3XUe2dLgQ/PfSOHoQAcesKLeF079GFNmdIhxqAhgqw29/1phJ1ad238cGdo
 qWAuZs7oonyPcJlwKLEX6y7XvabQFLGInBlNdR6bRkpGnZdBs0OlRK8m/LQCJNLlg7iu
 HWzvplW8IHIlknrMe3Gd2Tiw4YJNUq1dPP4qJr9wXwp7u6He3gud5TI7aNj3Kbe9+5Qn
 vkmw==
X-Gm-Message-State: AOAM532NT4vIomzTt8RgcjhDeYoRgTtW8tPVxHgM/UlfJlDTyD/mKKrg
 CmhP3lObOGsQqXa1Hv9Zxl/9CnJ8LegGN2aspQHomA==
X-Google-Smtp-Source: ABdhPJxePmdXDwHCxiW5q8xf/FWoojenXjiwrAx6L9NdYYB7Ajr4VQCV3G0OxdGpcxK9NDBSGfbx39EpN+TiZyB9H08=
X-Received: by 2002:ac8:7fca:: with SMTP id b10mr4156416qtk.62.1643313895857; 
 Thu, 27 Jan 2022 12:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20220127170405.155710-1-daniel.thompson@linaro.org>
In-Reply-To: <20220127170405.155710-1-daniel.thompson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jan 2022 23:04:44 +0300
Message-ID: <CAA8EJppWF27As46rRvYgHuqX=dwna2CQGZ79WXdrfqFbAK53uw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: Remove spurious IRQF_ONESHOT flags
 from dsi & hdmi
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 27 Jan 2022 at 20:04, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Quoting the header comments, IRQF_ONESHOT is "Used by threaded interrupts
> which need to keep the irq line disabled until the threaded handler has
> been run.". When applied to an interrupt that doesn't request a threaded
> irq then IRQF_ONESHOT has a lesser known (undocumented?) side effect,
> which it to disable the forced threading of irqs (and for "normal" kernels
> it is a nop). In this case I can find no evidence that suppressing forced
> threading is intentional. Had it been intentional then a driver must adopt
> the raw_spinlock API in order to avoid deadlocks on PREEMPT_RT kernels
> (and avoid calling any kernel API that uses regular spinlocks).
>
> Fix this by removing the spurious additional flag.
>
> This change is required for my Snapdragon 7cx Gen2 tablet to boot-to-GUI
> with PREEMPT_RT enabled.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>

Could you please split it into two parts: separate DSI and HDMI patches

> ---
>
> Notes:
>     Just in case anybody asks, yes! I did use coccinelle to do a quick scan
>     for similar issues. I didn't find any other instances in drivers/drm/ .
>
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 6b3ced4aaaf5d..3a3f53f0c8ae1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1877,7 +1877,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>
>         /* do not autoenable, will be enabled later */
>         ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
> -                       IRQF_TRIGGER_HIGH | IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +                       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
>                         "dsi_isr", msm_host);
>         if (ret < 0) {
>                 dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 3acdeae25caf0..a1bfbc4c74bf7 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -301,7 +301,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>         }
>
>         ret = devm_request_irq(&pdev->dev, hdmi->irq,
> -                       msm_hdmi_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +                       msm_hdmi_irq, IRQF_TRIGGER_HIGH,
>                         "hdmi_isr", hdmi);
>         if (ret < 0) {
>                 DRM_DEV_ERROR(dev->dev, "failed to request IRQ%u: %d\n",
>
> base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

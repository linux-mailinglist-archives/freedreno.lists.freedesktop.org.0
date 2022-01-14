Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A048F19F
	for <lists+freedreno@lfdr.de>; Fri, 14 Jan 2022 21:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4AC10E236;
	Fri, 14 Jan 2022 20:41:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BB510E236
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jan 2022 20:41:49 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id s127so13877218oig.2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jan 2022 12:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=w8eYRN8DvaWrfxZ2Wz3wjJHXZl1sXzUmVItZvQrcpIU=;
 b=OKa3qW6WIsuRKuwVZNQaoh+x0FXafWzSaIVMiOJybsAilmpEY6W3EOaW9x2UgT2rw5
 7Z6ixaS6ITqghZ1bGqvYEroKq3/zGqHGcf6lImK8zDJvW3Mf+P2/aLm6KsTE0F3P8quV
 5MzfzisWUjGUiPZu535FQWvgGlcTrhsR26KJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=w8eYRN8DvaWrfxZ2Wz3wjJHXZl1sXzUmVItZvQrcpIU=;
 b=I2nTMet6n6YDdNQ05ASv+huvHFpfGs+MZ4PLx0w2ubLGoDe1W9WbNkHa3nm3iHnA7K
 OyA8Dsv+Q/vyTj4j70CmVFrXC5ab0AShhBafXxu6Z8LcKy99gx0sMUPDp8EsgFLKIJnr
 I9z6GE0XbDuQjUaCKN0CdZuiBicFGbeZMjzaIf7IZ7sLIqAoVer3gVqRgcRftVJ9A0Jz
 KnlFUW3Zjsw4lVKu95NwBPW8tdvqv+k6I36U8fT6DhxZmdOPar67fhN+quJ1wjZ4GbGN
 rRKwoqRQyZ9uGSqUoT0vl0lqDQ/UwEJmlbnVUtEluW24WPymYlUxCi55bHbmweEVQOkL
 xaXA==
X-Gm-Message-State: AOAM531F5woszqHPnQAlUecE2KPO23bdtf0kgFJSQi5ddcxtyHOEPlPG
 lZ7BbAwNKBAKd6gqn4jeWlgEfW0pQGY6Ez1jXmBZ5g==
X-Google-Smtp-Source: ABdhPJyJdhcMkqImaSUxZ1WkeHPyT3tbME4n66V0rAr6S+Pk6ZlC3B9/0q6DsTjh/bqpzaqTLFTgaIaDVy4htwfjrno=
X-Received: by 2002:aca:4382:: with SMTP id q124mr8893398oia.64.1642192908901; 
 Fri, 14 Jan 2022 12:41:48 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Jan 2022 14:41:48 -0600
MIME-Version: 1.0
In-Reply-To: <1642182874-27296-2-git-send-email-quic_khsieh@quicinc.com>
References: <1642182874-27296-1-git-send-email-quic_khsieh@quicinc.com>
 <1642182874-27296-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 14 Jan 2022 14:41:48 -0600
Message-ID: <CAE-0n52UntroUk9hzPorUOvkVty1=V5B2oznYghi_DM6=zyzrw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v14 1/4] drm/msm/dp: do not initialize phy
 until plugin interrupt received
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-14 09:54:31)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7cc4d21..2616f7b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -372,21 +373,38 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>         return rc;
>  }
>
> -static void dp_display_host_init(struct dp_display_private *dp, int reset)
> +static void dp_display_host_phy_init(struct dp_display_private *dp)
>  {
> -       bool flip = false;
> +       DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
> +                       dp->core_initialized, dp->phy_initialized);
>
> +       if (!dp->phy_initialized) {
> +               dp_ctrl_phy_init(dp->ctrl);
> +               dp->phy_initialized = true;
> +       }
> +}
> +
> +static void dp_display_host_phy_exit(struct dp_display_private *dp)
> +{
> +       DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
> +                       dp->core_initialized, dp->phy_initialized);
> +
> +       if (dp->phy_initialized) {
> +               dp_ctrl_phy_exit(dp->ctrl);
> +               dp->phy_initialized = false;
> +       }
> +}
> +
> +static void dp_display_host_init(struct dp_display_private *dp)
> +{
>         DRM_DEBUG_DP("core_initialized=%d\n", dp->core_initialized);
>         if (dp->core_initialized) {

Can you remove this if condition too? I don't see how it ever happens.

>                 DRM_DEBUG_DP("DP core already initialized\n");
>                 return;
>         }
>
> -       if (dp->usbpd->orientation == ORIENTATION_CC2)
> -               flip = true;
> -
> -       dp_power_init(dp->power, flip);
> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
> +       dp_power_init(dp->power, false);
> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>         dp_aux_init(dp->aux);
>         dp->core_initialized = true;
>  }

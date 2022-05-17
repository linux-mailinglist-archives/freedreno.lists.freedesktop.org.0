Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B34DE529C4F
	for <lists+freedreno@lfdr.de>; Tue, 17 May 2022 10:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA3C10E8E1;
	Tue, 17 May 2022 08:25:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F14510E725
 for <freedreno@lists.freedesktop.org>; Tue, 17 May 2022 08:25:54 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id y63so21448953oia.7
 for <freedreno@lists.freedesktop.org>; Tue, 17 May 2022 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qFyj5figDGQVFNUWmIzfj4DH6eo/m3Ta43JA6WzvT2c=;
 b=O3ps97EHSIwu0IuHVUjVpLTmRF7nNzrP+6cR37aR9UAJOkAvkCNANY0qTFVPksvWkL
 flbsM7GACfhNRO9+HE3f5hQrZ80I8U+gm3r/y1CQMl9zlMqZGFYkcA4HF6K3GMXQwecn
 Qcf+MEJ7B5c1TEE/NB45C2BVnbNqH2suwpi7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qFyj5figDGQVFNUWmIzfj4DH6eo/m3Ta43JA6WzvT2c=;
 b=1LzOeEPCYPkhIAT+aPN/scIOIb8B39Vyeb7sJv4OsI8I+4MlyY1yPl90+I0SNbtkx0
 2N1E5YJR31yqNT1X7yiUS/ce8z7AojtgJ/pdmmKpDRZ8+CzZMHePCnZed8vu8bA3+sNL
 Y78E7LOCC8pAFZ3t2mU9+8OEU55jCdYUHM5DCQOiWtgfd3tFRfpUccqTCfT91m4m2ASS
 ZQlRms0TFdmLVVNcLloPs8bpvmAZR38uft95hRgD0tQv5yr16BEp/Vf0N6axhZd+FC5J
 jJWSHj8buyubezHzCnk/02RvLajl2Pk69d31YryxDn6e49DnWlCCZniZhpfX/kFn3tm+
 qtfQ==
X-Gm-Message-State: AOAM533CcawtxEpKyCZheU0S2dqTactcyoJpCBpIyLXn39i+SKxeAQDd
 p1B9fiQm/Rh/aSRALd05t834BP68YvlzpKQsviFOKw==
X-Google-Smtp-Source: ABdhPJxs+1xc/Lw2u3NTSePNRBog18/DG6e9Xn3YMLc6OyuZxzAX8XTsp+t318WYkCDh7KJLL1WVJkbua4qZl8h/e38=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr9696354oiw.193.1652775953881; Tue, 17
 May 2022 01:25:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 May 2022 01:25:53 -0700
MIME-Version: 1.0
In-Reply-To: <1652384598-21586-1-git-send-email-quic_khsieh@quicinc.com>
References: <1652384598-21586-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 17 May 2022 01:25:53 -0700
Message-ID: <CAE-0n5277_-=ZYprmF6JcVfrnG0aZVXqXq092VS=mkDtrOB_wg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6] drm/msm/dp: Always clear mask bits to
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

Quoting Kuogee Hsieh (2022-05-12 12:43:18)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index af7a80c..f3e333e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
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

I think Dmitry requested that this part be split off to a different
patch. It's fixing the call to dp_ctrl_reset_irq_ctrl() for the disable
case.

>  }
>
>  void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..ab691aa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -98,6 +98,8 @@ struct dp_display_private {
>         struct dp_ctrl    *ctrl;
>         struct dp_debug   *debug;
>
> +       bool suspended;
> +

Can we not have this flag? I also don't understand how this patch waits
for the event queue to drain. There are now multiple places we check to
see if we've suspended, but is it even possible to be in those places
during suspend? What is wrong with moving to an irq thread? Is it
because we want to wait for a modeset (EV_USER_NOTIFICATION)?

>         struct dp_usbpd_cb usbpd_cb;
>         struct dp_display_mode dp_mode;
>         struct msm_dp dp_display;

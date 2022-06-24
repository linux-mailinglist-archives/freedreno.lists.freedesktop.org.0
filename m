Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7795D558C1D
	for <lists+freedreno@lfdr.de>; Fri, 24 Jun 2022 02:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D01A10F17F;
	Fri, 24 Jun 2022 00:09:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E3E10F17F
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 00:09:48 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 y10-20020a9d634a000000b006167f7ce0c5so748641otk.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jun 2022 17:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=tNICjC0mqZ74g4NWx01ZNVZ2tkGnF23qOG9pMURoZhI=;
 b=keigWUEC4et/ph4vYev3R+C43rBbm6avYfx1ICG8YUlMjI17zFbQ2NqdKaLjP20MgD
 03TUpRIu3LgOXZ1LnijQy9VU1OpjjuxDho5zFrbATU/RB9F/5S2AJ9Z0bf26Xo+1ooT0
 XGnZvujpKw3kMWwkNxBRfcYiO47Af/Ydzdzyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=tNICjC0mqZ74g4NWx01ZNVZ2tkGnF23qOG9pMURoZhI=;
 b=1tdfw7ekh9JpDzgW5Dgnl+xBZ5g8SWoa+CfQC46wwJIbBwSGsSG3EJiZnX7DA0z4MT
 JiedOFnvw7cbeCu6nd6hzOyoEVSfpQszGshInJL8/B1BCz+WQw7vNf5l2xCfa/NCG5qq
 NE4xwl/1UzH5El14BEjV3tjSLp75GcjlMMTg47s23rf6zjhwoiuMDLw1G5NxBo6cp0l/
 zFUJiYaEx9WAYTgiuvLSLdekOprbF92xbJFxD7w6U0iMkxamXgYxV0yjz9fgKrwvHfpT
 CMd00IjZAoXFq8Q97o1nLF7zXnCb+nFlYX5eV51ZfevY0jOt04fyab88T/DcK7WUEr8b
 MyYg==
X-Gm-Message-State: AJIora8a3UQ7954ygmodmMqqykkZ6O1B3r/Hct362i5/HdVvBJ9LcXqo
 rhrobK9Gzl/leKclK8UlTxK/FAlXk7WPGeLFmsgqaw==
X-Google-Smtp-Source: AGRyM1toYtnlSvt/KriWql1qkmbYZ0fd3ZbL7W+3GyjF+TFTpfJIy6lNOXNS1wd+UjrciaaVGHz2lZIw6TxPwoIv6+Y=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr4954986otj.77.1656029388070; Thu, 23
 Jun 2022 17:09:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 17:09:47 -0700
MIME-Version: 1.0
In-Reply-To: <1656027256-6552-1-git-send-email-quic_khsieh@quicinc.com>
References: <1656027256-6552-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 23 Jun 2022 17:09:47 -0700
Message-ID: <CAE-0n534jvnjX5TShZw7CB9Cu9F7yowhwUosNkJE8t_R4xHYOw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: no dp_hpd_unplug_handle()
 required for eDP
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

Quoting Kuogee Hsieh (2022-06-23 16:34:16)
> eDP implementation does not reuried to support hpd signal. Therefore

s/reuried/require/

> it only has either ST_DISPLAY_OFF or ST_CONNECTED state during normal
> operation. This patch remove unnecessary dp_hpd_unplug_handle() for
> eDP but still keep dp_hpd_plug_handle() to support eDP to either
> booting up or resume from ST_DISCONNECTED state.

I take it that making this change also fixes a glitch seen on the eDP
panel when a second modeset happens? Can you add that detail to the
commit text? The way it reads makes it sound like this is purely a
cleanup patch, but then there's a Fixes tag so it must be a bug fix or
worthy optimization, neither of which is described.

>
> Fixes: 391c96ff0555 ("drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index da5c03a..ef9794e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1666,7 +1666,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>                 return;
>         }
>
> -       if (dp->is_edp)
> +       if (dp->is_edp && dp_display->hpd_state == ST_DISCONNECTED)
>                 dp_hpd_plug_handle(dp_display, 0);
>
>         mutex_lock(&dp_display->event_mutex);
> @@ -1737,9 +1737,6 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
>
>         dp_display = container_of(dp, struct dp_display_private, dp_display);
>
> -       if (dp->is_edp)
> -               dp_hpd_unplug_handle(dp_display, 0);

dp_hpd_unplug_handle() has a !edp check, and from what I can tell after
this patch that condition will always trigger? But then I wonder why we
aren't masking the irqs for hpd when the eDP display is disabled.
Shouldn't we at least be doing that so that we don't get spurious hpd
irqs when the eDP display is off or on the path to suspend where I
suspect the power may be removed from the panel?

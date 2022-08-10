Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E758F44F
	for <lists+freedreno@lfdr.de>; Thu, 11 Aug 2022 00:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D860939D7;
	Wed, 10 Aug 2022 22:23:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230E011A454
 for <freedreno@lists.freedesktop.org>; Wed, 10 Aug 2022 22:22:54 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10e615a36b0so19562938fac.1
 for <freedreno@lists.freedesktop.org>; Wed, 10 Aug 2022 15:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=6ZXpeykwT3UcSDOHGtJfXAmbLhvIZVOoNhfE2nMEi9U=;
 b=fNj6bGWSepVNh9KUpmWHunpqN8Jhu3GMgOn+GPdB4erApMi1R65km8K1Kmq7Mej4Nq
 +A4fckaH0S/Wcj86Dko9ri0Rc+tf9fvc6osQfaJSsy13zB/TMANokZiR5NSjqI6ff4Tq
 1Az7Ym4yC5q6aCw2z+xVuxCZpPI193+UioaKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=6ZXpeykwT3UcSDOHGtJfXAmbLhvIZVOoNhfE2nMEi9U=;
 b=PCDsWqbtY+sAbXpqpBGZ9XQrr673so8w64zKKFXahHamChDM3GoiOsqmSpNtQK5EN/
 cAAz6j6jF/Q4kqCtAd8ikLGxVbws4NcQ+ECnFCk4J2w2CckdLVZqyBZHwVms1xlRl6HW
 Idj2oehNN1Q+raz9zmEE+FAJvDEMrt3BQtlhFuz0CR/uA3fclj+6rWNNgl1tJ29j33Xx
 gspy9oOsdsYFZplBjczOb/MlrbS5A9EeCrSnO382Fhln9MtDcTZQJq6IXL7KeqvH8Rvi
 wj2Vglgr1Qh4L6g5xYlt2BJWYh8jHssJ1WSiaKy7hRX7FPjprZFl445Y93VkZHRAJBE1
 +Fqg==
X-Gm-Message-State: ACgBeo2QxVsQ8waQ1r+36mhFgKIrA6DdnHKdwjSIis45srpRuK+sm+sN
 OEz9HG7ybFSFh7OJgOB6OTyk+AyNp5mXhYSPK0515g==
X-Google-Smtp-Source: AA6agR4tGznIvQwijtSDOPuLU9fc/WJ4b/gonUrK7uyKPVZ3I1QHlYY7Al1Vij85kOgI7HtbkFv2qGEbFQGqeEitqyg=
X-Received: by 2002:a05:6870:9a17:b0:e9:3d1:f91a with SMTP id
 fo23-20020a0568709a1700b000e903d1f91amr2438112oab.44.1660170173320; Wed, 10
 Aug 2022 15:22:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Aug 2022 17:22:52 -0500
MIME-Version: 1.0
In-Reply-To: <1660159551-13828-1-git-send-email-quic_khsieh@quicinc.com>
References: <1660159551-13828-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 10 Aug 2022 17:22:52 -0500
Message-ID: <CAE-0n533SUb3Bg=pR8Fhwo-M5qLWiti4nzLR-rSGVAsrXgEYNQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dp: check hpd_state before push
 idle pattern at dp_bridge_disable()
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

Quoting Kuogee Hsieh (2022-08-10 12:25:51)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index b36f8b6..678289a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1729,10 +1729,20 @@ void dp_bridge_disable(struct drm_bridge *drm_bridge)
>         struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
>         struct msm_dp *dp = dp_bridge->dp_display;
>         struct dp_display_private *dp_display;
> +       u32 state;
>
>         dp_display = container_of(dp, struct dp_display_private, dp_display);
>
> +       mutex_lock(&dp_display->event_mutex);
> +
> +       state = dp_display->hpd_state;
> +       if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED) {

It's concerning that we have to check this at all. Are we still
interjecting into the disable path when the cable is disconnected?

> +               mutex_unlock(&dp_display->event_mutex);
> +               return;
> +       }
> +
>         dp_ctrl_push_idle(dp_display->ctrl);
> +       mutex_unlock(&dp_display->event_mutex);

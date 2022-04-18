Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B9C505E54
	for <lists+freedreno@lfdr.de>; Mon, 18 Apr 2022 21:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC7310E164;
	Mon, 18 Apr 2022 19:19:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CE010E16A
 for <freedreno@lists.freedesktop.org>; Mon, 18 Apr 2022 19:19:06 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-e5c42b6e31so5219134fac.12
 for <freedreno@lists.freedesktop.org>; Mon, 18 Apr 2022 12:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=i5wl56LotTiojun33tWHx/7uuv8PC5pAOqdx69tKaaM=;
 b=IrBO3HYKrCyj8BpxZJPl52AA7PNRk7cYMbyJAbdSWuQXLHzjL7QbrMJB94/Dn+xCWs
 M77uDtGevI5J2vY1vpOwBTPztIAZM4Pp6g5la85cZxmhCyck9gTUr6otIWl7HQb0mMHY
 SXrPPX1NWp97pWRQ38S8Do2rWKfx1C7R9VFnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=i5wl56LotTiojun33tWHx/7uuv8PC5pAOqdx69tKaaM=;
 b=22K2UDvTas2tQquSfRC4x3FcJqLd6C3NTAUVeE5ua3wpm6LqXj67LW/xsm/5EVAF/I
 TX9ltat1FI0uiwe0omUqvtSyMX+cZzftegr4UiCvhW31PJhm2v1jC0oDUbsJClewMv14
 Yy5xAQaV9h36EMDLlDrJY/GwYv3enBeQTwKxrs8EET62UOjwf9/faugE4dj4OFwAH5en
 fh3AV71ySbpdfsQ1opNgXOt7pS73vYyx5fKgqXodnf54yny1OaWIBwFUsOxEpIeCL3Eu
 wqSBTWgqpN20JJjUkzFoAp+MoLnQft5BrfL9s+eCKvRR7GGmvS4DUw75OjSLsMJHkIgh
 mB5Q==
X-Gm-Message-State: AOAM532CRlX2JgfOa5WWBqIup60JFgEfGN91Ecjdc+rSSQniQA4lPtgW
 KgpZnDD/H70A+50XafGEb3LIrjBVozawSfnDckujIg==
X-Google-Smtp-Source: ABdhPJy36I60SuKJQk1lAs2Wj4Aw91ozGFrNZzaJBTHE9jWCmMfEyKPfI8GyfHWmpkDQ6UzS6OnJiPVDUMtglnY/4Os=
X-Received: by 2002:a05:6870:3907:b0:e5:a6fd:4047 with SMTP id
 b7-20020a056870390700b000e5a6fd4047mr4740339oap.193.1650309545749; Mon, 18
 Apr 2022 12:19:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Apr 2022 12:19:05 -0700
MIME-Version: 1.0
In-Reply-To: <1650066445-18186-1-git-send-email-quic_khsieh@quicinc.com>
References: <1650066445-18186-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 18 Apr 2022 12:19:05 -0700
Message-ID: <CAE-0n505HQEu0Wmt17Y_AfTG+arD76kL7wpEFgeJKz6RRcQBxw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v9] drm/msm/dp: stop event kernel thread
 when DP unbind
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

Quoting Kuogee Hsieh (2022-04-15 16:47:25)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..5b289b9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -266,9 +269,18 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         }
>
>         rc = dp_register_audio_driver(dev, dp->audio);
> -       if (rc)
> +       if (rc) {
>                 DRM_ERROR("Audio registration Dp failed\n");
> +               goto end;
> +       }
>
> +       rc = dp_hpd_event_thread_start(dp);
> +       if (rc) {
> +               DRM_ERROR("Event thread create failed\n");

One thread DRM_ERROR()

> +               goto end;
> +       }
> +
> +       return 0;
>  end:
>         return rc;
>  }
> @@ -1132,12 +1149,19 @@ static int hpd_event_thread(void *data)
>         return 0;
>  }
>
> -static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
>  {
> -       init_waitqueue_head(&dp_priv->event_q);
> -       spin_lock_init(&dp_priv->event_lock);
> +       /* set event q to empty */
> +       dp_priv->event_gndx = 0;
> +       dp_priv->event_pndx = 0;
> +
> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       if (IS_ERR(dp_priv->ev_tsk)) {
> +               DRM_ERROR("failed to create DP event thread\n");

And another thread creation DRM_ERROR(). Can we just have one please
instead of two lines for something that probably never happens?

> +               return PTR_ERR(dp_priv->ev_tsk);
> +       }
>
> -       kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       return 0;
>  }
>
>  static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)

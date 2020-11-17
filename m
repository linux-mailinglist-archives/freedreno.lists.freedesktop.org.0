Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D12B55E6
	for <lists+freedreno@lfdr.de>; Tue, 17 Nov 2020 02:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4176E0CA;
	Tue, 17 Nov 2020 01:00:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D496E0CA
 for <freedreno@lists.freedesktop.org>; Tue, 17 Nov 2020 01:00:15 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id q5so15841231pfk.6
 for <freedreno@lists.freedesktop.org>; Mon, 16 Nov 2020 17:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=PuExbIj6CoeitWmQQjoOETDlqV6PNYzOVzDyJ83+bUM=;
 b=QIK29EeQBxKfUcrXB/o0zASZ0enH3DTfkTyOtmZv/6Kul0xepHNOrP6vcXrexOXTZr
 Jf7WPzyY+x36w8kkS6fijV02icwrKxoMEsT1/hK/7Xh4GJpYHbrJ1Lqf4YHYmRAKzw+2
 pQRmRF1jExMSGgLX1pwTHAY5KixKcCiArNfhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=PuExbIj6CoeitWmQQjoOETDlqV6PNYzOVzDyJ83+bUM=;
 b=T7jV5UviTnNWD0rYsydCAK/uG+Ec0oUF09U7kPM5Aqpk3oU5uhdnm6Z2UwXQgyZdVc
 uXkyA6yrsSY/QqcRERsnXBBi/93fD3JTXmW7R58QcZvLRFJe2xmT3U4rFlFndXF+pJ7C
 fG+9NUJkJ4s3dfto5Yv3MmiN1KZYMFeTyrlLb2/Y740LwsvlipIhrZExZOy37G/KWzMa
 DvnLv+ph2MPvtnlZzqbp0SNWLJsKD9wer4IPkwLQ+CK19TvMGHI3/jjIkuqNmj5SSS+I
 3oE02AqyrNWtlUnG8jRxQs9rbun6Nux/SMwYtWVNKOm9wBseIhzkqkf52PRKdEPZTRv0
 Ur4A==
X-Gm-Message-State: AOAM531RA7K0ej3ljMFKv6/6htLgFnQ8Djk+hNzVRyPN9LB0Gk5Bhov4
 OwW8M3bUCRiCq2uIPkSUY8alCQ==
X-Google-Smtp-Source: ABdhPJzohwSM2vGqzunfEj57/N7SS+yFjY7d2u20TWgXUDIMq5bsYUDz2+kVu7HVvVFWXPnuOH+lQw==
X-Received: by 2002:a63:565d:: with SMTP id g29mr1448743pgm.249.1605574815376; 
 Mon, 16 Nov 2020 17:00:15 -0800 (PST)
Received: from chromium.org ([100.99.132.239])
 by smtp.gmail.com with ESMTPSA id i6sm641469pjt.49.2020.11.16.17.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 17:00:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20201113222639.18786-1-khsieh@codeaurora.org>
References: <20201113222639.18786-1-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Mon, 16 Nov 2020 17:00:12 -0800
Message-ID: <160557481298.60232.17821932910000059522@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: fix connect/disconnect handled
 at ir_hdp
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-11-13 14:26:39)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 27e7e27b8b90..4e84f500b721 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -279,13 +279,25 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
>         drm_helper_hpd_irq_event(connector->dev);
>  }
>  
> -static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> -                                           bool hpd)
> +
> +static void dp_display_set_encoder_mode(struct dp_display_private *dp)
>  {
> -       static bool encoder_mode_set;
>         struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
>         struct msm_kms *kms = priv->kms;
> +       static bool encoder_mode_set;

Can this be stored in the dp_display_private structure instead? No
singletons please.

> +
> +       if (!encoder_mode_set && dp->dp_display.encoder &&
> +                               kms->funcs->set_encoder_mode) {
> +               kms->funcs->set_encoder_mode(kms,
> +                               dp->dp_display.encoder, false);
>  
> +               encoder_mode_set = true;
> +       }
> +}
> +
> +static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> +                                           bool hpd)
> +{
>         if ((hpd && dp->dp_display.is_connected) ||
>                         (!hpd && !dp->dp_display.is_connected)) {
>                 DRM_DEBUG_DP("HPD already %s\n", (hpd ? "on" : "off"));
> @@ -491,17 +487,29 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>         if (!rc) {
>                 sink_request = dp->link->sink_request;
>                 if (sink_request & DS_PORT_STATUS_CHANGED) {
> -                       /* same as unplugged */
> -                       hpd->hpd_high = 0;
> -                       dp->hpd_state = ST_DISCONNECT_PENDING;
> -                       dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> -               }
> -
> -               rc = dp_display_handle_irq_hpd(dp);
> -
> -               if (!rc && (sink_request & DS_PORT_STATUS_CHANGED)) {
> -                       hpd->hpd_high = 1;
> -                       dp->hpd_state = ST_CONNECT_PENDING;
> +                       if (dp_display_is_sink_count_zero(dp)) {
> +                               DRM_DEBUG_DP("sink count is zero, nothing to do\n");
> +                               if (dp->hpd_state != ST_DISCONNECTED) {
> +                                       hpd->hpd_high = 0;
> +                                       dp->hpd_state = ST_DISCONNECT_PENDING;
> +                                       dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> +                               }
> +                               rc = -ENOTCONN;
> +                       } else {
> +                               if (dp->hpd_state == ST_DISCONNECTED) {
> +                                       hpd->hpd_high = 1;

This else and then if can be an else if, right?

> +                                       dp->hpd_state = ST_CONNECT_PENDING;
> +
> +                                       rc = dp_display_process_hpd_high(dp);
> +                                       if (rc) {
> +                                               hpd->hpd_high = 0;
> +                                               dp->hpd_state = ST_DISCONNECTED;
> +                                       }
> +                               }
> +                       }
> +               } else {
> +                       if (!dp_display_is_ds_bridge(dp->panel))
> +                               rc = dp_display_handle_irq_hpd(dp);
>                 }
>         }
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

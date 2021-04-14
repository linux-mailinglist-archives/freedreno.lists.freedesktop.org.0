Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F61D35FD35
	for <lists+freedreno@lfdr.de>; Wed, 14 Apr 2021 23:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E056E978;
	Wed, 14 Apr 2021 21:22:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34EB6E977
 for <freedreno@lists.freedesktop.org>; Wed, 14 Apr 2021 21:22:51 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d8so10858484plh.11
 for <freedreno@lists.freedesktop.org>; Wed, 14 Apr 2021 14:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=RwOM404YmU1KKr4Np2+NWPRKRhKCplH67w1Du3EIAzQ=;
 b=Q/PrJhcrkB4mA4Y/IyOwo4Y5/jw1VFleUeDObzYvyFXWkXyIsRs8uwsnv1Vyf9uZVn
 X4IK4yTUElUXiM6WM4wgRDVkFR0GnMD4W0hBDAq5xWOD8XwzxYCXZ9xuGVCfvl2IyRhs
 b9Nw/D9ta7A4r3gyOwPYoUo6JxoSjcDyKclUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=RwOM404YmU1KKr4Np2+NWPRKRhKCplH67w1Du3EIAzQ=;
 b=fv1Ijr51YmY+PJJWFi7JQAuDIckgYqe2S/m0iPI70p3w9LtDaJyh646sqvBFP4oSg0
 H+8ZyL6Ob8VNtcslL8ELvkKEgJDOdBnu707z+ZFjWLcQ18JjPDBeVn6pFR0YZiKv3niz
 JXvnaZ/Whjeg1+uzeo6CK+tezqiYHgXw/do80FWMqJKA3CJY3bmYUnOs2Xi/5T7lYEdY
 OphDlFI5AkPdMGUIiHvvu7CCEPejkWX2ouF13xM2O4XZGnoBrVQBFT63ZF4QC2QtKMLR
 ksr3IBZmNKi2CxnNvD4/jG4rtGNAWfPDPIzAZtUkhouumfEHdxzupI4UVuLx8evEGj6C
 pA/A==
X-Gm-Message-State: AOAM531W4D3nl3B0/72UJrIWiDk+aKw38R7B5RVShRNRBReUPudbfaLg
 em2nE6JIKJlc4opumTa+q4Q3BA==
X-Google-Smtp-Source: ABdhPJx24gNc+irPfeI28vsit1JxAWe901EHCr3I7J4jq9hZYIxfEPuDHg/FpXbn5CxlkVPUjcZb2w==
X-Received: by 2002:a17:90b:3909:: with SMTP id
 ob9mr133410pjb.181.1618435371367; 
 Wed, 14 Apr 2021 14:22:51 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:753e:814e:f002:498a])
 by smtp.gmail.com with ESMTPSA id e190sm301649pfe.3.2021.04.14.14.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 14:22:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1618434170-28302-1-git-send-email-khsieh@codeaurora.org>
References: <1618434170-28302-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Wed, 14 Apr 2021 14:22:49 -0700
Message-ID: <161843536949.46595.14917924989191979850@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v2 2/3] drm/msm/dp: initialize audio_comp
 when audio starts
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

Quoting Kuogee Hsieh (2021-04-14 14:02:50)
> Initialize audio_comp when audio starts and wait for audio_comp at
> dp_display_disable(). This will take care of both dongle unplugged
> and display off (suspend) cases.
> 
> Changes in v2:
> -- add dp_display_start_audio()
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>

Looking better. Thanks!

> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 0ba71c7..8a69bcd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -177,6 +177,14 @@ static int dp_del_event(struct dp_display_private *dp_priv, u32 event)
>  
>         return 0;
>  }
> +void dp_display_start_audio(struct msm_dp *dp_display)

Please unstick this from previous function by adding a newline above.

> +{
> +       struct dp_display_private *dp;
> +
> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +       reinit_completion(&dp->audio_comp);
> +}
>  
>  void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>  {
> @@ -648,10 +656,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>         /* start sentinel checking in case of missing uevent */
>         dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
>  
> -       /* signal the disconnect event early to ensure proper teardown */

This doesn't need to be done early anymore? Please mention why in the
commit text.

> -       reinit_completion(&dp->audio_comp);
> -       dp_display_handle_plugged_change(g_dp_display, false);
> -
>         dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
>                                         DP_DP_IRQ_HPD_INT_MASK, true);
>  
> @@ -894,7 +898,6 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>         /* wait only if audio was enabled */
>         if (dp_display->audio_enabled) {
>                 /* signal the disconnect event */
> -               reinit_completion(&dp->audio_comp);
>                 dp_display_handle_plugged_change(dp_display, false);
>                 if (!wait_for_completion_timeout(&dp->audio_comp,
>                                 HZ * 5))
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

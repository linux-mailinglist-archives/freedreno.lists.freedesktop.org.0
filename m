Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72702F1FEA
	for <lists+freedreno@lfdr.de>; Mon, 11 Jan 2021 20:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858346E072;
	Mon, 11 Jan 2021 19:54:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797576E071
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jan 2021 19:54:04 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id t22so593335pfl.3
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jan 2021 11:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=Vxk2nV7tt4HCztmmcM/p9PpvV3AZqTIQaGCtnRxgY5o=;
 b=PYTOCCGpovAEIhp6SDc7oo7y6LDK0BrdmH5Bo6LK5wdMJMxJPgEfd+o4Ygb8Zm1W6N
 WT12d307T0ug2fNJrkoAHMKl/62zRSABiCuI41DTLqQTmWvAKerQmPYf8hZZ6PZ4IkQg
 8XXC0t3qPdfh8ztVgYLAPMtyOlQzV4bAnFIN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=Vxk2nV7tt4HCztmmcM/p9PpvV3AZqTIQaGCtnRxgY5o=;
 b=BCv8nh64hs8oulTJDAcjxqlxIaSVajVx89wrwUM4p3+pqmPmGtc1IQ16VG/My3BKaX
 TIdZ9Av33WzvLXFdWXfT6T42lHwwQZfSzmGeRv0pHmAUPTqp/jTIy7bLRl/IrZCSJUXG
 BAg93RCswmRztOxES9IVRoUBkrhKh4rbzTfmAMuEkiW6+q6y+bN/+xZLDGna9RmW6Wu3
 IAR55J54cNdo0LuluX2wwb84HQdmyDAWw/EPXp8IbKOBtacaF2YyelcgAZMUTTuHPfGV
 fDXM+Xs9Wtk0YM3dq0jWPbeMfRu19s2K7+CWg2Gc3ypxZFsKGH1ozOyqmtXg3Sg+vybq
 vMrg==
X-Gm-Message-State: AOAM5332Qzn1QqPtYpdtcmXiQFLDKxuMGANCaX0dYshTBn42L8FGSXYE
 sl68gXtdQXawDic1VARwHMjJbA==
X-Google-Smtp-Source: ABdhPJxKRGtGDIO3VfXdh7jxqm6nRjvFkD4HG/tJC8VlSrZjMO2GjMyC/nt1FZND08abv6HToCiIrg==
X-Received: by 2002:a65:494f:: with SMTP id q15mr1092942pgs.367.1610394844028; 
 Mon, 11 Jan 2021 11:54:04 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id 5sm419116pff.125.2021.01.11.11.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:54:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1610051425-20632-3-git-send-email-khsieh@codeaurora.org>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-3-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run
Date: Mon, 11 Jan 2021 11:54:01 -0800
Message-ID: <161039484176.3661239.14240346276437866761@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dp: unplug interrupt missed
 after irq_hpd handler
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
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org, daniel@ffwll.ch,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-01-07 12:30:25)
> There is HPD unplug interrupts missed at scenario of an irq_hpd
> followed by unplug interrupts with around 10 ms in between.
> Since both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts,
> irq_hpd handler should not issues either aux or sw reset to avoid
> following unplug interrupt be cleared accidentally.

So the problem is that we're resetting the DP aux phy in the middle of
the HPD state machine transitioning states?

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 44f0c57..9c0ce98 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -190,6 +190,18 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog)
>         return 0;
>  }
>  
> +/**
> + * dp_catalog_aux_reset() - reset AUX controller
> + *
> + * @aux: DP catalog structure
> + *
> + * return: void
> + *
> + * This function reset AUX controller
> + *
> + * NOTE: reset AUX controller will also clear any pending HPD related interrupts
> + * 
> + */
>  void dp_catalog_aux_reset(struct dp_catalog *dp_catalog)
>  {
>         u32 aux_ctrl;
> @@ -483,6 +495,18 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
>         return 0;
>  }
>  
> +/**
> + * dp_catalog_ctrl_reset() - reset DP controller
> + *
> + * @aux: DP catalog structure

It's called dp_catalog though.

> + *
> + * return: void
> + *
> + * This function reset DP controller

resets the

> + *
> + * NOTE: reset DP controller will also clear any pending HPD related interrupts
> + * 
> + */
>  void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)
>  {
>         u32 sw_reset;
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index e3462f5..f96c415 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1296,7 +1296,8 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
>          * transitioned to PUSH_IDLE. In order to start transmitting
>          * a link training pattern, we have to first do soft reset.
>          */
> -       dp_catalog_ctrl_reset(ctrl->catalog);
> +       if (*training_step != DP_TRAINING_NONE)

Can we check for the positive value instead? i.e.
DP_TRAINING_1/DP_TRAINING_2

> +               dp_catalog_ctrl_reset(ctrl->catalog);
>  
>         ret = dp_ctrl_link_train(ctrl, cr, training_step);
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

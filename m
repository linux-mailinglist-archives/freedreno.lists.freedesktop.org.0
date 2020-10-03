Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A438A282070
	for <lists+freedreno@lfdr.de>; Sat,  3 Oct 2020 04:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87536E0A0;
	Sat,  3 Oct 2020 02:12:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4826EA12
 for <freedreno@lists.freedesktop.org>; Sat,  3 Oct 2020 02:12:25 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id o20so2638214pfp.11
 for <freedreno@lists.freedesktop.org>; Fri, 02 Oct 2020 19:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=wqgtfEXlK69O3zYlvUS0N2rx5d3DFBbOXqk2l3qB7HU=;
 b=XIxg1evKrFevIrvQhr+5Aqj7er8uo1//KQ7s3HsIxDzY8M2HtkvgKRTT7V/bJD3T7Y
 OpjJ3LR7c7x7oerT4nRF5mexVr4cc8QCxJIkTO5EiM2eUHz1IYALwHEibgaiRi33p/KV
 mYoAlKK5EzWQ9qAOsVNOp0fq4qgKPsl6l+Fw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=wqgtfEXlK69O3zYlvUS0N2rx5d3DFBbOXqk2l3qB7HU=;
 b=X3ZvA5l1xEUaF8v5DmvSCobRTPaPIabYC3hH6WFxzoanh5RVgmvIOX7jt35vSi2O8H
 uptd8Vae7ZaUSyq8bUAl+ZcHKtWDjarATM46pI5Rb1tufKYFftwtagS5GXEGZoohMKIC
 uDgt+cQPYlYngt0ToSMkFxv/UYnGmruix/8w2MbgcYULnjd5ipaxMd+iQpdhSUVedvKP
 xYKQjQtfAEuKC4iwx5JgEnvMD5O/H3fDOw4pVLM7NPxj0YtagwKb+tbfYuhOpvh8+S82
 aKOIc6mOC7wfqa22ajgowqCpEz1Q3mN6JHo4H6bseeik3wvc4ukoB5WXfy0h7W7vyz/m
 QFeQ==
X-Gm-Message-State: AOAM5321ISTKQEDKz2Jk5Vb2+l0FnXALzPMG6xBq/TDZYqTF9kfK3Bok
 RlTrI5+mls9PJsgf4MJ2+/0ruw==
X-Google-Smtp-Source: ABdhPJzCGcXh/PpWofxiaZQnfeuTAnE6g8MPt67Opg9r0Sh3wV/qZ1llb4OZVm/VMVoIKcFZLG0gGg==
X-Received: by 2002:a62:1e07:0:b029:14e:d96c:9e04 with SMTP id
 e7-20020a621e070000b029014ed96c9e04mr5500869pfe.58.1601691145311; 
 Fri, 02 Oct 2020 19:12:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id j12sm2950932pjd.36.2020.10.02.19.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 19:12:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20201002220919.17245-1-khsieh@codeaurora.org>
References: <20201002220919.17245-1-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Fri, 02 Oct 2020 19:12:23 -0700
Message-ID: <160169114309.310579.5033839844955785761@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: fixes wrong connection state
 caused by failure of link train
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

Quoting Kuogee Hsieh (2020-10-02 15:09:19)
> Connection state is set incorrectly happen at either failure of link train
> or cable plugged in while suspended. This patch fixes these problems.
> This patch also replace ST_SUSPEND_PENDING with ST_DISPLAY_OFF.
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>

Any Fixes: tag?

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 52 ++++++++++++++---------------
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  5 +++
>  2 files changed, 31 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 431dff9de797..898c6cc1643a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -340,8 +340,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>         }
>  
>         dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> -
> -
>  end:
>         return rc;
>  }

Not sure we need this hunk

> @@ -1186,19 +1180,19 @@ static int dp_pm_resume(struct device *dev)
>  
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>  
> +       /* start from dis connection state */

disconnection? Or disconnected state?

> +       atomic_set(&dp->hpd_state, ST_DISCONNECTED);
> +
>         dp_display_host_init(dp);
>  
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>  
>         status = dp_catalog_hpd_get_state_status(dp->catalog);
>  
> -       if (status) {
> +       if (status)
>                 dp->dp_display.is_connected = true;
> -       } else {
> +       else
>                 dp->dp_display.is_connected = false;
> -               /* make sure next resume host_init be called */
> -               dp->core_initialized = false;
> -       }
>  
>         return 0;
>  }
> @@ -1214,6 +1208,9 @@ static int dp_pm_suspend(struct device *dev)
>         if (dp_display->power_on == true)
>                 dp_display_disable(dp, 0);
>  
> +       /* host_init will be called at pm_resume */
> +       dp->core_initialized = false;
> +
>         atomic_set(&dp->hpd_state, ST_SUSPENDED);
>  
>         return 0;
> @@ -1343,6 +1340,9 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>  
>         mutex_lock(&dp_display->event_mutex);
>  
> +       /* delete sentinel checking */

Stop sentinel checking?

> +       dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
> +
>         rc = dp_display_set_mode(dp, &dp_display->dp_mode);
>         if (rc) {
>                 DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> @@ -1368,9 +1368,8 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>                 dp_display_unprepare(dp);
>         }
>  
> -       dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
> -
> -       if (state == ST_SUSPEND_PENDING)
> +       /* manual kick off plug event to train link */
> +       if (state == ST_DISPLAY_OFF)
>                 dp_add_event(dp_display, EV_IRQ_HPD_INT, 0, 0);
>  
>         /* completed connection */
> @@ -1402,20 +1401,21 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>  
>         mutex_lock(&dp_display->event_mutex);
>  
> +       /* delete sentinel checking */

Stop sentinel checking?

> +       dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
> +
>         dp_display_disable(dp_display, 0);
>  
>         rc = dp_display_unprepare(dp);
>         if (rc)
>                 DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
>  
> -       dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
> -
>         state =  atomic_read(&dp_display->hpd_state);
>         if (state == ST_DISCONNECT_PENDING) {

I don't understand the atomic nature of this hpd_state variable. Why is
it an atomic variable? Is taking a spinlock bad? What is to prevent the
atomic read here to not be interrupted and then this if condition check
be invalid because the variable has been updated somewhere else?

>                 /* completed disconnection */
>                 atomic_set(&dp_display->hpd_state, ST_DISCONNECTED);
>         } else {
> -               atomic_set(&dp_display->hpd_state, ST_SUSPEND_PENDING);
> +               atomic_set(&dp_display->hpd_state, ST_DISPLAY_OFF);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

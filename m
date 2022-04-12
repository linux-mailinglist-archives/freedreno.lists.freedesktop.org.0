Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82004FC932
	for <lists+freedreno@lfdr.de>; Tue, 12 Apr 2022 02:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4154C10FA8E;
	Tue, 12 Apr 2022 00:21:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D063310FA8E
 for <freedreno@lists.freedesktop.org>; Tue, 12 Apr 2022 00:21:04 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id e4so17494781oif.2
 for <freedreno@lists.freedesktop.org>; Mon, 11 Apr 2022 17:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=y7Y1GROIPsSLxY9do07YZACd9MWDSI2F+M+lT+f9eTo=;
 b=HJgEFPK74D/NzNz5ewjQS1D3WZjnbn6QPFbqVtlhSvkdtZrvSBMTVSWXksPTipI0T0
 uIqntfRaCN+XM2SobWYamTU+fzXI4do20kvZmAFLXkApFfG0I0RWihEspBxiqL5Ohv9S
 RHrhVCX3aEVON9iRfWjDEisKAVzxYtFIOGtyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=y7Y1GROIPsSLxY9do07YZACd9MWDSI2F+M+lT+f9eTo=;
 b=RxM3Vdn3MFj+DWz7y1K5L0a+FirkNofMVRaNA8Lz4MU47wFa+DJezOJ6GIwzFxiFf9
 +paUXceLgufwV2xGunrlTm3/HQQq6TyIIRVb60inBApyFPjQJuScsgoJnNDWeQ/bxIDn
 LhqNQRZVkVVtyXmTuA675fhrWdT9027t15Swy+jS3BjBebjbSmleIDyN15qRt/eH/NVd
 kdEv2HWVadEIpd4rLbyLuMP1lReRgsYIoYq/K28Z//sA6GsHPIoV86NQxjGWlF0YeSQ5
 kt17PyiGaA/1Px9GT+Ar9ApElshHffcLcdIBIxVR04zanTrWJzqII3EkRwqLR3zLpp1j
 VKtA==
X-Gm-Message-State: AOAM532JAUV+K8QcqSsyumCtKyfOweOC296tyrOmki8n2esrVktEUhGw
 r2d0fDS6WdcYxwbK42fhGn4H6Q221/Kg7xsQqkpnVQ==
X-Google-Smtp-Source: ABdhPJw/3jAU3O/Kq+1TUpmeh35Qr9Tn/HpTVk9i7/UR2pAUgLJf83vv627lUOfEnAPl1s5WNjyIbdnff/jjSlRos9o=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr682476oif.63.1649722864112; Mon, 11 Apr
 2022 17:21:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Apr 2022 20:21:03 -0400
MIME-Version: 1.0
In-Reply-To: <1649722129-12542-1-git-send-email-quic_khsieh@quicinc.com>
References: <1649722129-12542-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 11 Apr 2022 20:21:03 -0400
Message-ID: <CAE-0n53zYpqJL9GCoqZRwMptCne+4Dk4thz-7rCDac7H98dm=A@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: stop event kernel thread when
 DP unbind
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

Quoting Kuogee Hsieh (2022-04-11 17:08:49)
> Current DP driver implementation, event thread is kept running
> after DP display is unbind. This patch fix this problem by disabling
> DP irq and stop event thread to exit gracefully at dp_display_unbind().
>
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Should add a Reported-by tag from Dmitry here.

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..fa1ef8e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -273,6 +274,8 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         return rc;
>  }
>
> +static void dp_hpd_event_stop(struct dp_display_private *dp_priv);

Why can't the function be defined here?

> +
>  static void dp_display_unbind(struct device *dev, struct device *master,
>                               void *data)
>  {
> @@ -280,6 +283,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct msm_drm_private *priv = drm->dev_private;
>
> +       disable_irq(dp->irq);
> +       dp_hpd_event_stop(dp);
>         dp_power_client_deinit(dp->power);
>         dp_aux_unregister(dp->aux);
>         priv->dp[dp->id] = NULL;
> @@ -1054,7 +1059,7 @@ static int hpd_event_thread(void *data)
>
>         dp_priv = (struct dp_display_private *)data;
>
> -       while (1) {
> +       while (!kthread_should_stop()) {
>                 if (timeout_mode) {
>                         wait_event_timeout(dp_priv->event_q,
>                                 (dp_priv->event_pndx == dp_priv->event_gndx),
> @@ -1137,7 +1142,22 @@ static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
>         init_waitqueue_head(&dp_priv->event_q);
>         spin_lock_init(&dp_priv->event_lock);
>
> -       kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +
> +       if (IS_ERR(dp_priv->ev_tsk))
> +               DRM_ERROR("failed to create DP event thread\n");

Why can't we error out? Why can't this kthread be started in probe?

> +}
> +
> +static void dp_hpd_event_stop(struct dp_display_private *dp_priv)
> +{
> +       if (IS_ERR(dp_priv->ev_tsk))
> +               return;
> +
> +       kthread_stop(dp_priv->ev_tsk);
> +
> +       /* reset event q to empty */
> +       dp_priv->event_gndx = 0;
> +       dp_priv->event_pndx = 0;
>  }
>

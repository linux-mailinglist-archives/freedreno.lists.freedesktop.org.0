Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA83501C31
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 21:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CC110E3A2;
	Thu, 14 Apr 2022 19:51:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DEC10E3A2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 19:51:25 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso6302119fac.9
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 12:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=rnBHU5K3ycHtHGp+npSuYUbzeHjwZqJTwpUR6awx5K0=;
 b=SK95oefoXLEubMwDR1MHVniI7UbqZu/lncjMXHeiPDst1S7Gfq0UIlkCT6VfIAHbcU
 1gYEnCZablTegpp+AdN7XofqAB2dcFvzFW35gQnMzRB3mZk0JBdr2S6t/09oyV6O1y4o
 lF5z4rkqcSnS3xdL+EyT6ZwNtAaDLeXb7OPTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=rnBHU5K3ycHtHGp+npSuYUbzeHjwZqJTwpUR6awx5K0=;
 b=GMJYkZS+T9PABHuC6iKNIIJAWpWV3K/ad3AvlrWGWzD7JhUjc1Ir1aG0l+8Kawp771
 JKMESZNWDYbCR3HyVta0FjJJ+XF/Xmp6pLXex5Es/yS/Bqld4Eb5JIp2ZKkgJmMPkiZd
 gnfmOtIExxyAZt0sHl+uTZFyl20/tvdXzgQYGEspZdAMJnUXSdiw0Cv12+/3VRoNlVw0
 jpUy1QeJzVm5tUouhPBe3jUOr7SCE2oMh8HGb/VZmw8sWEL+mnUxCC4u3w4IbP0/kEgL
 uBb7/LXKRjC1pv/k1jN1CfpNMNMDvwVg7USgtwQT/fSz1nRNLApAn9AMA1rd9H4J8jud
 YLfA==
X-Gm-Message-State: AOAM530dr8BPF8XkgYOx5nw5z8lgvPtQOr+ua/3cTEU0ZZ9OVqOHPnKP
 pCOIBNmfaqv9gCn3Ulx3R+a/DiVLSWioev1tlAZ32g==
X-Google-Smtp-Source: ABdhPJxIZ1+wVS/E6xe2tJP5xdtzHOubsUnHSuWmh6OmVY8p0l5j40yenMcY32DB6I9YmJXe2hlKMYMq0XR7iy+wQvQ=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr83625oao.63.1649965884650; Thu, 14 Apr
 2022 12:51:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 12:51:24 -0700
MIME-Version: 1.0
In-Reply-To: <1649957137-24620-1-git-send-email-quic_khsieh@quicinc.com>
References: <1649957137-24620-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 14 Apr 2022 12:51:24 -0700
Message-ID: <CAE-0n50pqaLEKLK4Hb+FETvNBf5KJnF4JhpeiA-O55wuGo_LJQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dp: stop event kernel thread
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

Quoting Kuogee Hsieh (2022-04-14 10:25:37)
> Current DP driver implementation, event thread is kept running
> after DP display is unbind. This patch fix this problem by disabling
> DP irq and stop event thread to exit gracefully at dp_display_unbind().
>
> Changes in v2:
> -- start event thread at dp_display_bind()
>
> Changes in v3:
> -- disable all HDP interrupts at unbind
> -- replace dp_hpd_event_setup() with dp_hpd_event_thread_start()
> -- replace dp_hpd_event_stop() with dp_hpd_event_thread_stop()
> -- move init_waitqueue_head(&dp->event_q) to probe()
> -- move spin_lock_init(&dp->event_lock) to probe()
>
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..0b9a96f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -230,6 +231,29 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>         complete_all(&dp->audio_comp);
>  }
>
> +static int hpd_event_thread(void *data);
> +
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
> +{
> +       int err = 0;

Drop local.

> +
> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       if (IS_ERR(dp_priv->ev_tsk)) {
> +               DRM_ERROR("failed to create DP event thread\n");
> +               err = PTR_ERR(dp_priv->ev_tsk);

		return PTR_ERR(dp_priv->ev_tsk);

> +       }

Newline

> +       return err;

return 0;

> +}
> +
> +static void dp_hpd_event_thread_stop(struct dp_display_private *dp_priv)
> +{
> +       kthread_stop(dp_priv->ev_tsk);
> +
> +       /* reset event q to empty */
> +       dp_priv->event_gndx = 0;
> +       dp_priv->event_pndx = 0;
> +}
> +
>  static int dp_display_bind(struct device *dev, struct device *master,
>                            void *data)
>  {
> @@ -269,6 +293,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         if (rc)
>                 DRM_ERROR("Audio registration Dp failed\n");
>
> +       rc = dp_hpd_event_thread_start(dp);

Forward declare this new function?

>  end:
>         return rc;
>  }
> @@ -280,6 +305,9 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct msm_drm_private *priv = drm->dev_private;
>
> +       /* disable all HPD interrupts */
> +       dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> +       dp_hpd_event_thread_stop(dp);
>         dp_power_client_deinit(dp->power);
>         dp_aux_unregister(dp->aux);
>         priv->dp[dp->id] = NULL;
> @@ -1054,7 +1082,7 @@ static int hpd_event_thread(void *data)
>
>         dp_priv = (struct dp_display_private *)data;
>
> -       while (1) {
> +       while (!kthread_should_stop()) {
>                 if (timeout_mode) {
>                         wait_event_timeout(dp_priv->event_q,
>                                 (dp_priv->event_pndx == dp_priv->event_gndx),
> @@ -1132,13 +1160,6 @@ static int hpd_event_thread(void *data)
>         return 0;
>  }
>
> -static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
> -{
> -       init_waitqueue_head(&dp_priv->event_q);
> -       spin_lock_init(&dp_priv->event_lock);
> -
> -       kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> -}

And then dp_hpd_event_thread_start() be defined here? The bind/unbind
functions should be moved to the bottom of this file because they're
probe/remove basically. Please do that in a followup patch.

>
>  static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
>  {

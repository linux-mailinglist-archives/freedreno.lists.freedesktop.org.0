Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C354F9485
	for <lists+freedreno@lfdr.de>; Fri,  8 Apr 2022 13:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F9D10E34C;
	Fri,  8 Apr 2022 11:52:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7BA10E34C
 for <freedreno@lists.freedesktop.org>; Fri,  8 Apr 2022 11:52:39 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id v13so4544125qkv.3
 for <freedreno@lists.freedesktop.org>; Fri, 08 Apr 2022 04:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jx6/Lgbitqz5l2vaW1Kah0wGVIvKoz5skxFr6Jlav/w=;
 b=S++XNMlvf3Vbg3Rih1bTFb/lLZQdn7EPa8DKSd1j6649HfU0cdQo29mEKO/CM1UKZm
 PASfkvYlTmczerTPeFCsnWQhsCz17nJ06x4kVN6JCl6sCIEOfC2CUg0hiZPc/AQ4Ln4t
 7W2rglnBywYnttvathHjgcJhn0UzVdsnGI1vr/VO9rZUsvLXxK+1hPIkGbS8BR+IWSn+
 IggrY86KAq9S9cEWy5t8J4iTDfPtYX/1+TilDScxqfwi886SS9VDp8q3ITUyiUTUC2Ah
 CRtJb2ekFG8s6seSnbe3BfEhhW7KuH35uo1ioN1V8UdWV0NKkZ9MpIxqsfW4X+F1vdHv
 h8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jx6/Lgbitqz5l2vaW1Kah0wGVIvKoz5skxFr6Jlav/w=;
 b=ifVQFLjGxKhU0lv75Wl2FfB6lA0q7szEDxtfHdl4rTtO/wrr4kENp0asTmKgtMVu/t
 mYgXHumB6F4UIkpFT6EdDlw2iC8/CtdntF0Sa53QEVtrBbz10f/SdjhLNQtoHlvh2fk0
 kcmRD5nU4oo4Xb/hpuqLyUcC7iG8z9PtWF0nH8JbYvnMS/DTjQa0QIhT9QEGgPemnwse
 OACSIH+zCGTzV88D9cxwiV2RZlV1JjVDCJQACThLjDvs/8fUQK5rfwlOyCDDz6t8s/zq
 T27WpVljqd1E8zijh1BnWZa9BIOzO+XfcaCA/66sVV7RK+hqhJBk2Cukqg6p12xnvj45
 8Vyw==
X-Gm-Message-State: AOAM5304lb8MBiWDS6GrZMUS8p3rXLBYOsZ5NONZG0VwGW+bNDF0k2QW
 tjgzyOSzxBRqPmP/ALr+TUTgJZ19A/iAyFegv/kaiQ==
X-Google-Smtp-Source: ABdhPJzUx8+jelie1GKF76E3MKGQcEpF3pUQ1g+FajnC79YKu7g3Y5icMIcl67VWS851AmyeK0Edv1CTDuLA810H2Ic=
X-Received: by 2002:a05:620a:2449:b0:69a:4ae:85e5 with SMTP id
 h9-20020a05620a244900b0069a04ae85e5mr4876649qkn.30.1649418758129; Fri, 08 Apr
 2022 04:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <1649350286-11504-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1649350286-11504-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Apr 2022 14:52:27 +0300
Message-ID: <CAA8EJpo7UGvhH0WYFm6gdOdX22++9kErudA7_ce-mbPBY3KEpw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: add fail safe mode outside of
 event_mutex context
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, bjorn.andersson@linaro.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 7 Apr 2022 at 19:51, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> There is possible circular locking dependency detected on event_mutex.
> To break this possible circular locking, this patch move setting fail
> safe mode out of event_mutex scope.

Please provide the lockdep trace here, it might help other people
trying to fix the issue or working on backports to stable kernels.

>
> Fixes: d4aca422539c ("drm/msm/dp:  always add fail-safe mode into connector mode list")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  6 ++++++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 20 ++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>  3 files changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 178b774..a42732b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -580,6 +580,12 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>                         dp->dp_display.connector_type, state);
>         mutex_unlock(&dp->event_mutex);
>
> +       /*
> +        * add fail safe mode outside event_mutex scope
> +        * to avoid potiential circular lock with drm thread
> +        */
> +       dp_panel_add_fail_safe_mode(dp->dp_display.connector);
> +
>         /* uevent will complete connection part */
>         return 0;
>  };
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index f141872..26c3653 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -151,6 +151,15 @@ static int dp_panel_update_modes(struct drm_connector *connector,
>         return rc;
>  }
>
> +void dp_panel_add_fail_safe_mode(struct drm_connector *connector)
> +{
> +       /* fail safe edid */
> +       mutex_lock(&connector->dev->mode_config.mutex);
> +       if (drm_add_modes_noedid(connector, 640, 480))
> +               drm_set_preferred_mode(connector, 640, 480);
> +       mutex_unlock(&connector->dev->mode_config.mutex);
> +}
> +
>  int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>         struct drm_connector *connector)
>  {
> @@ -207,16 +216,7 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>                         goto end;
>                 }
>
> -               /* fail safe edid */
> -               mutex_lock(&connector->dev->mode_config.mutex);
> -               if (drm_add_modes_noedid(connector, 640, 480))
> -                       drm_set_preferred_mode(connector, 640, 480);
> -               mutex_unlock(&connector->dev->mode_config.mutex);
> -       } else {
> -               /* always add fail-safe mode as backup mode */
> -               mutex_lock(&connector->dev->mode_config.mutex);
> -               drm_add_modes_noedid(connector, 640, 480);
> -               mutex_unlock(&connector->dev->mode_config.mutex);
> +               dp_panel_add_fail_safe_mode(connector);
>         }
>
>         if (panel->aux_cfg_update_done) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 9023e5b..99739ea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -59,6 +59,7 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel);
>  int dp_panel_deinit(struct dp_panel *dp_panel);
>  int dp_panel_timing_cfg(struct dp_panel *dp_panel);
>  void dp_panel_dump_regs(struct dp_panel *dp_panel);
> +void dp_panel_add_fail_safe_mode(struct drm_connector *connector);
>  int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>                 struct drm_connector *connector);
>  u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel, u32 mode_max_bpp,
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry

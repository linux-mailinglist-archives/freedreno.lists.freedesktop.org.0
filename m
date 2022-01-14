Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BDE48E296
	for <lists+freedreno@lfdr.de>; Fri, 14 Jan 2022 03:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E8710EB63;
	Fri, 14 Jan 2022 02:42:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A928B10EB5F
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jan 2022 02:42:57 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bu18so2962742lfb.5
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jan 2022 18:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=cjt46o0H8juJwTkg9g5qXZAEFKZ9jhldP8/d/bKEtbM=;
 b=AItf8MjIcqDlBKVoN8mbcCw6jsfY0mqaz1EXRhYSnnNPSTl7YFt4JhwnG7D8pjbp0y
 vbWB8MzPP0ldlt5ziFTnCx0tDWQkNu4PH6M96dl48CFRQjym0geyTThU4RzEB4wZKIPt
 eXhyLFqzG2XwOgCyBlLGAjJd4SVtVwppTz4r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=cjt46o0H8juJwTkg9g5qXZAEFKZ9jhldP8/d/bKEtbM=;
 b=wmnZWIp+atDy2Kz1rHP1MaAJOXbGUFLYx/GEYrhDcptwn1Ollq9dbc1gxP9SXDQLYy
 u2muLv9iS4n4Co5sNXO4pUyXaKCwXYBKDx4KMSVz4RiuHFWb6ubrWuB9u/PoqbMSEnHa
 Gjj9Go5WEue/HCUPgZIvVGOvDwxxUwkg1JrBp107Tc7ftSaJj7YmlRie79sfmzfdhoCo
 /Leo0LufxR+uVdkTFW3ajIxgq5+E+IwgMWkHEHN8qBq/3iv85cA9ToZ7v4A2gCGdL6SE
 n2eDMLKLOJUVY1u6MOLKCpWdDpb8ph1LrsIcA4S/1ufV+rWx/Fgav+DHeg8SJQipZ9c0
 LxnQ==
X-Gm-Message-State: AOAM532/Vmo8hnrUt7QJA6IqPiw8vDiELr76YvHW0Jb2soDCX8bnyVuo
 PshdauPbaRQjZN7FT6M2O0+8HBouqGfAoRBElhHyAg==
X-Google-Smtp-Source: ABdhPJwW2WTcDmQiD0n1+kqJjG6r7Sb7wz9pL0WUIMko1hXyZSHNYJlaQOXrDZKTuBGY9YLHSZk9DcRejNde+phVHXg=
X-Received: by 2002:a19:2d0c:: with SMTP id k12mr5322641lfj.224.1642128175854; 
 Thu, 13 Jan 2022 18:42:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Jan 2022 18:42:54 -0800
MIME-Version: 1.0
In-Reply-To: <1642118019-18673-2-git-send-email-quic_khsieh@quicinc.com>
References: <1642118019-18673-1-git-send-email-quic_khsieh@quicinc.com>
 <1642118019-18673-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 13 Jan 2022 18:42:54 -0800
Message-ID: <CAE-0n52OETzrO-XxuOQLp=fM17X3SGdD6zARtF85znmTqdvVRg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v13 1/4] drm/msm/dp: do not initialize phy
 until plugin interrupt received
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-13 15:53:36)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7cc4d21..b3c5404 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -83,6 +83,7 @@ struct dp_display_private {
>
>         /* state variables */
>         bool core_initialized;
> +       bool phy_initialized;
>         bool hpd_irq_on;
>         bool audio_supported;
>
> @@ -372,21 +373,38 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>         return rc;
>  }
>
> -static void dp_display_host_init(struct dp_display_private *dp, int reset)
> +static void dp_display_host_phy_init(struct dp_display_private *dp)
>  {
> -       bool flip = false;
> +       DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
> +                       dp->core_initialized, dp->phy_initialized);
>
> +       if (!dp->phy_initialized) {
> +               dp_ctrl_phy_init(dp->ctrl);
> +               dp->phy_initialized = true;
> +       }
> +}
> +
> +static void dp_display_host_phy_exit(struct dp_display_private *dp)
> +{
> +       DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
> +                       dp->core_initialized, dp->phy_initialized);
> +
> +       if (dp->phy_initialized) {
> +               dp_ctrl_phy_exit(dp->ctrl);
> +               dp->phy_initialized = false;
> +       }
> +}
> +
> +static void dp_display_host_init(struct dp_display_private *dp)
> +{
>         DRM_DEBUG_DP("core_initialized=%d\n", dp->core_initialized);
>         if (dp->core_initialized) {

When is this true? From what I see dp_display_host_init() is only called
from two places: resume where core_initialized has been set to false
during suspend or from dp_display_config_hpd() kicked by the kthread
where core_initialized is also false.

Also, I see that dp_display_host_deinit() is only called from suspend
now, so 'core_initialized' is almost always true, except for on the
resume path and before the kthread is started and in the case that the
driver probes but can't start the kthread for some reason (is that
real?).

>                 DRM_DEBUG_DP("DP core already initialized\n");
>                 return;
>         }
>
> -       if (dp->usbpd->orientation == ORIENTATION_CC2)
> -               flip = true;
> -
> -       dp_power_init(dp->power, flip);
> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
> +       dp_power_init(dp->power, false);
> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>         dp_aux_init(dp->aux);
>         dp->core_initialized = true;
>  }
> @@ -892,12 +901,19 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>
>         dp_display->audio_enabled = false;
>
> -       /* triggered by irq_hpd with sink_count = 0 */
>         if (dp->link->sink_count == 0) {
> +               /*
> +                * irq_hpd with sink_count = 0
> +                * hdmi unplugged out of dongle
> +                */
>                 dp_ctrl_off_link_stream(dp->ctrl);
>         } else {
> +               /*
> +                * unplugged interrupt
> +                * dongle unplugged out of DUT
> +                */
>                 dp_ctrl_off(dp->ctrl);
> -               dp->core_initialized = false;
> +               dp_display_host_phy_exit(dp);
>         }
>
>         dp_display->power_on = false;
> @@ -1027,7 +1043,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>  static void dp_display_config_hpd(struct dp_display_private *dp)
>  {
>
> -       dp_display_host_init(dp, true);
> +       dp_display_host_init(dp);
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
>         /* Enable interrupt first time
> @@ -1306,20 +1322,23 @@ static int dp_pm_resume(struct device *dev)
>         dp->hpd_state = ST_DISCONNECTED;
>
>         /* turn on dp ctrl/phy */
> -       dp_display_host_init(dp, true);
> +       dp_display_host_init(dp);
>
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
> -       /*
> -        * set sink to normal operation mode -- D0
> -        * before dpcd read
> -        */
> -       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>
>         if (dp_catalog_link_is_connected(dp->catalog)) {
> +               /*
> +                * set sink to normal operation mode -- D0
> +                * before dpcd read
> +                */
> +               dp_display_host_phy_init(dp);
> +               dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>                 sink_count = drm_dp_read_sink_count(dp->aux);
>                 if (sink_count < 0)
>                         sink_count = 0;
> +
> +               dp_display_host_phy_exit(dp);
>         }
>
>         dp->link->sink_count = sink_count;
> @@ -1363,7 +1382,11 @@ static int dp_pm_suspend(struct device *dev)
>                 if (dp_power_clk_status(dp->power, DP_CTRL_PM))
>                         dp_ctrl_off_link_stream(dp->ctrl);
>
> +               dp_display_host_phy_exit(dp);
> +

Why is there a newline here?

>                 dp_display_host_deinit(dp);
> +       } else {
> +               dp_display_host_phy_exit(dp);
>         }
>
>         dp->hpd_state = ST_SUSPENDED;

There's a dp->core_initialized = false right here but it's not in the
diff window. It's redundant now because the hunk above is basically

	if (dp->core_initialized == true) {
		...
		dp_display_host_phy_exit(dp);
		dp_display_host_deinit(dp);
	} else {
		dp_display_host_phy_exit(dp);
	}

	dp->hpd_state = ST_SUSPENDED;

and dp_display_host_deinit() sets core_initialized to false, thus
core_initialized will be false here already. Can you remove the
duplicate assignment?

> @@ -1535,7 +1558,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>         state =  dp_display->hpd_state;
>
>         if (state == ST_DISPLAY_OFF)
> -               dp_display_host_init(dp_display, true);
> +               dp_display_host_phy_init(dp_display);
>
>         dp_display_enable(dp_display, 0);
>

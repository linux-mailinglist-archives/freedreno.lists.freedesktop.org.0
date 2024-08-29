Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EAD964257
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 12:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4F210E3B8;
	Thu, 29 Aug 2024 10:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cfGpGzMt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB82E10E3B5
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 10:54:50 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6b6b9867faaso4760087b3.2
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 03:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724928890; x=1725533690; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WsR7RqYqCQqmzwTsLeO8CdfGE+Tzge8dR38Zue/JNNI=;
 b=cfGpGzMtVaAyfTGGecNS66Fdtez0mG8Qsmts7obByw2rKEolH3BnXyUtCPTCTSIcjp
 4kOjuuIyDPDHMekgvj8Xi1zysno2J4lBK/d45XgzZ7lujEVoec+AxSpNzWhCMjDHARC2
 qbEmvqy3t++MZT+UtZOwtsr/c9Ouq37III8v/PjrMOFtrw74eryJKUy9SSc1zAZmUurk
 8/Gh0sDpR+Imr42n6EIPyLsCsPFgqoelXIPksE/S0iyWEmudJdHP5EEzZ896BJ+2z24/
 tnlhYQODRhyPsFty3FDQjNLGfyHUeq6znhDBKDIs24By9od0ZBOPoK9cHepd1p84HXIG
 2MTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724928890; x=1725533690;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WsR7RqYqCQqmzwTsLeO8CdfGE+Tzge8dR38Zue/JNNI=;
 b=Efj2xXdqv2lCyH6O4i9G+NTRxBpLA9kOgjCaxo5n8lHYUY4kzoqh+E3PRQb5NDAClq
 Ku91/SuQd84oasz0PT+WnACZ/JUMKeeuNFLl1y2a+GtMuPoX98J8mLs6s5Gngk49yhR2
 7vni38G9CVPcN/1oZWclMFAOJ4vcWGMmVulcafoqWFG4yLy5s5aqtMAYBRdPmqm52j0s
 tLXvWO5uvw5reLgHGZDBabzUm2Lf/oIyRILPUtkz6PGK6OVZq5zZzkoLPW7V0w/1IQpZ
 lKL3jG2FBMYkQVNPpREqDPyk0VkE0hyMFH9wVDqcUQgI3ehXsLEvUIgrscIG4gHDqKWk
 Ck6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk/Ty2OhXQmbFAb1IOkuG9YKQVszXPINIQBPrr84rLTaQrxcuZBymGmJCG2a+pxlnHI7ZDO93MfrQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsocyqzjlGVqPxZn9iAfUcsb/wpsoq0UljO2pN2vtrS3Zu86oQ
 K+801QH4nRpanP/EdyxzjqUji31+V9J3DZQALR6vFimkuB3ObDnwyFGd4t/+2J2KQqTpYz5/Q6B
 wMpahU3f6QxvyoxMKxwF5cozybU2AseV2kq9BUQ==
X-Google-Smtp-Source: AGHT+IHlwblUdL+UTiUzAymzgQqR07igHxM+PP4FRvpf+PudLjPp4cCTHGnYjCo+YatZmNPbhFJbfpb+bLIZNBzAQwc=
X-Received: by 2002:a05:690c:6308:b0:6b0:d9bc:5a1e with SMTP id
 00721157ae682-6d27852ac23mr19105637b3.46.1724928889652; Thu, 29 Aug 2024
 03:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-2-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-2-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 13:54:38 +0300
Message-ID: <CAA8EJpp_LWmuN8CFuQEAME-O44_wJXUKsR1QwahuigzSss5Rqw@mail.gmail.com>
Subject: Re: [PATCH 02/21] drm/msm/dsi: fix DSC width for the bonded DSI case
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
>
> From: Jonathan Marek <jonathan@marek.ca>
>
> For the bonded DSI case, DSC pic_width and timing calculations should use
> the width of a single panel instead of the total combined width.

What is a "single panel"? Please rephrase the commit message so that
it reads logically.

>
> Bonded DSI can be used to drive a single panel having two input
> channels, or to drive two panels with a input channel on every panel that
> behave like single panel for display controller.

Missing actual action. See Documentation/process/submitting-patches.rst

>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

As pointed out during internal review, missing Fixes tag. Any reason
for ignoring it?

> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         | 3 ++-
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 6 +++++-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
>  3 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 87496db203d6c..35b90c462f637 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -79,7 +79,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>                                   const struct drm_display_mode *mode);
>  enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> -                                           const struct drm_display_mode *mode);
> +                                           const struct drm_display_mode *mode,
> +                                           bool is_bonded_dsi);
>  unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
>  int msm_dsi_host_register(struct mipi_dsi_host *host);
>  void msm_dsi_host_unregister(struct mipi_dsi_host *host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 6388bb12696ff..7a4d9c071be5a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2489,7 +2489,8 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>  }
>
>  enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> -                                           const struct drm_display_mode *mode)
> +                                           const struct drm_display_mode *mode,
> +                                           bool is_bonded_dsi)
>  {
>         struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>         struct drm_dsc_config *dsc = msm_host->dsc;
> @@ -2499,6 +2500,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>         if (!msm_host->dsc)
>                 return MODE_OK;
>
> +       if (is_bonded_dsi)
> +               pic_width = mode->hdisplay / 2;
> +
>         if (pic_width % dsc->slice_width) {
>                 pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
>                        pic_width, dsc->slice_width);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index a210b7c9e5ca2..6e915b57e14bb 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -420,7 +420,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>                         return MODE_ERROR;
>         }
>
> -       return msm_dsi_host_check_dsc(host, mode);
> +       return msm_dsi_host_check_dsc(host, mode, IS_BONDED_DSI());
>  }
>
>  static int dsi_mgr_bridge_attach(struct drm_bridge *bridge,
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

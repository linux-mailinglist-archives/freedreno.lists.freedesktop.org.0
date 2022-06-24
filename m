Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FA555A3C5
	for <lists+freedreno@lfdr.de>; Fri, 24 Jun 2022 23:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65B710F52D;
	Fri, 24 Jun 2022 21:40:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0460110F532
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 21:40:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id u12so7205954eja.8
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 14:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FZYod/LHle/jfmWY/zvHrx8O3LfygSNaaLJbeeaZy9Y=;
 b=DJ9UIKSaDy12f3GUuM7BXgQfiPoT1tdOHJpXBuuYiRAnyaqQSjwsLm4lUs+FHTrtk2
 LQVknHtWZmBnM1asHoNucamNkZ4o/mp0QAs9srJymrFPcXvA+B0Yu3ZssKtFcdl2HwJG
 gplTqpsHbl802WvWckpxCq4yTxwUI5B06ZJy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FZYod/LHle/jfmWY/zvHrx8O3LfygSNaaLJbeeaZy9Y=;
 b=S7OD3hMNgGCKs/ro1J4yBuceYOVzmdZb4ISDFIOX9O4bDRahyoPTOryD3nCsGypudR
 zFtuVb90z2ukeGjyBhMKBNDwcTRk2g6Lzy92Q+CZ6DwqsBVnbGktI96S/APt2kEbKuBw
 b5UyA5e5X7QkVjHFfdd9djG7maRoLAGrnw1SJJw2nkvcFcTJWdiEtg8gxRhJhhUVv4Fj
 MpS9o0y50QX/7fYL45xazv3mGfPq5fUX84UoOa0SyIx3Ym+7pgvq7IcoPv16LxVUMP8u
 m1DRo+mCo24JGKEIxDt4OpkdHvYM5YfGDbKp4cQkTCHyX6ScHZVS+btZiG7M1a3aW+ZU
 MLPQ==
X-Gm-Message-State: AJIora8NvkapZetIrl+o0Y08GRreS7lJ+j3D9UaxK+vRSGneRwnlIY7j
 v9YQXBuA2mBuGQVqmluaHQP6OIKgkW5WIxQYMoc=
X-Google-Smtp-Source: AGRyM1tJsF+M8I5oYrXKAjXMjyy5YKqroOae1DeE5aDieEi6zvnhd8/+PMwJUxjuYDQzneFLFEN5fw==
X-Received: by 2002:a17:906:c154:b0:711:ce44:a0a0 with SMTP id
 dp20-20020a170906c15400b00711ce44a0a0mr1075389ejc.420.1656106820222; 
 Fri, 24 Jun 2022 14:40:20 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 z23-20020a170906435700b007094f98788csm1707126ejm.113.2022.06.24.14.40.18
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 14:40:19 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id f190so1715692wma.5
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 14:40:18 -0700 (PDT)
X-Received: by 2002:a7b:c392:0:b0:39c:4d27:e698 with SMTP id
 s18-20020a7bc392000000b0039c4d27e698mr1150788wmj.57.1656106818114; Fri, 24
 Jun 2022 14:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1656090912-18074-2-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Jun 2022 14:40:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XD0Nb8GiaqEM52rEkUeVjuo46hBv9YUizdDu9zOH6QfA@mail.gmail.com>
Message-ID: <CAD=FV=XD0Nb8GiaqEM52rEkUeVjuo46hBv9YUizdDu9zOH6QfA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 1/3] drm/msm/dp: move struc of
 msm_display_info to msm_drv.h
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 24, 2022 at 10:15 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> With current implementation, communication between interface driver and
> upper mdss encoder layer are implemented through function calls. This
> increase code complexity. Since struct msm_display_info contains msm
> generic display information, it can be expended to contains more useful
> information, such as widebus and dcs, in future to serve as communication
> channel purpose between interface driver and upper mdss encoder layer so
> that existing function calls can be eliminated.
> This patch more struct msm_display_info to msm_drv.h to be visible by
> whole msm scope.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 20 --------------------
>  drivers/gpu/drm/msm/msm_drv.h               | 19 +++++++++++++++++++
>  2 files changed, 19 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 781d41c..6b604c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -19,26 +19,6 @@
>  #define IDLE_TIMEOUT   (66 - 16/2)
>
>  /**
> - * struct msm_display_info - defines display properties
> - * @intf_type:          DRM_MODE_ENCODER_ type
> - * @capabilities:       Bitmask of display flags
> - * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
> - * @h_tile_instance:    Controller instance used per tile. Number of elements is
> - *                      based on num_of_h_tiles
> - * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
> - *                              used instead of panel TE in cmd mode panels
> - * @dsc:               DSC configuration data for DSC-enabled displays
> - */
> -struct msm_display_info {
> -       int intf_type;
> -       uint32_t capabilities;
> -       uint32_t num_of_h_tiles;
> -       uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> -       bool is_te_using_watchdog_timer;
> -       struct msm_display_dsc_config *dsc;

So in the structure you're "moving" there's this member called "dsc".


> -};
> -
> -/**
>   * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
>   * @encoder:   encoder pointer
>   * @crtc:      crtc pointer
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index fdbaad5..f9c263b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -106,11 +106,30 @@ struct msm_drm_thread {
>         struct kthread_worker *worker;
>  };
>
> +<<<<<<< HEAD

The above doesn't look like valid C to me.


>  /* DSC config */
>  struct msm_display_dsc_config {
>         struct drm_dsc_config *drm;
>  };
>
> +/**
> + * struct msm_display_info - defines display properties
> + * @intf_type:          DRM_MODE_ENCODER_ type
> + * @capabilities:       Bitmask of display flags
> + * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
> + * @h_tile_instance:    Controller instance used per tile. Number of elements is
> + *                      based on num_of_h_tiles
> + * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
> + *                              used instead of panel TE in cmd mode panels
> + */
> +struct msm_display_info {
> +       int intf_type;
> +       uint32_t capabilities;
> +       uint32_t num_of_h_tiles;
> +       uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> +       bool is_te_using_watchdog_timer;

...but then when you "move" the structure to its new location, which
should be a noop, then <poof> the "dsc" variable vanishes (along with
the kernel doc description of it before the structure).

-Doug

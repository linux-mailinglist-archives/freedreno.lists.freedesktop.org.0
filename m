Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D4A4EE4A1
	for <lists+freedreno@lfdr.de>; Fri,  1 Apr 2022 01:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F91710E31C;
	Thu, 31 Mar 2022 23:22:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CDE10E07C
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 23:22:39 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id g22so1048383edz.2
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 16:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avSGMtSz4ymacyl7GdMhd9/3YRX9NuWMZI8WC7CMKV0=;
 b=RB7qN+1nHYmA5Ki3RYQ5cOwMq+8+ec2V05lMPrIjOE0+2UCFYYM2uKN8wEUMfprHJd
 ber657p1Z3CwyukZldarn6sF9qZcZhzTh9Y/Nr6kgjdUGxUXyW3xmTRVYJOBuVfSKLTL
 qWjEu993x0lx2WpR1RPuyTpar5XfsrMV/EV58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avSGMtSz4ymacyl7GdMhd9/3YRX9NuWMZI8WC7CMKV0=;
 b=hXwboY3TEW0Xn/dlbCOVLgWx/u42kQAE6M2Wa+aZiE2NyZRNQrTFJwP5twjDqCalqL
 Wl/AexuJQy0sdZeEzpfkz2IrJ/8buIwycoOXOmuIlyjpJtrlmBq6J3VJby8F7yX7VtC1
 YcNudQnMWXubOVnWuifAxdzoEnd5o5q3ame58hyS4HBTmkltFpB0mzev0ZQEZ5B83+rU
 fs6Cb7MGbm86e0T0GJmLvaHNwQIkU4Wvkl0kzT5E2SmlzD/2z4uBxQ4okYWamFeTHM1N
 PYsbNHsdzMIEUB6D4ZHpltzK3kV7HWTho7VoQEKLEdTpV2E5dTnHG+YhyEJubNzBLRXb
 ++Hw==
X-Gm-Message-State: AOAM532ju8OuDPsM3PgW5pY7WiSe1LtW/o+YQhHF+9aM2TBj4qVIB9Vb
 nDkdqqZG8tqqSoors5h7EOfg54S1XLSTEIlw
X-Google-Smtp-Source: ABdhPJxx7Kv8ZetpGvNzlC6HPNBiYbHqpn9QKlP1wafhHPbwWFB7u0nSbDSZNxV/lkQpQ3LUlp1y3A==
X-Received: by 2002:a05:6402:914:b0:419:a627:ef6f with SMTP id
 g20-20020a056402091400b00419a627ef6fmr18551664edz.67.1648768958159; 
 Thu, 31 Mar 2022 16:22:38 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm308412ejb.194.2022.03.31.16.22.37
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 16:22:38 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 n63-20020a1c2742000000b0038d0c31db6eso518266wmn.1
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 16:22:37 -0700 (PDT)
X-Received: by 2002:a05:600c:2e02:b0:38c:8390:d8ca with SMTP id
 o2-20020a05600c2e0200b0038c8390d8camr6452311wmf.15.1648768957118; Thu, 31 Mar
 2022 16:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Mar 2022 16:22:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UtnNTWmMPYPkSJ5qceWspXtZ+hL6UTgSn=rHzd39Y42g@mail.gmail.com>
Message-ID: <CAD=FV=UtnNTWmMPYPkSJ5qceWspXtZ+hL6UTgSn=rHzd39Y42g@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 2/8] drm/msm/dp: wait for hpd high before
 aux transaction
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 9:03 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The source device should ensure the sink is ready before proceeding to
> read the sink capability or performing any aux transactions. The sink

s/performing/perform

> will indicate its readiness by asserting the HPD line. The controller
> driver needs to wait for the hpd line to be asserted by the sink before
> performing any aux transactions.
>
> The eDP sink is assumed to be always connected. It needs power from the
> source and its HPD line will be asserted only after the panel is powered
> on. The panel power will be enabled from the panel-edp driver and only
> after that, the hpd line will be asserted.
>
> Whereas for DP, the sink can be hotplugged and unplugged anytime. The hpd
> line gets asserted to indicate the sink is connected and ready. Hence
> there is no need to wait for the hpd line to be asserted for a DP sink.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v6:
>   - Wait for hpd high only for eDP
>   - Split into smaller patches
>
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 13 ++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_aux.h     |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  5 files changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 6d36f63..a217c80 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -36,6 +36,7 @@ struct dp_aux_private {
>         bool initted;
>         u32 offset;
>         u32 segment;
> +       bool is_edp;
>
>         struct drm_dp_aux dp_aux;
>  };
> @@ -337,6 +338,14 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>                 goto exit;
>         }
>
> +       if (aux->is_edp) {

Adding a comment about _why_ you're doing this just for eDP would
probably be a good idea. Like maybe:

/*
 * For eDP it's important to give a reasonably long wait here for HPD
 * to be asserted. This is because the panel driver may have _just_
 * turned on the panel and then tried to do an AUX transfer. The panel
 * driver has no way of knowing when the panel is ready, so it's up
 * to us to wait. For DP we never get into this situation so let's
 * avoid ever doing the extra long wait for DP.
 */


> @@ -491,7 +500,8 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
>         drm_dp_aux_unregister(dp_aux);
>  }
>
> -struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog)
> +struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
> +                               bool is_edp)

nit: I think your indentation of the 2nd line isn't quite right.


> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
> index 82afc8d..c99aeec 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> @@ -16,7 +16,8 @@ void dp_aux_init(struct drm_dp_aux *dp_aux);
>  void dp_aux_deinit(struct drm_dp_aux *dp_aux);
>  void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
>
> -struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog);
> +struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
> +                               bool is_edp);

nit: I think your indentation of the 2nd line isn't quite right.


Things are pretty much nits, so FWIW:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

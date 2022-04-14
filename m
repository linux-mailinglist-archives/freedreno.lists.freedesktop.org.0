Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860605018FE
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 18:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5E410FC70;
	Thu, 14 Apr 2022 16:47:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB8010FC70
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 16:47:33 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z99so7112953ede.5
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 09:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nYg934FepxhPHJYVYrZutxuJmtuv3DcX7+LrwvmwUiI=;
 b=eGFM3ztMn9Emo9AjWCLBFf6FEEMtubNIu4UVefX1GeJ26mF6dhm/kQWOM5JylyVuYl
 AHn+lsZ0Yi4quPDxF8v/hLAKDCzF3fDmkLwshBHfrSsZIyCpo3q5P97DH5qN01gnoVSV
 2s/CAcL2joy6KFQjXDYCrSGLKApreqzCGzpJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nYg934FepxhPHJYVYrZutxuJmtuv3DcX7+LrwvmwUiI=;
 b=MDKPmmbUFvN6AM+DeOoLX8F8t6d7W4fqCNnfUVQF3AZ28Ey0gSaiFg/RMcjTTTNEWA
 7TnfBnEM4aoq4lrTBosGQyuVPXl/10gkQFxufHQavH0CfLFWOCYZ/FrevO12jqXMz0Yr
 +TUYnIlX/ff0fE7J3M54QHa1d1R6w+Z2ItD+6sT0sfejbrOxkLnoJMWuce2Hoi0JffKD
 +CzuN2JL6diAmSxYYisMPseTInQu5Ii2NxZKC4TqDSQm6ZAfg0kUhQm9MOp3NJAMJ6cq
 ZwzlcZZO9CUoywxLHyh9E9LPthMwYPYGgH7TNqu26NPb8C4DifRZcf0yI+eVTGx53iDf
 D1jA==
X-Gm-Message-State: AOAM532jBXPN9IdvgbkbI6gDKhUF07vV8h4tbf4ix3ZQNVLdKlbv/R8L
 9YjktHzaXKHLZqY5iPPpee0FQB1tGVibt5B20Kc=
X-Google-Smtp-Source: ABdhPJxMNrnAZwoTWQYln1uqU0ly1qxxJW8sG862xfFfCOWuKn5/mWtjz/mgrsGdJNurx8auUdFgLw==
X-Received: by 2002:a05:6402:2554:b0:41d:7f40:a8bc with SMTP id
 l20-20020a056402255400b0041d7f40a8bcmr3933059edb.371.1649954852065; 
 Thu, 14 Apr 2022 09:47:32 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 r3-20020aa7d583000000b00420a8b66566sm1242568edq.97.2022.04.14.09.47.31
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:47:31 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so6341986wmb.4
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 09:47:31 -0700 (PDT)
X-Received: by 2002:a05:600c:502b:b0:38f:f7c6:3609 with SMTP id
 n43-20020a05600c502b00b0038ff7c63609mr3225672wmr.15.1649954388394; Thu, 14
 Apr 2022 09:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1649938766-6768-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 09:39:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uc+qVKH7fAkqtB+Y_jHpWXy5tOABRCN=8TH1bibAp+8Q@mail.gmail.com>
Message-ID: <CAD=FV=Uc+qVKH7fAkqtB+Y_jHpWXy5tOABRCN=8TH1bibAp+8Q@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 2/4] drm/msm/dp: Support only IRQ_HPD and
 REPLUG interrupts for eDP
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
 Steev Klimaszewski <steev@kali.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 14, 2022 at 5:20 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The panel-edp enables the eDP panel power during probe, get_modes
> and enable.

Technically the panel-edp powers on the panel in pre_enable()


> The eDP connect and disconnect interrupts for the eDP/DP
> controller are directly dependent on panel power. As eDP display can be
> assumed as always connected, the controller driver can skip the eDP
> connect and disconnect interrupts. Any disruption in the link status
> will be indicated via the IRQ_HPD interrupts.
>
> So, the eDP controller driver can just enable the IRQ_HPD and replug
> interrupts. The DP controller driver still needs to enable all the
> interrupts.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v7:
>   - reordered the patch in the series
>   - modified the return statement for isr
>   - connector check modified to just check for eDP
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  9 +++------
>  drivers/gpu/drm/msm/dp/dp_display.c | 22 +++++++++++++++++++++-
>  2 files changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index fac815f..07f2389 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -569,10 +569,6 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>
>         u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
>
> -       /* enable HPD plug and unplug interrupts */
> -       dp_catalog_hpd_config_intr(dp_catalog,
> -               DP_DP_HPD_PLUG_INT_MASK | DP_DP_HPD_UNPLUG_INT_MASK, true);
> -
>         /* Configure REFTIMER and enable it */
>         reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
>         dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
> @@ -599,13 +595,14 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
>  {
>         struct dp_catalog_private *catalog = container_of(dp_catalog,
>                                 struct dp_catalog_private, dp_catalog);
> -       int isr = 0;
> +       int isr, mask;
>
>         isr = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
>         dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
>                                  (isr & DP_DP_HPD_INT_MASK));
> +       mask = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
>
> -       return isr;
> +       return isr & (mask | ~DP_DP_HPD_INT_MASK);

Please add a comment above this explaining what the goal of the above
statement is. I guess it's something like this, though you might want
to modify it to remove snark and insert the real reason unless you
like being snarky:

  /*
   * Report the raw status of all interrupts (AKA we still report the
   * interrupt as asserted even if it's masked) _except_ for HPD-related.
   * interrupts. We only report HPD-related interrupts if they're
   * unmasked. We do it this way because we thought it would be extra
   * confusing for readers of this code and we were bribed by Mordac to
   * confuse you.  OK, maybe that's not true. We actually do it this way
   * because of <insert your compelling reason here>.
   */

Along the same lines as my comments in patch #1, I don't have a great
feel for exactly when the various HPD bits are enabled / disabled and
it feels like it need to be made super obvious / well documented. That
being said, I'd be OK w/ that happening in the proposed cleanup.


-Doug

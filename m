Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686084EE4C8
	for <lists+freedreno@lfdr.de>; Fri,  1 Apr 2022 01:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7E710E12B;
	Thu, 31 Mar 2022 23:30:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF48910E12B
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 23:30:06 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id s13so1767242ljd.5
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 16:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oU/P0lUIzx1uZfbuXoLmvC/k7etlrfD8HbND/4uBtMs=;
 b=CVm3r8sEiJHudIn3wBe5psgjEjOXEvg7kAXV5xw19t+3DbObpkYUHppzcz6qWIyEKC
 iD+uGmLJdXzgNCcEVX3/o2rL3pH35aBBGYvKh1WC1iiWOWhQglndY1DyhfDoBvDHciUT
 HKdhiizGnGLfo9pL1ZqNneKf5bIxKreY/JwCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oU/P0lUIzx1uZfbuXoLmvC/k7etlrfD8HbND/4uBtMs=;
 b=IXA+tT2MF/r+FMbBYB4jaHz9hG/8WDIYLLkwVYmW5Ql402wRxYLyw5muqoHwr+ggaS
 IK+4jxGKqR5EUWDb7nTrRr2+vxKG3cMiip5dkx0jq+ML8fcCkWKHFzC+iVToqNRy+DkN
 l9zAvjCAHXBym9SJEb1HhZgTfgyNo0xZIqjPyT2Oo6k5HHaNw76yq+UBRGzw7nRohETA
 QkFFLos2ltHp+vcgcIa5M3NCp6WHLxWhGHFwZkSw7PNTu+8ZzqHazgp4DwXqVyhj1tZ3
 F9uRXcof09ZpKWc1B5r5TTpxv0qlDy3EqpZX0LcZPsWBFoO/aZb6M3aCMtuXlTm1VVR9
 iKcw==
X-Gm-Message-State: AOAM531pBuqGafkI7S5wOQLcqNk2mRVDg3zLrMMDMkupeV8RT2LTPuC4
 gilz3DEW4JKtL2kgk+E0vpwBXCUUWhPALOZ5taI=
X-Google-Smtp-Source: ABdhPJwcLPsytgPRm2gl1eemHEM2JBxReRf4Hh02RO7XGq6MU0QTbh8xGXE5zki4+KIvNjTmdRn6qA==
X-Received: by 2002:a2e:b88e:0:b0:249:d862:60 with SMTP id
 r14-20020a2eb88e000000b00249d8620060mr11969987ljp.250.1648769404760; 
 Thu, 31 Mar 2022 16:30:04 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05651210cb00b0044a7a3d4bfasm70358lfg.92.2022.03.31.16.30.04
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 16:30:04 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id p10so1800453lfa.12
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 16:30:04 -0700 (PDT)
X-Received: by 2002:a5d:4491:0:b0:203:f63a:e89b with SMTP id
 j17-20020a5d4491000000b00203f63ae89bmr5618171wrq.342.1648769032444; Thu, 31
 Mar 2022 16:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-8-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-8-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Mar 2022 16:23:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V92j=yEoaM4REO6ws=AXpBjM6zWwBtZ8SbPiFd2cu3yw@mail.gmail.com>
Message-ID: <CAD=FV=V92j=yEoaM4REO6ws=AXpBjM6zWwBtZ8SbPiFd2cu3yw@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 7/8] drm/msm/dp: Support edp/dp without
 hpd
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

On Wed, Mar 30, 2022 at 9:04 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Some eDP sinks or platform boards will not support hpd.
> This patch adds support for those cases.

You could say more, like:

If we're not using HPD then _both_ the panel node and the eDP
controller node will have "no-hpd". This tells the eDP panel code to
hardcode the maximum possible delay for a panel to power up and tells
the eDP driver that it should continue to do transfers even if HPD
isn't asserted.


> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 1809ce2..8f1fc71 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -244,10 +244,17 @@ void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
>
>  int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
>  {
> -       u32 state;
> +       u32 state, hpd_en;
>         struct dp_catalog_private *catalog = container_of(dp_catalog,
>                                 struct dp_catalog_private, dp_catalog);
>
> +       hpd_en = dp_read_aux(catalog, REG_DP_DP_HPD_CTRL);
> +       hpd_en &= DP_DP_HPD_CTRL_HPD_EN;
> +
> +       /* no-hpd case */
> +       if (!hpd_en)
> +               return 0;
> +
>         /* poll for hpd connected status every 2ms and timeout after 500ms */
>         return readl_poll_timeout(catalog->io->dp_controller.aux.base +
>                                 REG_DP_DP_HPD_INT_STATUS,
> @@ -586,8 +593,10 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>         reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
>         dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
>
> -       /* Enable HPD */
> -       dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
> +       /* Enable HPD if supported*/
> +       if (!of_property_read_bool(catalog->dev->of_node, "no-hpd"))

I don't think this is a particularly lightweight operation. It's
literally iterating through all of our device tree properties and
doing string compares on them. ...but this function is called somewhat
often, isn't it? It feels like the kind of thing that should happen at
probe time and be stored in a boolean.

...and then you can use that same boolean in
dp_catalog_aux_wait_for_hpd_connect_state() rather than reading the
register value, right?


-Doug

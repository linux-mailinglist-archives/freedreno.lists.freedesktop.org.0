Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B656E3D6A68
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 01:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC746EB3A;
	Mon, 26 Jul 2021 23:54:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333F36EB47
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 23:54:26 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id 21so13036271oin.8
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 16:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/VLYF7ULvK8ZBgtGaBzY2DEw131HN7Z0pCBHVUvwO54=;
 b=hxr7765n6XazZWlQrt1w5TK6xrOZnmJ0Egyb88XGLVXTWx7fLXIPJFISvBfpxLF/Rm
 xnFRkf4oY5oEMEAaOXSUwOucRnQQ/PcaM5rWWyXmoo60bUMF3vBQ5KPWF/wETQ4jt24+
 CktUVvmDz3kzCaFCDYjeWSqxbuBZmPkr2EoF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/VLYF7ULvK8ZBgtGaBzY2DEw131HN7Z0pCBHVUvwO54=;
 b=rlJ7OXUIXNk6Iy0oxugUhPj4XNhOgr/948lkhgXj/YEKQrvI4iOpzzHTTuUpKZjUpx
 rCr10j7WrpmKX/oDYhAlaLCYiYdsOxCWL9J6Ilu4w4Mwrme09eiiq5mJCEyv4wsbHzMq
 abxb7dJ+H2o5cuCNRd1Eem3Q5hyErqd3voMfQfx9js9fSB8MewVdeB16+eRE2kMiBmUg
 y9+FOI6aTuAOUZSM1bnUBHSOQvBnyMPXGfnAEnRkfJKjhcniCdeokfyTw6uYvrvdC/Za
 +vgJCvQFNto81cLJpEkpn3MA1nsdly8SVee7j4fZVWam1CFQ4QK01WjHjrAn5veyuy95
 h+Nw==
X-Gm-Message-State: AOAM532NzlToL7l11G+OUQGhmPR63BEJISXAP8ASFM8e6zC89aZ0QXDH
 AdVUrk0Y2Cz7DhcbLB7nNtjvgOnQTecuuyvsdbdmsg==
X-Google-Smtp-Source: ABdhPJzd/1nyMLgswv7B9b/xTSfgYdGHuVA0ExUmZ4ifjYmYX/hivyNvHxCzZQ7qLJmY/6pV3kbD/8Sp1ceKx2RVsA0=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr13166680oiu.19.1627343665469; 
 Mon, 26 Jul 2021 16:54:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:54:25 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-7-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
 <20210725042436.3967173-7-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 19:54:25 -0400
Message-ID: <CAE-0n52iQ5XOu=X3sVOyvYddoYRY7bHPc-5GiOwTcnOwLL2_gQ@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/dp: Add sc8180x DP controllers
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
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-24 21:24:36)
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Link: https://lore.kernel.org/linux-arm-msm/20210511042043.592802-5-bjorn.andersson@linaro.org/
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 92b7646a1bb7..c26805cfcdd1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -129,8 +129,20 @@ static const struct msm_dp_config sc7180_dp_cfg = {
>         .num_dp = 1,
>  };
>
> +static const struct msm_dp_config sc8180x_dp_cfg = {
> +       .io_start = { 0xae90000, 0xae98000, 0 },
> +       .num_dp = 3,
> +};
> +
> +static const struct msm_dp_config sc8180x_edp_cfg = {
> +       .io_start = { 0, 0, 0xae9a000 },
> +       .num_dp = 3,
> +};

Can the two structs not be combined into one struct and set as .data for
either compatible?

> +
>  static const struct of_device_id dp_dt_match[] = {
>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> +       { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
> +       { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_edp_cfg },
>         {}
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

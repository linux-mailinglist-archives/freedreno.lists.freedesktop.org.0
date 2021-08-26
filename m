Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8B53F7FC4
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 03:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7143C6E457;
	Thu, 26 Aug 2021 01:21:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DB46E457
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 01:21:52 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id n27so2483314oij.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 18:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6nXlei/Gzl2kgJrjUypJPJMbLWWtXj8x5vv2RmtYCFk=;
 b=Fl2zoS01SxGzy75oar1XNbzccL+NIMw8VXIazGxrv9mtTk3t4A/gX5nocJDAK3e4ym
 2pJb0fRgXs3r/GgRnsO6IFoFzOoWgEeImeTfwI2gd+1179p6Qf16ndE5pC9YsWH29gW2
 /n2x2Y+ste2OcTlK787bUn/Hyv9BIubrPaq7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6nXlei/Gzl2kgJrjUypJPJMbLWWtXj8x5vv2RmtYCFk=;
 b=GRbLiS+zqzfiHfYwij4sg0S1Yei+7LeZiHPCM4nrVX4nwFavvnSRVvAePAHTYbjdYX
 iguYguUdQ8ThLfd+Upu/zPPDJZlEDd/dhwKS8eccCdz2NGpIjO2Z1md8mMBKpVySo9HH
 zBz6O5aVubmyisj0LeJlbkrFu+s59K8juQTu0i9+TniBiHQgeT54ZoAKPwR5Vfk9Tndp
 vCe98HmZL1FPvErBHHmJC6iKTIUiF/vKTmAD7/gzmiX/ZF7HjXfDPlRku22fX1pAJOgG
 fa0JXSPNzfsWU8KI9xJ0S2vVBCoG2VNUK6PRh48j9/G48Frtn5KC4fxgfesbPvrmD8SK
 XVrw==
X-Gm-Message-State: AOAM533JYUidYItR4dRKvr6L/bgZV6WlIuLZ6lDQmAWX5eTVVoQ1gCso
 3CcwG5Pll99oFc19Ml2rgoL9KxqXxldFiEOaNGN3xg==
X-Google-Smtp-Source: ABdhPJz1PrTQ46AFZgnsHo3RwaOgObBPJwNmVa81VCkWSx1FhF7a08m5xnynvSJw6aQm8FOE9v9zVAEx6nn1AokhkX4=
X-Received: by 2002:a05:6808:181a:: with SMTP id
 bh26mr9465358oib.166.1629940912164; 
 Wed, 25 Aug 2021 18:21:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 01:21:51 +0000
MIME-Version: 1.0
In-Reply-To: <20210825222557.1499104-5-bjorn.andersson@linaro.org>
References: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
 <20210825222557.1499104-5-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 26 Aug 2021 01:21:51 +0000
Message-ID: <CAE-0n53EySs6UbKrcE1x1n0S22CtzneRm4fx328UzMDy5eHADA@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 4/5] drm/msm/dp: Store each subblock in
 the io region
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

Quoting Bjorn Andersson (2021-08-25 15:25:56)
> Not all platforms has DP_P0 at offset 0x1000 from the beginning of the
> DP block. So split the dss_io_data memory region into a set of
> sub-regions, to make it possible in the next patch to specify each of
> the sub-regions individually.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

One nit below:

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index dc62e70b1640..a95b05dbb11c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -25,9 +25,16 @@ enum dp_pm_type {
>         DP_MAX_PM
>  };
>
> -struct dss_io_data {
> -       size_t len;
> +struct dss_io_region {
>         void __iomem *base;
> +       size_t len;

It flip flops here. Would be nice to the diff if len was where it really
wanted to be.

> +};
> +
> +struct dss_io_data {
> +       struct dss_io_region ahb;
> +       struct dss_io_region aux;
> +       struct dss_io_region link;
> +       struct dss_io_region p0;
>  };

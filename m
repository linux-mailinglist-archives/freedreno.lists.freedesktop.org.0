Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD2038137C
	for <lists+freedreno@lfdr.de>; Sat, 15 May 2021 00:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE706F4A0;
	Fri, 14 May 2021 22:07:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009B96F49D
 for <freedreno@lists.freedesktop.org>; Fri, 14 May 2021 22:07:32 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id f8so712713qth.6
 for <freedreno@lists.freedesktop.org>; Fri, 14 May 2021 15:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IbrQjxkb0K3z7ZkPDbwumBPr7QnDKgJDV9MYg72KtXI=;
 b=dx1Df5/yzY+AeZz/rdkuLnqLf65GYwH3dHIFCdSBqpHR3fWG5VtvM11+v8Pz0I424K
 /CTN93UfyjlVQMv7eSajh07I4QztMYX0OMg0CHIOA2eA2JA68b/3utBkLzotkWwEGMYo
 pnph5wO/Gl8XUyBVgaIP6DIgLVnP/tHjlk/sY1uNq1c5iAz2ltn/TpK+gz9uARdDWfNz
 KE0Nouw9d71fwOyDTx1rde2xAF4byNR1HtLY4UzwVp7KueySru6gKGgLUrpUX49QoMAW
 qLKZzxO74ljfE8ocXZcXcgy7UgDj2/GzwxBgMcm3+7UlIM8aqyxYD+tC5H2LRLvBx7cp
 eZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IbrQjxkb0K3z7ZkPDbwumBPr7QnDKgJDV9MYg72KtXI=;
 b=bVq/h6K6E/hTouRwdci4IgPSHRM2s2GIVp2JYBszGrC4sjZsSocDJOptO63CAx4lyS
 JVY+Q6PyClavMlIJBUrBqmvH3ZJ7E30QMCUe5Jnb1WWszA25LFogYn8noJUUC+0TZ9UZ
 1vbB+hZ3hn0/Rzwkpas2S9ErcymLFL6MhuCNMMYductMQaeQTGU8ss8PpQQh9sMgbML8
 GRYH6XO+xLV21LfPKSamYwVuNdjYZymC4agnIME24WDWxUW1ZjqbAwc2/gehIUdWpBcH
 mDDdLzSXNbV+KXAKryi7Bz5uxdIr+S4NrKNEpRxeUE6iODCghhQlkWDtyHPGo5Hsx7FR
 CN9A==
X-Gm-Message-State: AOAM530vSd4WOJATQIAqv0iZPjTPoQCyPlAdPSkSBu01Porb2zzNSDRX
 oLQnDsSp/Dpl/4AVP6zjvfuYcKLKIgbYlRm1t4aUKA==
X-Google-Smtp-Source: ABdhPJxaEbRftY4lIHCyF5Rw8nvdMm5/lCdHTk5LXSje8/I/5yu/Xzt4icnH9N8EPP/ne043QHlIxNTO/PeJv6d+lKQ=
X-Received: by 2002:ac8:5810:: with SMTP id g16mr44371397qtg.135.1621030052188; 
 Fri, 14 May 2021 15:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210514213032.575161-1-arnd@kernel.org>
In-Reply-To: <20210514213032.575161-1-arnd@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 15 May 2021 01:07:21 +0300
Message-ID: <CAA8EJpoo=VS1Nk-3CpyraDFzF+0xe3SWxkVt7M=8aBNhbdh_hQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: fix 32-bit clang warning
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, Rob Clark <robdclark@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 15 May 2021 at 00:31, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang is a little overzealous with warning about a constant conversion
> in an untaken branch of a ternary expression:
>
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: error: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 5000000000 to 705032704 [-Werror,-Wconstant-conversion]
>         .max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000UL : ULONG_MAX,
>                                                       ^~~~~~~~~~~~
>
> Rewrite this to use a preprocessor conditional instead to avoid the
> warning.
>
> Fixes: 076437c9e360 ("drm/msm/dsi: move min/max PLL rate to phy config")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> As found with another patch, using __builtin_choose_expr() would
> likely also work here, but doesn't seem any more readable.
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e76ce40a12ab..accd6b4eb7c2 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -972,7 +972,11 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>                 .restore_pll_state = dsi_7nm_pll_restore_state,
>         },
>         .min_pll_rate = 600000000UL,
> -       .max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
> +#ifdef CONFIG_64BIT
> +       .max_pll_rate = 5000000000UL,
> +#else
> +       .max_pll_rate = ULONG_MAX,
> +#endif
>         .io_start = { 0xae94400, 0xae96400 },
>         .num_dsi_phy = 2,
>         .quirks = DSI_PHY_7NM_QUIRK_V4_1,
> --
> 2.29.2
>


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

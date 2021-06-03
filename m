Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1F3996D9
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 02:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225E16EE9E;
	Thu,  3 Jun 2021 00:13:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE5A6EE9E
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 00:13:37 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id u188so2086931vsu.8
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 17:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjcG7yb0p2PCjeChIEZx/qwcbpSV6pjnKIr2LM5z6DM=;
 b=NrcYLu/c53UvNnWkwbC+Vo+HdEds3SEb3xPgCuHxo4K2YM1dbNKZNmSzwYZHDBimzc
 /HlEvWxgkdSDYuT61IXOSAgsufEDnEsWcHBZGATvUQlpot1ws1yWvFR0PLqUAmoWOF2Z
 O4ys4RorI7/0D48LzE7XFm+v2Hdo8l1d1u9rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjcG7yb0p2PCjeChIEZx/qwcbpSV6pjnKIr2LM5z6DM=;
 b=QjldGyu5ivCALsYOwcxSL2uFHqMKvZLN7r52U+TKbCro+JYkmrcQhoqOJyUutKE/EP
 7xCkB+Lot2qZDCc7Y/R2gxHGyZJc2D+t+qnB8m4DUiBIKgOn8m9Mpz7qNmbZi3nqZEhK
 iuN752KmBva1Vvh49BCUbeIgyKWPLOgZLpR9UdZeqUFoLFQkSkcjY5tjsBJpAs23ZVPq
 c4J3DJDM/HnDVj+eRrRVSplYphvG6cYDi0EqRl1VJ0rcdKrJIqcfSCATvJBHA/vuHdUG
 vyfCbf+3LH5Tv96WEWWW8DodpvxOYVBwIJyocTvuhYJOr0h8MmSRSKUVtzbVZlQRkXp1
 7LPw==
X-Gm-Message-State: AOAM532XrCaKweIwAmo8YNiIY2K3bDzB3/4Tlttwo0EBzCYEWlpDRZsD
 68tOlipM3sRI5i7OqdFrCXtolLEjgTTUyA==
X-Google-Smtp-Source: ABdhPJwyiW58rgHPoBtdJ9rzRxkgIIagGwPyZwQKyCSAqchRglGqdHomyZnL6CBuv3D3mi2o7XQ/mw==
X-Received: by 2002:a67:79d2:: with SMTP id u201mr10328vsc.5.1622679216641;
 Wed, 02 Jun 2021 17:13:36 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id a9sm247234vkm.48.2021.06.02.17.13.36
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 17:13:36 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id w5so2331570uaq.9
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 17:13:36 -0700 (PDT)
X-Received: by 2002:a25:8191:: with SMTP id p17mr50542159ybk.405.1622678728912; 
 Wed, 02 Jun 2021 17:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
 <1622390172-31368-3-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1622390172-31368-3-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Jun 2021 17:05:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WuWKHo1YLRTtN_dcMDuoc9erpwaGTb6WNgwHeDLuz8qw@mail.gmail.com>
Message-ID: <CAD=FV=WuWKHo1YLRTtN_dcMDuoc9erpwaGTb6WNgwHeDLuz8qw@mail.gmail.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [Freedreno] [v5 2/5] drm/panel-simple: Support DP AUX backlight
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sun, May 30, 2021 at 8:57 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> If there is no backlight specified in the device tree and the panel
> has access to the DP AUX channel then create a DP AUX backlight if
> supported by the panel.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>
> This patch depends on [1] (drm/panel: panel-simple: Stash DP AUX bus;
> allow using it for DDC) and the previous patch (2/5) of this series.
>
> Changes in v4:
> - New
>
> Changes in v5:
> - Address review comments and move backlight functions to drm_panel.c (Douglas)
> - Create and register DP AUX backlight if there is no backlight specified in the
>   device tree and panel has the DP AUX channel. (Douglas)
> - The new drm_panel_dp_aux_backlight() will do the drm_edp_backlight_supported() check.
>
> [1] https://lore.kernel.org/dri-devel/20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid/
>
>  drivers/gpu/drm/panel/panel-simple.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index b09be6e..047fad5 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -800,6 +800,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
>         if (err)
>                 goto disable_pm_runtime;
>
> +       if (!panel->base.backlight && panel->aux) {
> +               err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
> +               if (err)
> +                       goto disable_pm_runtime;
> +       }

It's so nice now!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

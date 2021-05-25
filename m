Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4F390758
	for <lists+freedreno@lfdr.de>; Tue, 25 May 2021 19:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6358F6EA85;
	Tue, 25 May 2021 17:19:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FBF6EA85
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 17:19:02 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id v4so23659563qtp.1
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 10:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w0/3xC3kqe2mkaFTrJiNvLz+tg/CIiWw7gj3Uibgai0=;
 b=DpjOp44+hv54UbamXcHi1Io81NdpsllsShqbdEANlnxV2HneW79ilmjfE9yTMA53Hu
 wolCkRzSYN1FXKlYvS/GsjlpUvZBXmD+npc04UzVZWEKkhpPMTylp+QQ8UWyRwfhXswA
 EjvbEyffn6nxJdiISSxLjelVb8nzUklNcRRlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w0/3xC3kqe2mkaFTrJiNvLz+tg/CIiWw7gj3Uibgai0=;
 b=ZfbnjFwQ7oslNimY/xVAEZOkZSTjh4jEimQ4FD+JxhssC3uqAWnSws1pfUVO/2hGiE
 LophXOXAiZs90M7eYWUB/t1axLdGyP+osYrbkT3u5FabSSYrrKJhANOJ2xlWwqUvV9Ns
 0CSQ8RRPOxxQrg0eD2w1NJZiRb0oAucfvh1zJT6BYb/lvvQjHqjjuUA6SM/z/af0Ioav
 amGenrkiaGYMWLNJ+Eo2vfxhlv4NNY/0pXwH+jsvDnckXvUne/HQIkdw9h247SGmrVTN
 SJeZpxSPiD9RGVcvSsfr4/IHwSou0LW6wdMpsYmoKwqQjEG0cIXB4PyGAj6A5PbKKtv2
 tzFg==
X-Gm-Message-State: AOAM531i5Ji+h1XccUxcdQdDNPerJLiN0nUoSXoAoyTGy4WThT1aL9dF
 daY9bT0h3QFIApmQQ8R6NdF39ymk/tgP5Q==
X-Google-Smtp-Source: ABdhPJx/k/4losWyJU6GEU5ZurCid+fOQqTEz4D+VUnyAYkgYloMI1tHBD9y5sqDaXgsPaXpW16I/Q==
X-Received: by 2002:ac8:7f13:: with SMTP id f19mr32303418qtk.237.1621963136855; 
 Tue, 25 May 2021 10:18:56 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
 by smtp.gmail.com with ESMTPSA id a24sm1381046qtp.39.2021.05.25.10.18.55
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 10:18:55 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id i4so44130530ybe.2
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 10:18:55 -0700 (PDT)
X-Received: by 2002:a05:6902:1023:: with SMTP id
 x3mr42866654ybt.79.1621963134688; 
 Tue, 25 May 2021 10:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-3-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1621927831-29471-3-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 May 2021 10:18:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBLUqR1BqC_LO87s+4Cf5mEq=ODG_TDdm=YPYJvf7NyA@mail.gmail.com>
Message-ID: <CAD=FV=WBLUqR1BqC_LO87s+4Cf5mEq=ODG_TDdm=YPYJvf7NyA@mail.gmail.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [Freedreno] [v4 2/4] drm/panel-simple: Support for delays
 between GPIO & regulator
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 mkrishn@codeaurora.org, Lyude Paul <lyude@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, May 25, 2021 at 12:31 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> Some panels datasheets may specify a delay between the enable GPIO and
> the regulator. Support this in panel-simple.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>
> Changes in v4:
> - New
>
>  drivers/gpu/drm/panel/panel-simple.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index f9e4e60..caed71b 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -134,6 +134,22 @@ struct panel_desc {
>                 unsigned int prepare_to_enable;
>
>                 /**
> +                * @delay.power_to_enable: Time for the power to enable the display on.
> +                *
> +                * The time (in milliseconds) that it takes for the panel to
> +                * turn the display on.

Maybe a slightly better description:

The time (in milliseconds) to wait after powering up the display
before asserting its enable pin.


> +                */
> +               unsigned int power_to_enable;
> +
> +               /**
> +                * @delay.disable_to_power_off: Time for the disable to power the display off.
> +                *
> +                * The time (in milliseconds) that it takes for the panel to
> +                * turn the display off.

Maybe a slightly better description:

The time (in milliseconds) to wait after disabling the display before
deasserting its enable pin.


> +                */
> +               unsigned int disable_to_power_off;
> +
> +               /**
>                  * @delay.enable: Time for the panel to display a valid frame.
>                  *
>                  * The time (in milliseconds) that it takes for the panel to
> @@ -367,6 +383,10 @@ static int panel_simple_suspend(struct device *dev)
>         struct panel_simple *p = dev_get_drvdata(dev);
>
>         gpiod_set_value_cansleep(p->enable_gpio, 0);
> +
> +       if (p->desc->delay.disable_to_power_off)
> +               msleep(p->desc->delay.disable_to_power_off);
> +

I wonder if it's worth a warning if
"p->desc->delay.disable_to_power_off" is non-zero and p->enable_gpio
is NULL? I guess in theory it'd also be nice to confirm that p->supply
wasn't a dummy regulator, but that's slightly harder.


>         regulator_disable(p->supply);
>         p->unprepared_time = ktime_get();
>
> @@ -427,6 +447,9 @@ static int panel_simple_prepare_once(struct panel_simple *p)
>                 return err;
>         }
>
> +       if (p->desc->delay.power_to_enable)
> +               msleep(p->desc->delay.power_to_enable);
> +

Similar to above: I wonder if it's worth a warning if
"p->desc->delay.power_to_enable" is non-zero and p->enable_gpio is
NULL?

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

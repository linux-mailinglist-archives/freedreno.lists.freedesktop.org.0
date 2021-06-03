Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6266D3996D1
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 02:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065BC6EEAA;
	Thu,  3 Jun 2021 00:12:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5096EEAA
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 00:12:16 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id c3so4493952oic.8
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 17:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YY+50g2xbLmTItDZeExpa+h7sZUgks1PFFwjtEST29Q=;
 b=J+RLM6Uw8pkvedBwVfvy74tpdAUeGO0e98yDe55RjmvPdGbEjR6u0YMprrOSWzv3gF
 nSSv8X3pRykeUkcdrSaK1I/MQnjUdHw2otek61i8OwYCHm1bImLbRjDGt31WKPYg3vHX
 5OugkfuCie6rZleuvOlKW129DU0L59AeD354c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YY+50g2xbLmTItDZeExpa+h7sZUgks1PFFwjtEST29Q=;
 b=OlXmpA0Qqe3MrhRl1x4KcGe+yo+yCDdtb/gPbFvElzZrC1mcA3jjDUsx5KlRUeXaEV
 xZKDDlV8dzzzS78o/rYv+Ms1omRwVIH4zZoRlZoC3h5avLeMiNsoJUYG9BPMZi8w+enk
 w9lK4uFeU0aATUt1XDB3r9gKnfnBjIdqN5CNfjg0GmV9oJoKv7b9hs6KNsOOAo1WO6N5
 CeOTUBoK0EN46XpaEOPWC9jMMtvsLw/lpDllxWxbAtmhNSxx9HNTqZKiNZQ7iKkdK22s
 UCgSzvFewKbi88qFYUe7l8pL1X6aZ2SspG6euMWPps62xQlKjoZtWSJcaaqzdHjTN22M
 IFrw==
X-Gm-Message-State: AOAM533nRWDeKR6qQttG9f2QO+WjO9IX7IGhE8t7ECLucgl8Erd9gMQx
 9FHpmm5CBQLbcTloPe+nTQUBaOf4PpB+Nw==
X-Google-Smtp-Source: ABdhPJxDnsUo99Up7GtNVRC+2H6ZjMNfnVZ27M0A8LC9HB0UgrXLuhuW+oymA1+vaATCQpcQ/MIE7A==
X-Received: by 2002:aca:ab50:: with SMTP id u77mr23465554oie.153.1622679135468; 
 Wed, 02 Jun 2021 17:12:15 -0700 (PDT)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com.
 [209.85.161.51])
 by smtp.gmail.com with ESMTPSA id l19sm336207otk.65.2021.06.02.17.12.15
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 17:12:15 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id
 w20-20020a4a35540000b02902458551c0d6so990381oog.7
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 17:12:15 -0700 (PDT)
X-Received: by 2002:a25:2345:: with SMTP id j66mr42352856ybj.343.1622678753835; 
 Wed, 02 Jun 2021 17:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
 <1622390172-31368-4-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1622390172-31368-4-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Jun 2021 17:05:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UncbMRcrJmMiCNT6YSoSGzENnmwfEBqmV2aEGXO5mA+Q@mail.gmail.com>
Message-ID: <CAD=FV=UncbMRcrJmMiCNT6YSoSGzENnmwfEBqmV2aEGXO5mA+Q@mail.gmail.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [Freedreno] [v5 3/5] drm/panel-simple: Support for delays
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
 Krishna Manikandan <mkrishn@codeaurora.org>, Lyude Paul <lyude@redhat.com>,
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
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sun, May 30, 2021 at 8:57 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
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
> Changes in v5:
> - Update description (Douglas)
> - Warn if "power_to_enable" or "disable_to_power_off" is non-zero and panel->enable_gpio
>   is NULL (Douglas)
>
>  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 047fad5..e3f5b7e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -133,6 +133,22 @@ struct panel_desc {
>                 unsigned int prepare_to_enable;
>
>                 /**
> +                * @delay.power_to_enable: Time for the power to enable the display on.
> +                *
> +                * The time (in milliseconds) to wait after powering up the display
> +                * before asserting its enable pin.
> +                */
> +               unsigned int power_to_enable;
> +
> +               /**
> +                * @delay.disable_to_power_off: Time for the disable to power the display off.
> +                *
> +                * The time (in milliseconds) to wait before powering off the display
> +                * after deasserting its enable pin.
> +                */
> +               unsigned int disable_to_power_off;
> +
> +               /**
>                  * @delay.enable: Time for the panel to display a valid frame.
>                  *
>                  * The time (in milliseconds) that it takes for the panel to
> @@ -347,6 +363,10 @@ static int panel_simple_suspend(struct device *dev)
>         struct panel_simple *p = dev_get_drvdata(dev);
>
>         gpiod_set_value_cansleep(p->enable_gpio, 0);
> +
> +       if (p->desc->delay.disable_to_power_off)
> +               msleep(p->desc->delay.disable_to_power_off);
> +
>         regulator_disable(p->supply);
>         p->unprepared_time = ktime_get();
>
> @@ -407,6 +427,9 @@ static int panel_simple_prepare_once(struct panel_simple *p)
>                 return err;
>         }
>
> +       if (p->desc->delay.power_to_enable)
> +               msleep(p->desc->delay.power_to_enable);
> +
>         gpiod_set_value_cansleep(p->enable_gpio, 1);
>
>         delay = p->desc->delay.prepare;
> @@ -782,6 +805,11 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
>                 break;
>         }
>
> +       if (!panel->enable_gpio && desc->delay.disable_to_power_off)
> +               dev_warn(dev, "Specify enable_gpio when using disable_to_power_off delay\n");
> +       if (!panel->enable_gpio && desc->delay.power_to_enable)
> +               dev_warn(dev, "Specify enable_gpio when using power_to_enable delay\n");

Last nit is that the warning messages could be a little confusing to
someone reading the logs. I guess the target audience of the error
message is probably someone doing bringup. That person specified a
panel in their device tree and maybe isn't even aware that they're
using "disable_to_power_off" or "power_to_enable". Maybe wording
instead:

Need a delay after disabling panel GPIO, but a GPIO wasn't provided.
Need a delay after enabling panel GPIO, but a GPIO wasn't provided.

That's definitely getting into nittiness, though and I wouldn't be
upset if the patch landed with the existing messages. Thus, with or
without the change to the error message:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

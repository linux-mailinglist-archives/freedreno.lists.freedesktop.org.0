Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C528426199
	for <lists+freedreno@lfdr.de>; Fri,  8 Oct 2021 03:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D136E05C;
	Fri,  8 Oct 2021 01:11:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6063F6E05C
 for <freedreno@lists.freedesktop.org>; Fri,  8 Oct 2021 01:11:01 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id h2so17341732ybi.13
 for <freedreno@lists.freedesktop.org>; Thu, 07 Oct 2021 18:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fu1qbb9TIftGGLiopDIHJNKJDVey9e03m26BW4nVQKw=;
 b=Po56gcNdg4y0ShSFya7iIGBaaYp8lJIgoWK2sKkC2odnhSdrhLke32eYYchYWX3zz+
 Nm+/wq0ok2Zr5dKDvEpdJYix/07lkxeuSx0249JyESbN5Xlr5CvvlEpFo9YwzyBq4Zq4
 1PQnUlPIfYnZ2LBNy7px4RtIpECNMUR89AfE/U1pJLC6OaPFz9abQjsmmjE/j997mdbB
 lGGZXG8PwWP30MjktBdRJYtUrcKJafkHtsB/3XYpV5m82PgtMgNDuMRTMqnqWUCe9t3U
 54SSiScQ9DFOj6TFDreDNUcuEGJS1Lbudtab9yqFIoMbpb/qDs2KFo0pJm+ezMpmEAkN
 nFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fu1qbb9TIftGGLiopDIHJNKJDVey9e03m26BW4nVQKw=;
 b=c4NxOUO++1Uwa4QdIzF9Atjpwn5jRQ8jRm952e8OYPwk6nv3FKMcuMnG5nTjpvmUgt
 wHQYxbn65B9vka8h2iZPOGJ5GhLpvshcANGbN6ap+3I1SP9awzcPGyuBtcPOaCKpzMod
 rS7GRhm5WdiawxxxcPJXq/ejEcEwyVWZkNA/K/q/ir5O+WXUgOSi8IkxSq7AjlkM6Cel
 XhvfC51yng/1kOQ2ESLETz8omGkoOjZk5GzxnTzhmTwiDsAHV2dvuJuyQuu6MnutDSDX
 IsHbIPJmpi6Rrs75rhPg9wazRnt5Bel/582GhT1jHAyuCE/8AjTiqLDk/8n3hqVcBMXN
 Ghng==
X-Gm-Message-State: AOAM533K70ZdoWeKjQ+GclT62uOVegEelx6Rgx0XSQi7L4C4jqgD8Wwy
 DI1djBtfmJ/5uxDnnYDFfGMyo+q3pQWrPmYcO1bAeQ==
X-Google-Smtp-Source: ABdhPJzRqmpc7ZCLtvfPCPlOJuwh7NKrbymtx/f5NZk8E50MzwzoBQeCzV16ElGWYbGopGOusWI0XFQieBWdHv96j04=
X-Received: by 2002:a25:bd93:: with SMTP id f19mr285693ybh.23.1633655460310;
 Thu, 07 Oct 2021 18:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-3-swboyd@chromium.org>
 <CAGETcx9T59dHXodt9MW=tTV_hYhtNOZzYFT=35D--VN7WJ0GqQ@mail.gmail.com>
 <CAE-0n50YqKr1nKy-4WaxsfuwPiJ5kZcf46t-U_4i-TpfXzOX1g@mail.gmail.com>
 <CAE-0n532XYgT=dTTCyLcwikvxgUyGi=TcybDh=v3wQTNb=wqyw@mail.gmail.com>
In-Reply-To: <CAE-0n532XYgT=dTTCyLcwikvxgUyGi=TcybDh=v3wQTNb=wqyw@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 7 Oct 2021 18:10:24 -0700
Message-ID: <CAGETcx_0GRg7u3dAxP9u0qO-hfJ0N3V44CGLwFFX1kVxZ00g+w@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 02/34] component: Introduce the aggregate
 bus_type
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

On Thu, Oct 7, 2021 at 1:11 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Stephen Boyd (2021-10-07 11:40:07)
> > Quoting Saravana Kannan (2021-10-06 20:07:11)
> > > On Wed, Oct 6, 2021 at 12:38 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > diff --git a/drivers/base/component.c b/drivers/base/component.c
> > > > index 0a41bbe14981..d99e99cabb99 100644
> > > > --- a/drivers/base/component.c
> > > > +++ b/drivers/base/component.c
> > [...]
> > > > +                       continue;
> > > > +
> > > > +               /* Matches put in component_del() */
> > > > +               get_device(&adev->dev);
> > > > +               c->link = device_link_add(&adev->dev, c->dev,
> > > > +                                         DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> > >
> > > Remove the STATELESS flag and you'll get a bunch of other stuff done for free:
> >
> > I tried that and it didn't work for me. The aggregate device never
> > probed and I was left with no display. Let me see if I can reproduce it
> > with logging to provide more details.
>
> This patch fixes it (whitespace damaged sorry).

Not sure why you have to trigger an explicit rescan, but instead of
this patch below, you could also try setting this flag instead?
DL_FLAG_AUTOPROBE_CONSUMER

-Saravana

>
> ----8<----
> diff --git a/drivers/base/component.c b/drivers/base/component.c
> index 65042c9f8a42..43cac9ed70b7 100644
> --- a/drivers/base/component.c
> +++ b/drivers/base/component.c
> @@ -202,7 +202,7 @@ static int find_components(struct aggregate_device *adev)
>                 /* Matches put in component_del() */
>                 get_device(&adev->dev);
>                 c->link = device_link_add(&adev->dev, c->dev,
> -                                         DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +                                         DL_FLAG_PM_RUNTIME);
>                 c->adev = adev;
>         }
>
> @@ -749,7 +749,9 @@ static int __component_add(struct device *dev,
> const struct component_ops *ops,
>         mutex_unlock(&component_mutex);
>
>         /* Try to bind */
> -       return bus_rescan_devices(&aggregate_bus_type);
> +       bus_rescan_devices(&aggregate_bus_type);
> +
> +       return 0;
>  }
>
>  /**
>
>
> The important part is ignoring the return value of bus_rescan_devices().
> It's a cycle problem. The last component is probing and calling
> component_add() in its probe function. The call to component_add() is
> trying to probe the aggregate device now that all components are added.
> But when it tries to probe the aggregate device it sees that a supplier,
> which is this component calling compnent_add(), hasn't been probed yet,
> so it returns -EPROBE_DEFER. That is passed up to the component and it
> defers probe.
>
> I don't think the component device cares at all about the aggregate
> device being able to probe or not. We should be able to ignore the
> return value of bus_rescan_devices() in component_add(). I'll add a
> comment to the code here so it's more obvious.

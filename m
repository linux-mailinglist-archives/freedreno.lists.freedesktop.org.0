Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D36B425D01
	for <lists+freedreno@lfdr.de>; Thu,  7 Oct 2021 22:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C451C6F40A;
	Thu,  7 Oct 2021 20:11:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705A86F40A
 for <freedreno@lists.freedesktop.org>; Thu,  7 Oct 2021 20:11:41 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 v2-20020a05683018c200b0054e3acddd91so4442809ote.8
 for <freedreno@lists.freedesktop.org>; Thu, 07 Oct 2021 13:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=RQk4fZ8zAs/6aRjZB+mzOwZtqbl00fU4slehYKDsrqc=;
 b=IHhVwmWPbTvQi99ZO+D11B1elyHaSTPHfBa98vxfDPsiU7ydHtTDkbfrw+5UWn2CIL
 jQWGqK/pKPW/1iSVBTjlVxyLFQftacDlm45yTJ9znDdg0rSnqXGMOUPUD0Vmhi3yxtxK
 BIPcL3MhLZC72XE6J3d8bsGziRr3hllyrkc1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=RQk4fZ8zAs/6aRjZB+mzOwZtqbl00fU4slehYKDsrqc=;
 b=OQp+863Sd44hrt4Scr6uD400Itw6Q24qobyaM1cRT4g/acnUS5m4olUPjxuYB3pcKL
 ObP16ZSiDkcimFzjp5gDOXceA2ZDj/7uqNC7YPbQXxBSYqAmTFDD+Bt+rStM2gtroILE
 AQbU9lDPXg0D5jNLwMkN0r3YeOviiwaVGLc1m9omQY9k8u66nows/qfobHwgly3HpEMZ
 gPBdPYKWxlzn8aczhOcG7o9D2RKIfZPT3MWJEtY1VEi3udXgyxWQynOh8RgY97rgGrFt
 hJlsWAFWF3j3p0bD01zEz44ip1p2vZG2PiXxSGnwQfS55A/QccR652yUnNxfFrWhkX9F
 7tqw==
X-Gm-Message-State: AOAM531aUsWqscP8udkhAmX4ZBFRVzrt0FqEeiOKMZgSNBeMOjk1YdAR
 qYKbKNh1jZSuzVo0KIYoCizNyx/LU+ej2Fj2pFg97Q==
X-Google-Smtp-Source: ABdhPJw6F0cMIR3gHGSKrivUlJvz9nMPEORHTG5UDv1ab+eSfl1wmDgSWj65PdXu+FyfAhZ1Zixs1O4RRYobdhRF36Q=
X-Received: by 2002:a9d:12f4:: with SMTP id g107mr1438053otg.77.1633637500801; 
 Thu, 07 Oct 2021 13:11:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 16:11:40 -0400
MIME-Version: 1.0
In-Reply-To: <CAE-0n50YqKr1nKy-4WaxsfuwPiJ5kZcf46t-U_4i-TpfXzOX1g@mail.gmail.com>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-3-swboyd@chromium.org>
 <CAGETcx9T59dHXodt9MW=tTV_hYhtNOZzYFT=35D--VN7WJ0GqQ@mail.gmail.com>
 <CAE-0n50YqKr1nKy-4WaxsfuwPiJ5kZcf46t-U_4i-TpfXzOX1g@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 16:11:40 -0400
Message-ID: <CAE-0n532XYgT=dTTCyLcwikvxgUyGi=TcybDh=v3wQTNb=wqyw@mail.gmail.com>
To: Saravana Kannan <saravanak@google.com>
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

Quoting Stephen Boyd (2021-10-07 11:40:07)
> Quoting Saravana Kannan (2021-10-06 20:07:11)
> > On Wed, Oct 6, 2021 at 12:38 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > diff --git a/drivers/base/component.c b/drivers/base/component.c
> > > index 0a41bbe14981..d99e99cabb99 100644
> > > --- a/drivers/base/component.c
> > > +++ b/drivers/base/component.c
> [...]
> > > +                       continue;
> > > +
> > > +               /* Matches put in component_del() */
> > > +               get_device(&adev->dev);
> > > +               c->link = device_link_add(&adev->dev, c->dev,
> > > +                                         DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> >
> > Remove the STATELESS flag and you'll get a bunch of other stuff done for free:
>
> I tried that and it didn't work for me. The aggregate device never
> probed and I was left with no display. Let me see if I can reproduce it
> with logging to provide more details.

This patch fixes it (whitespace damaged sorry).

----8<----
diff --git a/drivers/base/component.c b/drivers/base/component.c
index 65042c9f8a42..43cac9ed70b7 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -202,7 +202,7 @@ static int find_components(struct aggregate_device *adev)
 		/* Matches put in component_del() */
 		get_device(&adev->dev);
 		c->link = device_link_add(&adev->dev, c->dev,
-					  DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+					  DL_FLAG_PM_RUNTIME);
 		c->adev = adev;
 	}

@@ -749,7 +749,9 @@ static int __component_add(struct device *dev,
const struct component_ops *ops,
 	mutex_unlock(&component_mutex);

 	/* Try to bind */
-	return bus_rescan_devices(&aggregate_bus_type);
+	bus_rescan_devices(&aggregate_bus_type);
+
+	return 0;
 }

 /**


The important part is ignoring the return value of bus_rescan_devices().
It's a cycle problem. The last component is probing and calling
component_add() in its probe function. The call to component_add() is
trying to probe the aggregate device now that all components are added.
But when it tries to probe the aggregate device it sees that a supplier,
which is this component calling compnent_add(), hasn't been probed yet,
so it returns -EPROBE_DEFER. That is passed up to the component and it
defers probe.

I don't think the component device cares at all about the aggregate
device being able to probe or not. We should be able to ignore the
return value of bus_rescan_devices() in component_add(). I'll add a
comment to the code here so it's more obvious.

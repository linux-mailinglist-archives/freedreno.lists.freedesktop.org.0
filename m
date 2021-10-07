Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C055425B08
	for <lists+freedreno@lfdr.de>; Thu,  7 Oct 2021 20:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49026E58E;
	Thu,  7 Oct 2021 18:40:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6786E58E
 for <freedreno@lists.freedesktop.org>; Thu,  7 Oct 2021 18:40:08 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id s24so10264938oij.8
 for <freedreno@lists.freedesktop.org>; Thu, 07 Oct 2021 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=guZCAG9/M6PTktkx+p5Y506i79kkw+F0pi1xST3ThjI=;
 b=eoaFzaHrfJm1jzZKszGfYysGFsPkWiLkV42qmUaekj0K6fMN2c0pWhvZv78K/0Ad4h
 B0fmpjHvEEU6jmiaMpLUfTIJNZ8ZO+LbthEG1lvmrkvlipbM6Ca0ExLXeRmTVr00aJRd
 aEUGwgH+rUznkfE9N4jbS5jI3a4+CT93HQVqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=guZCAG9/M6PTktkx+p5Y506i79kkw+F0pi1xST3ThjI=;
 b=OqvWJJaeuyjdLIaYBTn+TIKKhcfJ391/XrxpEEahipFaH34kDvxKuuAxlv4Ilc3PsW
 yX1/GaN1DBHpD1BM9iiqf/uG+A0f64KJ1tOd1aJ1h2BwXaymzqr1b4hjeG7i/WtcwGYo
 sLyNbMtL84PgnhtVluSt93KeScUfKjj7TbCioFVJDgXm6GWcXC2FyWi8bkUM270PblO0
 nHd8ePMExAtse1M6UI6vjIHCfeu2uHM9zp+oayeDLP9voCHOo/TxRy7ScWYe7BvB/rbr
 Wiqd9QW/aF1H/fMmkK0ug/TaCOcBOvJdT2hoydvGzkF/KY26RBh9014T7kIP3dQkEEWE
 pk7Q==
X-Gm-Message-State: AOAM5330mlR9g13Qltn3Bcq6T9v2XscmwSg3Mcxdd2mCo7uYWG6xZpfi
 Af8/OEv0S/FPNwXGcEDhcDGon2Fg9BPBzmm2cRvlng==
X-Google-Smtp-Source: ABdhPJxpUjFTInikBOthEuo2yMMcPcoUAGKwZEFNquucXrsgJOhNGhmC42pATrvLazjiCWiuJ+9KXCooSjB2ec7opUg=
X-Received: by 2002:aca:f02:: with SMTP id 2mr4508153oip.64.1633632007694;
 Thu, 07 Oct 2021 11:40:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 14:40:07 -0400
MIME-Version: 1.0
In-Reply-To: <CAGETcx9T59dHXodt9MW=tTV_hYhtNOZzYFT=35D--VN7WJ0GqQ@mail.gmail.com>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-3-swboyd@chromium.org>
 <CAGETcx9T59dHXodt9MW=tTV_hYhtNOZzYFT=35D--VN7WJ0GqQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 14:40:07 -0400
Message-ID: <CAE-0n50YqKr1nKy-4WaxsfuwPiJ5kZcf46t-U_4i-TpfXzOX1g@mail.gmail.com>
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

Quoting Saravana Kannan (2021-10-06 20:07:11)
> On Wed, Oct 6, 2021 at 12:38 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > diff --git a/drivers/base/component.c b/drivers/base/component.c
> > index 0a41bbe14981..d99e99cabb99 100644
> > --- a/drivers/base/component.c
> > +++ b/drivers/base/component.c
[...]
> > +                       continue;
> > +
> > +               /* Matches put in component_del() */
> > +               get_device(&adev->dev);
> > +               c->link = device_link_add(&adev->dev, c->dev,
> > +                                         DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
>
> Remove the STATELESS flag and you'll get a bunch of other stuff done for free:

I tried that and it didn't work for me. The aggregate device never
probed and I was left with no display. Let me see if I can reproduce it
with logging to provide more details.

> 1. The aggregate device would get force unbound when the component
> devices unbind.
> 2. You don't need to explicitly keep track of and delete the link. If
> either of the devices get deleted, it'll get deleted automatically.
> 3. It will avoid useless probe attempts of the aggregate device before
> all the component devices are probed.
>

I don't think point 3 is happening right now. We only try to probe the
aggregate device once all components probe.

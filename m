Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A445751BF2C
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 14:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC8E10E0A5;
	Thu,  5 May 2022 12:21:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195BE10E0A5
 for <freedreno@lists.freedesktop.org>; Thu,  5 May 2022 12:21:02 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id y2so7287040ybi.7
 for <freedreno@lists.freedesktop.org>; Thu, 05 May 2022 05:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oqzYqmtOukgWsbQu7Sm4paiPoURWMu6g5DfWZGiQmpI=;
 b=yu0XS7cRt5+84Nt1NOCR0GMW7QRyqAy9GCxDc2pywEbKshYlRAnflbX9eMW5SWgt89
 B3DJKW/GdF0mi+yyLwkDGXaBZnGrgL6NohACS11JfQe7eWLV4N5bNvIdLS1a8q4AJvtu
 ObrfQOVYiB0GgjNnMXXoFIDxQGXtHKgswDO+c8Y4erVLSYZ+WmmailrpjoSCswcHpoJj
 LalM4+ALYML4fZ8x52uw00sc5kVyUVxw+XtE8BTAWCpHH3Hrf0qsHlojaVSRwTlYUj+x
 6ovfoRXedOmY9piTq1fgHsSwLGcWp5rjJY+E9eSnWhzHwCJwLILT03fnGiHCPxYcOQ51
 yM6Q==
X-Gm-Message-State: AOAM531AS6hz/pW+79AeeHJlMDyWT9A++iAAlLrhMDGJ3b+sDTxWVktm
 vIUxezkOKfhs8mO2u6iysAvKW78vEXEptGxQBY4=
X-Google-Smtp-Source: ABdhPJyG1iLik/vFtFS9S/zeuipmFl5Gpkix5aWcrJKW9hkV7rmqAdKIbPiRyp0qfbH/Xm9ONsG2JYip54XwJP1Ai5U=
X-Received: by 2002:a25:da84:0:b0:648:423e:57b0 with SMTP id
 n126-20020a25da84000000b00648423e57b0mr20879291ybf.137.1651753261048; Thu, 05
 May 2022 05:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220429164325.1.I2a3b980ea051e59140227999f0f0ca16f1125768@changeid>
 <CAHp75VdqbXCYoEwxMt7xG55QDu2mXHbnpwdnHb6ktm8NdVPJnQ@mail.gmail.com>
In-Reply-To: <CAHp75VdqbXCYoEwxMt7xG55QDu2mXHbnpwdnHb6ktm8NdVPJnQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 5 May 2022 14:20:50 +0200
Message-ID: <CAJZ5v0hKrnRznpTjTyb8ANGN=REaukAbqQNB_14i_NwAA84=uA@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] device property: Fix recent breakage of
 fwnode_get_next_parent_dev()
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Scally <djrscally@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, May 1, 2022 at 9:50 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Apr 30, 2022 at 3:00 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > Due to a subtle typo, instead of commit 87ffea09470d ("device
> > property: Introduce fwnode_for_each_parent_node()") being a no-op
> > change, it ended up causing the display on my sc7180-trogdor-lazor
> > device from coming up unless I added "fw_devlink=off" to my kernel
> > command line. Fix the typo.
>
> Sorry and merci pour la fix!
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Applied, thanks!

> > Fixes: 87ffea09470d ("device property: Introduce fwnode_for_each_parent_node()")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/base/property.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/property.c b/drivers/base/property.c
> > index 36401cfe432c..52e85dcb20b5 100644
> > --- a/drivers/base/property.c
> > +++ b/drivers/base/property.c
> > @@ -600,7 +600,7 @@ struct device *fwnode_get_next_parent_dev(struct fwnode_handle *fwnode)
> >         struct device *dev;
> >
> >         fwnode_for_each_parent_node(fwnode, parent) {
> > -               dev = get_dev_from_fwnode(fwnode);
> > +               dev = get_dev_from_fwnode(parent);
> >                 if (dev) {
> >                         fwnode_handle_put(parent);
> >                         return dev;
> > --
> > 2.36.0.464.gb9c8b46e94-goog
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko

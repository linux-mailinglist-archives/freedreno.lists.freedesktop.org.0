Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D17526E48
	for <lists+freedreno@lfdr.de>; Sat, 14 May 2022 07:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0688610EEA2;
	Sat, 14 May 2022 05:47:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1F310EEA2
 for <freedreno@lists.freedesktop.org>; Sat, 14 May 2022 05:47:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8F0260AC7;
 Sat, 14 May 2022 05:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F21C340EE;
 Sat, 14 May 2022 05:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652507240;
 bh=vf2oLc0MEqjD1BilnbgV6Jliq+/poCm2Ji1IcvG5qhI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TnBQ3gW3Mgy4xSLlzsQVY2FkVHtJnnEKuaXFFByUIkHP/U0KYDC3ezH/tkBPNSMBO
 BFBY23Gepo3P6EzjbmtkfdRwN2K0WI+iqfsrna0jSQNHaqca8aRP6WcRvgUPO1gr6B
 WRHWuZ6uq/ARgsBKCsKy8g4GnZ0dzbvypbowjpcM=
Date: Sat, 14 May 2022 07:47:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Saravana Kannan <saravanak@google.com>
Message-ID: <Yn9CY99u4HkPGHDa@kroah.com>
References: <20220429164325.1.I2a3b980ea051e59140227999f0f0ca16f1125768@changeid>
 <CAHp75VdqbXCYoEwxMt7xG55QDu2mXHbnpwdnHb6ktm8NdVPJnQ@mail.gmail.com>
 <CAJZ5v0hKrnRznpTjTyb8ANGN=REaukAbqQNB_14i_NwAA84=uA@mail.gmail.com>
 <CAGETcx_9MNGBi1avOzYoOOaed0CVHa03dfTxYpQuOErtpiisLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx_9MNGBi1avOzYoOOaed0CVHa03dfTxYpQuOErtpiisLg@mail.gmail.com>
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Daniel Scally <djrscally@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, May 13, 2022 at 08:58:12PM -0700, Saravana Kannan wrote:
> On Thu, May 5, 2022 at 5:21 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Sun, May 1, 2022 at 9:50 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Sat, Apr 30, 2022 at 3:00 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > Due to a subtle typo, instead of commit 87ffea09470d ("device
> > > > property: Introduce fwnode_for_each_parent_node()") being a no-op
> > > > change, it ended up causing the display on my sc7180-trogdor-lazor
> > > > device from coming up unless I added "fw_devlink=off" to my kernel
> > > > command line. Fix the typo.
> > >
> > > Sorry and merci pour la fix!
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> > Applied, thanks!
> 
> Has this been picked up by one of the driver-core branches yet? I was
> poking around that
> git repo and didn't see any commit with this title. This breaks
> fw_devlink in a severe manner, so I want to make sure it gets into
> 5.18.

Look in linux-next:
	117ef574074d ("device property: Fix recent breakage of fwnode_get_next_parent_dev()")

Rafael's tree is not my tree :)

thanks,

greg k-h

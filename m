Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450B526DFB
	for <lists+freedreno@lfdr.de>; Sat, 14 May 2022 05:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90B110E103;
	Sat, 14 May 2022 03:58:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2110610E074
 for <freedreno@lists.freedesktop.org>; Sat, 14 May 2022 03:58:49 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id w187so18419302ybe.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 May 2022 20:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GT9/q30klIOZiNi12Byl1O8n++vZSioA/Bb3DiRLCoc=;
 b=b9aVU7IS90gpAcPOVXeUUrzRXPZYphDZXmhfMOkEgJQ0e8/RprHm3Tru+rqh0eu/jP
 +n+RJB1cn+kThXEeRgZv3mfaquhe++Vzq8HazzqAAM+xvKu/o65jXbXFJ7FLfvnG0L2X
 z6AeKhwLSb05/HIc8T0pKufqixhuDC5lp3vBhssiTDDtccAOAjgpAijozUNZ0Gic9K8a
 GS+rPR30c8EgzGZ0TTaTWHGNsyTqAxZ3GpD9QJu3i/JNT2qSik9ALRb9T9DBno78oVbZ
 9GWixvBNT3L7/uh+PeNGp8S7tXWLa/fuHpW6kLY4B9I1fgL4a0I9ZvJYqbq9S1tiD3mf
 siqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GT9/q30klIOZiNi12Byl1O8n++vZSioA/Bb3DiRLCoc=;
 b=o4D4IByF5x1QVlRq6vGEoKwRi9+qnc6hHXj2P5RM9z8KC9L89X9oQCyKNBw5GQZsNX
 CzyP7oTtBFPYJgUsDwYt1P31fhV6W0+Fby4Sdw+u5dclYpRV26QvDMXtv/Hwmbse9xtv
 QMIzZpudPdZMqX1H2xr560F9Oyc7qW3KnZcHgoY+3fr7BplrjNgylnwhkRonKtgYzU7T
 JgHlDh7x0rbh3R7H5af05j1fcWJk3rPJrMXCLwiDJ5yrL7i35KD5ZZp26WTbwaKXceEo
 yzMNn9sNSSqbojd8bVX+IjIrniYdgYSvMXGjN60GPkLOVsaoEO6mGLoMQAQ3srjBnOgd
 Zovg==
X-Gm-Message-State: AOAM5302F6LN4qr60gsMi+u7401z7DAxO0ZU//ubyehe+7IOtU90Rysc
 mzSfkqqYr9tC2AnFH/d0m0sNOpthJ3YDbyurY1HNrw==
X-Google-Smtp-Source: ABdhPJyA0cZpGgVC+vHuXsPtJhVk9N1EspaO4yzHpGvrbO4jnRAAMhk7yYaKZyXDuU7oq2lHHQw5HbRctiWXIBKLOBM=
X-Received: by 2002:a25:504c:0:b0:64b:979c:1bae with SMTP id
 e73-20020a25504c000000b0064b979c1baemr5867654ybb.563.1652500728034; Fri, 13
 May 2022 20:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220429164325.1.I2a3b980ea051e59140227999f0f0ca16f1125768@changeid>
 <CAHp75VdqbXCYoEwxMt7xG55QDu2mXHbnpwdnHb6ktm8NdVPJnQ@mail.gmail.com>
 <CAJZ5v0hKrnRznpTjTyb8ANGN=REaukAbqQNB_14i_NwAA84=uA@mail.gmail.com>
In-Reply-To: <CAJZ5v0hKrnRznpTjTyb8ANGN=REaukAbqQNB_14i_NwAA84=uA@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 13 May 2022 20:58:12 -0700
Message-ID: <CAGETcx_9MNGBi1avOzYoOOaed0CVHa03dfTxYpQuOErtpiisLg@mail.gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Daniel Scally <djrscally@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, May 5, 2022 at 5:21 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Sun, May 1, 2022 at 9:50 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Sat, Apr 30, 2022 at 3:00 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > Due to a subtle typo, instead of commit 87ffea09470d ("device
> > > property: Introduce fwnode_for_each_parent_node()") being a no-op
> > > change, it ended up causing the display on my sc7180-trogdor-lazor
> > > device from coming up unless I added "fw_devlink=off" to my kernel
> > > command line. Fix the typo.
> >
> > Sorry and merci pour la fix!
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Applied, thanks!

Has this been picked up by one of the driver-core branches yet? I was
poking around that
git repo and didn't see any commit with this title. This breaks
fw_devlink in a severe manner, so I want to make sure it gets into
5.18.

-Saravana


-Saravana

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B17AB3A4959
	for <lists+freedreno@lfdr.de>; Fri, 11 Jun 2021 21:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CC36E082;
	Fri, 11 Jun 2021 19:15:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7B06E082
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jun 2021 19:15:30 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id m21so10035177lfg.13
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jun 2021 12:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XX1W3URWQ8r7C42PWjWKsvggaK12j8Zhh8tbxVvnO2w=;
 b=nTb2yspBH9u7uwoFjX8jsvdCFER3T7Bg+mpnOMpkt4egaQm7qPi7JOIsnAKqah/LXZ
 drWRb1WZk+czg48dmZFpssa0KuRfbWn7mW3UVNp3P5AKH2B3xN15/uWNvDDYh/R/iDqf
 KZJKULNgY5qxFSwUY/CtclPh7LQYPy11OEBjje2bPI2ycK1Iay5R070vmzOX8iTf5Va8
 RnYlsgYc+bIvRwDdB/cjijQcprkz0x1qGD7wE7fcyK9tfWT/kbuIe5LsiRTllfH2Dcmf
 fg85Tw49uriMJ6UDesjh15oUodZahOpAsnAi1yJJVFjlkBkEoMpSZADCnUiJG+alXrFh
 n31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XX1W3URWQ8r7C42PWjWKsvggaK12j8Zhh8tbxVvnO2w=;
 b=rDoJc2aeiHOP/YE3nFRwBlmAkbymQ5Hiw1ovjwNXhy6g5c3wONsgAvnejwKgi9yLXx
 nejhlmyFRol7hVEe8V4Jthwz0PMFIxeAFJPtWSsW7O7GEMryTjgkuOSwvtdwEkOo+TrF
 tYr2qAh/GamZAcGYW6LbmzZfTMqn/S4+BRsTZtM5xPdwFqcEAWKPrLRqYmTn287cRF0J
 KiNu7fX1CaBvLdKGps1YjEhlNYCwD4ftZ0yd0KKn/+QoelkcqgQ4GrUAuRykKevc6POz
 Tja2SIC73GuSzeWp0B8dOvWR4+IIqrj05UCDwpT8jJD6v7JR7NF7acZWUc/5vVTmiFC3
 0EiQ==
X-Gm-Message-State: AOAM5331OOUbbNGla6YVhRxVkowA0RpQSeX+iW0/f+nmXk8p/vPOzTUj
 q0SZjKA2HG6fNwFO34F6m5XztkSWFnERU32Jeovtbw==
X-Google-Smtp-Source: ABdhPJzojiGmPxWqA+iJlZvJDBVswkAfdjKbLrU0iZLy3nWfGlyWzCEH7Q2CBe44XskeGNFG3yWJgOHAbCBUTjJOHNU=
X-Received: by 2002:a19:c181:: with SMTP id r123mr3490274lff.7.1623438928342; 
 Fri, 11 Jun 2021 12:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
 <20210331105735.3690009-23-dmitry.baryshkov@linaro.org>
 <CALAqxLVwpLOsvjBVi+xb5S2VQNuGKgeOzrSqwZe5FN6RSeEEWA@mail.gmail.com>
 <CAA8EJprMKydEKQhHr=wk76H_a1-udjspVXSY1j2tqHNErAG-uQ@mail.gmail.com>
In-Reply-To: <CAA8EJprMKydEKQhHr=wk76H_a1-udjspVXSY1j2tqHNErAG-uQ@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 11 Jun 2021 12:15:16 -0700
Message-ID: <CALAqxLVeCH-8eiDZVy6vN4nD594od69A388bTwfJsJfmgb3Ddw@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v4 22/24] drm/msm/dsi: remove temp data from
 global pll structure
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Vinod Koul <vinod.koul@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Collingbourne <pcc@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 2:01 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi,
>
> On Fri, 11 Jun 2021 at 10:07, John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Wed, Mar 31, 2021 at 3:58 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > The 7nm, 10nm and 14nm drivers would store interim data used during
> > > VCO/PLL rate setting in the global dsi_pll_Nnm structure. Move this data
> > > structures to the onstack storage. While we are at it, drop
> > > unused/static 'config' data, unused config fields, etc.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> > > Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
> >
> > Hey Dmitry,
> >   Just wanted to give you a heads up.  Peter Collingbourne reported
> > today that his db845c wasn't booting to display for him on his 4k
> > monitor. It works fine on a 1080p screen, and while 4k isn't supported
> > (yet?),  normally the board should fall back to 1080p when connected
> > to a 4k monitor.  I was able to reproduce this myself and I see the
> > errors below[1].
>
> It looks like I made a mistake testing these patches with the splash
> screen disabled.
> Stephen Boyd has proposed a fix few days ago (will be included into
> the 5.13). Could you check that it fixes the problem for you?
>
> https://lore.kernel.org/linux-arm-msm/20210608195519.125561-1-swboyd@chromium.org/

Ah! This does seem to fix it! Thank you so much for pointing it out!

thanks
-john
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

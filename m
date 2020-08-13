Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C33D243B24
	for <lists+freedreno@lfdr.de>; Thu, 13 Aug 2020 16:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395FE6E20B;
	Thu, 13 Aug 2020 14:00:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04F46E20B
 for <freedreno@lists.freedesktop.org>; Thu, 13 Aug 2020 14:00:52 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id h4so7400605ioe.5
 for <freedreno@lists.freedesktop.org>; Thu, 13 Aug 2020 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tzXeBlakzfAPPBzAY3IVEXgA9jvG+1VSy76HmBZ+Eeo=;
 b=Frxlqa+/7w65h7ujJ6x4K0255V608BE5V93+WqdiJmnuE83RXO6cl7nbP6RRICr/Er
 9afVovZs/0bYli9HlOpK0zlyLPOVax0MZIVYZBJtYKWQCShyAAvDRsm5+nci5RgkfNJ4
 ubew+AI8wwmtV3fPdiLSRBv1xoT7DKGndlMY/7eM4dNWUnk681X2jN0ZF1TC7pYtgUp4
 XZNb368pbIxgUhibNE1k2Dly00yZKvBcm3iG77R3tAvIyxvuG26rdqdCXdwYPH+9d9Ev
 9CFNN3TafecvPq70CeHKlV/xsGEepswBYRBq4aPygL7CrsCPiu71z13CUfo57DQOkdKQ
 +2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tzXeBlakzfAPPBzAY3IVEXgA9jvG+1VSy76HmBZ+Eeo=;
 b=Q2tHSM9IYRgIlX4BDhRorEWNnNXGETrcDUaVhBvCHDsSizz4j9QcOaidSwzDyR2s3B
 AEoTGNYnIV0Efnwph2d0cY7k4EMRS+4IqUzZfRFXPlGy6/ZWkhBPLWg7D8N55puNH9hK
 qcx+HrVelQJnYA2MDyVKSoRX1Rj9IrY0o12HbQTLkvCMJnQvu3+//e3uPMUSkZJ/WYzB
 DvYtZiOee6CQ/baRsep/yaR9KWzqoH7cfVru52SQlpjVWZVDes2gGDmZeTy1VRFM7GcE
 Jf5IG4oTd2vXT0o1bAeslSDyyu0eqFXsm1LJq+mGRoYRuxg6ZDLYFb4dhcL01BtWzWw/
 0J3A==
X-Gm-Message-State: AOAM532k3IcABokeaubV304JCuLjIbsVH8hbryfMynqxKnqq6Mcq5lDy
 aDltbzMVXmSLN1gTgnLgMkyORHxumlCwtRwgEiRErw==
X-Google-Smtp-Source: ABdhPJzB3GTeeyPYbcbZosaY+gzQ1Ur88csOtNEtaN+0khwH+hXGAwA50wSehgY59xMIxU0AWtphOXrV/3beCc7SnsM=
X-Received: by 2002:a02:9047:: with SMTP id y7mr5209751jaf.128.1597327252041; 
 Thu, 13 Aug 2020 07:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvGXOcsF=70FVwOxqVYOeGTUuzhUzh5od1cKV1hshsW_g@mail.gmail.com>
 <CAK8P3a1ReCDR8REM7AWMisiEJ_D45pC8dXaoYFFVG3aZj91e7Q@mail.gmail.com>
 <159549159798.3847286.18202724980881020289@swboyd.mtv.corp.google.com>
 <CA+G9fYte5U-D7fqps2qJga_LSuGrb6t9Y1rOvPCPzz46BwchyA@mail.gmail.com>
 <159549996283.3847286.2480782726716664105@swboyd.mtv.corp.google.com>
 <159725426896.33733.4908725817224764584@swboyd.mtv.corp.google.com>
In-Reply-To: <159725426896.33733.4908725817224764584@swboyd.mtv.corp.google.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 13 Aug 2020 19:30:40 +0530
Message-ID: <CA+G9fYuVQonk+hcaJWaJ2CNWrsgV5EsRa+1eUr6+UUKxHGB3vw@mail.gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [Freedreno] stable-rc 4.14: arm64: Internal error: Oops:
 clk_reparent __clk_set_parent_before on db410c
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
Cc: Sasha Levin <sashal@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, samuel@sholland.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Eric Anholt <eric@anholt.net>, Jordan Crouse <jcrouse@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 lkft-triage@lists.linaro.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@csie.org>, freedreno <freedreno@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 12 Aug 2020 at 23:14, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Stephen Boyd (2020-07-23 03:26:02)
> > Quoting Naresh Kamboju (2020-07-23 03:10:37)
> > > On Thu, 23 Jul 2020 at 13:36, Stephen Boyd <sboyd@kernel.org> wrote:
> > > >
> > > > It sounds like maybe you need this patch?
> > > >
> > > > bdcf1dc25324 ("clk: Evict unregistered clks from parent caches")
> > >
> > > Cherry-pick did not work on stable-rc 4.14
> > > this patch might need backporting.
> > > I am not sure.
> > >
> >
> > Ok. That commit fixes a regression in the 3.x series of the kernel so it
> > should go back to any LTS kernels. It looks like at least on 4.14 it's a
> > trivial conflict. Here's a backport to 4.14
>
> Did this help?

Thanks for your patch.
Sorry for the late reply.
The reported issue is not always reproducible However,
I have tested this for 100 cycles and did not notice the reported problem.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

- Naresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

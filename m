Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7002321D8A
	for <lists+freedreno@lfdr.de>; Mon, 22 Feb 2021 17:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8342B6E192;
	Mon, 22 Feb 2021 16:56:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661B96E192
 for <freedreno@lists.freedesktop.org>; Mon, 22 Feb 2021 16:56:38 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id i8so13942003iog.7
 for <freedreno@lists.freedesktop.org>; Mon, 22 Feb 2021 08:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HdNyJlknAH8feoDYpLG+qSZzF4E0AHcYq0sJE+ywDvg=;
 b=Px2AQSymPs0ndnQo7hRE5ENeKz5PCcG+/YzLVJz4brjs6tQ52yjrQX7E0BxZFoo+1K
 c5FXncZt0xI78U4Yh6abir2Rag7nxSTnTu1CF62G1d2+0VRIzaZKuxH7XvTqudFNffdw
 q2FS16kVOJitiDJ5hGkzYyxfFKft9O+K+o8NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HdNyJlknAH8feoDYpLG+qSZzF4E0AHcYq0sJE+ywDvg=;
 b=lbRBBY+VY9xTU3TgYfidp0H20drcGiiRXjq9a1qPyG4Q93xjt8zWqC+pgaQbyDqeLl
 /rRq6ql9RCFVMEn6sTPfqL63oBH6vzK5vAKM4BeOMMLbZYBmsnYMq7tvlGXOxmrC0u9h
 sh+TC/RQNZdydPUWhBDQB5qJsVvtoAjbCog8yKpGIJpedg6+byKnBS4oUrUNcJGDrvbx
 IggrjJPXZ3wounBocrWQ3WtRNXx7IFYrAHlus4aM6HzL0O0fFhrThHwTMIC5WsJLUYiM
 36mtD6Dt593tvqOjQjvKhzNHm8WR8+T0ErbiBtqM1fdL6U226fXO9IGGw5cXT6dEwoER
 4MCg==
X-Gm-Message-State: AOAM5339UeowEtjqaaNXXFItLU50+TDoVLuPiud7QgsQuwNAVsE6FnZG
 REsddVSVUj5Tna0o5tSoItCiWACIzSkrDw==
X-Google-Smtp-Source: ABdhPJxiWQyHNi69h/XCWc2H/0URZmY6BV5rtfaEjl4PVjWcoeECefFTU3gGwojvBe+86p++qz9msA==
X-Received: by 2002:a02:1909:: with SMTP id b9mr16891884jab.141.1614012997406; 
 Mon, 22 Feb 2021 08:56:37 -0800 (PST)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id e1sm13755013iol.31.2021.02.22.08.56.36
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 08:56:36 -0800 (PST)
Received: by mail-il1-f175.google.com with SMTP id a16so11417312ilq.5
 for <freedreno@lists.freedesktop.org>; Mon, 22 Feb 2021 08:56:36 -0800 (PST)
X-Received: by 2002:a05:6e02:1a25:: with SMTP id
 g5mr16127965ile.2.1614012995930; 
 Mon, 22 Feb 2021 08:56:35 -0800 (PST)
MIME-Version: 1.0
References: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org>
 <161368935031.1254594.14384765673800900954@swboyd.mtv.corp.google.com>
 <7af07dcacd5b68087cc61e467e9c57ea@codeaurora.org>
 <161377480166.1254594.16557636343276220817@swboyd.mtv.corp.google.com>
 <1782d03506bebe7751d33ae12a38d21c@codeaurora.org>
In-Reply-To: <1782d03506bebe7751d33ae12a38d21c@codeaurora.org>
From: Sean Paul <seanpaul@chromium.org>
Date: Mon, 22 Feb 2021 11:55:58 -0500
X-Gmail-Original-Message-ID: <CAOw6vbLkET7UvsUhWDeeMz8V5i5c_hBSR-Q4-B6_Y5apoTzEng@mail.gmail.com>
Message-ID: <CAOw6vbLkET7UvsUhWDeeMz8V5i5c_hBSR-Q4-B6_Y5apoTzEng@mail.gmail.com>
To: khsieh@codeaurora.org
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dp: add supported max link
 rate specified from dtsi
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
Cc: Sean Paul <sean@poorly.run>, Tanmay Shah <tanmay@codeaurora.org>,
 Dave Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 abhinavk@codeaurora.org, Daniel Vetter <daniel@ffwll.ch>,
 aravindh@codeaurora.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 11:31 AM <khsieh@codeaurora.org> wrote:
>
> On 2021-02-19 14:46, Stephen Boyd wrote:
> > Quoting khsieh@codeaurora.org (2021-02-19 08:39:38)
> >> On 2021-02-18 15:02, Stephen Boyd wrote:
> >> > Quoting Kuogee Hsieh (2021-02-18 12:55:04)
> >> >> Allow supported link rate to be limited to the value specified at
> >> >> dtsi. If it is not specified, then link rate is derived from dpcd
> >> >> directly. Below are examples,
> >> >> link-rate = <162000> for max link rate limited at 1.62G
> >> >> link-rate = <270000> for max link rate limited at 2.7G
> >> >> link-rate = <540000> for max link rate limited at 5.4G
> >> >> link-rate = <810000> for max link rate limited at 8.1G
> >> >>
> >> >> Changes in V2:
> >> >> -- allow supported max link rate specified from dtsi
> >> >
> >> > Please don't roll this into the patch that removes the limit. The
> >> > previous version of this patch was fine. The part that lowers the limit
> >> > back down should be another patch.
> >> >
> >> > We rejected link-rate in DT before and we should reject it upstream
> >> > again. As far as I can tell, the maximum link rate should be determined
> >> > based on the panel or the type-c port on the board. The dp controller
> >> > can always achieve HBR3, so limiting it at the dp controller is
> >> > incorrect. The driver should query the endpoints to figure out if they
> >> > want to limit the link rate. Is that done automatically sometimes by
> >> > intercepting the DPCD?
> >>
> >> ok, i will roll back to original patch and add the second patch for
> >> max
> >> link rate limited purpose.
> >> panel dpcd specified max link rate it supported.
> >> At driver, link rate is derived from dpcd directly since driver will
> >> try
> >> to use the maximum supported link rate and less lane to save power.
> >> Therefore it is not possible that limit link rate base on dpcd.
> >> AS i understand we are going to do max link rate limitation is due to
> >> old redriver chip can not support HBR3.
> >> How can I acquire which type-c port on the board so that I can trigger
> >> max link rate limitation?
> >>
> >>
> >
> > The driver already seems to support lowering the link rate during link
> > training. Can't we try to train at the highest rate and then downgrade
> > the link speed until it trains properly? I sort of fail to see why we
> > need to introduce a bunch of complexity around limiting the link rate
> > on
> > certain boards if the driver can figure out that link training doesn't
> > work at HBR3 so it should try to train at HBR2 instead.
>
> yes, dp driver did support down grade link rate during link training
> procedure.
> But link training is kind of setting up agreement between host and panel
> with assumption that there are no other limitations in between.
> The problem we are discussing here is the limitation of usb re driver
> link rate support.
> Since we do not know how usb re driver behavior, I am not sure link
> training will work appropriately for this case.
> It may end up link status keep toggling up and down.
>

IMO we should just fail link training if the redriver doesn't support
a link count/rate and fallback to the next count/rate. This should be
handled the same as if there were a cable incapable of achieving a
link rate. Adding the link rate to the device tree (at least on the dp
block) seems suspicious.

If you really wanted to model the redriver's limitations in software,
you'd probably want to introduce a bridge driver/connector which
rejects modes that cannot be achieved by the redriver. This should
prevent the dp driver from trying to train at the unsupported rates.

Sean


> Both link-lane and link-rate specified at dtsi are for the limitation of
> Trogdor hardware platform.
> Both link-lane and link-rate specified at dtsi are NOT for panel since
> panel have specified its capability at its DPCD.
>
>
>
>
>
>
>
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

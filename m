Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A7E423481
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 01:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B936089690;
	Tue,  5 Oct 2021 23:35:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB6F89690
 for <freedreno@lists.freedesktop.org>; Tue,  5 Oct 2021 23:35:33 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id o4so1478067oia.10
 for <freedreno@lists.freedesktop.org>; Tue, 05 Oct 2021 16:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=56IzYsCngcQCBJWMD0JhwTzUl1q8pi+qZeXw6ytKK8A=;
 b=eRRinxuy/37yDFfXp6IVii9vjLkGuva0q1QVDD23ceHuI1Ku2gowQTk8r+Mi+XdmxX
 U2Wsp25IqyOlImWDr9V+UWMcKRvFJHL99YIhUVDVBQRG8DuQ01Lpl0DLnXurNPz2/fDy
 7wW6jiSD1tcTXxwfxdEqh52XidJdgW83YrpTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=56IzYsCngcQCBJWMD0JhwTzUl1q8pi+qZeXw6ytKK8A=;
 b=kQOScCQX0+WtJpGAsfRaPg9aAZvbfxQ+V1u1RN22+R6ugIXIW5Z3lXaaSB2go9HbNd
 7v7VRCMvODztr/aEmj8R8ylN7piJtMuC4h6soLuGatB+cHx06O8ZFXdj5dse2+gVUIXB
 6tmXIVYJ6KDUnPBhWkdgH7gfJJZ8kICdxnDKPpSc4DlNFE9NxEbYjFyR5Q9LiCFLWxe7
 pkB8H8I6AJDGVt/FBD3SsyfNKAII4tzxs06X+sQL5fSel32WW6TvNmf3UaaNXTw8Uld7
 hEWOWqlYq84MK3ZLRgPzsryuRuBZi/WpPeFR8/SQGY8j7FFSofgFZR1Y1vve1co5G4yf
 mxXw==
X-Gm-Message-State: AOAM531T6acbCJIm3XvCeNVvI6o2AE1w4ycaW2gbBXZS0qp7fI0lMOxW
 go19TJKs2Y1ROF6hKwk71Svx4KQoEXwz9wR+Can8Aw==
X-Google-Smtp-Source: ABdhPJz8EZyQff1TxdzuJVG8JQE9jeLRASYoOxoi7ECsw4XqrqgsNEazNQpnBxnQIQovikbvFIHbcAQ/6pYFY/+7Tqw=
X-Received: by 2002:a05:6808:f8f:: with SMTP id
 o15mr4789420oiw.164.1633476932903; 
 Tue, 05 Oct 2021 16:35:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 16:35:32 -0700
MIME-Version: 1.0
In-Reply-To: <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
 <YVzGVmJXEDH0HfIL@ripper>
 <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
 <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 16:35:32 -0700
Message-ID: <CAE-0n507Nci+7MCJWSqxU=MPjrZLn5VMJq1BdceFmvp2AN6F=A@mail.gmail.com>
To: khsieh@codeaurora.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sankeerth Billakanti <sbillaka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Shorten SETUP timeout
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

Quoting khsieh@codeaurora.org (2021-10-05 16:04:40)
> On 2021-10-05 15:36, Stephen Boyd wrote:
> > Quoting Bjorn Andersson (2021-10-05 14:40:38)
> >> On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
> >>
> >> > Quoting Bjorn Andersson (2021-10-04 19:37:50)
> >> > > Found in the middle of a patch from Sankeerth was the reduction of the
> >> > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> >> > > is initalized and HPD interrupt start to be serviced, so in the case of
> >> > > eDP this reduction improves the user experience dramatically - i.e.
> >> > > removes 9.9s of bland screen time at boot.
> >> > >
> >> > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> >> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> > > ---
> >> >
> >> > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> >> > re-read the code a couple times to understand that it's waiting 100ms
> >> > times the 'delay' number. Whaaaaat?
> >> >
> >>
> >> I assume you're happy with the current 10s delay on the current
> >> devices, so I don't think we should push for this to be backported.
> >> I have no need for it to be backported on my side at least.
> >>
> >
> > Sure. Fixes tag != backported to stable trees but it is close.
> >
> >> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >>
>    dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms
>
> This patch will prevent usb3 from working due to dp driver initialize
> phy earlier than usb3 which cause timeout error at power up usb3 phy
> when both edp and dp are enabled.

That sounds pretty bad.

> I had prepared a patch (drm/msm/dp: do not initialize combo phy until
> plugin interrupt) to fix this problem.

Great! When were you planning to report this problem on the list?

> Unfortunately, my patch is depend on Bjorn's patch (PATCH v3 3/5]
> drm/msm/dp: Support up to 3 DP controllers).
> I will submit my patch for review once Bjorn's patches merged in.
> Therefore I would think this patch should go after both Bjorn's patches
> and my patch.
>

Why can't you send it now? Point to the other patch series as a
dependency.

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB8959EAE1
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 20:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26D611A235;
	Tue, 23 Aug 2022 18:24:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C2C11A1E0
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 18:24:40 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-3375488624aso372449867b3.3
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 11:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=XtHnpqNsO1GqMrMs/hDiQG1cyMYMiBI2ato5C3wCzTY=;
 b=ZKjjBYj1gBxAdyZVr4lWAsSGku+8GieBuHQ0OEl+X6QIkz2TOPeiJzxckGICnDAK6n
 HQDdOGwtXOJmY2+WICC2VDh8zfUiHfdLpJC8lWSq7GxlkVvqWeAgjuHN4CFZcvp6aLOZ
 khUt1UxKnVrjmLB7um48WbJx2FswKGDvb7Oe2zpjfVf9shqM7nucZZVk+DMnjbtAEIIu
 yI/uwG1Y513oEBHTDMT3NV3d95LxaNIG/5QDAwtKNc7sKA2wBoKhbb+hb73rCvLoG64i
 wc5mWc5YcuVubR46MgT47K/oMOGJQlY7a9xMpfU0Dwz4AIlp11JdSygsuDWpwwtdQjyk
 uHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=XtHnpqNsO1GqMrMs/hDiQG1cyMYMiBI2ato5C3wCzTY=;
 b=zDez/Vx8jtFezsQ7yr0UL6SrBfcX75/Jnsxn43NlC0olsQPiUg/F2NMMitqFXr0NYJ
 ucAwLSNPmxjFTqtWgdazRX2P0v1q8rkejvJBe4VSg4XZHplSikPfgOJGADu23wrDQOAH
 iHrPpRFiXBcRwZR9smPwFn2xJxYf4XEQv5RD4atpFM8C0b5Vt4wgpPrLVA3C2idGGKOu
 0BjiK51AY7XdwDsp5BEn4sQohW8ORnarX1w/Tdnn4PxJJxwSciUg6qZHvVW8ex9jHmGd
 7tXu8pIxQKnDazaw+7UAvj15zp2sWJMxqWYOmLC7sJjNqhmnPW/ZHHdGMvz3XTIdFToi
 VzvQ==
X-Gm-Message-State: ACgBeo2S1Eg5L3ntaiiOhlSxdlvdcQfs3yEmSctOjOSUhpAdFNYxWa63
 XzQhUG8RpbsWsBdeaGCEQmWcnR02FBq6Aku1p+LaNg==
X-Google-Smtp-Source: AA6agR5pGU5afgAW1EmPG74/gUZ4nBuucS0dag+FVmm04t1k3abnSKIImoKbMJKXkhk9kD94wSV2vICNKg4sS6nDwjk=
X-Received: by 2002:a0d:eb87:0:b0:338:d06b:e605 with SMTP id
 u129-20020a0deb87000000b00338d06be605mr20055821ywe.316.1661279079937; Tue, 23
 Aug 2022 11:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220726173824.1166873-1-dianders@chromium.org>
 <20220726103631.v2.4.Ie85f68215ada39f502a96dcb8a1f3ad977e3f68a@changeid>
 <CAMSo37XsawRxTnJriLUAwJAj0+ZzpACtMiR_3V7H1H9WXg3T_Q@mail.gmail.com>
 <CAD=FV=V5c0bCOCBvdnqVJ6Sa1XKeg+d7kTEL2Okh4GAL66MGiw@mail.gmail.com>
 <CAMSo37Uve4qrAA81zrO9eOGc4y7vjg-OZ9L7m9xWM7UkQ6PzmQ@mail.gmail.com>
 <CAMSo37U1uxUFkn4Jda5E+nDiz0wp8_ERbNa9BUgWttZ6dEssAg@mail.gmail.com>
 <CAD=FV=WNNAYtdoocp_ShyNBOBmqSSr79=x_2UKq+yfA+HiOo9w@mail.gmail.com>
In-Reply-To: <CAD=FV=WNNAYtdoocp_ShyNBOBmqSSr79=x_2UKq+yfA+HiOo9w@mail.gmail.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Wed, 24 Aug 2022 02:24:29 +0800
Message-ID: <CAMSo37W47x-rFdNqJBJPW6TqCYC=K2fUS3FRPRCUg=t37a3u-Q@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 4/7] regulator: core: Allow specifying an
 initial load w/ the bulk API
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Steve Muckle <smuckle@google.com>,
 Alistair Delva <alistair.delva@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Mark Brown <broonie@kernel.org>, John Stultz <jstultz@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Todd Kjos <tkjos@google.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi, Douglas

On Tue, 23 Aug 2022 at 22:50, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Aug 22, 2022 at 11:23 PM Yongqin Liu <yongqin.liu@linaro.org> wrote:
> >
> > Hi, Douglas
> >
> > Just an update on the fix you pointed out previously here:
> > > > [1] https://lore.kernel.org/r/20220809142738.1.I91625242f137c707bb345c51c80c5ecee02eeff3@changeid
> >
> > With it I could boot the hikey960 build to the home screen if it does
> > not use the GKI kernel.
> > but the problem will be reproduced if it uses the GKI kernel.
> >
> > And if this change is reverted, then it could boot with the GKI kernel as well.
> >
> > I am not sure what's the reason there, but there seems to be some
> > difference with the fix above and the workaround of revert.
> > Not sure if you have any idea about that.
> >
> > Regarding the GKI kernel(Android Generic Kernel Image)[2], it's built
> > from the android-mainline tree(f51334eac4de) without any workaround.
> > (Neither the revert, nor the fix applied), and the regulator modules
> > used for the hikey960 build are hi6421v530-regulator.ko and
> > hi655x-regulator.ko
> >
> > I am still not sure if it would work with the GKI kernel that has the
> > fix that you pointed out in. the case that both the GKI kernel and
> > vendor tree have the fix.
> > Will update here when I have some results.

Just checked, with the fix applied in the GKI kernel, the problem is
not reproduced again.

> > [2]: https://source.android.com/docs/core/architecture/kernel/generic-kernel-image?hl=en
>
> That's not too surprising. The broken patch is in the core kernel so
> you need the fix in the core kernel.
Sorry, I still do not get the point here.

The GKI kernel is the same one, that does not have the revert and the
fix applied.

for the vendor tree(the ko files and dtb files are used)
#1 built with this commit reverted.
#2 built with the fix applied.

#1 could boot with the GKI kernel, while #2 does not boot with the same error.
What might cause the difference?

> I think that means you'll have to
> wait until `android-mainline` gets the fix. I don't work on Android,
> so if there's some other route to get an expedited fix into
> android-mainline I'm not aware of it.

Thanks, I will wait for the fix to be merged into the android-mainline,
before that I will use the revert workaround for the moment.

-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android

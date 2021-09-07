Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B20E4024FD
	for <lists+freedreno@lfdr.de>; Tue,  7 Sep 2021 10:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9052389BF8;
	Tue,  7 Sep 2021 08:19:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B69789BF8
 for <freedreno@lists.freedesktop.org>; Tue,  7 Sep 2021 08:19:31 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id j18so11603242ioj.8
 for <freedreno@lists.freedesktop.org>; Tue, 07 Sep 2021 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9MXLDJhiY0fcXEg+LnGTR4OLM7jMrz/NHCTwfTLwDMg=;
 b=ElO/UJxIHNBjrNw3yfn9GFGNJhWRax3Eba+PUZ2fRtFre/HLcwkOVfWXRighUoPjEM
 51pdOWhi5deDUkefb5ithDBAYMI1Xt3Ha6kCwxlz2jU3xLR7RY9A2cvZS1TToCOjgiwb
 G90h5wXsl4q8wEdtWuWhAcFViVGAa6gdHujMmr+8R2+97UhFUYN8BnSW82RzYCS9z25m
 U3Hbpw/V04VgoxO2f7CU769BkfR4sAUGF4mft1VQBJSWBaog2UPCDTdWjAc5BfTT59gu
 jjL8bOtXSq9C7rgou3bRoFo0EQUhz/R3Vi7onjxMLCD33If4/Ri4kEThFAQfEbRnGaik
 JwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9MXLDJhiY0fcXEg+LnGTR4OLM7jMrz/NHCTwfTLwDMg=;
 b=DthfNL2ap6mYXZv/Z+VNntlIvRKSSRdWLmV50+XOVgcTscj4U1H+PZ7fEdep91ruZL
 ZYAdCWq61JW7IAJ4ZttLib3lOa9EbRlbz10D9iKmy4g80nvlqMAndIclevgH8aeZ2irP
 HP20NN2NsUr9Rbl7tO1/MXamMiC9t3gZb9MDmuOUYgd42Ojk/Y55hj73u9xQUJnf3wiD
 2dIEQI6Vyeg/p74ROWQMjnDCM21Ha5rtspJnnxBulhNJveysh6KLKD2zRIqQ/e4GgFFk
 QiJ0VaveeB8anRxRPZG/bNkI8iOaRo+s7thNMHy3CbOexz3gbPle5KGAC8TyQWJYsCsm
 lK8g==
X-Gm-Message-State: AOAM531BdT1P9pfOXsxBVaMRlXP/rpZjA3mN69wEOT8aRCYbI2LQHqb5
 x66ulAXAjEANxAOloc06DfKeMBi+gIMeBKJF3CBDVA==
X-Google-Smtp-Source: ABdhPJwIQXLBjfDY4x2hegViI0I26x9Ldz3+Wvni8m5cPnPark5Q3y14GL2LxjfcnaO2magWZu87krrTNuiTaU5QMBA=
X-Received: by 2002:a6b:be02:: with SMTP id o2mr12593752iof.103.1631002770826; 
 Tue, 07 Sep 2021 01:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210729183942.2839925-1-robdclark@gmail.com>
 <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
 <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
 <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <CALAqxLUkyXK2gqNMBbtJFfh01ZpcG46dZaM7Zq4jG3OngvFREg@mail.gmail.com>
 <CAF6AEGsACLcDuszcgmHHs04GghLPiRfei3tGo161yBXsg7Y-YA@mail.gmail.com>
 <CAMi1Hd0dniDXPNOuh05ywqHKY+cGvAsd-cnD91K1GLppfO=x0w@mail.gmail.com>
 <CAF6AEGvtw06MYST2PdhqHVpsG4Tec2DnUA-uwFRP-6xqa9yf5Q@mail.gmail.com>
 <CAMi1Hd1kp8ijH8y3U2sxs5cE3Zfat_v-C3rrGtTK01ry8Om6Lw@mail.gmail.com>
 <CAF6AEGuE2KAnOQRGwbbVHmms0uOfq4XCvF=a8FJ98spzJ5=+XQ@mail.gmail.com>
 <CAF6AEGukn2=z-7CroxiKcHiCPfS_U3reOBe0ZYV1fj9UBap17w@mail.gmail.com>
In-Reply-To: <CAF6AEGukn2=z-7CroxiKcHiCPfS_U3reOBe0ZYV1fj9UBap17w@mail.gmail.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 7 Sep 2021 13:48:54 +0530
Message-ID: <CAMi1Hd2cO=vmFA81y2T9oAPxyKPpKn5d+uOs9emFbiop1vFD-A@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, 
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: Disable frequency clamping on a630
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

On Tue, 7 Sept 2021 at 02:53, Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Sep 6, 2021 at 1:50 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> >
> > ok, I guess it is at least not a board specific thing (ie. won't need
> > to introduce some dt binding)..
> >
> > It would be nice to know what the maximum we can safely increase freq
> > in one step, if we need to limit that.
>
> Also, one sanity check.. for android builds, are you using the same
> a630_gmu.bin from linux-firmware?  If not, does the l-f gmu fw change
> things?

We are using the same a630_gmu.bin from linux-firmware.

>
> For freq changes, we basically ask gmu for the freq we want, and it
> votes for the requested freq.. so a gmu fw bug could be possible here.
>
> BR,
> -R

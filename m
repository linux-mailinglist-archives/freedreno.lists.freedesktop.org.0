Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A1457D015
	for <lists+freedreno@lfdr.de>; Thu, 21 Jul 2022 17:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A653110E2D7;
	Thu, 21 Jul 2022 15:44:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEE110E2D7
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 15:44:07 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id v12so2646075edc.10
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SxxITHDTb1HH7twfNVc7G9AAeqX8EqngAkO5R6iw9Js=;
 b=nR88LRJ9k88qnqomsQbC4z8uoRy9fr9i9anwrJpCsWfLVtmxOhvAcI824wYLC8zXE8
 RjsTDc1tVbPt92E7Ye/VEY0Y/MbN+CHAQCQXQk7Yt50W/Vf3C7QBWWD+vy10BkIU2CA5
 ydR0CWMAHPOsDGdAmI3Rrm77mVcFoDqSxdL1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SxxITHDTb1HH7twfNVc7G9AAeqX8EqngAkO5R6iw9Js=;
 b=FIOxOHiv5xjVwqMXCgsoTkfr33oQ+TPxg3tnL+F6YsmjQ7XkDi5swpjYAEJpI1PtnU
 r5aiD28e5NjPPsWsy/vLbovKRxkF++n6k/BfJYfdGPMirlafbuiVOnt6bBTRb+cCAZJs
 gbE0cQg/Zk/f7xJvBw21TSX4P4930eJbzK3WVQb+ptUuc9ZdZ8M2uRuOWAKSI3dsjIzS
 uJn9Mu+RXo1u9Z1rp0XDuGXAM2YzSyBGG/F4+Zl4LjAZZmTXMU3drKBuPwRoQpNjpDaJ
 1gpnq6YYRuOsnfeh2Qkacklcr0ENVdUkr22kuXmQHQzQjiRdeIrDWVcTg0bKKhdE7aU2
 hKlQ==
X-Gm-Message-State: AJIora+iekdGnF9SZNTb60HMwMm3CItJSbKy13t+iTDgXGPSD1gy6HRn
 xMpsycKojHrVfuQZZdCJETAiyTFrrB2LVZnJfUo=
X-Google-Smtp-Source: AGRyM1ttWh4OKOh/XzHf+A9im62vES/knYSJuOkz30bE2+qrKDbGbbTw+kSs467YHou5K3CIdp361A==
X-Received: by 2002:a05:6402:4255:b0:43a:c03f:1aa4 with SMTP id
 g21-20020a056402425500b0043ac03f1aa4mr59472695edb.146.1658418245384; 
 Thu, 21 Jul 2022 08:44:05 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 g1-20020a17090604c100b0072b7b317aadsm953277eja.150.2022.07.21.08.44.02
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 08:44:04 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id d16so2830550wrv.10
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 08:44:02 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr35607698wrr.617.1658418241950; Thu, 21
 Jul 2022 08:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
 <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
 <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
 <YtlrV5R+JMxb7Dlu@sirena.org.uk>
In-Reply-To: <YtlrV5R+JMxb7Dlu@sirena.org.uk>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Jul 2022 08:43:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XDOxy1R5ipD0errwi6GOFz-X6G3_WE34LGLqmWE6_iyw@mail.gmail.com>
Message-ID: <CAD=FV=XDOxy1R5ipD0errwi6GOFz-X6G3_WE34LGLqmWE6_iyw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v16 0/3] eDP/DP Phy vdda realted function
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Johan Hovold <johan@kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 21, 2022 at 8:06 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 21, 2022 at 07:49:55AM -0700, Doug Anderson wrote:
>
> > Every single LDO on Qualcomm's PMICs seems to be able to be set in
> > "high power mode" and "low power mode", but I think the majority of
> > clients only really care about two things: on and in high power mode
> > vs. off. I think the amount of stuff peripherals can do in low power
> > mode is super limited, so you have to be _really_ sure that the
> > peripheral won't draw too much current without you having a chance to
> > reconfigure the regulator.
>
> *Generally* a low power mode would be mainly useful for low power
> retention type states, not active use.

Right. Certainly the case I've seen where it is most useful is in S3
where we need to keep a device powered just enough to detect a wakeup,
but it can definitely also be useful for mostly idle devices that we
need to keep powered to retain memory so they can start up again
quickly.

I guess I'd put it this way, though: how many drivers in Linux today
have _two_ calls to regulator_set_load(): one for the "active" state
and one for the retention state. Looks like UFS maybe. Any others? For
most devices the pattern is:

* get all of our regulators.
* for each regulator, set the load to something that will trigger HPM
when we're using the regulator.
* turn regulators on when we need power and off when we don't.

All the extra scaffolding and tables to pass something to
regulator_set_load() is just a lot of noise to add for drivers that
don't have any concept of "retention" mode and don't need it.

-Doug

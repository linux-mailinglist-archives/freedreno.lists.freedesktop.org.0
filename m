Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA182523C62
	for <lists+freedreno@lfdr.de>; Wed, 11 May 2022 20:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6177E112885;
	Wed, 11 May 2022 18:22:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820AD112885
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 18:22:09 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z19so3540599edx.9
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uiYBAkZ/K7TON78jcHgwLk8yR9bWm2DLv+jXS6/7A90=;
 b=TysY5PPYSJqqGGSP17kFdgyVAcXW0GiDdLa8+M1+Q0ojkz+YMGJOdGZ1g7kkbPZOu6
 yt+IrWP6PXRoXVf3HH1RNxijEEEziatsJwBR8ffnixgRhgmDKQimGHpCgltyrkDtU5pd
 QyBownI7LpEYTX9O9gVL+tE6Wpia3KSKpa7tY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uiYBAkZ/K7TON78jcHgwLk8yR9bWm2DLv+jXS6/7A90=;
 b=CACqhVCbY+aNxd+wWf55jorzeQQNA/XTHka0HAn8wIdEiVZL7ypWPFI/j/xYvctocv
 n/WRp4mXYkbEWZiLeIBEANtl6ZKYRsMLkR5BnrCwKvt7UgmeqmQfrha4ZHcPC0vbepvU
 VCIOG/T141CKdqzflIg+Yf0L0NTyD4fPPsL0tgfX0BIddiliWXGd5/CDZS5Mb75QuPVd
 ESp1X4O8Wsn5wAbFYLE3KjB5LSu5qE/tzMUF8KaknjOrNLAt5lqzdlhLBk2dpJAgwbs/
 bwVv+C3HpeZTQ48PWxFiEQo4ptdEgGpliOcC8RJ8WXb9UyEYl0xLx9zjg8ejXJt08u0N
 u+oA==
X-Gm-Message-State: AOAM530nU5GwU3IQBzmxQlFiOP3l9mjiBbsPVes57451bZ/hh7Gr21r+
 KAaQC+ZqFNp9maa/wc+prew1stzmxzfxNLaS3SE=
X-Google-Smtp-Source: ABdhPJyXIIZ8JGx/IulzsGoQCNEvL5OA+l3K09Tr6F9Y+z5OC1CZNX+ETbAFTrUp9eplehECs6HzIw==
X-Received: by 2002:a05:6402:120a:b0:428:91cf:7615 with SMTP id
 c10-20020a056402120a00b0042891cf7615mr20867581edw.379.1652293327692; 
 Wed, 11 May 2022 11:22:07 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 lh1-20020a170906f8c100b006f3ef214db6sm1261885ejb.28.2022.05.11.11.22.06
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 11:22:06 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso3771105wma.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 11:22:06 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr6101308wmb.199.1652293325498; Wed, 11
 May 2022 11:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid>
 <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
 <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com>
 <MW4PR02MB718610FAA14F966ADE1B1585E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAE-0n51Q=cGwrMec3JEQENqWHV3pAUjLPT6RwZLA5xV080sgxQ@mail.gmail.com>
 <MW4PR02MB71867A18732B266DE8FA2040E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAE-0n53MEBYhyRtGWOCmjj923UQU_iVE_SEBQw6_FUci8NLz3w@mail.gmail.com>
 <MW4PR02MB71866E59B844A0842DF7570EE1C59@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB71866E59B844A0842DF7570EE1C59@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 May 2022 11:21:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WeTK8LBJmc6AkjPyPLVS+2sSRNEFuEOZrWGJr3Kpq58Q@mail.gmail.com>
Message-ID: <CAD=FV=WeTK8LBJmc6AkjPyPLVS+2sSRNEFuEOZrWGJr3Kpq58Q@mail.gmail.com>
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/2] dt-bindings: msm/dp: List supplies in
 the bindings
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
Cc: Rob Clark <robdclark@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, May 6, 2022 at 6:36 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> >> >> Our internal power grid documents list the regulators as
> >> >> VDD_A_*_1P2 and VDD_A_*_0P9 for all the platforms.
> >> >
> >> >Do your internal power grid documents indicate what these supplies
> >> >are powering? The question is if these supplies power any of the
> >> >logic inside the eDP controller or if they only supply power to the
> >> >analog circuits in the eDP phy. If it's the eDP phy only then the
> >> >regulator usage in the eDP driver should be removed. I would suspect
> >> >this is the case because the controller is probably all digital logic
> >> >and runs at the typical 1.8V that the rest of the SoC uses.
> >> >Similarly, these are voltage references which sound like a PLL reference
> >voltage.
> >> >
> >> >Please clarify this further.
> >> >
> >>
> >> For the DP driver using the usb-dp combo phy, there were cases where
> >> the usb driver was turning off the phy and pll regulators whenever usb-dp
> >concurrent mode need not be supported.
> >> This caused phy and pll to be powered down causing aux transaction failures
> >and display blankouts.
> >> From then on, it became a practice for the controller driver to vote for the
> >phy and pll regulators also.
> >>
> >
> >That sounds like USB-DP combo phy driver had improper regulator power
> >management where aux transactions from DP didn't keep the power on to
> >the phy. Where does the power physically go? If the power isn't physically
> >going to the DP controller it shouldn't be controlled from the DP controller
> >driver. If the aux bus needs the DP phy enabled, the DP controller driver
> >should enable the phy power (via phy_power_on()?).
>
> Yes, it was limitation earlier when we did not have proper interface to interact
> with the combo phy.
>
> In this case, the power from the regulators go to the combo phy.
>
> Now that there is an interface for the controller to interact with the
> combo phy, the proposal to drop the phy regulator voting from the controller
> driver seems reasonable to me.
>
> The phy_power_on() is used for getting the phy out of low power state or getting
> it ready for data transfer.
>
> The controller driver needs to enable the phy power via the phy_init() before
> any interaction with the sink like the aux transactions or before sending the data.
> The controller can disable the regulators via the phy_exit() call.

I can confirm that if I stop providing these regulators to the DP
controller that the screen still comes up. ...but also there are lots
of other things (including the PHY) that power these regulators up...

From offline discussion with folks:

1. It sounds like maybe the code for handling the regulators in the DP
controller leaked in from downstream where the DP driver itself
controls more stuff.

2. We should probably remove these regulators from the DP controller.

3. When we remove this from the DP controller, we'll have to make sure
that the PHY driver calls regulator_set_load() as needed.

Kuogee has volunteered to own this issue and send out patches fixing
the stuff up. So for now, please consider ${SUBJECT} patch abandoned.

-Doug

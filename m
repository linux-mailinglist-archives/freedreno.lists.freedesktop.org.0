Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A615C57CDE2
	for <lists+freedreno@lfdr.de>; Thu, 21 Jul 2022 16:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ED9910EF;
	Thu, 21 Jul 2022 14:40:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B9A910FF
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 14:40:08 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id fy29so3464395ejc.12
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K8gd/m3LxS60yVx7Ft64S3I2geJNhfthrTCnHWEHH0w=;
 b=PxLxMfnPHw7C70/BqUyBmctzuSLEjBn8t9+6JFbmwTV1PD+DxOc2aU5qW7Mv9pOvTL
 g41dPI7CL0SpwaPG1W9qn4AuZyxlGo0ZAhZuhm1Rg4BRvIOdSJZ27GhSGKT6BURo+9nE
 srGoMQ7BP/A7n2MGZvMwViiTYMpGYf3A5xR8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8gd/m3LxS60yVx7Ft64S3I2geJNhfthrTCnHWEHH0w=;
 b=HJ4CfYzE8rdZAyIe1Tcq71k704JGHJYbzal4Cyl8QiZ2N+L8xepgTRyrmu9Wto/YVq
 t3CgfziU3RIa3S+6heTDhAg7B43ypJh7wYk/z2KhiqTYuaDpIOlcNtkqUkCb1BOyVkMO
 vZ3DjbOa5hekjmP93IrSY29rgkPvJ2uj8IljS4CAcfgdW2TCkhqTimeeLiGG4o9opRkc
 x7Uhgt9thLY6qJ3PRKfrj3yzM+2TgWt7nxOcgug2y76iumABnZPGdLnNwk2UJUlkM09r
 0Q6FJs3HmcB40wa/O6VeYElOI9qOMgV8MHHWGhv7eFA34YioHbSyzyiECuIIFD64dt4c
 KRZw==
X-Gm-Message-State: AJIora8ES5SafzvAH/ZxiO5WrIeVLORTRbYTy3mfSxrOURTavZLozpQ8
 bLBxKuQPxBPZlWXLiQPLpA9t8APz3nwBJAOX
X-Google-Smtp-Source: AGRyM1ufqA8hCOXjWPMMsPlT0/tjrBflph2l5sNmz5fgjRbVda2/0/Qs/gMUpCx0cUbrawXVtjGGPQ==
X-Received: by 2002:a17:907:6d07:b0:72f:18bf:505 with SMTP id
 sa7-20020a1709076d0700b0072f18bf0505mr25000045ejc.406.1658414406721; 
 Thu, 21 Jul 2022 07:40:06 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 o15-20020a056402438f00b0043b986751a7sm1133502edc.41.2022.07.21.07.40.00
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 07:40:02 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id bu1so2568474wrb.9
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 07:40:00 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr35372536wrr.617.1658414400165; Thu, 21
 Jul 2022 07:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com> <Ytk2dxEC2n/ffNpD@sirena.org.uk>
In-Reply-To: <Ytk2dxEC2n/ffNpD@sirena.org.uk>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Jul 2022 07:39:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQGXqVkew544f3RDtWb3virRHWiafBAxK3ncb5wmVYwQ@mail.gmail.com>
Message-ID: <CAD=FV=UQGXqVkew544f3RDtWb3virRHWiafBAxK3ncb5wmVYwQ@mail.gmail.com>
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
 Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 21, 2022 at 4:20 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 21, 2022 at 12:31:41PM +0200, Johan Hovold wrote:
>
> If you're copying someone into a thread that's not obviously relevant
> for them it's good practice to put a note about it at the top of the
> mail to reduce the chances that it just gets deleted unread - people get
> copies of all sorts of random stuff for not great reasons (like getting
> pulled in by checkpatch due to once having done a cleanup) and are often
> quicky to delete things.
>
> > This series breaks USB and PCIe for some SC8280XP and SA540P machines
> > where the DP PHY regulators are shared with other PHYs whose drivers do
> > not request a load.
>
> > Specifically, the hard-coded vdda-phy load of 21.8 mA added by this
> > series, causes several RPMh regulators to now be put in low-power mode.
>
> > I found Doug's suggestion to handle situations like this in regulator
> > core:
> >
> >       https://lore.kernel.org/all/20180814170617.100087-1-dianders@chromium.org/
>
> > but since that was rejected, how do we deal with this generally?
>
> > In the above thread Doug mentioned adding support for load requests to
> > further drivers and Bjorn mentioned working around it by adding
> > regulator-system-load properties to DT.
>
> > It seems quite likely that changes like this one affects other systems
> > too, and the effects may be hard to debug. So a more general solution
> > than playing whack-a-mole using DT would be good to have.
>
> You could add a way to specify constant base loads in DT on either a per
> regulator or per consumer basis.

Yes, this please! ...on a per consumer basis. :-) It's been on my
wishlist for a while and would eliminate a massive amount of code /
tables in the drivers.

We could debate syntax, but I guess you'd either do it w/ two cells

vdda-phy-supply = <&vdda_mipi_dsi0_1p2 21800>;

...or with matching properties:

vdda-phy-supply = <&vdda_mipi_dsi0_1p2>;
vdda-phy-supply-base-load = <21800>;

-Doug

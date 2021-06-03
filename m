Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0662539ACFC
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 23:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F776E7EC;
	Thu,  3 Jun 2021 21:35:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DC56E7EC
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 21:35:36 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 q20-20020a4a6c140000b029024915d1bd7cso96366ooc.12
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 14:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fdGca/qkXtFIrcRqfF9Oz+FtnAgDYxa2k4yJTgHSE9Q=;
 b=DOZw7Gr9pDSoeMVNbsz8uTCNISGH2vhGvbGtWQMr0Fp9rnyxMjCI5vGvl2LpscweQo
 wv3w2GJEXjJOZ2fHsri7XyaJ1qifvbALUJFjnIer/nTrQstULiIub4T0uijaZ348mxJx
 d90Of6OCT5YxhVWGDsFyp9qZ7O7fqFtrg/ElE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fdGca/qkXtFIrcRqfF9Oz+FtnAgDYxa2k4yJTgHSE9Q=;
 b=bw6cJW8PqR6fFuNq8Cu237FEIjVOH07qz8yFy1U5wGBNQXQzQwrHYrvUmZCDY/iP6K
 JpzjKJlgc/r2bHFQjS834KiNK+gavbPIKM+CF42lTNJhi7NbIJF1RMzMNqnHy9FPp4kb
 rfVS0m6ZIzt81qXgS1FgBaQ0nbTdOitZ7eBkBUuS6i0R3TpRyQas6oRg8SCGFJsribzG
 Oa9mx3lJG98R0VJwn9byA4sHOoTK2kk1AUlYnvrS4O7yo8stv5tQulYZVGO7pBK1jKWu
 kNZaxeUzz9c/yC2K90IwabvQt/bkHcHznkzE6RJhiDtL38Ag/hTWC1lMWDUNLKqcI7fn
 ITmQ==
X-Gm-Message-State: AOAM533hdxDfHiAyIjRK0VCCww0+xEOk794ySoP4LRfF7xSo4kFfxBv9
 3ZKaEAq4c4FU6NdjOoFGjL45mz6ysRsL2E6x6Cq33Q==
X-Google-Smtp-Source: ABdhPJycnioH5Ed8RBIYP+Bjnktnsogk9MbeJEjp7I2J4ue38o/zYJWTWMH0j6NofP7729BFjMbMBTAF7hmWnC2eYzc=
X-Received: by 2002:a4a:85ca:: with SMTP id u10mr1068395ooh.80.1622756135377; 
 Thu, 03 Jun 2021 14:35:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Jun 2021 21:35:35 +0000
MIME-Version: 1.0
In-Reply-To: <d3ec375b9cbe72030e240a84a6c7e13d@codeaurora.org>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
 <YLkI/6ItCz+SbbuJ@yoga> <d3ec375b9cbe72030e240a84a6c7e13d@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 3 Jun 2021 21:35:34 +0000
Message-ID: <CAE-0n53B6oa2zUm0h28Z-U4uhdMabZPRFV=h-ffyBKLs_uHZ-Q@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, khsieh@codeaurora.org
Subject: Re: [Freedreno] [PATCH v2] arm64/dts/qcom/sc7180: Add Display Port
 dt node
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 vkoul@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, agross@kernel.org, abhinavk@codeaurora.org,
 linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-06-03 14:28:37)
> On 2021-06-03 09:53, Bjorn Andersson wrote:
> > On Thu 03 Jun 11:09 CDT 2021, Kuogee Hsieh wrote:
> >
> >> Add DP device node on sc7180.
> >>
> >> Changes in v2:
> >> -- replace msm_dp with dp
> >> -- replace dp_opp_table with opp_table
> >>
> >
> > I'm sorry for those suggestions, I don't like either one of them.
> >
> > And for everything but changes to the DRM code the changelog goes below
> > the --- line, so it's not part of the git history.
> >
> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  9 ++++
> >>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 78
> >> ++++++++++++++++++++++++++++
> >>  2 files changed, 87 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> index 24d293e..40367a2 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> @@ -786,6 +786,15 @@ hp_i2c: &i2c9 {
> >>      status = "okay";
> >>  };
> >>
> >> +&dp {
> >> +        status = "okay";
> >> +        pinctrl-names = "default";
> >> +        pinctrl-0 = <&dp_hot_plug_det>;
> >> +        data-lanes = <0 1>;
> >
> > Is it a limitation of the EC in Trogdor that you can only do 2 lanes?
>
> yes,
>

It's not an EC limitation. It's a hardware design decision. We have one
type-c PHY on the sc7180 SoC and we have two type-c ports on the board
so we have decided to only use two lanes for DP and two lanes for USB on
the type-c ports so that both type-c ports work all the time.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

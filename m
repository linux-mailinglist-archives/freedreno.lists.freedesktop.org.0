Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F107F563764
	for <lists+freedreno@lfdr.de>; Fri,  1 Jul 2022 18:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D0A14B49B;
	Fri,  1 Jul 2022 16:07:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C614E14B485
 for <freedreno@lists.freedesktop.org>; Fri,  1 Jul 2022 16:07:00 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id q6so4820727eji.13
 for <freedreno@lists.freedesktop.org>; Fri, 01 Jul 2022 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iU1WXNqtWMrZUa+JVDcKXW+n/u2YiixZY6UAGKLDnPg=;
 b=iq8OARlHdwjKJaotlBm1jpgne1kU1PT5n8rnl6fpp9YAyJoLGzBe5hekwwTHO4U6WG
 ZHK2qR50/rtNqUyDApnn0W+70spOH37v/wSryluuzENNpTsfhHWf5E7ADyc2jEgaJWZ7
 jHT3znd5Z/JBcuN1ieNFm6MgqTMUf+yFMuuW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iU1WXNqtWMrZUa+JVDcKXW+n/u2YiixZY6UAGKLDnPg=;
 b=A8xEdl9Bkugadt4pumgeEAVipYA6YS87DVMcM2827kEYt9/Wg42wWw5mkFQFJHMjrg
 sxt87OP5bR8Pzv6n/Q8xI14CWvXOLd8UFBRb8VRZzAmDvOmf3AeBt3Jvtd5zVWFmA4xn
 MML/ImxM/RvhU3BrzBC5E9m6hZlQsfsKCMHvNEq1B1CLSxsDDqZMhHu2EN0IKBL0GmDA
 QHWiCOkZBSk/s2n17oEaEvrDiDW4jga9ibq/QUSoiGSJ2YPVL2MhjDWuEaz5+KsArFGe
 /6Xz88uJtJmHQi2OFX1vi9IsHkr1/krzuHb9da1jzrqv4PRheYn6KJJy0y4xYNuO9ZTb
 Renw==
X-Gm-Message-State: AJIora8oNCk1brgFGZHQaXZf6dVzBDrkbWsG7pocXfp5zVRcWUEY1ICs
 d6KaU6hotQ9JRE0FJ8aA32D7N+22hRTjqzEC
X-Google-Smtp-Source: AGRyM1vs+1Uh5MmeaXcngrsalP+j4cyrsH6D2c82emy8QwUzWUlIBaIQsEy53IGoTIi+na1yILIleg==
X-Received: by 2002:a17:906:d550:b0:723:5c2c:8a71 with SMTP id
 cr16-20020a170906d55000b007235c2c8a71mr14773206ejc.254.1656691619096; 
 Fri, 01 Jul 2022 09:06:59 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 uz12-20020a170907118c00b00711aed17047sm10522046ejb.28.2022.07.01.09.06.58
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 09:06:58 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 g39-20020a05600c4ca700b003a03ac7d540so3985952wmp.3
 for <freedreno@lists.freedesktop.org>; Fri, 01 Jul 2022 09:06:58 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8d:b0:3a1:2e4d:1dd2 with SMTP id
 f13-20020a05600c4e8d00b003a12e4d1dd2mr17792094wmq.85.1656691617857; Fri, 01
 Jul 2022 09:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <1656690436-15221-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1656690436-15221-1-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Jul 2022 09:06:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V5uLz9aqrgHrsPYHzBXL+Bx5Ds8aEP_kSzA29d-9jtBg@mail.gmail.com>
Message-ID: <CAD=FV=V5uLz9aqrgHrsPYHzBXL+Bx5Ds8aEP_kSzA29d-9jtBg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] arm64: dta: qcom: sc7180: delete vdda-1p2
 and vdda-0p9 from mdss_dp
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 quic_mkrishn@quicinc.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 quic_kalyant@quicinc.coml, LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 1, 2022 at 8:47 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 732e118..824a98c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -813,8 +813,6 @@ hp_i2c: &i2c9 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&dp_hot_plug_det>;
>         data-lanes = <0 1>;
> -       vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
> -       vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
>  };

Reviewed-by: Douglas Anderson <dianders@chromium.org>

NOTE: this is somewhat related to Kuogee's series [1] but it's OK to
take even though his series hasn't landed. On trogdor we always keep
these regulators in HPM mode so we're not truly dependent on the
addition of regulator_set_load in the DP PHY.

[1] https://lore.kernel.org/lkml/8b751eb3-2e19-0e03-4c94-b26b3badd397@linaro.org/

-Doug

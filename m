Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5518680C517
	for <lists+freedreno@lfdr.de>; Mon, 11 Dec 2023 10:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D99210E383;
	Mon, 11 Dec 2023 09:46:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04D210E385
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 09:46:25 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5de93b677f4so23843017b3.2
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 01:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702287985; x=1702892785; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ztyXivNuoKy+BneSWBkP9rSJnlB8B4ezbvE54Oo1NlU=;
 b=zlRGVZNGW7XltTjnJqVOJKMv3AylUdswyW0qf4JKB/zi1+Hsr9AsOphAsbv1cG5i+P
 m0AXXODHdqeSZtpQgJ0opaABOme6RO+1r7Dk+TMIvXk08IMm+Kuk3/S3glgmBobrZXY4
 quQd74ooI/RxNsd7WIzcCHwcPXtKTq5g2lGQDk+9yDJizkmj1I0ICD5EP10iuP2EJ3a1
 GrgtxLp6ze1XsotTpoKHLzIJruj4wkZzUb2Rsu4ifkbaW3H40m/jcCe5JK7nUBvbtVFH
 Sec6HPg2UGWfGPyt7zMXtA8Yf0SybpJbvwcgO6gJ+SkdSWRoOHUDc8uxGfXx75LM+JdV
 VTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702287985; x=1702892785;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ztyXivNuoKy+BneSWBkP9rSJnlB8B4ezbvE54Oo1NlU=;
 b=Rhmo9e0JXitz5Lgaqc8hyRAa2wmvJMeQ8K9lfoFuIc2+ijfolvTAQwSJhFxskirNVJ
 2xiubanO1fwjx8/qBg7Lt6foiuRceee8eujkfJUILW2qFOBXOP4UW/kKrnvebO9WPZVq
 lSAu9IW0TqmmjFxBpKkGSpkMdbUPFhMyxhcyXjK9jZ8f54SbB6w17SWfJaWrdyl3a07q
 Xx8c3fq6sWl6rxi1XiClshtixRtKoTMYBXtD5sDxcD7wnS9XQ2F3lf9G7B37Dl4jj10b
 h+CwmtntaqFZaOcgYdsJvvarqfrPlCs4Cp3T3siuq23K7dMqDxL4FPzFyDQWoAmNT0Ob
 XkWQ==
X-Gm-Message-State: AOJu0YzW3lulChgeARmf/fF+LzVrMwVMo4enHURvk3tTLI6JXHQIuWZz
 oOB93Y+ArRNZg9w8wdJHDUpGFr4kFtrERHvUS8d14A==
X-Google-Smtp-Source: AGHT+IHURBFzCJzZFsNF1co2h/izQ0cL38z/U3Y37n9DKZ7fTanIIaYzh9eONAyPtqR8UEIN3d2Z/6hvKEoyRrb3Guw=
X-Received: by 2002:a5b:20d:0:b0:da0:350f:fd6a with SMTP id
 z13-20020a5b020d000000b00da0350ffd6amr1668920ybl.46.1702287984965; Mon, 11
 Dec 2023 01:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
 <20231209232132.3580045-8-dmitry.baryshkov@linaro.org>
 <5025892d-0cbc-462a-b7d8-95828680dd8b@linaro.org>
In-Reply-To: <5025892d-0cbc-462a-b7d8-95828680dd8b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 11:46:14 +0200
Message-ID: <CAA8EJprp+Rf5BKEnaoCooWVKGfg6SRg-uc=NRywc10qy=Yj2Xw@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sm8150: add USB-C ports to the
 USB+DP QMP PHY
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 at 11:33, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 10.12.2023 00:21, Dmitry Baryshkov wrote:
> > Expand Combo USB+DP QMP PHY device node with the OF ports required to
> > support USB-C / DisplayPort switching.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index ea7c92c0e405..38423a9f8408 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -3447,6 +3447,29 @@ usb_1_qmpphy: phy@88e8000 {
> >                       #phy-cells = <1>;
> >
> >                       status = "disabled";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +                                     usb_1_qmpphy_out: endpoint {};
> style 1
> > +                             };
> > +
> > +                             port@1 {
> > +                                     reg = <1>;
> > +
> > +                                     usb_1_qmpphy_usb_ss_in: endpoint {
> > +                                     };
> style 2
> > +                             };
> > +
> > +                             port@2 {
> > +                                     reg = <2>;
> > +
> > +                                     usb_1_qmpphy_dp_in: endpoint {};
> style 3
>
> :(

Which one should I stick to?


-- 
With best wishes
Dmitry

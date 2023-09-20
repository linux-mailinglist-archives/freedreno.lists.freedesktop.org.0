Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C789C7A740C
	for <lists+freedreno@lfdr.de>; Wed, 20 Sep 2023 09:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE0F10E162;
	Wed, 20 Sep 2023 07:28:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B1510E161
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 07:28:02 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-59bbdb435bfso64952047b3.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 00:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695194882; x=1695799682; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gwW/aKgkBI8jvoRbmdXukbiIBoNPv5CCX3I1vI78hY0=;
 b=whfn6B49YV+aXQ0xP/vIm8YzUst5z/UBqttdmpQEBPBN7F+G60c1MHfm7J88qIsZGX
 MSAiizcySFkjTJgXh/2ltoAOSqHUVL4k/RGrfkvbptFXppmjT3MEvbyYy2a7FxwScRlw
 nPkmaMyX/f3VaIXSl+fGun8JPt6DrQrF4wh3ZlW4tihnZHCmQx4PCATy4UGgTixc6P8Q
 HJYmuT2/2HjStQUE5A5BWYr25RWY0gMEBzYoH6TAayykC2NLKcjR2nTIRJ38Fqotu4EQ
 Uw37ylIymbkaSpXjPLyKYDrdsVuK/GzzFX2BBTxEBr8I5c0xDYeUew9Fjt/BaXO7kekT
 G64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695194882; x=1695799682;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gwW/aKgkBI8jvoRbmdXukbiIBoNPv5CCX3I1vI78hY0=;
 b=bcype3dgR7l9znMRI24P+VS7iOhszVQeq3eoaXjT5wS3IueB6IEqx1hI6ldMU2Cihh
 waHR5oLZwbCLh0ROW0xYNInRt+tvHEFzyELmog1y9+W1kXkyVehAVHlcMsTcWWnT9N/p
 gWqIhacHz6x3bfcZDc7v6DuWIm8uBbglMUYL9jYDyl+3u5yHXmpCwXHqk7WzSN87zPqD
 8+G7pKpMMyZEokamLG9kwy2CQE+zlhwi0A+5To39kpwyCXcejXOuQjwX6eu/HV80VIle
 z+JJEms/5TLqnIzWQk0kBLKppezzlgjTas7Ph7gAqO7izt9du8r8uJKgi+isABIrlaDJ
 NraQ==
X-Gm-Message-State: AOJu0YyjZJKaipZBGTMSAom8OzH22cZJWM/8TzGmkwz0vu++ls371kIx
 vQWyupIOX11ogKGdjltTCtARkC9fHwgbY0rcUSR+Dw==
X-Google-Smtp-Source: AGHT+IFcGwxsD14iTBsfb5A6WM9HKpgER1VektslYkA2MPFERnEZVoaEsnHQM17447rTKPxBIUUzlSQbAxSsLf5oFEA=
X-Received: by 2002:a81:9e10:0:b0:579:effb:ae1c with SMTP id
 m16-20020a819e10000000b00579effbae1cmr1828509ywj.26.1695194881940; Wed, 20
 Sep 2023 00:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
 <20230817145940.9887-2-dmitry.baryshkov@linaro.org>
 <4eaekxgmikdacvvprysb6btdqootbc6paomzhuqjtzd6rgqxkc@birohtqp4rbo>
In-Reply-To: <4eaekxgmikdacvvprysb6btdqootbc6paomzhuqjtzd6rgqxkc@birohtqp4rbo>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Sep 2023 10:27:50 +0300
Message-ID: <CAA8EJpozPp2-oqr2mWAuA_8mTSc8whnOAg+zYZSWNmQBg_eLxw@mail.gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/4] arm64: dts: qcom: sm8250: Add
 DisplayPort device node
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
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 20 Sept 2023 at 05:08, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Thu, Aug 17, 2023 at 05:59:37PM +0300, Dmitry Baryshkov wrote:
> > Declare the displayport controller present on the Qualcomm SM8250 SoC.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 89 ++++++++++++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index eb00bbd3e1f3..8d705a1713fb 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -3638,6 +3638,8 @@ port@1 {
> >
> >                               port@2 {
> >                                       reg = <2>;
> > +
> > +                                     usb_1_qmpphy_dp_in: endpoint {};
> >                               };
> >                       };
> >               };
> > @@ -4405,6 +4407,14 @@ dpu_intf2_out: endpoint {
> >                                                       remote-endpoint = <&mdss_dsi1_in>;
> >                                               };
> >                                       };
> > +
> > +                                     port@2 {
> > +                                             reg = <2>;
> > +
> > +                                             dpu_intf0_out: endpoint {
> > +                                                     remote-endpoint = <&mdss_dp_in>;
> > +                                             };
> > +                                     };
> >                               };
> >
> >                               mdp_opp_table: opp-table {
> > @@ -4432,6 +4442,85 @@ opp-460000000 {
> >                               };
> >                       };
> >
> > +                     mdss_dp: displayport-controller@ae90000 {
>
> displayport-controller does not seem to be a valid child node of the
> sm8250 mdss. Please make sure that the binding is updated, if not
> already done.

True. I added the compatibility string to dp-controller.yaml, but
missed the mdss schema. I'll send a fix ASAP.

>
> Thanks,
> Bjorn



-- 
With best wishes
Dmitry

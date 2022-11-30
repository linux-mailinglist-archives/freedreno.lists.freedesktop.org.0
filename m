Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDDD63DD25
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 19:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052E510E117;
	Wed, 30 Nov 2022 18:24:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB49310E4C2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 18:24:14 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-3b5d9050e48so177535757b3.2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 10:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/AXVTYuE39O3jx8KzIx60z7zZqTvKk5rk179CigNl+o=;
 b=r3cFSuHJOdgxKK7PnOzg6boDESZv0VXA9TJv3XXTy7Qlanmxk5oQcgfrqhfInFQ0yu
 rJ+2NEVM8ak7025PMXUD2rYzAgmJW/92UBTTAP8eEERFGAnYjun04GdUPiAi4z43WevP
 yf4fJm2MneHCwTPqnba6wS7y+fKaaeuYMHYuQqq10mNYfnR9w+cYvPrzBBLOKSOMlwjt
 BI7NJfszVWbOBBSIsoo6YeJoZ6V2LA398oJu/sEEfc4mwEqC7uDuhwwWldKaRsMzbmMk
 RCTdOV8OXBrDrhlOfJpyPEHtJKUTS3VoJrkU2VZ8wgHIsc3phfUQVfyw5aKjIWyrNqeV
 IAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/AXVTYuE39O3jx8KzIx60z7zZqTvKk5rk179CigNl+o=;
 b=DFviZ+854nYQ4jSv776Ucmc8yWcIt4/xVD55cq4+jIevT0GedZXsXEMGQvXz8kJ2HD
 jK/oh2OglFjxRkj84jhkK04YQ1J+aZta26VviHqByXLyPXksnNyCVu/0jUmHqpjRetlg
 M21gvmGfJC6SuV/slnEg3d4SEZP3QV3qWrmlWYpUWZ3u5hD6qiDBLwi+sllJF+SBXj2Y
 1uDo9lfF3LvCOuYqJKEKsaCmpP6/JyGzbB63Nc5hHsYqRTbMZLAalq5RZzPMlhgXs5tI
 ljhmSXj6eIe5NDSesvbxVQ//3hMRWKK0FUZt745ulWAJAmuSOCZ6A2SnsVKjQt/xZhrc
 gGBg==
X-Gm-Message-State: ANoB5pkqU7MIEinNwNh0j367+q6CWVPMwheC11nyY72meq6OsErZTGmD
 QwD6fsjPBG3zhBQFnYqXhpYZr7hOG4oM35XUfIpWeXosA2c=
X-Google-Smtp-Source: AA0mqf4Grq046732aS2kFtLMc/jktEFfU9NaUpZKy0KLcNigiNxT1JUOJ6pWTyXLZW5WLvlRheojHaHAX3k5dn503Wg=
X-Received: by 2002:a81:4902:0:b0:3c4:bb7a:9443 with SMTP id
 w2-20020a814902000000b003c4bb7a9443mr18323626ywa.138.1669832653988; Wed, 30
 Nov 2022 10:24:13 -0800 (PST)
MIME-Version: 1.0
References: <1669767131-13854-1-git-send-email-quic_khsieh@quicinc.com>
 <1669767131-13854-2-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpr_AODJ6WPB8_4aRY8q6XBy3-cXMOkox7VfL-PK1p4pQg@mail.gmail.com>
 <cce7ce65-b27f-93ee-9907-35072490f114@quicinc.com>
In-Reply-To: <cce7ce65-b27f-93ee-9907-35072490f114@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Nov 2022 20:24:03 +0200
Message-ID: <CAA8EJpq2H+fx+jMJ=E=7nno2vSMP5XdiM0eQrTZvk0ToETTg5Q@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 1/3] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
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

On Wed, 30 Nov 2022 at 19:41, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 11/30/2022 1:20 AM, Dmitry Baryshkov wrote:
> > On Wed, 30 Nov 2022 at 02:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
> >> add link-frequencies property into dp_out endpoint as well. The last
> >> frequency specified at link-frequencies will be the max link rate
> >> supported by DP.
> >>
> >> Changes in v5:
> >> -- revert changes at sc7180.dtsi and sc7280.dtsi
> >> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
> > Bindings update?
>
> Sorry, I did not get this.
>
> Can you please elaborate more specified what exactly you want me to do?

You need to update device tree bindings. See
Documentation/devicetree/bindings/display/msm/

> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 6 +++++-
> >>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 6 +++++-
> >>   2 files changed, 10 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> index 754d2d6..39f0844 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >> @@ -812,7 +812,11 @@ hp_i2c: &i2c9 {
> >>          status = "okay";
> >>          pinctrl-names = "default";
> >>          pinctrl-0 = <&dp_hot_plug_det>;
> >> -       data-lanes = <0 1>;
> >> +};
> >> +
> >> +&dp_out {
> >> +    data-lanes = <0  1>;
> >> +    link-frequencies = /bits/ 64 <160000000 270000000 540000000>;
> >>   };
> >>
> >>   &pm6150_adc {
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> >> index 93e39fc..b7c343d 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> >> @@ -440,7 +440,11 @@ ap_i2c_tpm: &i2c14 {
> >>          status = "okay";
> >>          pinctrl-names = "default";
> >>          pinctrl-0 = <&dp_hot_plug_det>;
> >> -       data-lanes = <0 1>;
> >> +};
> >> +
> >> +&dp_out {
> >> +       data-lanes = <0  1>;
> >> +       link-frequencies = /bits/ 64 <160000000 270000000 540000000 810000000>;
> >>   };
> >>
> >>   &mdss_mdp {
> >> --
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >> a Linux Foundation Collaborative Project
> >>
> >



-- 
With best wishes
Dmitry

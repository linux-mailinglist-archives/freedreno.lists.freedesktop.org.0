Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C25763E5AC
	for <lists+freedreno@lfdr.de>; Thu,  1 Dec 2022 00:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F27F10E4EB;
	Wed, 30 Nov 2022 23:42:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A10710E4F0
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 23:42:24 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3b5d9050e48so772427b3.2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 15:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l3w19I8V57DQ1MXmfBf0wy4kHsUtbwRFQAGo94nfiSg=;
 b=PAaSk/+UU3OKSZlpP/G89ehMeIDS0uWq16/OYjCfNJ9PbrD7gojirNEVXqGbMrw+hV
 drt9I8xPI+VSMbyYo2DswLGz95A53WJAlubb+N3yM26deX2GPctfRz39JiiH7GNzySxO
 Y0uUoIjKdDxEbP7RPJhWfSNR+630WQA7aAmkEdSLMEzNocHvJtjWYRqQrpGZCsQkvvKa
 gvfoDWikQjv8oNc891l61NPDHsjBDmYcG0kP+0N/2ZLLrqjVbgBJ4ZCmeIbKhNLVp1IC
 8FmDhGZZ5jciIlSrOGOsk2+gW3kYPgNAEoKwNXMvLePNVKNDfs2xMNVCTwbjmaWxzCKr
 m+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l3w19I8V57DQ1MXmfBf0wy4kHsUtbwRFQAGo94nfiSg=;
 b=WOI7H3UDwrLxCkxQNne3gPiXdeIjmv+2nHoNvfybMHTRD2hzZGSk00XvOfNkNiRg8A
 MRfiTe/E9bKdUvx50Y0fTwY3BdA2G57gA/J1SzLzJrWCjpKYmxegzFGUZUZSlAlOraO5
 T7ny1Gu9a4Pr1mVx7z1B6XH+wbJTf9Mu+yyZZS8REI3myhAjY746EUScRijzDdxS01md
 JqqvynwR4OiV1W1j8oMIhc0A1GT6HUYWTcniFY8chyLbDB+cgQHpNyvrdsfDr2FXmi3x
 Sjsk8PcazjIO5vwi5t8eeJMOeG+DuSPshbO/I47rxH938Jf27D3umaMx0MsaKb2HPbSo
 SoKA==
X-Gm-Message-State: ANoB5pnM60krIftbjksiVgsfhdesv7kTFESfm2hML11oMjXGUQ1VlApQ
 GXztxeleD9qjd3kEJI+2wmt/HzBBj6pDceCmW0sP4g==
X-Google-Smtp-Source: AA0mqf7JqNs4sVnxoFf6GhCv7at7VDM9lbJPrNy7a721Jy3+he4/Jup6qkNh6vQEqrNkrpKHDEOD7DD62UC9NdRlS6o=
X-Received: by 2002:a0d:d103:0:b0:370:4c23:eacc with SMTP id
 t3-20020a0dd103000000b003704c23eaccmr61723709ywd.127.1669851743268; Wed, 30
 Nov 2022 15:42:23 -0800 (PST)
MIME-Version: 1.0
References: <1669767131-13854-1-git-send-email-quic_khsieh@quicinc.com>
 <1669767131-13854-2-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpr_AODJ6WPB8_4aRY8q6XBy3-cXMOkox7VfL-PK1p4pQg@mail.gmail.com>
 <cce7ce65-b27f-93ee-9907-35072490f114@quicinc.com>
 <CAA8EJpq2H+fx+jMJ=E=7nno2vSMP5XdiM0eQrTZvk0ToETTg5Q@mail.gmail.com>
 <930efdc2-8770-9548-36e9-34c7015ba312@quicinc.com>
In-Reply-To: <930efdc2-8770-9548-36e9-34c7015ba312@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 1 Dec 2022 01:42:12 +0200
Message-ID: <CAA8EJpqeDwdk3TmmO2ksqo5hX8Fm5YHx+Gco-tOvZbO3WO1BKA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 1 Dec 2022 at 01:11, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 11/30/2022 10:24 AM, Dmitry Baryshkov wrote:
> > On Wed, 30 Nov 2022 at 19:41, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>
> >> On 11/30/2022 1:20 AM, Dmitry Baryshkov wrote:
> >>> On Wed, 30 Nov 2022 at 02:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>>> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
> >>>> add link-frequencies property into dp_out endpoint as well. The last
> >>>> frequency specified at link-frequencies will be the max link rate
> >>>> supported by DP.
> >>>>
> >>>> Changes in v5:
> >>>> -- revert changes at sc7180.dtsi and sc7280.dtsi
> >>>> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
> >>> Bindings update?
> >> Sorry, I did not get this.
> >>
> >> Can you please elaborate more specified what exactly you want me to do?
> > You need to update device tree bindings. See
> > Documentation/devicetree/bindings/display/msm/
> got it, can I submit it as separate patch ?

It is a separate patch, but a part of the series. You have to resubmit
it anyway because of changes requested for the patch 2.

> >
> >>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>> ---
> >>>>    arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 6 +++++-
> >>>>    arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 6 +++++-
> >>>>    2 files changed, 10 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >>>> index 754d2d6..39f0844 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> >>>> @@ -812,7 +812,11 @@ hp_i2c: &i2c9 {
> >>>>           status = "okay";
> >>>>           pinctrl-names = "default";
> >>>>           pinctrl-0 = <&dp_hot_plug_det>;
> >>>> -       data-lanes = <0 1>;
> >>>> +};
> >>>> +
> >>>> +&dp_out {
> >>>> +    data-lanes = <0  1>;
> >>>> +    link-frequencies = /bits/ 64 <160000000 270000000 540000000>;
> >>>>    };
> >>>>
> >>>>    &pm6150_adc {
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> >>>> index 93e39fc..b7c343d 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> >>>> @@ -440,7 +440,11 @@ ap_i2c_tpm: &i2c14 {
> >>>>           status = "okay";
> >>>>           pinctrl-names = "default";
> >>>>           pinctrl-0 = <&dp_hot_plug_det>;
> >>>> -       data-lanes = <0 1>;
> >>>> +};
> >>>> +
> >>>> +&dp_out {
> >>>> +       data-lanes = <0  1>;
> >>>> +       link-frequencies = /bits/ 64 <160000000 270000000 540000000 810000000>;
> >>>>    };
> >>>>
> >>>>    &mdss_mdp {
> >>>> --
> >>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >>>> a Linux Foundation Collaborative Project
> >>>>
> >
> >



-- 
With best wishes
Dmitry

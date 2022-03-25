Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816814E7A80
	for <lists+freedreno@lfdr.de>; Fri, 25 Mar 2022 20:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1887C10E518;
	Fri, 25 Mar 2022 19:51:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F8110E518
 for <freedreno@lists.freedesktop.org>; Fri, 25 Mar 2022 19:51:07 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id o64so9277281oib.7
 for <freedreno@lists.freedesktop.org>; Fri, 25 Mar 2022 12:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=eUek1jmX1h1x8PcNcflTTCV7rdiqXP/FImxouF9eXrk=;
 b=MuYU2U53+0XditHV3+xMmufekP83Q86clHPRUFiYJI5c83MMgqsqZU6OE0iD7uqI1D
 bq5BpO0h+DDnBW2dzr+T0KLiCp0GgYfvXmXPzjeUTmIwglTcDMjx2JTa8I15roXjfJQr
 QDYKF7wfPMDa6WIjm4l4EenX4il5h6oLp4L78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=eUek1jmX1h1x8PcNcflTTCV7rdiqXP/FImxouF9eXrk=;
 b=LC7Qwtqn+evtzx/0fO6JV7tS5whdllG/hpDxUSBlq/JlrWFVHBNUPPUwWzt7mwo74V
 s+d/Kb2QwZmRbu33jC8SF5S9T0L2hj9xzkSGKY5ihUAOQzW3O60pENfgV898l78dkBeK
 zK0Iy+fM/mSuO2+MH4+BeDbe1xzGd8m2kQunLjfQsCtBEAMtGtCC8SMG2Al7OpgUvVez
 NjUpqrpqH9VZIwCRxcszHO3H6q9yN0q+YaSrNed0HBCVkUH426zq4NRlMugKceegqUv+
 y8X5n7ID1GMNuIP5/iwjsQlXo98OagAYQk1Od/1nrnzaAO2fwYHEmidzP3OKPn2zMEP8
 alpQ==
X-Gm-Message-State: AOAM530trHHoqR82l79EogvykPtPBK9bLad/A2HGwJv3KGzsrt8sVQnn
 /UbqI30ZOauxqZVy9G/N9/qDj0B1r2B74P22Cuo81Q==
X-Google-Smtp-Source: ABdhPJxjJgDkwaOL+igFbYKoHRlPcGxtCqcdt2HqSpDefQv8NNUO1BG5eOIgAhxWNNRmCDuEqZtRbL5DhxFUglZ6hXs=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr5910648oie.193.1648237866373; Fri, 25
 Mar 2022 12:51:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 14:51:05 -0500
MIME-Version: 1.0
In-Reply-To: <MW4PR02MB718635E7712D44094E6E91F3E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n52Uzo47N5QzoKOwny3XTrArA4nM-KPqAVxAPewSAyNOWw@mail.gmail.com>
 <MW4PR02MB718635E7712D44094E6E91F3E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Mar 2022 14:51:05 -0500
Message-ID: <CAE-0n500xV_SA_-KQ4Sh-8PV=rfaXxrMBAh5tnVpjCMD+VEyqg@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add
 support for eDP panel on CRD
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "sam@ravnborg.org" <sam@ravnborg.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "agross@kernel.org" <agross@kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "sean@poorly.run" <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (QUIC) (2022-03-25 06:30:58)
>
>
> > > +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> > > +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> > > +
> > > +       aux-bus {
> >
> > Can this move to sc7280.dtsi and get a phandle?
> >
>
> Okay, I will move this to sc7280.dtsi like below.
> Shall I define the required properties under &mdss_edp_panel node in the sc7280-crd3.dts?

The below patch looks good.

>
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3283,6 +3283,18 @@
>
>                                 status = "disabled";

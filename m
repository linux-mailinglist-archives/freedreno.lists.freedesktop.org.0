Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5706219E0
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 17:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3073910E4CB;
	Tue,  8 Nov 2022 16:56:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F041E10E4C5
 for <freedreno@lists.freedesktop.org>; Tue,  8 Nov 2022 16:56:04 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id k13so14247345ybk.2
 for <freedreno@lists.freedesktop.org>; Tue, 08 Nov 2022 08:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TN8l2lGtVmcCUipWgzLJOYNCDLR8IIsOAYeFjH7zJ1w=;
 b=g5OU3wWOpPPOiIkbca2HE3EGr3zNuD22/5cVb58DoDhivuCuM0q7rGOcbDSVt6mbM7
 puJ6zoUGLHjZ/1y6uiMnCnkawiLa+M5N9DdXrQ4fzYvPxIjFicmtVpQ8iKuahX6iPh0i
 X33uSN0n5zZzyPl0GscyTiXlC/PF+u4fiNCN8nZFt1t5CQBCzfLjrBf1UE1UaRSAWmsU
 /H/vai7wpg8sZXUHAjh6JncNyIQ3i9u3PIH5a4SM67tfTLu4wIulHKdk3lJ+poqtCJRJ
 eKxusToqrCDwwsWxNYuMzuHTDss2yuC8kvBnCyb0uZnmj2tZGUMLRFR75V/P53l4/ANS
 /5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TN8l2lGtVmcCUipWgzLJOYNCDLR8IIsOAYeFjH7zJ1w=;
 b=bcpl2llPzS1WKDsDuZLA/TFG71AiFaBXxi8L6Vat733qZRDGvjqDZKTsMztsvnlQvy
 JpAfgZuP+QyAATt6vL2A4HCCxvdFaVJnwVxFxhC40WGS/IepDawvS9hyWb1rSEbphLmc
 azRDthH64OrlK6i0d60Dr7+lyfS9QRF+ygJDNej0tYVhtWL2WekJVVgvAycwYjpdn0vf
 wtj5ARmZN5iTTwX+WWItwWTEwQm94/reRVTq9j8FDupUGv1xvZD6lDDNjmgpL+EZD70h
 0aHAifWBhmvFyJMe5rRVrSu4+ijMHoZIjahkDA/JZd62qIlAZJz7AEj27Vfy1nkJXm10
 2bxg==
X-Gm-Message-State: ACrzQf2c2gj2D9jspcx/IIZuu4GcjQ4/yUotkmTCqGa14nnSwrvrkmak
 WPLbAFgroLEFqxRu5P4TI6e2zDodkM4YBrt5R/ygEw==
X-Google-Smtp-Source: AMsMyM56aNnx3FqXLL0Tf26b1gUZQslz7y1AQLBr6u3w0T002wSBE6l9w1Rkr4MeMdq0L5BOCNqcXfrK/a4ieFP1Q3M=
X-Received: by 2002:a25:ba45:0:b0:67a:6298:7bac with SMTP id
 z5-20020a25ba45000000b0067a62987bacmr60069197ybj.194.1667926563854; Tue, 08
 Nov 2022 08:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
 <ceffec42-f9af-6bde-8db1-076f0cc2a34f@linaro.org>
 <a8c36604-5f52-0be9-29d7-f64811541c97@linaro.org>
In-Reply-To: <a8c36604-5f52-0be9-29d7-f64811541c97@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 8 Nov 2022 19:55:52 +0300
Message-ID: <CAA8EJpoepOn4ScZT6V7a1T73pWdQKsxUzVKA5KsBy9SFfNVBKQ@mail.gmail.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 03/18] dt-bindings: msm:
 dsi-controller-main: Add vdd* descriptions back in
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 8 Nov 2022 at 17:42, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 08/11/2022 12:59, Dmitry Baryshkov wrote:
> >>
> >> Warnings about missing regulators can be resolved by updating the
> >> relevant
> >> dtsi files to point to fixed always-on regulators where appropriate.
> >
> > Ugh. Are they missing or are they optional/not used on these platforms?
>
> Some platforms either don't implement them or worse possibly do
> implement but don't model them when they should.
>
> > Can you possibly list all regulator warnings?
>
>
> Downstream we have
>
> arch/arm/boot/dts/qcom/msm8916-mdss.dtsi
>
> mdss_dsi0: qcom,mdss_dsi@1a98000 {
>         vdda-supply = <&pm8916_l2>;
>         vdd-supply = <&pm8916_l17>;
>         vddio-supply = <&pm8916_l6>;
> };
>
> Looking at something like
>
> arch/arm/boot/dts/qcom/msm8916-mtp.dtsi which references
> arch/arm/boot/dts/qcom/dsi-panel-jdi-1080p-video.dtsi it doesn't appear
> to delete andy of the vdd*-supply references

Good example. We have vdda-supply and vddio-supply in
msm8916-pm8916.dtsi (correct).
And the mentioned vdd-supply is not applicable to this platform. It
powers up the external DSI-to-HDMI bridge. I'd assume that the same
regulator was destined to power up the panel.

So, I'd suggest defining all supplies at the top level and then
pushing all the required: parts into the per-SoC entries.

-- 
With best wishes
Dmitry

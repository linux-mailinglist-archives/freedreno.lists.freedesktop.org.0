Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC709650FFD
	for <lists+freedreno@lfdr.de>; Mon, 19 Dec 2022 17:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F04910E231;
	Mon, 19 Dec 2022 16:12:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C4610E231
 for <freedreno@lists.freedesktop.org>; Mon, 19 Dec 2022 16:12:03 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-144bd860fdbso12141622fac.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Dec 2022 08:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=opNyEy4Hga2S+HSZGwYoo4n70oAUrhY/I95QJwBLXGw=;
 b=GLXF0a9hN4NDrxSiyquzet3CYHgBek4M8xB9NgCoRur+3SiWUQ7U0TpQ80vS2Ey3yF
 7Z9I/KAw6ATX613YDJ3PomP8p4XMs41nnalAMwU6+QkQFUhMm8vvsM/K4MpnHj4V1b0x
 +YaWd5cjgjBFDIyenlffSYdjzvSma6xkeJIJvjxWrd9sI8mBIlSsddTfnkbhYVUCIDzB
 Lw7vc0hRHHp2zRSkxqQG/nmlTh1KEbHJdzruUiUK2ggEdHmzJdhNBQQ55yhkimSIbzcJ
 ORq78PFUdH2Oq9tfhYAjIghbEMkSxUcC+jVPPGxbu/HWGDnWbImG5UrI6v8+r37GhsdB
 tXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=opNyEy4Hga2S+HSZGwYoo4n70oAUrhY/I95QJwBLXGw=;
 b=hC4Mz8dFrYwCBPZZe4EgfPQvtk/yJtQ0Zwx0sImS+KNKSZHV5bzTQYIuc036ZTKBCB
 //GGf4EB2axoQdoz6ocihgpzm3/fMakUG49LNjFWoDSDcpoJiQI/zAtALaI0WQggbiQK
 k6Wlx71vKq//QKKfVySpSq8cu+rLiqOpzLzCW9hMLfhKZ4B4LgJpnamXogVxSgo3ad54
 UgQGXRS9oY7/1Lcqh1FFICHcQvNYxT4YArosPo3AfYcG1yDYl8kcnxE84mlTXBLV4dxo
 DUtSOups9mp0ZmyWdH4tVP20RzXSuYg9Dy024Z4EUzeXBOjassY/QWQzNfyf7Ef2u5Ax
 tqpA==
X-Gm-Message-State: AFqh2kqUUc+m0faazUCKBhbyHPN9ST1npf3eDLTZiraFzDRE7jFuBaUi
 2YSo43aTP5cQhmZNevY5QZqpSOEA5dPDCcS5Ps4m2w==
X-Google-Smtp-Source: AA0mqf55kS80V69FV3FbQLl+xTi2OHqecJQT7VNkb/GHotEghsH04avx+8ln6J+VXS2w3SXe+3JAgEmw1jbdGZgvIyg=
X-Received: by 2002:a05:6870:9e4c:b0:13c:33d0:22e2 with SMTP id
 pt12-20020a0568709e4c00b0013c33d022e2mr1717322oab.14.1671466323100; Mon, 19
 Dec 2022 08:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-11-robert.foss@linaro.org>
 <853d49f9-cd97-e8a0-53fd-9f673c2720a1@linaro.org>
In-Reply-To: <853d49f9-cd97-e8a0-53fd-9f673c2720a1@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 19 Dec 2022 17:11:52 +0100
Message-ID: <CAG3jFysRXykUgOqRiPVYSRtjQ5Rfj+DQQqPzhzA8j9B9LToj5g@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 10/11] arm64: dts: qcom: sm8350-hdk:
 Enable display & dsi nodes
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>, robdclark@gmail.com,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 andersson@kernel.org, dianders@chromium.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, daniel@ffwll.ch, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 5 Dec 2022 at 17:44, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 05/12/2022 18:37, Robert Foss wrote:
> > Enable the display subsystem and the dsi0 output for
> > the sm8350-hdk board.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > index e6deb08c6da0..39462c659c58 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > @@ -213,10 +213,32 @@ &cdsp {
> >       firmware-name = "qcom/sm8350/cdsp.mbn";
> >   };
> >
> > +&dispcc {
> > +     status = "okay";
> > +};
> > +
> > +&dsi0 {
>
> Bjorn suggested using mdss_dsi0 / mdss_dsi0_phy labels for DSI host and
> PHY, as it allows us to group them nicely. WDYT?

Sounds quite reasonable, fixing it in dts/dtsi/binding.

>
> > +     vdda-supply = <&vreg_l6b_1p2>;
> > +     status = "okay";
> > +};
> > +
> > +&dsi0_phy  {
> > +     vdds-supply = <&vreg_l5b_0p88>;
> > +     status = "okay";
> > +};
> > +
> >   &gpi_dma1 {
> >       status = "okay";
> >   };
> >
> > +&mdss {
> > +     status = "okay";
> > +};
> > +
> > +&mdss_mdp {
> > +     status = "okay";
> > +};
> > +
> >   &mpss {
> >       status = "okay";
> >       firmware-name = "qcom/sm8350/modem.mbn";
>
> --
> With best wishes
> Dmitry
>

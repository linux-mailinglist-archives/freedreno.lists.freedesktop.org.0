Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A436F7175
	for <lists+freedreno@lfdr.de>; Thu,  4 May 2023 19:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D274010E133;
	Thu,  4 May 2023 17:47:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECED10E133
 for <freedreno@lists.freedesktop.org>; Thu,  4 May 2023 17:47:56 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-b9e66ce80acso1123619276.3
 for <freedreno@lists.freedesktop.org>; Thu, 04 May 2023 10:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683222475; x=1685814475;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WmLmZ4NUVex/zW0VW9PZGBLrRjf+L442SsHdQx/ScHI=;
 b=Awgu6kTDO+Fv6jxwGDnu9W+EJCev1TpOimWLGD+Pg7dd6DaHLEE5V0tikC6sDyJrOk
 L5tRxzBQTklw2ag6srHzeuSxoB++mkJpzfvOdWKVzNXtstMVHdAMtbHG3ibgvxjX6COO
 I8siMPKWd213IqMlXZJ4Lz0jHYYnqPh4gkD3j0Wj/PfFVGhNb7+t8rQgyjovOIXLoasF
 e9WW93Y3+ka9f93qEjRoF7jpfFRkOWbqCYYa0upgz/K9gUDjw+wkvspEUyYP8mz1zFLr
 8y8SKAW88JBQ86QjSv5l32swub/pOrx5+fUFhQ4wrZABNBn61JmfmCy/RwzZOB+cPfMa
 +1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683222475; x=1685814475;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WmLmZ4NUVex/zW0VW9PZGBLrRjf+L442SsHdQx/ScHI=;
 b=Do5AYVmHTIUg/RtE6kEvSHB57WZZ99xh/OXMC86Af54zLH8ZANcz4xPuO8cMPaPhkY
 ZQnpsGhFOGL3vIH62UYF6GJLOfC6snMewl9TOe3w14vy9400eSTwej2XSFa3E6kDpcs/
 gjacS0Epv9tsequ4MS2NJmWfbedxF0Q5yimtPHpfRYRTelUw67FqhwjNJnCRDFI/vxJh
 DxbxAXkRy7rNalj57Bo/T34Jl1y2jTw5dGEAn9y97WmWVSSeSJlHkO9jOvtdmrw4vVRJ
 Iq95L1eEUOwuYU4T0aIcx/n8fXmRHaF6M7x/eeRHarMRNYSwwLAJ3X0op8zWxBG79v2h
 DTbQ==
X-Gm-Message-State: AC+VfDydhaFGOfOrdMAdwGrIHPFCqcHynNws4jeQvYuwECPKOF4V0rSg
 iAWkHe/sMlWkO9BsmjM2Ca6RuimVgSxkKg4xeO8sRQ==
X-Google-Smtp-Source: ACHHUZ4lMg2po+V05CT8e0bF8hKQDOZIyB47SunDrlnkIDMwwPwiH9jVZE0FSxqr7Sd1z2NXBt4lzVZS74b8ghqvt6Y=
X-Received: by 2002:a25:4088:0:b0:b9a:7df5:4f1f with SMTP id
 n130-20020a254088000000b00b9a7df54f1fmr822189yba.37.1683222475562; Thu, 04
 May 2023 10:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230504160430.4014206-1-dmitry.baryshkov@linaro.org>
 <723f23b2-c4d8-d688-b261-4198537eefe4@linaro.org>
In-Reply-To: <723f23b2-c4d8-d688-b261-4198537eefe4@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 May 2023 20:47:44 +0300
Message-ID: <CAA8EJpoHBtxMg559WdG+G=+BEJPiVo4agGEfxCORjWDwMTC5Ow@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] arm64: dts: qcom: enable dual ("bonded")
 DSI mode for DB845c
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 4 May 2023 at 20:11, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4.05.2023 18:04, Dmitry Baryshkov wrote:
> > Now as both lt9611 and drm/msm drivers were updated to handle the 4k
> > modes over DSI, enable "bonded" DSI mode on DB845c. This way the board
> > utilizes both DSI links and thus can support 4k on the HDMI output.
> >
> > Cc: Amit Pundir <amit.pundir@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Konrad
> >  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 36 ++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > index e14fe9bbb386..4dea2c04b22f 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> > @@ -419,6 +419,9 @@ &dsi0 {
> >       status = "okay";
> P.S. wanna move status last by chance?

Not within this patch, it is not relevant to bonded DSI mode.

>
> Konrad
> >       vdda-supply = <&vreg_l26a_1p2>;
> >
> > +     qcom,dual-dsi-mode;
> > +     qcom,master-dsi;
> > +
> >       ports {
> >               port@1 {
> >                       endpoint {
> > @@ -434,6 +437,31 @@ &dsi0_phy {
> >       vdds-supply = <&vreg_l1a_0p875>;
> >  };
> >
> > +&dsi1 {
> > +     vdda-supply = <&vreg_l26a_1p2>;
> > +
> > +     qcom,dual-dsi-mode;
> > +
> > +     /* DSI1 is slave, so use DSI0 clocks */
> > +     assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> > +
> > +     status = "okay";
> > +
> > +     ports {
> > +             port@1 {
> > +                     endpoint {
> > +                             remote-endpoint = <&lt9611_b>;
> > +                             data-lanes = <0 1 2 3>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&dsi1_phy {
> > +     vdds-supply = <&vreg_l1a_0p875>;
> > +     status = "okay";
> > +};
> > +
> >  &gcc {
> >       protected-clocks = <GCC_QSPI_CORE_CLK>,
> >                          <GCC_QSPI_CORE_CLK_SRC>,
> > @@ -493,6 +521,14 @@ lt9611_a: endpoint {
> >                               };
> >                       };
> >
> > +                     port@1 {
> > +                             reg = <1>;
> > +
> > +                             lt9611_b: endpoint {
> > +                                     remote-endpoint = <&dsi1_out>;
> > +                             };
> > +                     };
> > +
> >                       port@2 {
> >                               reg = <2>;
> >



-- 
With best wishes
Dmitry

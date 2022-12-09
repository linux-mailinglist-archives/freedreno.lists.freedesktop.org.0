Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0666481BC
	for <lists+freedreno@lfdr.de>; Fri,  9 Dec 2022 12:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CA310E524;
	Fri,  9 Dec 2022 11:30:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7534610E521
 for <freedreno@lists.freedesktop.org>; Fri,  9 Dec 2022 11:30:17 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-3b48b139b46so47768507b3.12
 for <freedreno@lists.freedesktop.org>; Fri, 09 Dec 2022 03:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MjK0sQNHkAnOyNoLULfLFC8tBks0VDS2+NJ4Yo442sA=;
 b=AfRGQFHE/4QABp88WIfbgyfDOy81cfakm17TWf4F5AZL2sftwRWRi4Lw8wdfsJhsF3
 Y7mvb184t/fForLJn9H4L30W4vGAdc1fvQk1YT8e/fsDDvqK6BPEzt9vIWoW4xLTJ1Sw
 ZEkV3zIA5IhMlYnmP4JqG0FBq8VX+S+ik/Tt9nKw5zzKB+tlYDBxAcApE6tfkoJVO69X
 LLqFzyoEeXimzaNT/pDC/c+oR8nmUxjvdX9ynIITarYmjtFbIFpgDlmKR0r1O7OxuqGD
 Vzpiivqk31devP9yFcv5nS0EIae97Jm6xS+ZZKzZ1Tq68Qk3vGm+2RoBEoGO90972p/f
 H0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MjK0sQNHkAnOyNoLULfLFC8tBks0VDS2+NJ4Yo442sA=;
 b=ShF1vi9qajAdmZHREvdAT0jeOErVh9elq2q38BcNRfMH6mPgMIE62eDYcBAP9+ZBey
 +LKbkRujNjurYyVz3a/z5nk+LXn9UFJgb3CyMH9eo5BiqCcoop5CwYyjxol5xPkh85We
 iqjl17k1gMUcL6zt6kZZVw3U6uj6pq3Wxrg/ETqREuVyS5xsJqhsPnPbVo4TOtRlWl44
 8GyYLmDPRCVwNbhAgHt+owRG4NSNM5Ln+VOaBc05Gr7z8OjCD+9/RS3tdsuy0Cdp3L0U
 RNxk0+foA/c3th0Znp9BlTSJ3+7Yr62z6Q20kAYFpe27W4Q7bU5Z6ODa468UmL1Rk2oD
 3+ZQ==
X-Gm-Message-State: ANoB5plF62uodtRpu5wDPhy1IEFaHb7jRKnPTjZmhxj234mzq99h9UUD
 no+UQ1Kon3reJwajz0VpxQPzlCa7aTMOMeR/QV9CiA==
X-Google-Smtp-Source: AA0mqf7pP+1F8DEdZRZp5BrYvfzyUJzKOuvAkltgXILih6wgXJxMU+qZ+fTFB9kxIvC7pN/xfkx/C4gAsxyb+DTEbmc=
X-Received: by 2002:a0d:db15:0:b0:3d6:2151:4038 with SMTP id
 d21-20020a0ddb15000000b003d621514038mr36253472ywe.418.1670585416427; Fri, 09
 Dec 2022 03:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-12-quic_bjorande@quicinc.com>
In-Reply-To: <20221207220012.16529-12-quic_bjorande@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Dec 2022 13:30:05 +0200
Message-ID: <CAA8EJpp8oSW=yEi_QvL1PzF5yhfHsbC7WLD8Lic1R5A_o0i9SA@mail.gmail.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 11/12] arm64: dts: qcom: sc8280xp-crd:
 Enable EDP
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 8 Dec 2022 at 00:00, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> The SC8280XP CRD has a EDP display on MDSS0 DP3, enable relevant nodes
> and link it together with the backlight control.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>
> Changes since v4:
> - None
>
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 72 ++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index f09810e3d956..a7d2384cbbe8 100644

[skipped]

> @@ -230,6 +246,54 @@ vreg_l9d: ldo9 {
>         };
>  };
>
> +&dispcc0 {
> +       status = "okay";
> +};
> +
> +&mdss0 {
> +       status = "okay";
> +};
> +
> +&mdss0_dp3 {
> +       compatible = "qcom,sc8280xp-edp";
> +       status = "okay";
> +
> +       data-lanes = <0 1 2 3>;

I hope to land Kuogee patches that move data-lanes to the endpoint
node, where they belong. Do we have any good way to proceed here?
Or would it be easier to land this patch as is and then, maybe next
cycle, move the property?

> +
> +       aux-bus {
> +               panel {
> +                       compatible = "edp-panel";
> +                       power-supply = <&vreg_edp_3p3>;
> +
> +                       backlight = <&backlight>;
> +
> +                       ports {
> +                               port {
> +                                       edp_panel_in: endpoint {
> +                                               remote-endpoint = <&mdss0_dp3_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
> +       ports {
> +               port@1 {
> +                       reg = <1>;
> +                       mdss0_dp3_out: endpoint {
> +                               remote-endpoint = <&edp_panel_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +&mdss0_dp3_phy {
> +       status = "okay";
> +
> +       vdda-phy-supply = <&vreg_l6b>;
> +       vdda-pll-supply = <&vreg_l3b>;
> +};
> +
>  &pcie2a {
>         perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
>         wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> @@ -496,6 +560,12 @@ hastings_reg_en: hastings-reg-en-state {
>  &tlmm {
>         gpio-reserved-ranges = <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
>
> +       edp_reg_en: edp-reg-en-state {
> +               pins = "gpio25";
> +               function = "gpio";
> +               output-enable;
> +       };
> +
>         kybd_default: kybd-default-state {
>                 disable-pins {
>                         pins = "gpio102";
> --
> 2.37.3
>


-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F6485ED61
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 00:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B4310E021;
	Wed, 21 Feb 2024 23:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B7wwDdKP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EE910E021
 for <freedreno@lists.freedesktop.org>; Wed, 21 Feb 2024 23:50:24 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so5375120276.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Feb 2024 15:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708559423; x=1709164223; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/XpZt7hzwc3jNcQDwZUZ5vMVTQ3xQ4U9NKZbGKi742g=;
 b=B7wwDdKP4mj/bhWrSY+HxFpjgC5q0SbnDkLi2WXoZ2IplJcNsoXvcIVRMbTlXJpSjC
 Zi9D0UsUfNzhPMHbMKmSF1UDNVTp2p5IBplZJszw8lUV70G8JHIuJOI4LyL6zYd0E1GR
 RB+nOsypVh9r3OSrQUE04xEov58joDwUbDCcydjk1MoKZzNx/rV+XPanMwUxI96Vs+qg
 mqHesYnaXBCHAMlghxaq7OhiWAhOhMVY35NW/UOlmGidYI42yiwZfmNImALe06iCpTC4
 gaGMOM36H+rOnxg6uymVA0YC3XP3t4vHTkUvz00eHJVLx6Hh5lKz4I8809zNnocVs1oJ
 ja2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708559423; x=1709164223;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/XpZt7hzwc3jNcQDwZUZ5vMVTQ3xQ4U9NKZbGKi742g=;
 b=gmtQ70fA7FzW+xKZvbzTES05h23gMMBHItiZoxVxhRiIDo38snwg4rIx8cM7npb2Ac
 hCk0htGO3G4GLeTbF5CX9c66mIlPq3LBfLnqe03t9kQQ3DCsIxEpeigQfwi64DIjdYtk
 vOykKBTxG5WK3LbcjL5Z98iP0ILvfacdPKWuhua1Q2i15p4zrC/2PqyR0lR4EOTiUGyx
 ZNouE0xD8qjTBr7tWA5jlBWZ2WH1eA+pNYFDLLueZhkquJCj0Tbo1xRcCdQizc/aQbYE
 6G2LkjPOp1K7IiZhHisM9ED+SEQOxGy0EMk4eN7iBF1NGPuyGkY0x50RXh5oDgQT/Ou1
 2f7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQROgve/GNlLC/CnTWPkCTviEefgF55ZjNazA2N1ahCPwE9304y/HVd0Iqow7KBeLirQsGCPGPi1/Yrb6MhAYBkKj4RXRDMVuengE2+jxi
X-Gm-Message-State: AOJu0YzuHmDT4SfMdYpJJgCKdDj2DPfnMHmRuFQ2CYNhn0QYnykyuKj1
 CG7FWpPva9QPayJUYAB4abePytuey+H+Rqap1YgewoXvi4GnsU32qHyvoX2DiMJLa+1nrDR5+0/
 JK7FMiampsMPn0dh74hdordIsnCcaPFxlZsVjzg==
X-Google-Smtp-Source: AGHT+IGFCpzYN9Tvhba/FP/G+LXkXROeoh+7TE5DeZAwGefezlUG4taS3kLJsE2C4lj2w55Q3QXgdigZ/ja3jgLbmO0=
X-Received: by 2002:a05:6902:220f:b0:dc7:48f8:ce2e with SMTP id
 dm15-20020a056902220f00b00dc748f8ce2emr1016956ybb.37.1708559423600; Wed, 21
 Feb 2024 15:50:23 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-6-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-6-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:50:12 +0200
Message-ID: <CAA8EJppAVehWUeLAqEAq8A3nq-o2g=8GK--XRVWtDV7-0BCskA@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB role
 switching
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> With the ADSP remoteproc loaded pmic_glink can be introduced and wired
> up to provide role and orientation switching signals.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 48 +++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index ab498494caea..079bf43b14cc 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -121,6 +121,41 @@ debug_vm_mem: debug-vm@d0600000 {
>                 };
>         };
>
> +       pmic-glink {
> +               compatible = "qcom,qcm6490-pmic-glink", "qcom,pmic-glink";
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               connector@0 {
> +                       compatible = "usb-c-connector";
> +                       reg = <0>;
> +                       power-role = "dual";
> +                       data-role = "dual";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +
> +                                       pmic_glink_hs_in: endpoint {
> +                                               remote-endpoint = <&usb_1_dwc3_hs>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +
> +                                       pmic_glink_ss_in: endpoint {
> +                                               remote-endpoint = <&usb_1_dwc3_ss>;

This should be connected to the QMP PHY rather than to the USB host.

Also it might be better to squash this patch with the patch 8. Or at
least to get redriver into the picture in this patch (and keep only
display-related parts in that patch).


> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
>         vph_pwr: vph-pwr-regulator {
>                 compatible = "regulator-fixed";
>                 regulator-name = "vph_pwr";
> @@ -476,7 +511,16 @@ &usb_1 {
>  };
>
>  &usb_1_dwc3 {
> -       dr_mode = "peripheral";
> +       dr_mode = "otg";
> +       usb-role-switch;
> +};
> +
> +&usb_1_dwc3_hs {
> +       remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_dwc3_ss {
> +       remote-endpoint = <&pmic_glink_ss_in>;
>  };
>
>  &usb_1_hsphy {
> @@ -491,6 +535,8 @@ &usb_1_qmpphy {
>         vdda-phy-supply = <&vreg_l6b_1p2>;
>         vdda-pll-supply = <&vreg_l1b_0p912>;
>
> +       orientation-switch;
> +
>         status = "okay";
>  };
>
>
> --
> 2.25.1
>


--
With best wishes
Dmitry

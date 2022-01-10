Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F23AF489B0B
	for <lists+freedreno@lfdr.de>; Mon, 10 Jan 2022 15:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861411132A3;
	Mon, 10 Jan 2022 14:06:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB08E1133FD
 for <freedreno@lists.freedesktop.org>; Mon, 10 Jan 2022 14:06:17 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id iw1so3211394qvb.1
 for <freedreno@lists.freedesktop.org>; Mon, 10 Jan 2022 06:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sjf5HXREYSAp8OzfvPdpCVvaNZb3bh0YsVohsQS8etE=;
 b=Ef1tKo1+J/Pet0Mz0h5QNoIi6PvtQ+1+fWb0HQUGQ4lEAMNbjcxRvAEU3DxMArWK9y
 fzau/FkT+YZtL0NHiYwukbV7vep7KYQtQ4BzdaCtfR4qn6ShDwpYmA8mea77jpxkrlBu
 bbSvxS851BIDcDBjpoecYmxSFv7n9EJdFi4oXDEI9dFknbedSu4LOF8MavDY5mI9i2CP
 MVk8+Thbh2tM7WVZfSAwuG3LvWekXxBwssJ9IOI6kA4fd/xxAtbKHR21uu907zNSoQdV
 SMeNnFppKyL4P/k3unU9iY9xzYsL0yH9od0CZztIF+oOKy38slsCiKUnvKfYYwH22n3a
 WoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sjf5HXREYSAp8OzfvPdpCVvaNZb3bh0YsVohsQS8etE=;
 b=AXlLzHZyAquAnm5+sVSKXoyhZSomM7ohHGVuuXvixsGshX21SaMsU4U+RpOB47Lzrr
 i+UaIseuUCeK8fLV/JRBRMJPZsW0EptSivqGH5mUNJDHyl7Wk9PCKHCkCopubM6pnLoS
 SoqRAX9I+8V4NyQ2lykho9hqWkHUWUQ0xMvNhyGuPJuI4oGe4Gc62DYsqPLPU9xe5GQA
 KtMQjBj7OR2WtOw+Fkw19sdzO6qWoDlkcaik5sC/M/Xn/HPss/Gk11PYx4k8v/MMiOuA
 3YdgA8stg2ZJ55TDXqPjWlqoBONSIu10PZR2B1i01zEnPbEAU37dVI1lyZyj0lNbBwFI
 hjrQ==
X-Gm-Message-State: AOAM531l3+6bG2WJHRm2wvw+h7up9q9y1hL28O6AiFKReE5j4Mal1ymE
 GKmiNVWTPtP1mIs4pxZiNSPCbkFzVSINjbeKBFiuEg==
X-Google-Smtp-Source: ABdhPJx8iuBfCaDUP7d8M8nzd/iM43KRhC+lgLYLRyHPh8qfwLit/VE9Y1WQXgB0+afvUXwpQfzD7BGkAXGOVEotGy0=
X-Received: by 2002:a05:6214:248a:: with SMTP id
 gi10mr67627781qvb.115.1641823576863; 
 Mon, 10 Jan 2022 06:06:16 -0800 (PST)
MIME-Version: 1.0
References: <1641819337-17037-1-git-send-email-quic_rajeevny@quicinc.com>
 <1641819337-17037-2-git-send-email-quic_rajeevny@quicinc.com>
In-Reply-To: <1641819337-17037-2-git-send-email-quic_rajeevny@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 Jan 2022 17:06:03 +0300
Message-ID: <CAA8EJprrRZK+ocW9zDY_eyeo_m_xbu+KmfWf8QmTYscAh5SxLw@mail.gmail.com>
To: Rajeev Nandan <quic_rajeevny@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [v2 1/3] dt-bindings: msm/dsi: Add 10nm dsi phy
 tuning properties
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
Cc: quic_kalyant@quicinc.com, freedreno@lists.freedesktop.org,
 jonathan@marek.ca, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 robdclark@gmail.com, robh+dt@kernel.org, quic_mkrishn@quicinc.com,
 daniel@ffwll.ch, swboyd@chromium.org, sean@poorly.run, robh@kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 10 Jan 2022 at 15:56, Rajeev Nandan <quic_rajeevny@quicinc.com> wro=
te:
>
> In most cases, the default values of DSI PHY tuning registers should be
> sufficient as they are fully optimized. However, in some cases where
> extreme board parasitics cause the eye shape to degrade, the override
> bits can be used to improve the signal quality.
>
> The general guidelines for DSI PHY tuning include:
> - High and moderate data rates may benefit from the drive strength and
>   drive level tuning.
> - Drive strength tuning will affect the output impedance and may be used
>   for matching optimization.
> - Drive level tuning will affect the output levels without affecting the
>   impedance.
>
> The clock and data lanes have a calibration circuitry feature. The drive
> strength tuning can be done by adjusting rescode offset for hstop/hsbot,
> and the drive level tuning can be done by adjusting the LDO output level
> for the HSTX drive.
>
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> ---
>
> Changes in v2:
>  - More details in the commit text (Stephen Boyd)
>  - Use human understandable values (Stephen Boyd, Dmitry Baryshkov)
>  - Do not take values that are going to be unused (Dmitry Baryshkov)
>
>  .../bindings/display/msm/dsi-phy-10nm.yaml         | 33 ++++++++++++++++=
++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.y=
aml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> index 4399715..d0eb8f6 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -35,6 +35,35 @@ properties:
>        Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
>        connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target

Generic note:
I think these properties should be prefixed with "qcom," prefix.

>
> +  phy-rescode-offset-top:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 5
> +    maxItems: 5
> +    description:
> +      Integer array of offset for pull-up legs rescode for all five lane=
s.
> +      To offset the drive strength from the calibrated value in an incre=
asing
> +      or decreasing manner, use 6 bit two=E2=80=99s complement values.

dtc should support negative values, google hints that <(-2)> should work.

> +
> +  phy-rescode-offset-bot:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 5
> +    maxItems: 5
> +    description:
> +      Integer array of offset for pull-down legs rescode for all five la=
nes.
> +      To offset the drive strength from the calibrated value in an incre=
asing
> +      or decreasing manner, use 6 bit two=E2=80=99s complement values.
> +
> +  phy-drive-ldo-level:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    minimum: 0
> +    maximum: 7
> +    description:
> +      The PHY LDO has an amplitude tuning feature to adjust the LDO outp=
ut
> +      for the HSTX drive. To offset the drive level from the default val=
ue,
> +      supported levels are with the following mapping:
> +      0 =3D 375mV, 1 =3D 400mV, 2 =3D 425mV, 3 =3D 450mV, 4 =3D 475mV, 5=
 =3D 500mV,
> +      6 =3D 500mV, 7 =3D 500mV

No encoding please. Specify the values in the dts and convert them
into the register values in the driver.

> +
>  required:
>    - compatible
>    - reg
> @@ -64,5 +93,9 @@ examples:
>           clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
>                    <&rpmhcc RPMH_CXO_CLK>;
>           clock-names =3D "iface", "ref";
> +
> +         phy-resocde-offset-top =3D /bits/ 8 <0x0 0x0 0x0 0x0 0x0>;
> +         phy-rescode-offset-bot =3D /bits/ 8 <0x0 0x0 0x0 0x0 0x0>;
> +         phy-drive-ldo-level =3D /bits/ 8 <1>;

--
With best wishes
Dmitry

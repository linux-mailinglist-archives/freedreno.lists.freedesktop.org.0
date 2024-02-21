Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699C385ED56
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 00:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9BF10E83F;
	Wed, 21 Feb 2024 23:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="US6xrc9c";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A57D10E83F
 for <freedreno@lists.freedesktop.org>; Wed, 21 Feb 2024 23:46:31 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dcbf82cdf05so1372266276.2
 for <freedreno@lists.freedesktop.org>; Wed, 21 Feb 2024 15:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708559190; x=1709163990; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9dEH93zhYBQD4O+y/ZdH1upWZUpwf2rY+NjXG87KgkY=;
 b=US6xrc9cq6oluBEDb89nG4h8ewcEU1dv1lyfimV8+i4gpUFBveAUFUjLHE540CS2to
 zdB1k2PlpoLbLGjc1lJZFWoISbNmXQC4vozmgHsfTNkYT+swGDpw49TCVlHoHQO3soPE
 UpsylE9VGPayu0o/Kgf2BDTXISymvA5OcATymwpsEHDpGER1wAcGHPoYYGqoXWBTrR5o
 IuNUV70x1K2MoSI2JKqmf9fs/CJlSx4M3Udln83o0kp3vWewBagHCcPVNAxfdkxrwHkV
 N22sA7Tewq7cmknZ5stFfLXXQUsOaiCySJ5cRNZjtqIhOK7Qw1rRvAeNWUXWe2m+RjgH
 hsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708559190; x=1709163990;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9dEH93zhYBQD4O+y/ZdH1upWZUpwf2rY+NjXG87KgkY=;
 b=agBAKfaRnJjk2sz43VCHRJjAH/7ybbXwk8bvjGD9PR44C9MhKkGp5tbSds/YZ9uuvI
 082A6Ns7uzW2a1I8GTJ+MJpcchgtvCNTGH9t3kjf2vIOdtTGOKgpe0gmDTLyHa7NPY0M
 XOrIlkSiftNFBkPkOmWxt/3llwX/RObiJPlLQW6ThoiW0bsRmsKC55Mcw+bOsxdkWMDh
 lX2E/e4CBDal0eH+OvjojYO2+pMeHEOWEm/pUokW2p+Xr6ZGBQe2DuGXAVK/mczfq3VD
 BIrzmTw9OaX6qAEZEHbuB4P0RvOE/unhgFa3ViPqR+CWPCBnZbcVrIay4AfAlrr05tn5
 O3cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9LXL71WT3IuivWbTWUoOepEoRm8UDzIFzaN+QokkHvONuFmo0vruMf3Jj6F/qUL+xzlU+pOs6DB3bvoGPLpK2za5WJN3vtbxrHXUOmtZf
X-Gm-Message-State: AOJu0Yz2lrXLF13CXs4RZMYwTyljW4JadkW1e8Rpotz53eUMc7W+BNrh
 w0h+E01MT4NADX4snDv3hX/S2qR27X9G18omPscGETb25KXhRbr6VNUOV21A+WxrogWs1DxCo9t
 dJsC+TVpMa+5E+W2g0+kyGR3We3D7NJ0pgPYF+Q==
X-Google-Smtp-Source: AGHT+IGT+kCZVUVphawG3vyzsnULQGNfcmUnmQnWaJ9LkQcRZTA/qLxPQfQPfUp2YntsI2O5+i9NAL76Naaxfiuwc7Y=
X-Received: by 2002:a05:6902:2412:b0:dcc:245b:690e with SMTP id
 dr18-20020a056902241200b00dcc245b690emr1138030ybb.40.1708559190364; Wed, 21
 Feb 2024 15:46:30 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-4-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-4-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:46:19 +0200
Message-ID: <CAA8EJppeStVB4Fn9Abh5hae6UBT871r9OrdCSux-YBwUOGAN3A@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: qcom: qcs6490-rb3gen2: Add DP output
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
> The RB3Gen2 board comes with a mini DP connector, describe this, enable
> MDSS, DP controller and the PHY that drives this.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index ac4579119d3b..32313f47602a 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -430,6 +430,23 @@ &gcc {
>                            <GCC_WPSS_RSCP_CLK>;
>  };
>
> +&mdss {
> +       status = "okay";
> +};
> +
> +&mdss_edp {
> +       status = "okay";
> +};
> +
> +&mdss_edp_out {
> +       data-lanes = <0 1 2 3>;
> +       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};

Please add a corresponding dp-connector device and link it to the mdss_edp_out.

> +
> +&mdss_edp_phy {
> +       status = "okay";
> +};
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
> @@ -470,3 +487,9 @@ &usb_1_qmpphy {
>  &wifi {
>         memory-region = <&wlan_fw_mem>;
>  };
> +
> +/* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
> +
> +&edp_hot_plug_det {
> +       bias-disable;
> +};
>
> --
> 2.25.1
>


--
With best wishes
Dmitry

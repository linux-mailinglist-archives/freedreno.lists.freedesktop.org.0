Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B8185ED2B
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 00:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7065210E011;
	Wed, 21 Feb 2024 23:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bl7STJCg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4063510E011
 for <freedreno@lists.freedesktop.org>; Wed, 21 Feb 2024 23:41:23 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc6d9a8815fso7149943276.3
 for <freedreno@lists.freedesktop.org>; Wed, 21 Feb 2024 15:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708558882; x=1709163682; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gum7JHLE82lB2obWuKI41M7h3ZETASXy1kYfBRSiY+0=;
 b=bl7STJCg8iKtSNlIWYYvbpcjvv7zYgVnEuq+guHUoVL9UEOAWZo1MxMngQ9ylumVZO
 alVQ5c51dqTEbigftqU1fAFI2et+iuLUAaoi6BHZKjsvJQGNvLMV7yW21n574rXS+mA7
 OlLJEjyTDyZ2JszCZBBEndE9v8R5qgYfPbqcFZiMqXkY4UmiBdpF+QxafO9MlvdwP+Su
 4Gr7S24cAt1dNAQvRQeJDD7W5GBaVddNT3bWj8gkyzl227vo8uEhYCstX1/9qmizW1zA
 I6hnNzjB08w8R/G3n7mZkvFrlpIpJ8FcSDkww3etnSWi43mEyKJLKeQO699x11uVvNwk
 HWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708558882; x=1709163682;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gum7JHLE82lB2obWuKI41M7h3ZETASXy1kYfBRSiY+0=;
 b=YsERY/WuhNZ/eZSZmWQqknsNGYUswo0BL6JJMpa/5jdoQbMo1h2T7FCzsxRLS074o/
 XIwtYdfU/JVAgxti3rqbT9tdcGG85fdVcA7wfXzKwJKp8AD+xkJa1dbXsJ1TAPiyAhfn
 wKm04KLR1UOSyTaLgFPVnphKMOrwkJIa7NUZQO4aRjz8Azd9ZSJZ4biGXOU4a9t3zQf0
 QoaPIvxUNitr/D8iyjOB4cwPWhn/T9FOJOjqhi4k7+6uTYvuNtLFOAvr4HOdpRQ2EamA
 US/KoYdYdHQ15MKAX5HErqxNYl36wLDyRGFcqcF9DbQPwnlbR3PWNCKtkzdRIWYHoY4q
 gieg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvLsui7k58iIjvOmxITjDf17ih+HvzleUue0NK6QifXVKu6b764acTHimodNDqonIRbgelYFaZXPD9OhhkcyUjsAoLTXffh++46RKBqXBo
X-Gm-Message-State: AOJu0YxHmEvNIcOVan1Fb3BHMpu5JUoqW623BfMzOstOR0h1Sj9UhZy3
 1VAmB+Vxbt370u526k5g9mpaJj/ne4PYgiCBuWD1O2yFAGRG8ee1b+wuKuS2Mlb27vNPvSzbilT
 1WPVZaFaYCctXg7NSNZBk+Q0czmWgFwzdMXO4Dg==
X-Google-Smtp-Source: AGHT+IEAyXZCJmUxworvOHx5M4iyWXoKGn83vXU9An74FKMewTDmsI1ABCTIrzsggAoLQPNkOHTcA/u8/Q2R45yYeFk=
X-Received: by 2002:a25:48c8:0:b0:dcc:f8e5:c8c8 with SMTP id
 v191-20020a2548c8000000b00dccf8e5c8c8mr763050yba.45.1708558882169; Wed, 21
 Feb 2024 15:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:41:11 +0200
Message-ID: <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>
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
> The max frequency listed in the DPU opp-table is 506MHz, this is not
> sufficient to drive a 4k@60 display, resulting in constant underrun.
>
> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
> fix this.

I think we might want to keep this disabled for ChromeOS devices. Doug?

>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index a19c278ebec9..a2a6717c6c87 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4417,6 +4417,11 @@ opp-506666667 {
>                                                 opp-hz = /bits/ 64 <506666667>;
>                                                 required-opps = <&rpmhpd_opp_nom>;
>                                         };
> +
> +                                       opp-608000000 {
> +                                               opp-hz = /bits/ 64 <608000000>;
> +                                               required-opps = <&rpmhpd_opp_turbo>;
> +                                       };
>                                 };
>                         };
>
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry

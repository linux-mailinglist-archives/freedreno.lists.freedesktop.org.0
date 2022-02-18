Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7E34BAF05
	for <lists+freedreno@lfdr.de>; Fri, 18 Feb 2022 02:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A4810E9C8;
	Fri, 18 Feb 2022 01:10:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A76B10E9C8
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 01:10:21 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id e5so2417261lfr.9
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 17:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YhNqz0TwV7gSLYgP9YWbRspB12calUNnn7qInjIWMb8=;
 b=kjaQXcd+qDo6HeXDPEWhbFh7itNDJeBgJ0jJRODQBOZ7hs979pzm2WflsUaeHt87yP
 QfxDMnIRoaJ7eDkvmb/yckwyk9YSdc1FaxiFI9ozai/ESqHRWGC3j6y8tn1v5Pwbp/xi
 y+HpVyyGh9scpSCcn61WSMOXHDjMnjoadxSfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YhNqz0TwV7gSLYgP9YWbRspB12calUNnn7qInjIWMb8=;
 b=emQeg848ZsRkyR9EQ4571GeHMEGgSkjNlKB6Vunaup9GBANYmmWupkAVIjS1dBXwFp
 BsEqdt71ilwtSvNMmd0gofMMOQRQLQLGlC9jkRpGsG7+DIGPZldbgEMKzwmMG61k2cLO
 p/mQDK8sSZSMNqR0EbGQ0KacypKOS54een9apSgLSC3q7WyoMpvO3/1iJA5KQh51DYJN
 Yu1Tp99h2IMpNL2NGCkENgidpgfDAVCU0cHOa46NU0igEHhNObUuu3+fpMTkCu/XQIlx
 bRxWJa9zwWpwriOp2xQ1+o+yEJtEMneiXRmiC3rWOb4FLnV7uOhH/CylwHZaL5JVORRd
 cGTA==
X-Gm-Message-State: AOAM530yzUqA6kR2/a5tEmGuzyWE0elXcj8UipLSe5qLP6LcW1ZSnKbJ
 qYKNfTRvc22w7DlK4FCQuEwR4omd+YfswYb85IU=
X-Google-Smtp-Source: ABdhPJynKxDNqsqmljpep0zL2+sSl+8rjDrdtHeyfeqhzCb38zkHm31nYbqNElOfDCojQLInF2fzbA==
X-Received: by 2002:ac2:4156:0:b0:442:ca4c:4969 with SMTP id
 c22-20020ac24156000000b00442ca4c4969mr3796487lfi.328.1645146619214; 
 Thu, 17 Feb 2022 17:10:19 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id c11sm102924lfm.32.2022.02.17.17.10.18
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 17:10:18 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id b9so2442956lfv.7
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 17:10:18 -0800 (PST)
X-Received: by 2002:a5d:64ef:0:b0:1e3:1e05:d042 with SMTP id
 g15-20020a5d64ef000000b001e31e05d042mr4049131wri.679.1645146213585; Thu, 17
 Feb 2022 17:03:33 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Feb 2022 17:03:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VVvcn1VpLXjd+X9Xe50sS_vY5ukKJE8i=eAZf1Phofuw@mail.gmail.com>
Message-ID: <CAD=FV=VVvcn1VpLXjd+X9Xe50sS_vY5ukKJE8i=eAZf1Phofuw@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 2/5] arm64: dts: qcom: sc7280: Add
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 quic_khsieh@quicinc.com, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, quic_mkrishn@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> +       backlight_3v3_regulator: backlight-3v3-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "backlight_3v3_regulator";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_bl_power>;
> +       };

So I'm pretty sure that this is wrong and what you had on a previous
patch was more correct. Specifically the PMIC's GPIO 7 truly _is_ an
enable pin for the backlight. In the schematics I see it's named as
"PMIC_EDP_BL_EN" and is essentially the same net as "EDP_BL_EN". This
is distinct from the backlight _regulator_ that is named VREG_EDP_BP.
I believe the VREG_EDP_BP is essentially sourced directly from
PPVAR_SYS. That's how it works on herobrine and I believe that CRD is
the same. You currently don't model ppvar_sys, but it's basically just
a variable-voltage rail that could be provided somewhat directly from
the battery or could be provided from Type C components. I believe
that the panel backlight is designed to handle this fairly wide
voltage range and it's done this way to get the best efficiency.

So personally I'd prefer if you do something like herobrine and model
PPVAR_SYS. Then the backlight can use ppvar_sys as its regulator and
you can go back to providing this as an "enable" pin for the
backlight.

I know, technically it doesn't _really_ matter, but it's nice to model
it more correctly.

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C23457CE62
	for <lists+freedreno@lfdr.de>; Thu, 21 Jul 2022 16:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC1C11A5C8;
	Thu, 21 Jul 2022 14:58:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B55911AF95
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 14:58:54 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ss3so3564734ejc.11
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ltOZJ2KphG0d0DW5kFxQw6cxwCf3XHhnrjNPEB6uAhM=;
 b=GqcHAHQ4dhPcrDRrtzT1QFXBo9SckIDkd5pucGoABBMli/cpoSkioJ6cvz4F17aKpk
 J1b8mXuerCqilCV36ldocszUddyXRxKShRGF06LQ8abRM+DPmjUznZz+quSoY9VeZO6V
 fALHQi/5OCjS8u//p5bgNNYY4BxK08ZdxexH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ltOZJ2KphG0d0DW5kFxQw6cxwCf3XHhnrjNPEB6uAhM=;
 b=CmL3h/QkrLDiq30jI9iYKXMhNT7fTISbemNyf2cCVuxoF7M9dieq7zfCO0jJSq1RNU
 n5FaoF5WwsZ+0ofxmssR0vqmS6QJznrLQBl2tF/XNm1ix64izdXUwsS8QOA8iMZISGhO
 rhTx8BkErzkMmtiI/F8PSRBw75YlVaLM8ek6B9TErNuKZM2PdvDZUtaF87bqM6+m1oCL
 nPBaIKPVNwfV4LeuFt0m1aB9nl6M6M5PpuMlcZ0AXaZBobwNiWyiE9lpLN/KebFkayJd
 RIcR5OiY7Waqtc4TiJQVEEUNiRUtpwZyMIF1mi9YCVY1wQKtfrlb3b4V7fV1ap7mNDug
 2M7g==
X-Gm-Message-State: AJIora94BOQ3DjTk9hV/hdj3HUbxgVmPHtD0VbbOcfw17qlvnArmEI59
 gZSmLLXsMASa7V6TUNeYixWcDaguz64VFpVCPmA=
X-Google-Smtp-Source: AGRyM1ssVz6Wsp4P3rfR1Noah0Ys6uHR67tanonolG+yVFaaFA1wfxLGhd2NZjG+a7RKciV3+Eocdw==
X-Received: by 2002:a17:907:7e94:b0:72b:53d2:c004 with SMTP id
 qb20-20020a1709077e9400b0072b53d2c004mr41663548ejc.387.1658415532559; 
 Thu, 21 Jul 2022 07:58:52 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 t16-20020a17090605d000b00726e51b6d7dsm921888ejt.195.2022.07.21.07.58.52
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 07:58:52 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id m16so2468377edb.11
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 07:58:52 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr35414211wrr.617.1658415135216; Thu, 21
 Jul 2022 07:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com> <Ytk2dxEC2n/ffNpD@sirena.org.uk>
 <CAD=FV=UQGXqVkew544f3RDtWb3virRHWiafBAxK3ncb5wmVYwQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UQGXqVkew544f3RDtWb3virRHWiafBAxK3ncb5wmVYwQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Jul 2022 07:52:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WuyKAwLwJ80uv15jBPO=W9F7FGZ4dAci+CncwF0WPfOw@mail.gmail.com>
Message-ID: <CAD=FV=WuyKAwLwJ80uv15jBPO=W9F7FGZ4dAci+CncwF0WPfOw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v16 0/3] eDP/DP Phy vdda realted function
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Johan Hovold <johan@kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 21, 2022 at 7:39 AM Doug Anderson <dianders@chromium.org> wrote:
>
> > You could add a way to specify constant base loads in DT on either a per
> > regulator or per consumer basis.
>
> Yes, this please! ...on a per consumer basis. :-) It's been on my
> wishlist for a while and would eliminate a massive amount of code /
> tables in the drivers.
>
> We could debate syntax, but I guess you'd either do it w/ two cells
>
> vdda-phy-supply = <&vdda_mipi_dsi0_1p2 21800>;
>
> ...or with matching properties:
>
> vdda-phy-supply = <&vdda_mipi_dsi0_1p2>;
> vdda-phy-supply-base-load = <21800>;

Ah, sorry to respond to my own thread so quickly, but I just thought
of a reason for the "matching properties" solution instead of the two
cells. It would allow the SoC "dtsi" file to specify a base load while
the board "dts" file can then specify the supply. That feels like it
could be a nice solution.

-Doug

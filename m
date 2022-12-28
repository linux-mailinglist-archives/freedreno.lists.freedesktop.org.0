Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C963D6573E9
	for <lists+freedreno@lfdr.de>; Wed, 28 Dec 2022 09:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B8F10E37F;
	Wed, 28 Dec 2022 08:26:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCAD10E37D
 for <freedreno@lists.freedesktop.org>; Wed, 28 Dec 2022 08:26:54 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1442977d77dso17926149fac.6
 for <freedreno@lists.freedesktop.org>; Wed, 28 Dec 2022 00:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1Z9/PqGQwTjm38REEONxEQHatW3RqTg7g05P268BC1M=;
 b=nji85v022+wAGzmuUCmXUT7B5uYInWB2zkQn16q8fdGe7/NDlAMQUr5Cp2I9SaCEjj
 u5yD4380zCWtdDuPfOC8UZCmJ6L++mibjRQruP1ULO0tQJvhxgNb5Uu/N/e+62vZyALf
 Yuf5rkLMepoBBrL0JMSbuODZglCg/qcegi4vZE13eGKWxRgBLBbU2lnYCnpfonxmRvhY
 qH0XGE1LhursulJ0Ga0m1dEkKfrFwcC6iSmJrDhfNu+QgmNKdTSyccuBk1f/rUWiJbaO
 EkyKHYcNB+MP1iLxe2+Ut/Z49LyDteNB0PJQXprHM7fgb1L529pMts20yuxoEpSIodZz
 iu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Z9/PqGQwTjm38REEONxEQHatW3RqTg7g05P268BC1M=;
 b=ghO6RaVGvyDcCavFcQZbSZGSDOH9/guvA4xjJgGrKkOdr+Rk8Ry96G7jKVvJMt/iRy
 hALE/cuyKqyzgX6iliqlXrbHPnFELa5bls4c5KtClcMMEqrrCVkwJq9SU0we3dhprRph
 Cw2Nb6eN/nknMsqPbenlz2S6O97rvqhY0qaJIGufaYYa/Ys/vTUHY7YohArpRIcSbQQd
 m6wk1DAo7hm9KrPD1u2xoGaKAuYflpyXjSp3HW2C7rTXCL8vI7qHdLagwKl7p9ZlMATh
 FZkGDY85lJkWqd+MQyR4zi9dqYprMIlXPlJM31iUytJoNiOvr+jASJb7cXc4anbMxLrQ
 FXEw==
X-Gm-Message-State: AFqh2kqfZZXnBjJqlfRDzHGTVvV92T/W5DrQbzQkjetU9DuLmi4ZmjHU
 fXKgXy6X2BF6CGaqvgDoXn9jp2kTDNPj4qr7nOBlDw==
X-Google-Smtp-Source: AMrXdXvBQl9y5tcOiVIyN/zYA7iZvfKaDqF0akasn2AMX0NYxoPxxzLuE0yanG7HITqm7KzMeYSloUiGJcFvvJfwVNo=
X-Received: by 2002:a05:6870:d906:b0:13c:33d0:22e2 with SMTP id
 gq6-20020a056870d90600b0013c33d022e2mr1595918oab.14.1672216014029; Wed, 28
 Dec 2022 00:26:54 -0800 (PST)
MIME-Version: 1.0
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-12-robert.foss@linaro.org>
 <ed8c6ca2-e4e1-52f5-0858-8c774819dd73@linaro.org>
In-Reply-To: <ed8c6ca2-e4e1-52f5-0858-8c774819dd73@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 28 Dec 2022 09:26:43 +0100
Message-ID: <CAG3jFysSBF_bkeUu=0wWFh-2yBx1HBP=36AdsBKFew_0r1qApw@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 11/11] arm64: dts: qcom: sm8350-hdk:
 Enable lt9611uxc dsi-hdmi bridge
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
 vkoul@kernel.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 5 Dec 2022 at 17:47, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/12/2022 17:37, Robert Foss wrote:
> > The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.
> >
> > In order to toggle the board to enable the HDMI output,
> > switch #7 & #8 on the rightmost multi-switch package have
> > to be toggled to On.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
>
> Thank you for your patch. There is something to discuss/improve.
>
> > +
> >  &slpi {
> >       status = "okay";
> >       firmware-name = "qcom/sm8350/slpi.mbn";
> > @@ -544,4 +633,20 @@ usb_hub_enabled_state: usb-hub-enabled-state {
> >               drive-strength = <2>;
> >               output-low;
> >       };
> > +
> > +     lt9611_state: lt9611-state {
> > +             lt9611_rst_pin {
>
> No underscores in node names.

Ack

>
> > +                     pins = "gpio48";
> > +                     function = "normal";
> > +
> > +                     output-high;
> > +                     input-disable;
> > +             };
> > +
> > +             lt9611_irq_pin {
>
> Ditto

Ack

>
> > +                     pins = "gpio50";
> > +                     function = "gpio";
> > +                     bias-disable;
> > +             };
> > +     };
> >  };
>
> Best regards,
> Krzysztof
>

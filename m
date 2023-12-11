Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F303F80C511
	for <lists+freedreno@lfdr.de>; Mon, 11 Dec 2023 10:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7F110E384;
	Mon, 11 Dec 2023 09:45:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAD510E383
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 09:45:48 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5d77a1163faso32698107b3.0
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 01:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702287947; x=1702892747; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LpS2X863BqCbckfOeGv1uweVgiUEsH3nVqhMXbPH/Mk=;
 b=OmbPdSzcGDO37sJ/MdapfbjEuvvzhtTFfmiptTvSD4hxAWByykC6W4VPWqfzFIiK5H
 hdMjFaqcBGZwKV8OJLDd/DqDDXQJ2jUizps0bi/L+q3GCJeaq/Hi0XCYKyEcfnoxRnIt
 88pqKJ2UQgdgwU4paN0/iQyxzPwOe9IR2DOXuOiGyMuwW5Mhj3y6ghPOKhC97F3+6zyR
 GiVfXIA4v8Gar8MOJkWVabJg4zYgTIyzWbDHcNC/cMDH3I+aREpIXfbrzPFYe9pQYvIq
 diB7KSQ7SSYGus3vfpYXvHj4fBiPSB7hyDHSR05q3QOQcwZA/XtDnQmv8OkzK2dMmmx4
 E/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702287947; x=1702892747;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LpS2X863BqCbckfOeGv1uweVgiUEsH3nVqhMXbPH/Mk=;
 b=ZtuKEqnFf0oj9P6PO+VeIfL/DVhdyr7J93a7wXbamIiUm1pTD1+UDY4jEMSkQW6rRs
 AutGnR4KGtfweMKsOuFXkEo8qNcu3mDv/7KTZRivQKiESAL1qz9Ga8+/uX7YtpLZpL9z
 Za1Mb1/hIf2KAoDlMIVVD13UkcqC9j7ADLqwdeBLarcLDaD9Vcq8xsvoARpEGB2L4QVU
 JBeW1H9Zi/6eXl8CQflPXMo01gH/7SVm03v44A0OWBNZujvTL7t2GCmqCrFvXhC7WbCY
 9ULjV21BboXszgpfcZIyx4y2TME+KHunh7v/VnQl3pkZ3WmWqORD/tKupTzW2rMlmAxk
 igFg==
X-Gm-Message-State: AOJu0Yw3v8UU8C5ixAt4vRtttr80GwasAPaCF2Aq3lW1eVGtkteBPwkk
 CZs5OhrNBIQVPBH6HI3SaB4ruCyi92aDXkfOokCtOg==
X-Google-Smtp-Source: AGHT+IEdA2lchCkngKTLdWfeiqjIhis9dj4VJ2FHzG1FAryLDvngRcwgqBCjKabE9igBrprRTqwIRGCFN7ETgILY5SY=
X-Received: by 2002:a0d:e907:0:b0:5d8:9242:47ae with SMTP id
 s7-20020a0de907000000b005d8924247aemr2975958ywe.19.1702287947149; Mon, 11 Dec
 2023 01:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
 <20231209232132.3580045-5-dmitry.baryshkov@linaro.org>
 <92ae6379-5126-4a02-ad30-b5dd43d4d251@linaro.org>
In-Reply-To: <92ae6379-5126-4a02-ad30-b5dd43d4d251@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 11:45:36 +0200
Message-ID: <CAA8EJprf0WyE=HBo3Yuh13-m0HMKmH6L+-8xW8oDXWHZtoerjA@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: qcom: sm8150-hdk: enable HDMI output
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 at 11:31, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 10.12.2023 00:21, Dmitry Baryshkov wrote:
> > Add DSI outputs and link them to the onboard Lontium LT9611 DSI-to-HDMI
> > bridge, enabling HDMI output on this board. While adding the display
> > resources, also drop the headless ("amd,imageon") compat string from the
> > GPU node, since the board now has output.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> [...]
>
>
> > +
> > +     lt9611_irq_pin: lt9611-irq-state {
> > +             pins = "gpio9";
> > +             function = "gpio";
> > +             bias-disable;
> No drive-strength?

For the input pin with no bias? I'm not sure. And yes, it was c&p from RB3.

> Otherwise lokos good at a glance!


-- 
With best wishes
Dmitry

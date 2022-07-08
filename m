Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB856AFCC
	for <lists+freedreno@lfdr.de>; Fri,  8 Jul 2022 03:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24A910FBDB;
	Fri,  8 Jul 2022 01:35:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B96113470
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jul 2022 01:35:07 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id l81so25428495oif.9
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 18:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=4tZYB3D3ttRdFiiCtilAWtqL/vodIYjfkRV380LddxI=;
 b=YqVPs6OGlXv6Sp9KRjQ5n4cUkBmMpWL0Cum3EY3mTe97zngGmDmDYSmW0J1GN9juEx
 DIP0+w9C6lzRfLY/JYYPHaKvgvYpXpHoo2JrT18zzV0TxZRYwE+4s5AfRrjZ2RSU1fRn
 FIm0hCSULj6+zlot8yv7j9zYtwyLxR/lQp3AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=4tZYB3D3ttRdFiiCtilAWtqL/vodIYjfkRV380LddxI=;
 b=mGoscvKX7wnKerAHrRtG3q330enqisnRHuvrl099ra+OSQ0UYxX1Vp1QXVUaanNF8O
 PHwuQhsVimfPrjqho9dwXVXQMq9EVhXZlnW3PTD07c94br4vj1Xgir5vXgUsNp4+gnTO
 86Q8WhqA7YsN/DQLE38SeueHa+XQHfvbDtBIRiq2A3zHnzxiC770z6Z87D2MVLfl73qS
 zuHT8C40XvvIvnbosaNgkxTDY4gZSZ3K/z4vBM21IunL3iFP3Ei2pqotMAJSM/y6HFsC
 DTnOTgXuiVEuCXJJkMGhnKAWLgipdfkZjqsredx4/P/BBgfeN0NgdAr5Y0m+KWJHppJ2
 nqCw==
X-Gm-Message-State: AJIora/eRPNOn6tiZBSzPf5aY45YnIXGV5WWEYrlijF1ahvhzX3nGohX
 vNdh/1za5tQg+rizlwF3a8/JWNGc7YZPycD2MAHrWw==
X-Google-Smtp-Source: AGRyM1v9+37b3BeeGhgFxdk4ptbOOu4/0xrMKSGjTpNKD4WbRsi1W17nLbBPR/H8wQjqmzp2KhHDi/rTPjIzbMsTuvk=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr465809oil.193.1657244047137; Thu, 07 Jul
 2022 18:34:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:34:06 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-8-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-8-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 18:34:06 -0700
Message-ID: <CAE-0n52k+iCRwi2NUz_ur2zPTCY+WjAk+gDHtPoEytjKd610Qg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 7/9] arm64: dts: qcom: sc7180: drop
 #clock-cells from displayport-controller
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-07-07 14:32:02)
> Drop #clock-cells from DP device node. It is a leftover from the times
> before splitting the it into controller and PHY devices. Now clocks are

s/the it/the device/

> provided by the PHY, while the controller doesn't provide any clocks.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

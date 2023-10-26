Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C987D89CF
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 22:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DC510E8A5;
	Thu, 26 Oct 2023 20:47:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A794C10E8A5
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 20:47:39 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-d9c7bba32beso978689276.1
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 13:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698353259; x=1698958059; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jKSlzStaatEuvyuk4N2jzmzAhRhglEf2C7Yl+0Y/OSw=;
 b=lFwrxs1vpjCZBolB/Z60VCzFLOwEkEwF4NB8JcPD9Wo17JQ0NHa3Ih52LWWTRhqpQ1
 YOG5TlvzCc95KhikrIu365qklkt3hVXPnaHf5zD4BohmdYDaTpMPWTzSnLZV+Ka5wZce
 IlLE5HP3/DqcjeK9JflTClWOzgKIF+2Vo9ExsBfjiRj5wzNhTCq/DDZKVzqs6PQJ7TF8
 gQ9f6bQwccdCKa8CQZgRhAwsxMiWWF1864ihkrY+KhNqpFxb3deEMA5zHNdJA11ZKJ4Y
 OMYIaA2o7vruKa2XCFddfQ0Jw3gSqzmqPPlhvBR2q0ddUYsiJgOjX/Aqk7grUnPLbnuR
 IXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698353259; x=1698958059;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jKSlzStaatEuvyuk4N2jzmzAhRhglEf2C7Yl+0Y/OSw=;
 b=fE53zAl9JRz3kMMcVXatO2qce9daaJU7pk33nPQLtnj0RQt5wvcBTKEqZd+L+A5cuv
 +88kJobFGF6bno27E8FF+hMOXu0zOqV3WRlGpwzRL3ACTjhjbWPpWSVIyIvGaUtfZkkW
 /m/02ts0uH0eKkb556/9NA6LiB2cL2cQ+jYWIEqqiQay8T3JYB7sHUuKp4TluIUISirt
 owsDV5l0TB1ytSaFT3JYLPjcdyL5nUtlHPjqdbxuJBkEYFafuwDuXtsR4kuqm+sKK6FM
 zVAnc9MyL5acNhp6Bxk/hl3M0K6kOgVRjsYTEv8GtozU+A2ETWQK9TjZa+vaje0AqR0z
 c13A==
X-Gm-Message-State: AOJu0Yw/Z0gtfCzLurOBYygqJeabfqpkXnEt75xw+0YDztJDXWp/bMuO
 91eAmOdCy+DlMxr6i2kIP0OqBuqmu/0843C7B4G9Fw==
X-Google-Smtp-Source: AGHT+IG+vwPhPJYaA4HNyWvGtr14eA6vW2gDwAzAGDdlIAmWF+e+hGm2+Yi26mj+SjfZHi191GbY0gPPPP5Y0eHY5sE=
X-Received: by 2002:a25:b201:0:b0:d9a:45d7:4eae with SMTP id
 i1-20020a25b201000000b00d9a45d74eaemr555013ybj.62.1698353258762; Thu, 26 Oct
 2023 13:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <abc36c33-bfd9-4451-80ab-a631492044de@linaro.org>
 <ed18292b-efe8-48fc-8696-79e51acf8ab4@linaro.org>
In-Reply-To: <ed18292b-efe8-48fc-8696-79e51acf8ab4@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Oct 2023 23:47:27 +0300
Message-ID: <CAA8EJpo_H3-Lk1GQXGQikXiCtaEQ4C+FBW-fz9D2TbuX2HDhRA@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked'
 clock support
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 Michael Turquette <mturquette@baylibre.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 26 Oct 2023 at 21:57, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 10/7/23 01:43, Konrad Dybcio wrote:
> > On 4.10.2023 02:31, Dmitry Baryshkov wrote:
> >> clk_rcg2_shared_ops implements support for the case of the RCG which
> >> must not be completely turned off. However its design has one major
> >> drawback: it doesn't allow us to properly implement the is_enabled
> >> callback, which causes different kinds of misbehaviour from the CCF.
> >>
> >> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> >> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> >> switched off (and shared most of the implementation with
> >> clk_rcg2_shared_ops). The major difference is that it requires that the
> >> parent map doesn't conain the safe (parked) clock source. Instead if the
> >> CFG_REG register points to the safe source, the clock is considered to
> >> be disabled.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> > Would the intention here be to replace all usages of _shared_?

Yes

-- 
With best wishes
Dmitry

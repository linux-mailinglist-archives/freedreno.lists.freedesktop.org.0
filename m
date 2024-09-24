Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ABD984102
	for <lists+freedreno@lfdr.de>; Tue, 24 Sep 2024 10:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A86210E2BB;
	Tue, 24 Sep 2024 08:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wEAAIGXy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8602E10E2BB
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 08:48:27 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6b747f2e2b7so40816677b3.3
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 01:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727167706; x=1727772506; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O2BW7rW1FYVjlIde6zrnL8EA7RyRxs80o9NImTHzZY0=;
 b=wEAAIGXyXDu7tMhtxz3tYGMJ1WiD5txN8m4IJGbUwUy3luAeGO78OHui9waA6qLfPt
 fKVXIseTgwFpRT9BdE/D7x4wcosLhZ3r55V7TPzcqTHTWnvWYGf4CcBi69hdNac2Ws/+
 P4n7Up5txLzidn+Pox+bEXl7EBEa1DIdQyJK8TISq9DiX7nWjaZceyq15IagUlIkz6fM
 6IjRiWNmVXSMdSKIJ1tnCnzfB7W4jLyYMmDBy/3rqL+ULrZylFjD86WQWRacpwkLmI4v
 cIRqzs8s7CH2FHEauZBHTpGGGyNBJCGggIonbCoJLwiPCich47UnoC4gNi4Fo3x5wr76
 9fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727167706; x=1727772506;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O2BW7rW1FYVjlIde6zrnL8EA7RyRxs80o9NImTHzZY0=;
 b=n/8N8rxn3eA0TtXAyGK3SVfmQOev06DyDysp6rSzCLy0FMlCXl8x3RYN2KRqAKXQ+3
 hF6jl4yY8FBaMBeZy//HDxoueaXYTWzpFmF4wlkVzLZ8mnzgNAssiECuLciaSIpCrvRW
 Ml9D+w1WvtdzrkRc8PPFHfIe9eEwuyHvOwx3btxFpEDRrRl58VMBkRGKHZMjP/geY7L9
 BA4YvBx80mtaFFtsg5UzsFBLFEyKEpfj3xnX27JoS+j6l1j3xP0r49hF8pp5Z4Vx2g0F
 asPRjmZ9U/S7+d3y4gkyegbyJrOdP/esvHIBQsRfP1+Emhp4I6dtuQat3I4gz83bFG4I
 Nkaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM9KH2JC0EuAgwzhh8PoqAE0WTlmacM0xsmY4m6w0SqhK2Cci8Via/kmnfZvnA+FUXADg5D8RLrog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYamxyn0K24icGdyS4UTsb/qbplCpeQ9tdOhzAuIw0ytmOMkeH
 bxRoMX1Kpn12upaS5QLIDvrPMXM8NvpcEa85BVn+MLU3STdnbiv3B1gh2g5RgSqZ5Zlx16SAv+o
 1g+jHW2gOBkSyRJqw/D85etMgxXyCa+p5hCN1Tg==
X-Google-Smtp-Source: AGHT+IFCb5BRAlbLnAzwWjcBmVLE/ekCw6xTHW2PJeqbqJNzwemf1kqX/aZu6O5ynInq2xTnD+jZsJNpJ4482s31YGo=
X-Received: by 2002:a05:690c:3005:b0:6dc:45ef:d933 with SMTP id
 00721157ae682-6dfeefe56famr87702667b3.43.1727167706566; Tue, 24 Sep 2024
 01:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <7fcbvouzb7gq6lclrkgs6pxondvj5wvutyw3swg55ugvzfpvd4@2ph7x7ulxoyv>
 <013459fd-fbb0-4225-90e3-a16115154646@quicinc.com>
In-Reply-To: <013459fd-fbb0-4225-90e3-a16115154646@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 10:48:16 +0200
Message-ID: <CAA8EJpooSPgUbZdvDeQcrauAU80sL98uVojVhrK++8=+atsj7g@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add display support for Qualcomm SA8775P platform
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, 
 quic_vpolimer@quicinc.com
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

On Tue, 24 Sept 2024 at 09:16, Mahadevan P <quic_mahap@quicinc.com> wrote:
>
>
> On 9/12/2024 1:26 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 12, 2024 at 12:44:32PM GMT, Mahadevan wrote:
> >> Add support for mdss and dpu driver on Qualcomm SA8775P platform.
> >>
> >> ---
> >> This series depends on following series:
> >> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
> > As such, it probably can not be merged before 6.14 (the mentioned series
> > will go on 6.13, we usually don't do cross-tree merges into drm). Please
> > rework the bindings to drop the dependency (it is possible, use fake
> > nodes instead of using dispcc + ID). Then you can specify that only the
> > DTS patch depends on the dispcc support, allowing driver changes to go
> > in first.
>
>
> Can we use clocks = <&dummy_dispcc 0>, <&dummy_dispcc 1>,
> <&dummy_dispcc 2>; instead of  clocks =  <&dispcc0
> MDSS_DISP_CC_MDSS_AHB_CLK>, <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>; in dt bindings?

Please take a look at how other platforms solved that already rather
than inventing a new way. For example, see sm7150, sm8650, x1e80100.

>
> >
> >> ---
> >>
> >> Mahadevan (5):
> >>    dt-bindings: display/msm: Document MDSS on SA8775P
> >>    dt-bindings: display/msm: Document the DPU for SA8775P
> >>    drm/msm: mdss: Add SA8775P support
> >>    drm/msm/dpu: Add SA8775P support
> >>    arm64: dts: qcom: sa8775p: add display dt nodes
> >>
> >>   .../display/msm/qcom,sa8775p-dpu.yaml         | 120 +++++
> >>   .../display/msm/qcom,sa8775p-mdss.yaml        | 225 ++++++++
> >>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  85 +++
> >>   .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
> >>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
> >>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
> >>   drivers/gpu/drm/msm/msm_mdss.c                |  10 +
> >>   8 files changed, 931 insertions(+), 3 deletions(-)
> >>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> >>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> >>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> >>
> >> --
> >> 2.34.1
> >>



-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7D4570811
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 18:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAE110F99C;
	Mon, 11 Jul 2022 16:12:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E51C8F3DB
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 16:12:46 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id k30so6868757edk.8
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 09:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EpUWA0CCK9VbBCJDoo4DsDsKj3ehCYJDBTp0s+uL7as=;
 b=ixU/xMq7Hv7sYGK7x3fdtMTt6aasWztP+joaQKiF3Qoz8jom4Zbc/6yW2OaMtJkOni
 QRGTqspiIYsKDwbpNgmJ05SE4tIR3oGEcMR0OpCFjW/x/t+QR2pLDk1XL1qU/cZ3VQjn
 R+Rda0PCnymlDaO5mqJNz0TzmHAvame4MLDOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EpUWA0CCK9VbBCJDoo4DsDsKj3ehCYJDBTp0s+uL7as=;
 b=6aY60N8OEFzRClDp5CDUtSw6on+Af882uiKs1IjzrqXpZBvZgNZP3J1oVGEDlGgIA+
 /Wek/EG8f4/Kr0qi9a0OXVHBpCq9GmpIseM2OMKnrdu0iGjjOZtZscRnPzsMkQYyYzNx
 hhtYqCZ5uePVggVxzGHdTe9nfKJ7kbOpHfCtnSId0AvsDH0fxlDAiDAQDC/HJ4PUYHOn
 lNqkZSqTRnNtRMoVy30b7HHtYmKttQ4dV/60ggqpWXfoKT7/pBqV1iQJ9lfxzYrwjesc
 nqNZdOjBI/VfWmoNBwFTkZYXvQEsCGRDhx8k3SHxHFMft/vRHKZkeKZT22QQA7PxhbVp
 RHsg==
X-Gm-Message-State: AJIora+enAbnz+OOiDJykXRpb8N1Gce5KIuDWGp073IJD+XPLFlFLtij
 CxEPZQE5DqeUwtW0WwXkQjDhL9YgwCkhoDQ9FQY=
X-Google-Smtp-Source: AGRyM1uIM19FzWWdmpyEn9gB0GL9fNFyIAFmzBcxEkCUnqO3mCgzy5cY7yEkZlbYtZPLsIAgkF7tUA==
X-Received: by 2002:a05:6402:150d:b0:43a:2cac:ca24 with SMTP id
 f13-20020a056402150d00b0043a2cacca24mr25965370edw.110.1657555964325; 
 Mon, 11 Jul 2022 09:12:44 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm4554518edu.45.2022.07.11.09.12.42
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 09:12:42 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id h17so7713611wrx.0
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 09:12:42 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr17134813wrr.583.1657555961970; Mon, 11
 Jul 2022 09:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <1657555122-18605-1-git-send-email-quic_khsieh@quicinc.com>
 <CAD=FV=WC0XQqOyONddX37=ad8M4N2NHB5UTmDVZU5SEggLvFEA@mail.gmail.com>
 <9abb6a67-e7a5-a3dc-1bff-30e9d2922b84@quicinc.com>
In-Reply-To: <9abb6a67-e7a5-a3dc-1bff-30e9d2922b84@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jul 2022 09:12:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VHC_mTya4ywa50_Af0uwt19rYDs9PyGfOh_AhRAJTEgA@mail.gmail.com>
Message-ID: <CAD=FV=VHC_mTya4ywa50_Af0uwt19rYDs9PyGfOh_AhRAJTEgA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] arm64: dta: qcom: sc7280: delete vdda-1p2
 and vdda-0p9 from mdss_edp
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 quic_mkrishn@quicinc.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 quic_kalyant@quicinc.coml, LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 9:10 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 7/11/2022 9:02 AM, Doug Anderson wrote:
>
> Hi,
>
> On Mon, Jul 11, 2022 at 8:58 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
>
> You also need to remove it from
> `arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi`.
>
> arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi: vdda-1p2-supply = <&vdd_a_usbssdp_0_1p2>;
>
> I did not see above line at sc7280-herobrine.dtsi at latest msm-next tree.

It's in the qcom tree...

https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/tree/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi?h=for-next#n438

-Doug

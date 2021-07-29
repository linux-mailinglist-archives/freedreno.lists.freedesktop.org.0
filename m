Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BCB3DAA24
	for <lists+freedreno@lfdr.de>; Thu, 29 Jul 2021 19:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702AB6EE1F;
	Thu, 29 Jul 2021 17:29:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031876EE1B
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 17:29:38 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id o20so9348864oiw.12
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=nuL9Gtrngyb6HozKG8XOhySmiHppyZ4SPKwk+KQp+Zc=;
 b=JdtXha2KVXzKZ2i+/dg6/TqTi8BKHsyrpUafLCGrH3a4/NrAgfn9+1VV61+cKYypI/
 zQis9HjO0mRR/RhoP0rU+vdBW8oNeszZsNBI9t+oY9amV7+Q38G2zdiUy58bnHalNRVT
 BzZ5MybexeU8CXngY8eZukXE4Gw0vor1OAyfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=nuL9Gtrngyb6HozKG8XOhySmiHppyZ4SPKwk+KQp+Zc=;
 b=ovj/PlkI7QBOxdm3e/DkY0AqjlgEMeS9lB2W0wRAGlH74g4TVl6xteF6gY56LMfkvm
 uq72SRxRyO825fhZBB5ZMYjbSquvf/3/4yIazX1YrV2VsvmWR8FpRddei6DuQRHY0yZY
 2b82qBn/UiQwnIN55moDmmZI5oxCzd5flC4qXwTOJIx7Q09UEZOIxhjioNX2cX38CSrZ
 R4+kC8QrsBYuEF43q+cmYTh/1eMNPQCryWL4NiEpdv3MPTuRagAJSRkbBjVOdwQnIsTh
 WXnGcepGW4rS/EbpS60aw/RBmBwe/ZeyanyUxrn3AVfCbewdQaRTL5qLAc5oejm+TRY7
 Ovmw==
X-Gm-Message-State: AOAM533E8lt0JltyHAsyQgPEK1m1sFT4JUPNKhk0H74bucgpkx3MpY6r
 xXPjo6b6Lqqp+wZBoBw7LMqabSjCzD7/sH6D25Cx+g==
X-Google-Smtp-Source: ABdhPJwi3G9rwu5lrD06uFLjaL3kNc79dxhFbRDbNktWD54FVP7PGqPqCjr1IvDBEJd9gDzQ74iPrFgSWrFNyjY6nRc=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr3928249oiu.19.1627579778357; 
 Thu, 29 Jul 2021 10:29:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jul 2021 12:29:38 -0500
MIME-Version: 1.0
In-Reply-To: <20210728172330.v3.2.Iea8318d85a23f0167fd523ea85df5630147649f9@changeid>
References: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org>
 <20210728172330.v3.2.Iea8318d85a23f0167fd523ea85df5630147649f9@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 29 Jul 2021 12:29:37 -0500
Message-ID: <CAE-0n50GLdByWnMxf2AZJ0r1pdZFRwG3b5t3V69wZY6H6pf32A@mail.gmail.com>
To: Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>, 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 2/2] arm64: dts: qcom: sc7280: Add gpu
 thermal zone cooling support
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Akhil P Oommen (2021-07-28 04:54:02)
> From: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
>
> Add cooling-cells property and the cooling maps for the gpu thermal
> zones to support GPU thermal cooling.
>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

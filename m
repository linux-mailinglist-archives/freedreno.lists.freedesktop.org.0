Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E2489936E
	for <lists+freedreno@lfdr.de>; Fri,  5 Apr 2024 04:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024C61137CA;
	Fri,  5 Apr 2024 02:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kXhP/ALt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B451137CA
 for <freedreno@lists.freedesktop.org>; Fri,  5 Apr 2024 02:55:01 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dc25e12cc63so2515622276.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Apr 2024 19:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712285700; x=1712890500; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EfDPM/jBlrvHW8pL/mwrjjQGf0cytLyBW2ZbeZaxa8w=;
 b=kXhP/ALtHj8Cz0oLPgEqvKn3Lu+jUDfBAZ4KlrHothNs+waduaqfoUjm6PXgZ4D2kM
 XageD7xOOLS9RNLaJvuhFSn+ta4V3X1T1eOo9pRIi3TzqPcrqLLgjL5RzE4MlvCCny4E
 TjNLIjGIBCaSgt6MIiOiYVteJhCmbtyFBvxLG6bB5is+q0JYea7AMXO8XJ3LPnd4kRzx
 6b4ywLcjjvaR7KaR2pK1uGHienz8C4uq6Z3xqgXUgwPmByNHblBORHyai27h8GudqF7U
 0gYeMJgcWcC7tPwwAld27iL8YTWJuVlwEWnHqF2rJhVuHt87xVsjfRLxMs0kl7Mi+upT
 HQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712285700; x=1712890500;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EfDPM/jBlrvHW8pL/mwrjjQGf0cytLyBW2ZbeZaxa8w=;
 b=UwKP3bKWKAWImew01fRkAqrng2z5TCT/pnA/1Ut+AXw1vA6FkfcqkpR1eRt6Nt53FB
 4K3+CRVXPnDdtDuxVwWvPpQjD2zP8qtm267y/0X3tzyUTqNd3Z+5O6JX3jP9yLj0id4n
 +65DjbYrZblD/qhc3zwZZSHZLSunxH0zGQZNmy8xOhkHQ55LMDwbsuo5VTfUrHw0ubKQ
 3ah6CwF2BmThd3SDnuST0yLJHdYlIJ2cnKJ8l1jhA0eX71OH80FBHGPcou/WWkrZFzQy
 cxm/ypxDMrgEda282fxJbnv9+G0wqNDWcxTdoYCEusRbUCoGuedabidORlKIQZAUs5LG
 CYog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfBVHkT1MKW1Svwjtfze0gRpd/rui8lj0EH4l4VdF878Lg73AIHatc9PNREIF65gAXr40WnzVGUHXsp2y6xhpMBw6s6XGuvQ1ShkiycupO
X-Gm-Message-State: AOJu0Yw+q6fqU2OIm4Uz44qs+hR6F80dvOmN3F/WdCz/2w/UOVcZ2R2K
 ihEI5+mhff8RQUjlfL3Fow/rs5Tqhj0dnsoVKDHXhWbDgNvhv3JZVZuvcfyf+7N0u3KHnlqAAYb
 5WbpMtkY2bcNWu2u8+Sw1UYn5AphwrCaOrWt/MA==
X-Google-Smtp-Source: AGHT+IFivS2hB8z2W9hwonWTCxmRcOXhWI/RFcC0uZQ37FAI9e0SKdalGASHEiDclHq2P1ZBRA6kcdGTvgLJPN2UQoc=
X-Received: by 2002:a25:dc92:0:b0:dcc:6894:4ac0 with SMTP id
 y140-20020a25dc92000000b00dcc68944ac0mr207083ybe.20.1712285700487; Thu, 04
 Apr 2024 19:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240404234345.1446300-1-swboyd@chromium.org>
In-Reply-To: <20240404234345.1446300-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 05:54:49 +0300
Message-ID: <CAA8EJprZ8Ehx+M7vy1pH8OT6Of2v8-trecCJZhF5wxBRSGQoXw@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom: qmp-combo: Fix VCO div offset on v3
To: Stephen Boyd <swboyd@chromium.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
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

On Fri, 5 Apr 2024 at 02:43, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Commit ec17373aebd0 ("phy: qcom: qmp-combo: extract common function to
> setup clocks") changed the offset that is used to write to
> DP_PHY_VCO_DIV from QSERDES_V3_DP_PHY_VCO_DIV to
> QSERDES_V4_DP_PHY_VCO_DIV. Unfortunately, this offset is different
> between v3 and v4 phys:
>
>  #define QSERDES_V3_DP_PHY_VCO_DIV                 0x064
>  #define QSERDES_V4_DP_PHY_VCO_DIV                 0x070
>
> meaning that we write the wrong register on v3 phys now. Add another
> generic register to 'regs' and use it here instead of a version specific
> define to fix this.
>
> This was discovered after Abhinav looked over register dumps with me
> from sc7180 Trogdor devices that started failing to light up the
> external display with v6.6 based kernels. It turns out that some
> monitors are very specific about their link clk frequency and if the
> default power on reset value is still there the monitor will show a
> blank screen or a garbled display. Other monitors are perfectly happy to
> get a bad clock signal.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: ec17373aebd0 ("phy: qcom: qmp-combo: extract common function to setup clocks")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

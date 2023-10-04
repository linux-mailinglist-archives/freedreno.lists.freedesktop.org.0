Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1DE7B7EC1
	for <lists+freedreno@lfdr.de>; Wed,  4 Oct 2023 14:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A52F10E116;
	Wed,  4 Oct 2023 12:08:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AC610E116
 for <freedreno@lists.freedesktop.org>; Wed,  4 Oct 2023 12:08:56 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-59f6492b415so7990907b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 04 Oct 2023 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696421336; x=1697026136; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uooSCEajVBYK+4N0+yQr6mZZtZ+slaSkRYJcX2gZXHI=;
 b=qhlwgG+EPqR2ivTUxDm50ngAvym3EGhs+5TAkgVoilImE1nDMH+hHwxJXoQqN9Jfef
 /mkNiKBg9pQt3S34qruvngg01LnYZ7JHK63tnwYFP5t66jJuImdunXXalKuXhu1vJ+4K
 iV4NppjzfK8e+3criOIYkUuYzmNPzseA/iAF061dq2CjX4XB3q+RkPvYl41jLsH8G8Tj
 j+igtUhYaXChYPSNKv+4/9RsMzOwj0cTK9t8h0tzF53ekMUuEQ9dAe0ziRwXlc7YEWXC
 MTSYKCRRppbiMNFkR/1BRUa14Sb5gQfOUvd9Ig5zGHUZbqkb+g/bhCBSooMNkjIqhugJ
 UvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696421336; x=1697026136;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uooSCEajVBYK+4N0+yQr6mZZtZ+slaSkRYJcX2gZXHI=;
 b=r/CCFvfxS3d/ID4IQV5G7lyjTlh3b84TwfzhfxM9UJNJpPzEPWz21dCxFcuxyt4p7c
 9cqusEOEgDCzNIRQ1mpLJw+t5WD4fRrt//4Mvyodz4YI4milCODNOzUwxhRNJFatLBAk
 /aerSz7fQHF5Ew9euQWfzjQe60tuhiDQw2bmHwqJBXQIT3OqZIIMxe86uPy+AEXcae7M
 RKgUwIE31Ky75zCTUo9MPz2FfZ6P2PJ0YeJ56ZCOY8y6xUz7ka5MDJOU5Zi9I1cvfmIY
 xybUUiGjb9YVUf70OEkvtxvNyVRyyRnXF71mKVaYEKwSt6E0kupq0lLRbveDUkblo8My
 /LzQ==
X-Gm-Message-State: AOJu0YwX3tvaS7IDXfvrUwgxpUZ4g3PTHwOzAVpBBIRvXFht2P0am4jD
 asKLrnKdbhRMuOjGdnfNqePXEGS/EBfn5fpspow8Jw==
X-Google-Smtp-Source: AGHT+IGtNE8Bdim5k+kYMkJxXavlzqknUeIEsO5VdfFSg069KV3TIGpu0ks7PhJezu1+AvnccNCYRy4M1pbtuCRnghc=
X-Received: by 2002:a0d:d801:0:b0:59f:79e7:6e5d with SMTP id
 a1-20020a0dd801000000b0059f79e76e5dmr3952734ywe.15.1696421335974; Wed, 04 Oct
 2023 05:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
In-Reply-To: <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 4 Oct 2023 15:08:44 +0300
Message-ID: <CAA8EJprGfS5x89FOWhjPCdLzSNbEK-U1h8qVmfiLc6+4NjEiNA@mail.gmail.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
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
 Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 freedreno@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 4 Oct 2023 at 12:27, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 04/10/2023 01:31, Dmitry Baryshkov wrote:
> > clk_rcg2_shared_ops implements support for the case of the RCG which
> > must not be completely turned off. However its design has one major
> > drawback: it doesn't allow us to properly implement the is_enabled
> > callback, which causes different kinds of misbehaviour from the CCF.
> >
> > Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> > clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> > switched off (and shared most of the implementation with
> > clk_rcg2_shared_ops). The major difference is that it requires that the
> > parent map doesn't conain the safe (parked) clock source. Instead if the
> > CFG_REG register points to the safe source, the clock is considered to
> > be disabled.
>
> Why not have a new bit in .flags ?
>
> Instead of lying about the clock being off, mark the clock as "parked",
> or "safe parked" or whatever term we choose for it ?

The main problem with adding flags doesn't fully scale. From the CCF
perspective, what should be the difference between parked and disabled
clocks? How should it treat the parked one?

From my point of view, the 'parked' clock is as good as 'disabled',
because the end devices do not work with the corresponding clock being
sourced from XO.
We already have a similar implementation for the PCIe PIPE clocks,
which reinterpret physical 'XO' source as a 'disabled' state to
facilitate disabling the clock before turning the genpd off.

>
> I feel 'disabled' should mean disabled and 'enabled' should me enabled
> when I read a value from debugfs and if we are parking a clock it should
> have a clear means of being flagged as a clock that should be parked.
>
> An example. I recently inherited some autogenerated code for camcc on
> sc8280xp.
>
> One of the clocks is marked as CLK_IS_CRITICAL by the autogen code
> meaning "never switch off" but CLK_IS_CRITICAL stops the camcc driver
> from doing runtime pm_ops to power collapse.
>
> The solution I have is to remove CLK_IS_CRITICAL and to hard-code in
> probe() the clock to always on.
>
> But if we had a CLK_DISABLE_SAFE_PARK flag - then not just for rcg but
> for branch clocks we could differentiate away from hard-coded always on
> in probe...
>
> ?
>
> ---
> bod



--
With best wishes
Dmitry

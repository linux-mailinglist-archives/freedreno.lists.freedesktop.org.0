Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA5356E1D
	for <lists+freedreno@lfdr.de>; Wed,  7 Apr 2021 16:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871A56E917;
	Wed,  7 Apr 2021 14:05:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB9B6E906
 for <freedreno@lists.freedesktop.org>; Wed,  7 Apr 2021 11:37:38 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id 7so18227381qka.7
 for <freedreno@lists.freedesktop.org>; Wed, 07 Apr 2021 04:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IW3oRRx99M57CpJG31OJ6s9cRTtaL0D26Vt6HdVUzpk=;
 b=oopYu+YQ42DBdZzN3yOYVkLE34+WNijKBfVjcKw6QPwW/mRKOs2n2G4L1YfBrga8cx
 220R9uTBCCRVSD1cy6bDEd7gA1lnF9TD+T4FpdSH5e6pDE7WFLCti3vaDYFyC2SgaM9z
 dzLQKaRLpCgPt311J8OYBUcFJAbeRxPMkE31g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IW3oRRx99M57CpJG31OJ6s9cRTtaL0D26Vt6HdVUzpk=;
 b=BwTIKc+wKvY5kdrM3iYSii02bknaFwAQNIdl0HplLBPMWUL4tGRXX2y7woeJreUOTn
 jtrXoF2Y52DRg/oqPKZDUaOVE6t+IE/mFeV0YzA/MnCYe47h1OhhVR0aSVyy0cOu/qRy
 V8fvhjLjk6KXUTNnctm2LSPkZId/3n/3mCq3FW0uEiBQFJvpFkE8ON856kbvWmcAhTzK
 f9nrGg6G86pQIzJEE3gQX0bgE+cwCWX2fSjOt4byD9FACdVmyQDPsfxxdFGTej0IG1It
 eesBVcjd5iENNR4iNgTKvxC+jYV+AdcTmMyPy9lo/jJEZfcXaiP/dJO1Y7gJbafhsq3i
 6p1g==
X-Gm-Message-State: AOAM5333lap0jZgkuHJ8jGWprbr9Od09xggXJX/eHYl5u2hEjFKJBSBe
 SVy5+443eBZyrEPkMaNsbv1rCUabUIq6HcWD/41wTg==
X-Google-Smtp-Source: ABdhPJyA5Hg5hcZK/lrBzsOg/7n5zpjnXNILiWuDcgO2g8kFHFN6fUKV9nWalWac9N9CBudJ/zH0+3dvbyRGFrd6m4Q=
X-Received: by 2002:ae9:f70a:: with SMTP id s10mr2714172qkg.468.1617795457907; 
 Wed, 07 Apr 2021 04:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 7 Apr 2021 20:38:56 +0900
Message-ID: <CAFr9PXm9oStJ4oKNaGCGi9sXBTc-6iDZJZTWvumWHiFwwcRPnQ@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailman-Approved-At: Wed, 07 Apr 2021 14:05:09 +0000
Subject: Re: [Freedreno] [PATCH] clk: fixed: fix double free in resource
 managed fixed-factor clock
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
Cc: Rob Clark <robdclark@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dmitry,

On Wed, 7 Apr 2021 at 08:06, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> devm_clk_hw_register_fixed_factor_release(), the release function for
> the devm_clk_hw_register_fixed_factor(), calls
> clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> after that the devres functions will also kfree the allocated data,
> resulting in double free/memory corruption. Just call
> clk_hw_unregister() instead, leaving kfree() to devres code.

Doh.
Sorry for not spotting this when I wrote the patch.
Thank you for cleaning up after me.

Cheers,

Daniel
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

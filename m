Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF4B356771
	for <lists+freedreno@lfdr.de>; Wed,  7 Apr 2021 11:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645FE6E8E4;
	Wed,  7 Apr 2021 09:00:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3CD6E8E4
 for <freedreno@lists.freedesktop.org>; Wed,  7 Apr 2021 09:00:23 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id u8so13163693qtq.12
 for <freedreno@lists.freedesktop.org>; Wed, 07 Apr 2021 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ku8OglXxTNGGbHHWxcDhFtMWBJ7gtdpe5IAmLvPb6lg=;
 b=kkQOW1FEjeAuK4pSRWDAdhG6BTn98oaYU5CXLmk5LoQRxwLgIFMtcfz+yNOUKcVezU
 wp5fJQIdGN4hXvwFGYOhgvrc5dNVPvNvgN1fNEnOZoQZwLIqWZ5UOfnnOHYkUeWkej++
 h+HuMRIFphgMWtV6QRs0aBrXTKqZCAPcEBXdxYmjPMruEDSC3P0K6D0eGjsHHmSmW5iT
 3eB0xKzkF0Iu7CWkfeuSj6Imeg9AdH5nW1g/6/voQLnt/FSWuit973ZZw9Q6Q9h9Uvg+
 pmiOFE5J6hAzTc2AguIoltt9XtP/o/ScTdlw9kCgacNjhDWxFf9gQVVgWLqTSPsa4Shb
 x5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ku8OglXxTNGGbHHWxcDhFtMWBJ7gtdpe5IAmLvPb6lg=;
 b=ltzY0dAfpqoqi6rImG4aKmqOzlvV8kqJ/lPtwfDECmApCVeXwBnYxUT3dZJIr/UUjS
 nosYTa1pgOJTux708CqQR0m/HmAJJrsSVb5g/um77oXACD01/vVDjw/rA3nUIKzC9wuM
 naJB5qrFozckcKc+C15rPQiwhMA58+m7YXFyKet40xbWSA6mr96pF0tWu5PCVEX1yl9i
 4IrtQuzXrBxF1RlWLUltFNDzxCILvsbWqXryEkGheTfcYTqd2AXg/b/sd9dWHkhc9xKx
 xJ7BedvuIbJdRMv/jgYx6VkY8u3ydbbvr04RotW6kYCfkYFG04I6Yqahd/zNLgNsXl4K
 nAwg==
X-Gm-Message-State: AOAM530XMzpfl9C2FUnMLGQvRAycAcsF4Gb2O7PTfo5A5dV+3dNVnsHr
 Es/nDJQeeaUUUEiX5ZPRBovu5wRDgAOD3SS9ZoQeRg==
X-Google-Smtp-Source: ABdhPJwpVpHl5AgfUWWZ7rFE+fTLLWSBLG47+bo0fY9bos4oOj4bPlOhokymeav3cksyRptLE/cPLlYDQRqm8B0+fp8=
X-Received: by 2002:a05:622a:1716:: with SMTP id
 h22mr1818569qtk.273.1617786022398; 
 Wed, 07 Apr 2021 02:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Apr 2021 12:00:11 +0300
Message-ID: <CAA8EJpr7MazgHfL0qQiqfXvRn8T+ExnGhn-QFa1Np-fBhXn53w@mail.gmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Daniel Palmer <daniel@0x0f.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 7 Apr 2021 at 02:06, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> devm_clk_hw_register_fixed_factor_release(), the release function for
> the devm_clk_hw_register_fixed_factor(), calls
> clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> after that the devres functions will also kfree the allocated data,
> resulting in double free/memory corruption. Just call
> clk_hw_unregister() instead, leaving kfree() to devres code.
>
> Reported-by: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Palmer <daniel@0x0f.com>

Forgot:

Fixes: 0b9266d295ce ("clk: fixed: add devm helper for
clk_hw_register_fixed_factor()")


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>
> Stephen, this fix affects the DSI PHY rework. Do we have a chance of
> getting it into 5.12, otherwise there will be a cross-dependency between
> msm-next and clk-next.
>
> ---
>  drivers/clk/clk-fixed-factor.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

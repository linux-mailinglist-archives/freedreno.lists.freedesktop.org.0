Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FA615139B
	for <lists+freedreno@lfdr.de>; Tue,  4 Feb 2020 01:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7609E6E462;
	Tue,  4 Feb 2020 00:21:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53F76E4FF
 for <freedreno@lists.freedesktop.org>; Tue,  4 Feb 2020 00:21:21 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id j20so7030696otq.3
 for <freedreno@lists.freedesktop.org>; Mon, 03 Feb 2020 16:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LPuXmrJI40A2Un1MmFXL7OHrwiIKEbtwiS4nTQZEtlw=;
 b=Sqy4Qf7TbtVRb9AKX7R0QHMGO6MbjHFjRhrNLCVULzUn/tmym5SloAoPUq1SLwktqL
 YfDK2SvCgqu1fkHcx0lbvUks2URnH9G99ch0qldrHccgrrXWifX1cpgNKWL3di2+l5qG
 Iwa5jrVHUpE4EDrYxjMPzWGaWAWHjMLWl631queL7ztP48d4tpQc/xVcRzYnMe81w7uC
 4hxAPoC0OgBYxmSUgZWTss5WoM88w5zWJpgZGqSN5GUyK+Gqf6JeoJvJ0WVhmy55jGIu
 VOwXEJfrLuQ1xyydF5FCEOXUqw/PKDYZA6sbjwFeJXBDWoNWiF1G1cD7YnRP7AONLW+P
 e5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LPuXmrJI40A2Un1MmFXL7OHrwiIKEbtwiS4nTQZEtlw=;
 b=pLG5VuSODr1t7Uo8YNNJTF97vvZXR2eK293RlR4dEr40TxNgP42M5NIT8aXOM5kJNz
 QoL2Rpg8uA7T/u2sJdMD1p5Q3U7QaPr2N1ZtJU9U7Ia13+eo+LrjMyvJCdLPJNLILAg9
 1eKlqqaB35dtQnbsdbenEavKHUJWXgvrQ6R8ifrbYi61Qgw2uvRFnzYXEHRmpBDckDyN
 UMIUZo0eiZTpMdn2QPNRwcCPj9unZFS9TEiSZmyX7KgaMB2MMcVpydoJRT2bumJyA240
 oK2P1JmmRFRpTTJVFmxEVgXSgprmzM7EW2pfyg1oDA5Dwhbi3m1jqlPpRkLzhtY60hzA
 qBew==
X-Gm-Message-State: APjAAAUHxn8DAKA2m9Duy2uLf5WFEEyZBv8U2OI7wgMK5JGffkgI9TgD
 HO5K89gTda2qGr8ipqQvljv9mBocikWmtJfxV9PQaw==
X-Google-Smtp-Source: APXvYqz/YSe/X4e5btHvwVXt9j0h9vzKao0F/dYt5ZLOc7r211EAvVVKoCb8baK3UiKvJDxzD5l048nUmNuGreHgVVI=
X-Received: by 2002:a05:6830:1094:: with SMTP id
 y20mr19728104oto.12.1580775680897; 
 Mon, 03 Feb 2020 16:21:20 -0800 (PST)
MIME-Version: 1.0
References: <1579763945-10478-1-git-send-email-smasetty@codeaurora.org>
 <1579763945-10478-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1579763945-10478-2-git-send-email-smasetty@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 3 Feb 2020 16:21:09 -0800
Message-ID: <CALAqxLU9-4YEF8mTjuPF+LBJH8fFw_OfrdT7JtTqib127RRaEA@mail.gmail.com>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v2 2/3] drm: msm: a6xx: Add support for A618
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
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-arm-msm@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 11:19 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds support for enabling Graphics Bus Interface(GBIF)
> used in multiple A6xx series chipets. Also makes changes to the
> PDC/RSC sequencing specifically required for A618. This is needed
> for proper interfacing with RPMH.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index dc8ec2c..2ac9a51 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -378,6 +378,18 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>         int ret;
>
> +       /*
> +        * During a previous slumber, GBIF halt is asserted to ensure
> +        * no further transaction can go through GPU before GPU
> +        * headswitch is turned off.
> +        *
> +        * This halt is deasserted once headswitch goes off but
> +        * incase headswitch doesn't goes off clear GBIF halt
> +        * here to ensure GPU wake-up doesn't fail because of
> +        * halted GPU transactions.
> +        */
> +       gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> +
>         /* Make sure the GMU keeps the GPU on while we set it up */
>         a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>

So I already brought this up on #freedreno but figured I'd follow up
on the list.

With linus/master, I'm seeing hard crashes (into usb crash mode) with
the db845c, which I isolated down to this patch, and then to the chunk
above.

Dropping the gpu_write line above gets things booting again for me.

Let me know if there are any follow on patches I can help validate.

thanks
-john
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

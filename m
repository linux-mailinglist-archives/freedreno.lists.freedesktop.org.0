Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A24791538E8
	for <lists+freedreno@lfdr.de>; Wed,  5 Feb 2020 20:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1546F943;
	Wed,  5 Feb 2020 19:20:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924526F93E
 for <freedreno@lists.freedesktop.org>; Wed,  5 Feb 2020 19:20:36 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id v141so2081626vsv.12
 for <freedreno@lists.freedesktop.org>; Wed, 05 Feb 2020 11:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5YaLuYG6Iy8QwcRaBytxQgkWb5GSrDhgxvX793l25Mo=;
 b=GuNlVw9BGjVfmhTOpV2VTeLQx5fb7PKdprf2XR10o8G5FgixUq0JmY+Z6cyD+kx95/
 5YEYPMNOQ2HaOFmXohheuf6yU7ENKL+x9hT+6uAnCPS2kPLJN5v1nYtcuPh1UbkNEo++
 J8++OrPT4HiHnTqOvvoifx1YVBfMdbqv1HAW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5YaLuYG6Iy8QwcRaBytxQgkWb5GSrDhgxvX793l25Mo=;
 b=qBgP4VMJp5FFhnNTk+tXfVpLDyz1PJCJPFQEc6zFhy97/TR7k5s9HO9yD19N7E0M6J
 bTlFiBtgv8tWXjdG6t1E+w3kYMic8NjYOUUsBf/3Swbe9cjKQKEWLiZeOYZuw/M1vZDe
 xn5CbzA+6TLs5UV3hZZzSTLORwqhVe2GgSLGzrBmDHI2GU5TIm70C0o+bened+SqI9gb
 KJIbKCxBVfNmCjuFq8dvOblUrO5NsGRhVndVi7wITBs+O1XZ91SzenyeEbUt0pX/GY+J
 BQdoJpip6JzqfkD6LiXdQlUyBYQ/V+4nRDqMn7yPRatfbqduBQBCkf3HEH29ZRQzZZeP
 D3QA==
X-Gm-Message-State: APjAAAXkMPRQmCcBYM3jGWlmyZA+kX3I6LGEsGgzxWeKIprX3oCg0dBP
 vE55MbBSzMjfL9GqIu3sK5NNGsp+sWY=
X-Google-Smtp-Source: APXvYqyDhJZLxdizSVaLF/VVCX+dUWXzJaMJFJTLZ+kD/tcYM8l/xUwcS4k1tgb/Hna2sQ+cIx6/Ig==
X-Received: by 2002:a67:fd63:: with SMTP id h3mr25890684vsa.221.1580930434659; 
 Wed, 05 Feb 2020 11:20:34 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id b20sm254650vsq.20.2020.02.05.11.20.33
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 11:20:33 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id o42so1281341uad.10
 for <freedreno@lists.freedesktop.org>; Wed, 05 Feb 2020 11:20:33 -0800 (PST)
X-Received: by 2002:ab0:2006:: with SMTP id v6mr20493719uak.22.1580930433242; 
 Wed, 05 Feb 2020 11:20:33 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org>
 <1580886097-6312-3-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-3-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Feb 2020 11:20:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V6yM7UJwu0ZLPCqmDgV9FS4=g+wcLg0TV51b72zvWT9Q@mail.gmail.com>
Message-ID: <CAD=FV=V6yM7UJwu0ZLPCqmDgV9FS4=g+wcLg0TV51b72zvWT9Q@mail.gmail.com>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v4 2/3] clk: qcom: gpucc: Add support for GX
 GDSC for SC7180
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
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 4, 2020 at 11:02 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> From: Taniya Das <tdas@codeaurora.org>
>
>  Most of the time the CPU should not be touching the GX domain on the
>  GPU
>  except for a very special use case when the CPU needs to force the GX

Really weird word-wrapping?  You've also indented your whole commit message?


>  headswitch off. Add a dummy enable function for the GX gdsc to simulate
>  success so that the pm_runtime reference counting is correct.

Overall the commit message sounds a lot like the message in commit
85a3d920d30a ("clk: qcom: Add a dummy enable function for GX gdsc").
That's fine for the most part, but it makes it sound like you're
_only_ adding the dummy enable.  In this case you're adding support
for the GX domain and _also_ adding a dummy enable.  Maybe try:

Most of the time the CPU should not be touching the GX domain on the
GPU except for a very special use case when the CPU needs to force the
GX headswitch off. Add the GX domain for that use case.  As part of
this add a dummy enable function for the GX gdsc to simulate success
so that the pm_runtime reference counting is correct.  This matches
what was done in sdm845 in commit 85a3d920d30a ("clk: qcom: Add a
dummy enable function for GX gdsc").


> Signed-off-by: Taniya Das <tdas@codeaurora.org>

Since you are re-posting Taniya's patch you need to add your own
Signed-off-by as per kernel policy.


> ---
>  drivers/clk/qcom/gpucc-sc7180.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
> index ec61194..3b29f19 100644
> --- a/drivers/clk/qcom/gpucc-sc7180.c
> +++ b/drivers/clk/qcom/gpucc-sc7180.c
> @@ -172,8 +172,45 @@ enum {
>         .flags = VOTABLE,
>  };
>
> +/*
> + * On SC7180 the GPU GX domain is *almost* entirely controlled by the GMU
> + * running in the CX domain so the CPU doesn't need to know anything about the
> + * GX domain EXCEPT....
> + *
> + * Hardware constraints dictate that the GX be powered down before the CX. If
> + * the GMU crashes it could leave the GX on. In order to successfully bring back
> + * the device the CPU needs to disable the GX headswitch. There being no sane
> + * way to reach in and touch that register from deep inside the GPU driver we
> + * need to set up the infrastructure to be able to ensure that the GPU can
> + * ensure that the GX is off during this super special case. We do this by
> + * defining a GX gdsc with a dummy enable function and a "default" disable
> + * function.
> + *
> + * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
> + * driver. During power up, nothing will happen from the CPU (and the GMU will
> + * power up normally but during power down this will ensure that the GX domain
> + * is *really* off - this gives us a semi standard way of doing what we need.
> + */
> +static int gx_gdsc_enable(struct generic_pm_domain *domain)
> +{
> +       /* Do nothing but give genpd the impression that we were successful */
> +       return 0;
> +}
> +
> +static struct gdsc gx_gdsc = {
> +       .gdscr = 0x100c,
> +       .clamp_io_ctrl = 0x1508,
> +       .pd = {
> +               .name = "gpu_gx_gdsc",

nit: technically name could be "gx_gdsc" to match the name of the
struct and #define.  Your name is copied from sdm845 and matches the
name of the struct and #define from there.


> +               .power_on = gx_gdsc_enable,
> +       },
> +       .pwrsts = PWRSTS_OFF_ON,
> +       .flags = CLAMP_IO,

Compared to sdm845, you have different flags.  There we have:

.flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,

I'm not sure I have enough background knowledge about the hardare to
figure this out.  Can you confirm that you're different than sdm845 on
purpose?  Bonus points if you can confirm whether sdm845 is also
correct as it is today or should be changed to match what you have?


> +};
> +
>  static struct gdsc *gpu_cc_sc7180_gdscs[] = {
>         [CX_GDSC] = &cx_gdsc,
> +       [GX_GDSC] = &gx_gdsc,
>  };

Assuming that the question on flags is resolved and the commit message
updated, feel free to add my Reviewed-by tag.




-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

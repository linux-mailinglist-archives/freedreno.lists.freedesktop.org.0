Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31B3148B6F
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2020 16:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5713D6E3F7;
	Fri, 24 Jan 2020 15:46:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357F66E3F0
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2020 15:46:22 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id v28so2729347edw.12
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2020 07:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NE3aiQszngEl/i5B8XOMfRsuYNGxae+vatiEahI26NA=;
 b=lIrmGPVnZYQWikeBK2Um2t6CV95XnstHmc5/hdWTSBbcqQ5CgqFjEZepUwga1V8uRE
 /yIPlBlghAA0djsFM9c/79B9/OelTnjo4mPQFTiPVic680JSOYl0MfWimcYzxZb+fvSS
 pWMl3Vpoz9TJubn9J3NhtNc1Dap4gYAHQ6QKkcmaXMadMPdwnzOvZkPr+hx+x+DGsBg/
 tt7Oosf1IH49+t9BdjO/G7jTkIxdZjHAPoaEEV2TUbni/W9/8YAyaryMhyP90vq9GaJG
 JydbbXuvS/h++l/QYitW4TBCw2bfKOkgdP4WXwAuEpRXwjZAZ6r0ZjG+xf23U4SGGRM2
 UqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NE3aiQszngEl/i5B8XOMfRsuYNGxae+vatiEahI26NA=;
 b=dZCOYeBEj3qDL7RR67gTfu+LLp0jNZ3+xycN9X0lxd2H/5XJuxmQgf8CGOWP2dM9/q
 Sb0lg0iqJCiq5+8vhJ6ybSiBWm4M6/0L2dYTTosu2AYA9nFj/ggKnUxhoWKWI8j+uH/l
 2DjRT3CDlGS01qwjF747baojpcbQFpQS/p2njgs/45vXhFkFNfvFcxpF2PIEW8Ug9qNm
 4eVR5i385xCxVzxpnXAvju1Qv4Z8Q2d5pvfIy1K58D9hGfy2hkSVnaIBH+HhDgcb3GV3
 0RiUwPdNIwM7vVOfheDYA4AMvCRhKuecw/LN9zNtfqf7GMmjzqd9NRhymqIgu4UfgbmO
 C05Q==
X-Gm-Message-State: APjAAAWZ1THyqT9bLRKx/IzJPG9aqmjI4bYU1sprwVy/r3yIe5UTvxv6
 +9E00Ime+looyMYjERgmCwS7e71zR4PQEJ0iOk8=
X-Google-Smtp-Source: APXvYqzr/miwHthTdWEaxos07mltjrS+dD/PMEyGO+b11mE7lhcZWdZO16H3hMQzHIhR1oyFyPiQgLEeiW1joLnTaMA=
X-Received: by 2002:a17:906:a44d:: with SMTP id
 cb13mr3333605ejb.258.1579880780744; 
 Fri, 24 Jan 2020 07:46:20 -0800 (PST)
MIME-Version: 1.0
References: <1579868411-20837-1-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1579868411-20837-1-git-send-email-akhilpo@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 24 Jan 2020 07:46:09 -0800
Message-ID: <CAF6AEGtgbNSMnX3Bd6HKoEhViwKj64YkDPkATiqHAY87_gpT2w@mail.gmail.com>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: Correct the highestbank
 configuration
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Jan 24, 2020 at 5:50 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> Highest bank bit configuration is different for a618 gpu. Update
> it with the correct configuration which is the reset value incidentally.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

Thanks, this fixes the UBWC issues on a618

Fixes: e812744c5f95 ("drm: msm: a6xx: Add support for A618")
Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index daf0780..536d196 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -470,10 +470,12 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         /* Select CP0 to always count cycles */
>         gpu_write(gpu, REG_A6XX_CP_PERFCTR_CP_SEL_0, PERF_CP_ALWAYS_COUNT);
>
> -       gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
> -       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
> -       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
> -       gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
> +       if (adreno_is_a630(adreno_gpu)) {
> +               gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
> +               gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
> +               gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
> +               gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
> +       }
>
>         /* Enable fault detection */
>         gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL,
> --
> 2.7.4
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

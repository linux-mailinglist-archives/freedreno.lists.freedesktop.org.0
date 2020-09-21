Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17044272A9D
	for <lists+freedreno@lfdr.de>; Mon, 21 Sep 2020 17:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394FC6E370;
	Mon, 21 Sep 2020 15:47:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660616E4DD
 for <freedreno@lists.freedesktop.org>; Mon, 21 Sep 2020 15:46:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z1so13318975wrt.3
 for <freedreno@lists.freedesktop.org>; Mon, 21 Sep 2020 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U7rH3MXQ3KBOROK+/p1uMLnsBPfVkv2CUGNF+40H8CQ=;
 b=sn3DqawA1RNbqkHW0tvnFkd2GiYiCjELepybm+aam7/yvyjHFmOo9q7pPBiH33v8Op
 2wL+UI+jhlMdMmJMPgt0vQClTuOd1Tn+woUaaLaU1nbbru77Gq92Sv7WlYXdGc/1fh7j
 tPV7BURHK0mzqBcwiijiVvCOoDFHnuWolY9QHzurOv312IH7j3Au86bQTsXS+BGDCWAL
 jomGlM4U5R6hyuHfCfItut5XwMsFyZwiPL5Diiy6tprIy7rS95mlHbaOL4RBW7MOVc26
 GQMu0iwRcdWjryua/c2h1CCJFbhrvAubhd/57B9O5ZxZEZ7ElkfYSLSj/MG45nycuB4P
 EftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U7rH3MXQ3KBOROK+/p1uMLnsBPfVkv2CUGNF+40H8CQ=;
 b=f4rDR91TCERjE3Ojg4lUzIZvveNMtmOvg5XR5cpb9ebNdmf1/aRBMjWTeNyBvqxYr4
 m3sxDKTE+4ipOYe93Q0aw4VRqpif9YadzEyLcCH/MIGTOSp5kewdP/U0IhBDhuWcg0BH
 bv05BngksPU0cqlhOw3fTqi1lo24bgu10My+ngTeWSuj+6gZhB6PDh7h6AGA2LdyLc2J
 tJerMZQpFJfnLH/E3w4LlLoXZfw8tZh//xlDUUdMeJfFYWBFvx0EMtXu6GfD7SOiqm7/
 wqDqcohqtnfmE1OKF2xN4B4lFWfdD15xR2HHuwA/9h4BHsBg1IqrowtgRpLPm7wa1U/a
 eX4g==
X-Gm-Message-State: AOAM531ufkNzXBw1Fqnpa58cHBv2jVVfWa/5bM9i6f6P2teXnDHr3MUo
 r9Nb6ErsdyDS1ROgV6CQHBAKJtT2eJVQT5oijKU=
X-Google-Smtp-Source: ABdhPJxtVHCQUzYNlQuLpcrdAi/k+3N/BQu6j76lleZS5WeYQKN4wzqF/1ou0P5HlZiijbSJuuB5KdJ7UqhNNjRI4mg=
X-Received: by 2002:adf:f382:: with SMTP id m2mr345644wro.327.1600703207013;
 Mon, 21 Sep 2020 08:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <1600702038-10893-1-git-send-email-akhilpo@codeaurora.org>
 <1600702038-10893-2-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1600702038-10893-2-git-send-email-akhilpo@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 21 Sep 2020 08:47:48 -0700
Message-ID: <CAF6AEGsRMB_XvAKuaV8uf3yT61j-845GLB7sKPQoJrOQwd5-QQ@mail.gmail.com>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: Leave inuse count intact on
 map failure
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
Cc: Jonathan <jonathan@marek.ca>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 8:27 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> Leave the inuse count intact on map failure to keep the accounting
> accurate.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 80a8a26..8367a1c 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -88,8 +88,10 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>                 ret = aspace->mmu->funcs->map(aspace->mmu, vma->iova, sgt,
>                                 size, prot);
>
> -       if (ret)
> +       if (ret) {
>                 vma->mapped = false;
> +               vma->inuse++;

vma->inuse-- ?

BR,
-R

> +       }
>
>         return ret;
>  }
> --
> 2.7.4
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

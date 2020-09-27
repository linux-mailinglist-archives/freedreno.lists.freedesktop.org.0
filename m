Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9A27A267
	for <lists+freedreno@lfdr.de>; Sun, 27 Sep 2020 20:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AE489DBA;
	Sun, 27 Sep 2020 18:50:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359E789DBA
 for <freedreno@lists.freedesktop.org>; Sun, 27 Sep 2020 18:50:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k15so9411467wrn.10
 for <freedreno@lists.freedesktop.org>; Sun, 27 Sep 2020 11:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g+t9R4EAtEIISULglZW0aLkA0SSVKLPzn9R1Q498LHQ=;
 b=FfJglfhij6sPHhMkXQYWrIyFodAjuGnK198UmhbKgvEU4nYuMphPdhTGhpPhIzXvTD
 heTAoND4AxD42O+xHl8M0e0c4gDmdtaJrlMHBh8ksBkiC+oFANGc7Jugcko0augs8lUf
 Qc0+TyQgEqN5kDUYtCWc4ufK3sQmmDpad/6XyUPDshBWiQlbpNCMvMk38Ni+3B9Vll6U
 CZEV4rsfW8Yx+ZJQZGfyhl/HmW/ifpDmtXAVlvF1n6WSxaPXm296SxyStdvjiHW5B/fo
 FAGqQdHNR2aunhQMS+KQJLd/mb4zgOZw9IVxqf9Db2t9C1VdCAvMpU6shpPoGiYZHqXo
 +U1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+t9R4EAtEIISULglZW0aLkA0SSVKLPzn9R1Q498LHQ=;
 b=rK8fnDZh6dXMyySSqWrhj4EyeScQZdTJ9olM2jh5ajqBLQElb+Dms7x6jmGg5sSys/
 cnt348htIvBguSZeQBxolsqrKWIII70pY4IYMBYWZkQcquD2UQ4Zr6c+ouB+z2t0J3tA
 6ftQY0t1E3soMlpFAR/E3J/4bDlnPgbrqctOpAT0f9Rn7SpqC8szgBSWqUOKDmvh6L7U
 uLEoY61GI2JFaW6OJzh7N4aPJ+kFjCkyFkYIrFfcFMVXcQ8dKmC32UNCnm89ryRAyTvf
 QdkuHDNdMiR5pHznsnSXXZytW6tTxvPO0A7NLktUsx26rRBOVGwUWXo5TbABMj2B2Jh8
 fHbw==
X-Gm-Message-State: AOAM532FhU3y8fpi6dxRsCGwZjT84NMDiV1WpW3+qCdwaEwz3NYMkFmq
 sSKjlqDOeiOgX5Z+aXA1Q4cAuyPHF5yVVe0g6Uc=
X-Google-Smtp-Source: ABdhPJwReFAlPBA6bUsKMfNlvNTagxLjBdCxdBbMVAxawsEUEhQO6mmWgIpDc1xFg1fg+gnJfmbaZCa5NF13iGOIXSI=
X-Received: by 2002:adf:f382:: with SMTP id m2mr14295407wro.327.1601232650778; 
 Sun, 27 Sep 2020 11:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200926125146.12859-1-kholk11@gmail.com>
 <20200926125146.12859-8-kholk11@gmail.com>
In-Reply-To: <20200926125146.12859-8-kholk11@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 27 Sep 2020 11:51:54 -0700
Message-ID: <CAF6AEGud+uR5J8aJ_FK544-nCuFVQ6AgbJGQPkxMm_RH-i37xg@mail.gmail.com>
To: AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: Re: [Freedreno] [PATCH 7/7] drm/msm/a5xx: Disable UCHE global filter
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
Cc: freedreno <freedreno@lists.freedesktop.org>, marijns95@gmail.com,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 martin.botka1@gmail.com, Jordan Crouse <jcrouse@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Sep 26, 2020 at 5:52 AM <kholk11@gmail.com> wrote:
>
> From: Konrad Dybcio <konradybcio@gmail.com>
>
> Port over the command from downstream to prevent undefined
> behaviour.
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index bdc852e7d979..71cd8a3a6bf1 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -722,6 +722,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>             adreno_is_a512(adreno_gpu))
>                 gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
>
> +       /* Disable UCHE global filter as SP can invalidate/flush independently */
> +       gpu_write(gpu, 0x00000E81, BIT(29));

Looks like this is REG_A5XX_UCHE_MODE_CNTL?  We should define a name
for this, rather than open coding.

(It's ok if you just add it to a5xx.xml.h, I can push a MR to add this
to mesa a5xx.xml)

BR,
-R

> +
>         /* Enable USE_RETENTION_FLOPS */
>         gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
>
> --
> 2.28.0
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

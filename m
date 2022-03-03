Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3304CC73F
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 21:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A76110E6AB;
	Thu,  3 Mar 2022 20:47:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE4210E6AB
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 20:47:12 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so7129025oot.11
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 12:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=+Puf4aNWGnBjbMoB3Susur6crhlYcLtx4j9Ip8HC7kA=;
 b=k6W8e10+Uf4sakf0fAoRyizRgUlCGT2fKfRGf7YwCJrtx8hpizrlDmaFiq8woyaLIu
 W+2+qR2dv4+7DFP95rd8s2jg2ZvOv5SouJRZ7Afuui/tPsw9eOVrD0vpNwJnfae5s/1O
 p4+Jh9D3nwk0keSiFtAGFSLDSlgSabeDgSqRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=+Puf4aNWGnBjbMoB3Susur6crhlYcLtx4j9Ip8HC7kA=;
 b=T8xqeGJxue8CuXw8y1h7HIQKcJruwhl8QI/Lu+EqAQhy/dQR7V4M1OTmQYQQ25QogJ
 sSZsMOPjcTZRqjdcYJLvD5ZPltKDWJ4UOAYfWw1m3v1KLFUf+j/Y3dKAO4eJOtSwNaqm
 m1BD0S4dsj1pmswxRqzXj70lMmiBtEUTSBYXg5gS6I10k2rPSJ6jKkdmQHBvLLbAxavV
 7RupX7me9LditAWakaqLkfX4SQ0T9dbJHx4UlaYniaSXwNS/h5rolY/wdg7qlNB7hxpE
 qKS5idvlke7ZxFMgZV/n14/pX7m4EmCCpZWFE8iEDaK2Rvx9Gp03La1khxQJ3uwx/ZD/
 4mRw==
X-Gm-Message-State: AOAM533vgS/YIZTNbk543jYuG9qqvDW/AdjvJLYEJsCgNOzzPUne7ZGf
 1HdYLIcuex+O0xPOYpY2oPEYPuzu5ecqZqa+UD1rpA==
X-Google-Smtp-Source: ABdhPJzs1MvRVnkrIzc9Yf/1HC1AcAjxcK4UHZbLjJ8EUNjw5BY9npnsX81bicw0V269DxxbFy1/oRBcFej16mWlsGQ=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr19586044oon.25.1646340431451; Thu, 03
 Mar 2022 12:47:11 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 12:47:10 -0800
MIME-Version: 1.0
In-Reply-To: <20220303194758.710358-4-robdclark@gmail.com>
References: <20220303194758.710358-1-robdclark@gmail.com>
 <20220303194758.710358-4-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 12:47:10 -0800
Message-ID: <CAE-0n532ZX=qXTBKSFyRYAmkqFN7oqKyPvJHBuVMmr2eHY+O4A@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/4] drm/msm: Add SYSPROF param
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Yangtao Li <tiny.windzz@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rob Clark (2022-03-03 11:46:47)
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index fde9a29f884e..0ba1dbd4e50f 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -330,6 +337,24 @@ struct msm_file_private {
>         struct kref ref;
>         int seqno;
>
> +       /**
> +        * sysprof:
> +        *
> +        * The value of MSM_PARAM_SYSPROF set by userspace.  This is
> +        * intended to be used by system profiling tools like Mesa's
> +        * pps-producer (perfetto), and restricted to CAP_SYS_ADMIN.
> +        *
> +        * Setting a value of 1 will preserve performance counters across
> +        * context switches.  Setting a value of 2 will in addition
> +        * suppress suspend.  (Performance counters loose  state across

s/loose  /lose/

> +        * power collapse, which is undesirable for profiling in some
> +        * cases.)
> +        *
> +        * The value automatically reverts to zero when the drm device
> +        * file is closed.
> +        */
> +       int sysprof;
> +
>         /**
>          * elapsed:
>          *
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index 7cb158bcbcf6..4179db54ac93 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -7,6 +7,40 @@
>
>  #include "msm_gpu.h"
>
> +int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> +                                struct msm_gpu *gpu, int sysprof)
> +{
> +       /* unwind old value first: */
> +       switch (ctx->sysprof) {
> +       case 2:
> +               pm_runtime_put_autosuspend(&gpu->pdev->dev);
> +               fallthrough;
> +       case 1:
> +               refcount_dec(&gpu->sysprof_active);
> +               fallthrough;
> +       case 0:
> +               break;
> +       }
> +
> +       /* then apply new value: */

It would be safer to swap this. Otherwise a set when the values are at
"1" would drop to "zero" here and potentially trigger some glitch,
whereas incrementing one more time and then dropping the previous state
would avoid that short blip.

> +       switch (sysprof) {
> +       default:
> +               return -EINVAL;

This will become more complicated though.

> +       case 2:
> +               pm_runtime_get_sync(&gpu->pdev->dev);
> +               fallthrough;
> +       case 1:
> +               refcount_inc(&gpu->sysprof_active);
> +               fallthrough;
> +       case 0:
> +               break;
> +       }
> +
> +       ctx->sysprof = sysprof;
> +
> +       return 0;
> +}

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599108C33DC
	for <lists+freedreno@lfdr.de>; Sat, 11 May 2024 23:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24B010E045;
	Sat, 11 May 2024 21:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZDGmqEEc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C0610E098
 for <freedreno@lists.freedesktop.org>; Sat, 11 May 2024 21:47:05 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-61804067da0so32028607b3.0
 for <freedreno@lists.freedesktop.org>; Sat, 11 May 2024 14:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715464025; x=1716068825; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UUDDnmzrxB3l3/4aj031ZrzOLNCmAjmO9rvghUTgzkE=;
 b=ZDGmqEEcd/Ob8/AhCL/D9s+fmttzibq2HbQ96wFFf2DOvzu66xo7OpyqLsmPVNM1iy
 Ft3vmcz5c2xjRtRU+07a2innXUa9nnBfxGya1Y2L0Cf4yC/QjAB0LVIB0V5DFxWSoxUg
 w5exlEBHPYivJ+jh4K5fCipozvGFGvbE6ZkxWT09lOlYtlK1ZN9DU2HBzTlHYefnRXWz
 K3IUk6jSB8HGKDqFvO2m9i9GUMZ/2p9SCEgzoixaLZHSCgCGfyd/kxjeN6VmG4w2f5ur
 w0L7+SHnV3LZVI24E+SZi5jJoIEqyUVN4eofNkR7CE5+FOpkzsGnOGllGm6lYrxXxwoe
 MrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715464025; x=1716068825;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUDDnmzrxB3l3/4aj031ZrzOLNCmAjmO9rvghUTgzkE=;
 b=XVTJ7sG5T7BrHWo0DHumFiMHWCG5EJPUyfNefEqFfgt0A0dUVe29+vT9RjvugT4Mrc
 lA3fxvKDZ1IpZOEP+gbwkO4djnOSoJhltOa8r8d9nxCm+v6EQD6VdnZDgyjHEA81fzcq
 K3FD3vAv0b1OEEGxM04QtAOYNgquRIcTslRNaaKgm7T+2IxTB5D+DShENg/m9oiXdFvJ
 IIAM25BBZfMao/JLOnggHj6mnJD19QY1JKc2z+Ecjc+MIVkTBTNUpZac6kMMB4Iao45l
 QYSczAvSzh8UYeNt0+zJ0od0RGPXby72QdW5sj1usmgoy5HEblQ50lM0rL53aAfVKqXF
 CA+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQl8oRoJHpwHMS+OQNLJTa6XWhzo7uuRf0k6cqTy7C7mt4qxAo/WfgbTQswNevbHI708MlX5IHJicxImgxhwvSt3UYp+dEtrYRlU0CB42F
X-Gm-Message-State: AOJu0Yx9wB04KBE7M7M/cgzUeJwq1EKwohfs4wV3RRJXdnsScGKduaiT
 VW+7E285v95ozUuwkTS7lqC45vUG7YpEnUkmP8l6DRrYhxabS4mQTgD3NMYsEzjjqPrFI1IT1l+
 WLIKdUxcWmcjrpEpJMX8MuY7kdEMgZ2rfN8Q78A==
X-Google-Smtp-Source: AGHT+IGG3nr3fWq7oYomiHLISDdigDRI73rcAWer5xHynouZBj9dhN1hlkvK3TDT9c5wAPBOWXNGkt1XOlWrmP10/T4=
X-Received: by 2002:a05:690c:ed4:b0:61a:e9f6:2b1b with SMTP id
 00721157ae682-622aff774d9mr84631617b3.8.1715464024566; Sat, 11 May 2024
 14:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240511-msm-adreno-memory-region-v2-1-9f33f42e7b99@gmail.com>
In-Reply-To: <20240511-msm-adreno-memory-region-v2-1-9f33f42e7b99@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 00:46:53 +0300
Message-ID: <CAA8EJprMULN1BbRvUjh81f7x02cdg7UeNzuEnw2nUNrmKC7eFw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/a6xx: request memory region
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sat, 11 May 2024 at 22:56, Kiarash Hajian
<kiarash8112hajian@gmail.com> wrote:
>
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
>
> Implement the region-request through the corresponding managed
> devres-function.
>
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
> Changes in v2:
> - update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.

Same comment as I posted for v1 of the patch.

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8bea8ef26f77..aa83cb461a75 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -636,9 +636,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>
>  err:
>         if (!IS_ERR_OR_NULL(pdcptr))
> -               iounmap(pdcptr);
> +               devm_iounmap(&pdev->dev,pdcptr);
>         if (!IS_ERR_OR_NULL(seqptr))
> -               iounmap(seqptr);
> +               devm_iounmap(&pdev->dev,seqptr);
>  }
>
>  /*
> @@ -1503,7 +1503,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       ret = ioremap(res->start, resource_size(res));
> +       ret = devm_ioremap_resource(&pdev->dev, res);
>         if (!ret) {
>                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
>                 return ERR_PTR(-EINVAL);
> @@ -1646,7 +1646,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>         dev_pm_domain_detach(gmu->cxpd, false);
>
>  err_mmio:
> -       iounmap(gmu->mmio);
> +       devm_iounmap(gmu->dev ,gmu->mmio);
>
>         /* Drop reference taken in of_find_device_by_node */
>         put_device(gmu->dev);
> @@ -1825,9 +1825,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>         dev_pm_domain_detach(gmu->cxpd, false);
>
>  err_mmio:
> -       iounmap(gmu->mmio);
> +       devm_iounmap(gmu->dev ,gmu->mmio);
>         if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> -               iounmap(gmu->rscc);
> +               devm_iounmap(gmu->dev ,gmu->rscc);
>         free_irq(gmu->gmu_irq, gmu);
>         free_irq(gmu->hfi_irq, gmu);
>
>
> ---
> base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
> change-id: 20240511-msm-adreno-memory-region-2bcb1c958621
>
> Best regards,
> --
> Kiarash Hajian <kiarash8112hajian@gmail.com>
>


-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC68C3398
	for <lists+freedreno@lfdr.de>; Sat, 11 May 2024 21:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4477910E082;
	Sat, 11 May 2024 19:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SpCPzTSV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02D710E082
 for <freedreno@lists.freedesktop.org>; Sat, 11 May 2024 19:50:11 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-de603e3072dso3540643276.1
 for <freedreno@lists.freedesktop.org>; Sat, 11 May 2024 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715457010; x=1716061810; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F3s0BYtwV5QP2poIgqh39ZmRBGGeeft/DMBZxm9dZ+c=;
 b=SpCPzTSVF+FMyVBk47VotCQ8FzKZKozbulTtjC+nWaUfwzD9ymWvYlSYvRxApx5QIC
 coOwRzr55NrRIYGU9vH12FD4RofvoQMTfg4SemKeDPhM9r6XDAWMF5Tx7katOzZLUbrc
 Q8oth+CaAC0YJnp7S7p9WBHJ1+3lZTXmVq6NGub46Sxx7h+paxqbRQrn07hJxB6mB//u
 qQ/RWJxAw9Au9zK1RyoX31vyzIkgPyRSDQXh61C5vzLJ/JvNyvLIr8Iz71CyxjYzrdTJ
 ssC2aKSQsEP207Y1YrU/Yw+FwDzaCFr8k9GdGrpcbsNZ0iz/+xvgLUESiu3Lfp//GTcG
 3I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715457010; x=1716061810;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F3s0BYtwV5QP2poIgqh39ZmRBGGeeft/DMBZxm9dZ+c=;
 b=ZugmvvDD8lsK3zm/AYjgfN5h/wwI/aqVdgwUb6SpevT3NrDuv02eVj8mspONijbTb1
 L0AxOQQ7taFoxIkwwpnElsCgkM7Cbz1+TiFq5FVUziYbR2qG+FmGdB+djf5Jqz5Q9hvk
 wjsV1lnDpeSqWWyr9bhkPDAXMi779AjwfKNn0RzuO0dSyWxL1rYrNx69OiGrkV2GIZvV
 jFk/nOL+8oHvCwlJ2IuUb5izBzAraSIbgl2VZkR+ISKbOTOuVwgQxkurpKvZ/FU7cGVr
 C4zAodXjYQDjZTBgQXSvqBNucu7QPMnnf+w+Pd5rke112G8ezaM3I3fniWVAvyPY1KKz
 tQCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWGdQWtY4hJZ7YYTaspw5k2siqlN0Vt9Hwm91CqYG/C/PjHAy5TsLMtA2QbA/rlIQR2K5QaJMM8y092tOCX9eMI8mDi9VUYRwjX44oGCWY
X-Gm-Message-State: AOJu0YwoX+RIBVRv5bectkqF4CkGaZy8x+pb9lMFPD122G592QRCVNnw
 UWCc0veSMDVhiwoQldi4FpqRFarxnM5ZwlOlVCO8ZdVW7kFkbtpzovSgU0KvnISq8rPP2GZXlsQ
 9I4KO7VZy93mTKMh0gsZg9ER1dTpnJxFniIlZIw==
X-Google-Smtp-Source: AGHT+IH9oytgieimnJ6EUHW02efq8o7XP9X5e1CpiXtKNoPTUQJ83yI9IK5vGxbcwkH+3Dtqr7EKoZaRHYG6zBFUUaY=
X-Received: by 2002:a25:b1a3:0:b0:dee:5cb6:483c with SMTP id
 3f1490d57ef6-dee5cb64977mr4069754276.49.1715457010482; Sat, 11 May 2024
 12:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240511-msm-adreno-memory-region-v1-1-d73970717d42@gmail.com>
In-Reply-To: <20240511-msm-adreno-memory-region-v1-1-d73970717d42@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 11 May 2024 22:49:59 +0300
Message-ID: <CAA8EJprdnzvhx50DVHBRLZGkk4GNuCXaBiXt3wfNv-xm2AWOvg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: request memory region
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

On Sat, 11 May 2024 at 22:35, Kiarash Hajian
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

Is there any reason to keep devm_iounmap calls? IMO with the devres
management in place, there should be no need to unmap them manually.

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

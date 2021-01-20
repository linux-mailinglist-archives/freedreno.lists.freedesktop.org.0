Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B302FD535
	for <lists+freedreno@lfdr.de>; Wed, 20 Jan 2021 17:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C236E0C5;
	Wed, 20 Jan 2021 16:16:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C655B6E0C5
 for <freedreno@lists.freedesktop.org>; Wed, 20 Jan 2021 16:16:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id y187so3333759wmd.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Jan 2021 08:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SvG9Qr2zxUy5HyLVR4TgZLHsdMEzZtUjpB7xdPk8iSo=;
 b=foNTPOf8c+UYplpTCoGSwxPK1EmUKrmf6sJTjd2gLaS7nJjsQn6xbawNYYd+tezQc+
 arbDC0ePsRaAkkz6RBjrAZLdietm994fw6geddCUB9SCUzhGOO+eVLDcbU0PKqx7a7Jx
 TrmCc5OeB7DUkLFGkGLxer9QJ3uCZVbnERwHXa7+JvnSoDK5YzB1fQ3M/d9hDpZ1jnz+
 emVXR8AMPOA0YekeKssClkox+UUiBWalTiiCz9vIXbQK0i0AW/CuL4tdLWUgqR5kY5pF
 MawgMrEPME9I4C7QyJwFRSamTPwMHse0025M+fWLHmdvNbPgZrhAqn+KBYDeCrFhtFZt
 7OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SvG9Qr2zxUy5HyLVR4TgZLHsdMEzZtUjpB7xdPk8iSo=;
 b=B8wScRJkMSsJgEOMU7tLwxJ12E6E72PduCHaD5/jpbNBiUTI7xxZY9tIPBtRCMC4fy
 AFLL5aYAbF2LXV6uW7ojCw/aCqKJE7gdAGI2Ojnlsfe2SGFIMhzb64CAP/z/D6bdN41t
 OBUFaEsoQN+DT593aAbSQZ0HHAWDL3nwnGYgH/1BM09w/emzfXIySIwHVuJ25U3biaD9
 44Q0nLw+6q5UluhwngVwaLdLq1JkwtHq5tOmchm4qdboX8FiWFXgvjlijo6QRbiREeYQ
 Vci0MwhFyJXglb6f//CwTLyMxqMRBM93/J7LkX89Fibv0uXHw7ayKepotccWe+EaHs1S
 1Gzg==
X-Gm-Message-State: AOAM5304M/khvMJBTYnWoHa2/3m5LPzAARNy0LJg306S0O8XzI6nE/O8
 ttMlQ9e81RUL5o1bm/2SoRQBAodAIBCiGi62LNk=
X-Google-Smtp-Source: ABdhPJyUmdsXwHY6xIrZFhH9Qci48NyQWyQe8RwEA6yHxrd8yfk5o2NElr9E1IQrNnrG0TCdTmxXvSXJCW2uIQTPMss=
X-Received: by 2002:a1c:7d8e:: with SMTP id y136mr5244762wmc.94.1611159375225; 
 Wed, 20 Jan 2021 08:16:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
 <c5848b1c15765c8d6db7de2305baac856e818f12.1610366113.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <c5848b1c15765c8d6db7de2305baac856e818f12.1610366113.git.saiprakash.ranjan@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Jan 2021 08:18:40 -0800
Message-ID: <CAF6AEGszGhdKKq+tW0hKxiE22_+9MUh1hXg3p+7XDo_G51pmSg@mail.gmail.com>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/a6xx: Create an A6XX GPU
 specific address space
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Kristian H Kristensen <hoegsberg@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 angelogioacchino.delregno@somainline.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 4:04 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> A6XX GPUs have support for last level cache(LLC) also known
> as system cache and need to set the bus attributes to
> use it. Currently we use a generic adreno iommu address space
> implementation which are also used by older GPU generations
> which do not have LLC and might introduce issues accidentally
> and is not clean in a way that anymore additions of GPUs
> supporting LLC would have to be guarded under ifdefs. So keep
> the generic code separate and make the address space creation
> A6XX specific. We also have a helper to set the llc attributes
> so that if the newer GPU generations do support them, we can
> use it instead of open coding domain attribute setting for each
> GPU.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 46 ++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 23 +++++--------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  7 ++--
>  3 files changed, 55 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 3b798e883f82..3c7ad51732bb 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1239,6 +1239,50 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
>         return (unsigned long)busy_time;
>  }
>
> +static struct msm_gem_address_space *
> +a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
> +{
> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +       struct iommu_domain *iommu;
> +       struct msm_mmu *mmu;
> +       struct msm_gem_address_space *aspace;
> +       u64 start, size;
> +
> +       iommu = iommu_domain_alloc(&platform_bus_type);
> +       if (!iommu)
> +               return NULL;
> +
> +       /*
> +        * This allows GPU to set the bus attributes required to use system
> +        * cache on behalf of the iommu page table walker.
> +        */
> +       if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> +               adreno_set_llc_attributes(iommu);
> +
> +       mmu = msm_iommu_new(&pdev->dev, iommu);
> +       if (IS_ERR(mmu)) {
> +               iommu_domain_free(iommu);
> +               return ERR_CAST(mmu);
> +       }
> +
> +       /*
> +        * Use the aperture start or SZ_16M, whichever is greater. This will
> +        * ensure that we align with the allocated pagetable range while still
> +        * allowing room in the lower 32 bits for GMEM and whatnot
> +        */
> +       start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> +       size = iommu->geometry.aperture_end - start + 1;
> +
> +       aspace = msm_gem_address_space_create(mmu, "gpu",
> +               start & GENMASK_ULL(48, 0), size);
> +
> +       if (IS_ERR(aspace) && !IS_ERR(mmu))
> +               mmu->funcs->destroy(mmu);
> +
> +       return aspace;
> +}
> +
>  static struct msm_gem_address_space *
>  a6xx_create_private_address_space(struct msm_gpu *gpu)
>  {
> @@ -1285,7 +1329,7 @@ static const struct adreno_gpu_funcs funcs = {
>                 .gpu_state_get = a6xx_gpu_state_get,
>                 .gpu_state_put = a6xx_gpu_state_put,
>  #endif
> -               .create_address_space = adreno_iommu_create_address_space,
> +               .create_address_space = a6xx_create_address_space,
>                 .create_private_address_space = a6xx_create_private_address_space,
>                 .get_rptr = a6xx_get_rptr,
>         },
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index b35914de1b27..0f184c3dd9d9 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -186,11 +186,18 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>         return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>
> +void adreno_set_llc_attributes(struct iommu_domain *iommu)
> +{
> +       struct io_pgtable_domain_attr pgtbl_cfg;
> +
> +       pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;

btw, since quirks is the only field in the struct currently, this is
ok.  But better practice to do something like:

        struct io_pgtable_domain_attr pgtbl_cfg = {
                .quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA,
        };

which will zero-initialize any additional fields which might be added
later, rather than inherit random garbage from the stack.

BR,
-R

> +       iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
> +}
> +
>  struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
>                 struct platform_device *pdev)
>  {
> -       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         struct iommu_domain *iommu;
>         struct msm_mmu *mmu;
>         struct msm_gem_address_space *aspace;
> @@ -200,20 +207,6 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
>         if (!iommu)
>                 return NULL;
>
> -       if (adreno_is_a6xx(adreno_gpu)) {
> -               struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -               struct io_pgtable_domain_attr pgtbl_cfg;
> -
> -               /*
> -                * This allows GPU to set the bus attributes required to use system
> -                * cache on behalf of the iommu page table walker.
> -                */
> -               if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice)) {
> -                       pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> -                       iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
> -               }
> -       }
> -
>         mmu = msm_iommu_new(&pdev->dev, iommu);
>         if (IS_ERR(mmu)) {
>                 iommu_domain_free(iommu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index b3d9a333591b..2a3d049b46b5 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -212,11 +212,6 @@ static inline int adreno_is_a540(struct adreno_gpu *gpu)
>         return gpu->revn == 540;
>  }
>
> -static inline bool adreno_is_a6xx(struct adreno_gpu *gpu)
> -{
> -       return ((gpu->revn < 700 && gpu->revn > 599));
> -}
> -
>  static inline int adreno_is_a618(struct adreno_gpu *gpu)
>  {
>         return gpu->revn == 618;
> @@ -278,6 +273,8 @@ struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
>                 struct platform_device *pdev);
>
> +void adreno_set_llc_attributes(struct iommu_domain *iommu);
> +
>  /*
>   * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
>   * out of secure mode
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

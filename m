Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9802FD57C
	for <lists+freedreno@lfdr.de>; Wed, 20 Jan 2021 17:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95A789D84;
	Wed, 20 Jan 2021 16:25:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1806D6E3B7
 for <freedreno@lists.freedesktop.org>; Wed, 20 Jan 2021 16:25:36 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c12so5144431wrc.7
 for <freedreno@lists.freedesktop.org>; Wed, 20 Jan 2021 08:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VmXJoFPWI+nCHNQVvQy5enpCPwkoasKdaNpv7FpReEE=;
 b=gbdDcwr9MaO655fZV8zDxW2US1eB/jIoOrvDvPMuYukOhpC07vfiJHfCsFgxOUjLVG
 LiuS/oDOobIfjOliuWaY4wsgM/Z/haexUS9Nec4sh0ofr7Gcp3E6andMt2xUrpARJeBs
 /PwBc4rTVwgax5Ms2fHwokiXfeGzHz5bfAU2Yqk6flk07j/fKb2j2IUFuOVFvtiI8WqH
 gikl2Be5idSiRZoSUUwgsYlihKiyFo9N8sPA5v7ndift6b+yqdFG/THHEbyXbXD/0MZF
 phy1lDgMS/NLZR2+vTnKM1U26KnDE+iHvzeKkVEIlnTE27alr04QF/V4bP5x+jLH79Dl
 cavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VmXJoFPWI+nCHNQVvQy5enpCPwkoasKdaNpv7FpReEE=;
 b=tc0H/fECDG33dg+HH/o29iAkVv1hLmfpKR6Kvr9HJ+2iZxCvdb/2MSPmlJ7yEYkUdI
 v6q6j039YfIiJOdisQOIasxO8RkCJNO9dfmTMZaL+LUPbjx75Zlcz6Y4EyHo/Z3tQMZh
 8avVq8SBH2ra5S9cR+nB0WkrmqF2NOmWtCGBpmszZptcWWzJ7mk7Li1ZBqjNe/Okk5Nn
 nagtVrbpGpt1YtvlE08bh7oFV/3pk3/LyJXyE8d2te7LbjdPx32L4w9zVVb+J2xiXBJv
 JCOL00pGbnSyfBqekoPV3VGnYL9ifOdPzrc8pIrT7KQyL5jYGbhWc0mJiowCHUZZencw
 FZIw==
X-Gm-Message-State: AOAM531zdKWp2UwSuyYkxto/e/kYZ535uyCdsyb+bZdGzqAufyAQahnz
 XTPzEBBsmrcmSF0iZGAQOMWLPEd4FOC54yJOvag=
X-Google-Smtp-Source: ABdhPJxoBB1Q2esqxKIL9GToqwG7o04UAnfs2StN8gvl+kvad1N7bRt+vpKwZXEbmb8vvPvjkejaY4/5dVFSCByZS8Y=
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr10214939wrv.132.1611159933614; 
 Wed, 20 Jan 2021 08:25:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
 <c5848b1c15765c8d6db7de2305baac856e818f12.1610366113.git.saiprakash.ranjan@codeaurora.org>
 <1120efd2-151b-4643-9a57-c15c46ab6e16@somainline.org>
In-Reply-To: <1120efd2-151b-4643-9a57-c15c46ab6e16@somainline.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Jan 2021 08:27:58 -0800
Message-ID: <CAF6AEGvKreWA0bjwHfnp6oKksqW70hBWMn857xzbs9bUeti-Eg@mail.gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Kristian H Kristensen <hoegsberg@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 3:04 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Il 11/01/21 13:04, Sai Prakash Ranjan ha scritto:
> > A6XX GPUs have support for last level cache(LLC) also known
> > as system cache and need to set the bus attributes to
> > use it. Currently we use a generic adreno iommu address space
> > implementation which are also used by older GPU generations
> > which do not have LLC and might introduce issues accidentally
> > and is not clean in a way that anymore additions of GPUs
> > supporting LLC would have to be guarded under ifdefs. So keep
> > the generic code separate and make the address space creation
> > A6XX specific. We also have a helper to set the llc attributes
> > so that if the newer GPU generations do support them, we can
> > use it instead of open coding domain attribute setting for each
> > GPU.
> >
>
> Hello!
>
> > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 46 ++++++++++++++++++++++++-
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 23 +++++--------
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.h |  7 ++--
> >   3 files changed, 55 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index 3b798e883f82..3c7ad51732bb 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1239,6 +1239,50 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
> >       return (unsigned long)busy_time;
> >   }
> >
> > +static struct msm_gem_address_space *
> > +a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
> > +{
> > +     struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > +     struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > +     struct iommu_domain *iommu;
> > +     struct msm_mmu *mmu;
> > +     struct msm_gem_address_space *aspace;
> > +     u64 start, size;
> > +
> > +     iommu = iommu_domain_alloc(&platform_bus_type);
> > +     if (!iommu)
> > +             return NULL;
> > +
> > +     /*
> > +      * This allows GPU to set the bus attributes required to use system
> > +      * cache on behalf of the iommu page table walker.
> > +      */
> > +     if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> > +             adreno_set_llc_attributes(iommu);
> > +
> > +     mmu = msm_iommu_new(&pdev->dev, iommu);
> > +     if (IS_ERR(mmu)) {
> > +             iommu_domain_free(iommu);
> > +             return ERR_CAST(mmu);
> > +     }
> > +
> > +     /*
> > +      * Use the aperture start or SZ_16M, whichever is greater. This will
> > +      * ensure that we align with the allocated pagetable range while still
> > +      * allowing room in the lower 32 bits for GMEM and whatnot
> > +      */
> > +     start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> > +     size = iommu->geometry.aperture_end - start + 1;
> > +
> > +     aspace = msm_gem_address_space_create(mmu, "gpu",
> > +             start & GENMASK_ULL(48, 0), size);
> > +
> > +     if (IS_ERR(aspace) && !IS_ERR(mmu))
> > +             mmu->funcs->destroy(mmu);
> > +
> > +     return aspace;
> > +}
> > +
>
> I get what you're trying to do - yes the intentions are good, however...
> you are effectively duplicating code 1:1, as this *is* the same as
> function adreno_iommu_create_address_space.

I had suggested moving this to a6xx, to avoid breaking earlier gens so
much..  (Note a2xx by necessity already has it's own version of
create_address_space().) I would in general tend to favor a small bit
of code duplication to lower the risk of breaking older gens which not
everybody has hw to test.

But I suppose we could add a has_llcc() and move the htw_llc_slice up
to the 'struct adreno_gpu' level.  Casting to a6xx_gpu in common code
isn't a great idea.  Older gens which don't have LLCC (or don't have
LLCC support yet) could leave the slice ptr NULL.

BR,
-R

> I don't see adding two lines to a function as a valid justification to
> duplicate all the rest: perhaps, you may want to find another way to do
> this;
>
> Here's one of the many ideas, perhaps you could:
> 1. Introduce a "generic feature" to signal LLCC support (perhaps in
>     struct adreno_info ?)
> 2. If LLCC is supported, and LLCC slices are initialized, set the LLCC
>     attributes on the IOMMU. Of course this would mean passing the init
>     state of the slices (maybe just a bool would be fine) back to the
>     generic adreno_gpu.c
>
> This, unless you tell me that the entire function is going to be a6xx
> specific, but that doesn't seem to be the case at all.
>
> Concerns are that when an hypotetical Adreno A7XX comes and perhaps also
> uses the LLCC slices, this function will be duplicated yet another time.
>
> >   static struct msm_gem_address_space *
> >   a6xx_create_private_address_space(struct msm_gpu *gpu)
> >   {
> > @@ -1285,7 +1329,7 @@ static const struct adreno_gpu_funcs funcs = {
> >               .gpu_state_get = a6xx_gpu_state_get,
> >               .gpu_state_put = a6xx_gpu_state_put,
> >   #endif
> > -             .create_address_space = adreno_iommu_create_address_space,
> > +             .create_address_space = a6xx_create_address_space,
> >               .create_private_address_space = a6xx_create_private_address_space,
> >               .get_rptr = a6xx_get_rptr,
> >       },
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index b35914de1b27..0f184c3dd9d9 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -186,11 +186,18 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
> >       return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
> >   }
> >
> > +void adreno_set_llc_attributes(struct iommu_domain *iommu)
>
> Since this function is relative to the iommu part of this driver, I
> think that it would be appropriate to give it the same prefix as all
> the other functions that are "working in this context".
> Hint: adreno_iommu_set_llc_attributes
> Alternatively, this two lines function may just be a static inline in
> the header....
>
>
> But then, what are we talking about, here?
> Since you should stop code duplication and bring everything back in
> here (in a generic way!!!), then this helper would be of no use, at all,
> because then you would be just "throwing" these two lines back in the
> function adreno_iommu_create_address_space....
>
>
> > +{
> > +     struct io_pgtable_domain_attr pgtbl_cfg;
> > +
> > +     pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> > +     iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
> > +}
> > +
> >   struct msm_gem_address_space *
> >   adreno_iommu_create_address_space(struct msm_gpu *gpu,
> >               struct platform_device *pdev)
> >   {
> > -     struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> >       struct iommu_domain *iommu;
> >       struct msm_mmu *mmu;
> >       struct msm_gem_address_space *aspace;
> > @@ -200,20 +207,6 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
> >       if (!iommu)
> >               return NULL;
> >
> > -     if (adreno_is_a6xx(adreno_gpu)) {
> > -             struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > -             struct io_pgtable_domain_attr pgtbl_cfg;
> > -
> > -             /*
> > -              * This allows GPU to set the bus attributes required to use system
> > -              * cache on behalf of the iommu page table walker.
> > -              */
> > -             if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice)) {
> > -                     pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> > -                     iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
> > -             }
> > -     }
> > -
> >       mmu = msm_iommu_new(&pdev->dev, iommu);
> >       if (IS_ERR(mmu)) {
> >               iommu_domain_free(iommu);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > index b3d9a333591b..2a3d049b46b5 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -212,11 +212,6 @@ static inline int adreno_is_a540(struct adreno_gpu *gpu)
> >       return gpu->revn == 540;
> >   }
> >
> > -static inline bool adreno_is_a6xx(struct adreno_gpu *gpu)
> > -{
> > -     return ((gpu->revn < 700 && gpu->revn > 599));
> > -}
> > -
> >   static inline int adreno_is_a618(struct adreno_gpu *gpu)
> >   {
> >          return gpu->revn == 618;
> > @@ -278,6 +273,8 @@ struct msm_gem_address_space *
> >   adreno_iommu_create_address_space(struct msm_gpu *gpu,
> >               struct platform_device *pdev);
> >
> > +void adreno_set_llc_attributes(struct iommu_domain *iommu);
> > +
> >   /*
> >    * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
> >    * out of secure mode
> >
>
> Regards,
> - Angelo
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

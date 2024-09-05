Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC3E96E0A6
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 19:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A2210E919;
	Thu,  5 Sep 2024 17:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pr+MxyVO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDAC10E919
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 17:00:36 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-39f51371baeso3533695ab.3
 for <freedreno@lists.freedesktop.org>; Thu, 05 Sep 2024 10:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725555635; x=1726160435; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZV/Ct62i0SWe/eQOuu8hbmxJsUYcvz+0fB6177mZLk=;
 b=Pr+MxyVO6ClFNBfolkYcWHDl0NOKVn2FoHdCJz2qjVi80rp/p1IugGCSR0/Em2HPP3
 tcggU4Vtc7u+zBowyp38eInywAuS9Fcl4mBjajuLminmwyrpq8XEDeJz6lxHrEK3hniZ
 ErJe9jo5xX7NRtqV+QZq2G5KnnluZ/lJ6vvtu7V/Md/KxFW+228EM4q5AtmGh/4R/aUP
 hDV9C/TM9GdvPOWLBwHAndmJOrsZ/oTfxoYba7bn4J3kYaPeTfSxIGYLiqVi7r3Rf5cF
 UKAhXlnzjNvWiZFkkV6zLkb0Dzy7mtqpuwm/jog9hZZyomoqY/LGY3uke72wflRtGBLK
 C9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725555635; x=1726160435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZV/Ct62i0SWe/eQOuu8hbmxJsUYcvz+0fB6177mZLk=;
 b=mZ8fxYZcxAp7EOILuV+xgqdkZx9YZGfy6uZMtlOMx4dk3rldku6qC2b1KOlJTBCUZ5
 vYjoIaFXqlL6I5VqUjkIdGEltqMrRp9VTKaOm+5XhMOAe8WFaHCYTbSm8wnSWDGtrMnA
 ufdZZK+JCestHL60uMrw1OxM6MFMefvbIfuzyILTPqlNJRwYo4AvADBXgrSCwvTd1il3
 RHOJE5/KotQo8+8sKmwl+pRBsw9GuT7KSaCBLUNPyyy8UtJOK/+CvYroZcKgfojjCprA
 WX2HHUhJ49/eM/vsdBwjW2uQd5pulLJpHMsXqgYNETJgIGVX5xViMHSHo2Ak+Xxfixgj
 ZKlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDGnywhSfTSPeYZ4pxnkfoXBMwrczqOeMOmXL75odDfLi9odFZquR+bhYB5BX58YKIbWGQm1+izhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMd7GDtuJNwgYgyZI4tRDg7s5Ky42lYgJjtFMuau2y+pDOdWJa
 KPPLVAbdeGHTjtoGm/sk5InaEiKA6Sb4P4ffPyO66vxetb25xv/tx2teoBWok0HB9DxfuBGDY0J
 Dkx5tXO6GlaZZ9c7R5t+qaTFjZ3c=
X-Google-Smtp-Source: AGHT+IG3fVJMj8X+QupsVk+lbXCJzCFrxGLdE4Y0iBpJXuWEfA4+fZ1P0PS+T7tA6d644LYLD2Q7k7jx/OI0IyXRgj8=
X-Received: by 2002:a05:6e02:1545:b0:3a0:4255:1912 with SMTP id
 e9e14a558f8ab-3a042551a3bmr75420225ab.10.1725555634840; Thu, 05 Sep 2024
 10:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240905124956.84932-1-robdclark@gmail.com>
 <20240905155330.GA15246@willie-the-truck>
 <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
In-Reply-To: <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 5 Sep 2024 10:00:22 -0700
Message-ID: <CAF6AEGs3aRXbnnhD84GBbz9wJmyNR=dA3hbGuMLcM22Vs8CU_g@mail.gmail.com>
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent unmap"
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Ashish Mhetre <amhetre@nvidia.com>, 
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, 
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 5, 2024 at 9:27=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 05/09/2024 4:53 pm, Will Deacon wrote:
> > Hi Rob,
> >
> > On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> >>
> >> It was causing gpu smmu faults on x1e80100.
> >>
> >> I _think_ what is causing this is the change in ordering of
> >> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> >> memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
> >> this patch is supposed to work correctly in the face of other
> >> concurrent translations (to buffers unrelated to the one being
> >> unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
> >> stale data read back into the tlb.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >>   drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
> >>   1 file changed, 14 insertions(+), 17 deletions(-)
> >
> > Please can you try the diff below, instead?
>
> Given that the GPU driver's .tlb_add_page is a no-op, I can't see this
> making a difference. In fact, given that msm_iommu_pagetable_unmap()
> still does a brute-force iommu_flush_iotlb_all() after io-pgtable
> returns, and in fact only recently made .tlb_flush_walk start doing
> anything either for the sake of the map path, I'm now really wondering
> how this patch has had any effect at all... :/

Yeah..  and unfortunately the TBU code only supports two devices so
far, so I can't easily repro with TBU enabled atm.  Hmm..
__arm_lpae_unmap() is also called in the ->map() path, although not
sure how that changes things.

BR,
-R

> >
> > Will
> >
> > --->8
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index 0e67f1721a3d..0a32e9499e2c 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -672,7 +672,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_p=
gtable *data,
> >                  /* Clear the remaining entries */
> >                  __arm_lpae_clear_pte(ptep, &iop->cfg, i);
> >
> > -               if (gather && !iommu_iotlb_gather_queued(gather))
> > +               if (!iommu_iotlb_gather_queued(gather))
>
> Note that this would reintroduce the latent issue which was present
> originally, wherein iommu_iotlb_gather_queued(NULL) is false, but if we
> actually allow a NULL gather to be passed to io_pgtable_tlb_add_page()
> it may end up being dereferenced (e.g. in arm-smmu-v3).
>
> Thanks,
> Robin.
>
> >                          for (int j =3D 0; j < i; j++)
> >                                  io_pgtable_tlb_add_page(iop, gather, i=
ova + j * size, size);
> >

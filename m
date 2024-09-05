Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C83C96E0D5
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 19:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F355710E91D;
	Thu,  5 Sep 2024 17:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N40O89ag";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4230B10E91D
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 17:10:44 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-39f4fed788bso3774565ab.3
 for <freedreno@lists.freedesktop.org>; Thu, 05 Sep 2024 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725556243; x=1726161043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TugYWWTmfA5+0ZqiY0zoD9lJrHPCBxbgSyyl1t8wKjk=;
 b=N40O89agRyINpD39t98XOZJEkw61x2Snl0/LdNMqOVw7aCYs/A+nOmFXx/opmZcJpV
 eyN1bnz5hq/K1crGgTmHwXBkTXsX7rQ+YwYadLjxfYkot34gO9Rm7OYi4ODJ00A5hniG
 ue/aRB0z/0xO3O3LppTGcpE4YMb8s11/IN0yY9dPHH+oUqcG3VM6/3pH0FVvNQ4PIRoC
 ZDM/yb/tLpINEkjN0I5CNSnMD68+fjUGOHR4HzVKS/BbZX7ClvtDdw55WZbcECFvwCZR
 XKwf/wAnf/pOG+sLHr7/+Y+7sPd9djk8K+GQQcUvYOUVzpufPk5hd4LOEWRsUVIIQd1S
 CqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725556243; x=1726161043;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TugYWWTmfA5+0ZqiY0zoD9lJrHPCBxbgSyyl1t8wKjk=;
 b=apQHI+xQ7rG9JG58odXXnlXH9CDfkKpt3h85iC21mRMQIBfG8TQaUDGeD78X3Z1mW3
 334Zs3yQ8g5QT0er7iNjb1SK/mPcuZ/fvYignr7IuNuQpdWOAbwsgTcEItynxXtJAQPI
 /f6rLqWsneZlbvqpHJAhiTjB9nW/yIjO/Czu1ba5y1c/9qLLe5oG1ewh3Mgvf/mh89ol
 eV1brHDwpT9PwC55HI764E+ztwCJFA8Uk2CVutjStn/vKRkVyBwJRikUqvMDKd/H570h
 V382acdBes9FGdvTJ2NA5R411mqZ/vhvY7hoNsSwEsjXijPZobmoHTDDXv+CdcDUIb3t
 2g3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC/A95gUvW473k2mu3/JMNl7p1LMmHuEBF3aXJ5T0xMYiOOrDxO9wlIdGKjzEmsr2CtzZTTqF0Tb8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHIBBmvPccfYsZ1rtB67JscMvpFzIEKaJkOW3eZB6jaF3rZczk
 R66a3hVGBY18vmw3tyAw5+Q66bMkxHGpeLRpKN44jQCfwneo90WQOWElpQS2KFZ9mru8lUIRiCN
 Bi932GCwkQFW4a/Gq9XdSs0Hen/U=
X-Google-Smtp-Source: AGHT+IH5kHkyh4TQY9qQMpV4jTCKCy2lyxsS5qWD7hz50R2gl4bk5tUOxy/O9US635pYUshC6lF6+mLFwVVPNAM4HVQ=
X-Received: by 2002:a05:6e02:148e:b0:3a0:4d72:7f5e with SMTP id
 e9e14a558f8ab-3a04d7282c9mr15898065ab.7.1725556243238; Thu, 05 Sep 2024
 10:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240905124956.84932-1-robdclark@gmail.com>
 <20240905155330.GA15246@willie-the-truck>
 <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
 <CAF6AEGs3aRXbnnhD84GBbz9wJmyNR=dA3hbGuMLcM22Vs8CU_g@mail.gmail.com>
In-Reply-To: <CAF6AEGs3aRXbnnhD84GBbz9wJmyNR=dA3hbGuMLcM22Vs8CU_g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 5 Sep 2024 10:10:31 -0700
Message-ID: <CAF6AEGsqdxO4+kaz6jOLBS_syjEkZg-7Veqh3j-o=RiGNcBH8A@mail.gmail.com>
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

On Thu, Sep 5, 2024 at 10:00=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Thu, Sep 5, 2024 at 9:27=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
> >
> > On 05/09/2024 4:53 pm, Will Deacon wrote:
> > > Hi Rob,
> > >
> > > On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
> > >> From: Rob Clark <robdclark@chromium.org>
> > >>
> > >> This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> > >>
> > >> It was causing gpu smmu faults on x1e80100.
> > >>
> > >> I _think_ what is causing this is the change in ordering of
> > >> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> > >> memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
> > >> this patch is supposed to work correctly in the face of other
> > >> concurrent translations (to buffers unrelated to the one being
> > >> unmapped(), because after the io_pgtable_tlb_flush_walk() we can hav=
e
> > >> stale data read back into the tlb.
> > >>
> > >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > >> ---
> > >>   drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++----------------=
-
> > >>   1 file changed, 14 insertions(+), 17 deletions(-)
> > >
> > > Please can you try the diff below, instead?
> >
> > Given that the GPU driver's .tlb_add_page is a no-op, I can't see this
> > making a difference. In fact, given that msm_iommu_pagetable_unmap()
> > still does a brute-force iommu_flush_iotlb_all() after io-pgtable
> > returns, and in fact only recently made .tlb_flush_walk start doing
> > anything either for the sake of the map path, I'm now really wondering
> > how this patch has had any effect at all... :/
>
> Yeah..  and unfortunately the TBU code only supports two devices so
> far, so I can't easily repro with TBU enabled atm.  Hmm..
> __arm_lpae_unmap() is also called in the ->map() path, although not
> sure how that changes things.

Ok, an update.. after a reboot, still with this patch reverted, I once
again see faults.  So I guess that vindicates the original patch, and
leaves me still searching..

fwiw, fault info from the gpu devcore:

-------------
fault-info:
  - ttbr0=3D0000000919306000
  - iova=3D0000000100c17000
  - dir=3DWRITE
  - type=3DUNKNOWN
  - source=3DCP
pgtable-fault-info:
  - ttbr0: 000000090ca40000
  - asid: 0
  - ptes: 000000095db47003 000000095db48003 0000000914c8f003 00000008fd7f0f=
47
-------------

the 'ptes' part shows the table walk, which looks ok to me..

BR,
-R

> BR,
> -R
>
> > >
> > > Will
> > >
> > > --->8
> > >
> > > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtabl=
e-arm.c
> > > index 0e67f1721a3d..0a32e9499e2c 100644
> > > --- a/drivers/iommu/io-pgtable-arm.c
> > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > @@ -672,7 +672,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io=
_pgtable *data,
> > >                  /* Clear the remaining entries */
> > >                  __arm_lpae_clear_pte(ptep, &iop->cfg, i);
> > >
> > > -               if (gather && !iommu_iotlb_gather_queued(gather))
> > > +               if (!iommu_iotlb_gather_queued(gather))
> >
> > Note that this would reintroduce the latent issue which was present
> > originally, wherein iommu_iotlb_gather_queued(NULL) is false, but if we
> > actually allow a NULL gather to be passed to io_pgtable_tlb_add_page()
> > it may end up being dereferenced (e.g. in arm-smmu-v3).
> >
> > Thanks,
> > Robin.
> >
> > >                          for (int j =3D 0; j < i; j++)
> > >                                  io_pgtable_tlb_add_page(iop, gather,=
 iova + j * size, size);
> > >

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD78496DAF2
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 15:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897BB10E8CB;
	Thu,  5 Sep 2024 13:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DD6s9dJu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905AD10E8CA
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 13:57:35 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-39f4827a07aso2627365ab.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Sep 2024 06:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725544655; x=1726149455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oc5+mSx3W5XFfGXytntTUzm4xnx4wnnrB9kh6mhBy6M=;
 b=DD6s9dJuSH/WxuC5kGISbxY/gWwvg8InYUFzc6l69OtxwzqfpDwn9Kc63Ni52qQMZV
 RLihMPjlTbQegPvy7MkAMAFpcvhB0SKLzF4W3i7DzSYHK5jfobGlQTLOwnATSTmLNTbF
 DJma8YQRA6DaIyUffPyShG9iCuizsk+9ypmJJvm804E6WthE9YKQdfjPCKY1nCc8BvHo
 CqeaFS/SuXCZpTyCQfaDuBPXOZKsDcKHGRMvv/AS7h5//edkYFY+MoIF7TBFr5b+h/2u
 Xzo6CPnW2FtOKC7hnSsnKiPYeoZKarTFS58ejNAFVJx1avyiOB0A+fNh7E9E3k1QsNXx
 y2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725544655; x=1726149455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oc5+mSx3W5XFfGXytntTUzm4xnx4wnnrB9kh6mhBy6M=;
 b=nk7sfeOIQ7/1deJqr3ynmGPaBI8m2jvk1tAvDVGv80qsmbJVj5zK13CiUdnU8/6Lra
 3BS87XqQlagomlBHSrIyvUyoA0QjrMgundjn+lnMFoZ9LAfhq/eaKJV27fALps3pFr3V
 bHNUj0OKe+ablTAGmvI8fDNKvbpsHK3pMWFfkp/01BTBkTOu1ouCkic3oepUooVfOJSI
 Yt/KOR5eNObr95b3IJuR5Zpkfwjrys0z6gGsL7Wz3p+HvS3HMrVc0VrNzceMJLQDADB+
 N3Ep6LbnB4uXGJSDldXnIMTKpw6YSUvbknUjc3ErpsznLsM5BpQRqG1M08AiAvvKi0tx
 uUiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbS9hxU8+qnGNgFNMvGNdNdmqfeldzarhlEec8APLZdW08B76BhBJfuVOMjkWGJsgIfZKZnlAL9wE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEdh/7pT04KeX7/n6E0zSkQh4bIfXhrurhMmMKoT50CHxW4Mho
 PJ1d4KZQs8lGelLzFCU49oGvHWKRYClUm6rFMDJ7ge9dJPcnHrMwoe6I29ZiZ0R2ELe85SHiNbI
 ltIQMJ54LphhppkRFrIaefBoml/k=
X-Google-Smtp-Source: AGHT+IH19xIWuVYCDQUvgge4detxZmlypKKLvCBkh2uWT8rdoV0uXU1DBfLhUeWBn085IemWYq1jY9RKwCVgIwlHcUo=
X-Received: by 2002:a05:6e02:1a6d:b0:39a:ea89:22ec with SMTP id
 e9e14a558f8ab-39f4f68d785mr219239495ab.9.1725544654507; Thu, 05 Sep 2024
 06:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240905124956.84932-1-robdclark@gmail.com>
 <fb54ef8d-f769-47d5-8a9d-aa93f96d5c41@arm.com>
In-Reply-To: <fb54ef8d-f769-47d5-8a9d-aa93f96d5c41@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 5 Sep 2024 06:57:22 -0700
Message-ID: <CAF6AEGuv=yyVDx58iWU203BQPp-pT2SAC9yW-JMm2U+MTsGUaQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent unmap"
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Ashish Mhetre <amhetre@nvidia.com>, 
 Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, 
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

On Thu, Sep 5, 2024 at 6:24=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 05/09/2024 1:49 pm, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> >
> > It was causing gpu smmu faults on x1e80100.
> >
> > I _think_ what is causing this is the change in ordering of
> > __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> > memory) and io_pgtable_tlb_flush_walk().
>
> As I just commented, how do you believe the order of operations between:
>
>         __arm_lpae_clear_pte();
>         if (!iopte_leaf()) {
>                 io_pgtable_tlb_flush_walk();
>
> and:
>
>         if (!iopte_leaf()) {
>                 __arm_lpae_clear_pte();
>                 io_pgtable_tlb_flush_walk();
>
> fundamentally differs?

from my reading of the original patch, the ordering is the same for
non-leaf nodes, but not for leaf nodes

> I'm not saying there couldn't be some subtle bug in the implementation
> which we've all missed, but I still can't see an issue with the intended
> logic.
>
> >  I'm not entirely sure how
> > this patch is supposed to work correctly in the face of other
> > concurrent translations (to buffers unrelated to the one being
> > unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
> > stale data read back into the tlb.
>
> Read back from where? The ex-table PTE which was already set to zero
> before tlb_flush_walk was called?
>
> And isn't the hilariously overcomplicated TBU driver supposed to be
> telling you exactly what happened here? Otherwise I'm going to continue
> to seriously question the purpose of shoehorning that upstream at all...

I guess I could try the TBU driver.  But I already had my patchset to
extract the pgtable walk for gpu devcore dump, and that is telling me
that the CPU view of the pgtable is fine.  Which I think just leaves a
tlbinv problem.  If that is the case, swapping the order of leaf node
cpu cache ops and tlbinv ops seems like the cause.  But maybe I'm
missing something.

BR,
-R

> Thanks,
> Robin.
>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
> >   1 file changed, 14 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index 16e51528772d..85261baa3a04 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -274,13 +274,13 @@ static void __arm_lpae_sync_pte(arm_lpae_iopte *p=
tep, int num_entries,
> >                                  sizeof(*ptep) * num_entries, DMA_TO_DE=
VICE);
> >   }
> >
> > -static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtab=
le_cfg *cfg, int num_entries)
> > +static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtab=
le_cfg *cfg)
> >   {
> > -     for (int i =3D 0; i < num_entries; i++)
> > -             ptep[i] =3D 0;
> >
> > -     if (!cfg->coherent_walk && num_entries)
> > -             __arm_lpae_sync_pte(ptep, num_entries, cfg);
> > +     *ptep =3D 0;
> > +
> > +     if (!cfg->coherent_walk)
> > +             __arm_lpae_sync_pte(ptep, 1, cfg);
> >   }
> >
> >   static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
> > @@ -653,28 +653,25 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io=
_pgtable *data,
> >               max_entries =3D ARM_LPAE_PTES_PER_TABLE(data) - unmap_idx=
_start;
> >               num_entries =3D min_t(int, pgcount, max_entries);
> >
> > -             /* Find and handle non-leaf entries */
> > -             for (i =3D 0; i < num_entries; i++) {
> > -                     pte =3D READ_ONCE(ptep[i]);
> > +             while (i < num_entries) {
> > +                     pte =3D READ_ONCE(*ptep);
> >                       if (WARN_ON(!pte))
> >                               break;
> >
> > -                     if (!iopte_leaf(pte, lvl, iop->fmt)) {
> > -                             __arm_lpae_clear_pte(&ptep[i], &iop->cfg,=
 1);
> > +                     __arm_lpae_clear_pte(ptep, &iop->cfg);
> >
> > +                     if (!iopte_leaf(pte, lvl, iop->fmt)) {
> >                               /* Also flush any partial walks */
> >                               io_pgtable_tlb_flush_walk(iop, iova + i *=
 size, size,
> >                                                         ARM_LPAE_GRANUL=
E(data));
> >                               __arm_lpae_free_pgtable(data, lvl + 1, io=
pte_deref(pte, data));
> > +                     } else if (!iommu_iotlb_gather_queued(gather)) {
> > +                             io_pgtable_tlb_add_page(iop, gather, iova=
 + i * size, size);
> >                       }
> > -             }
> >
> > -             /* Clear the remaining entries */
> > -             __arm_lpae_clear_pte(ptep, &iop->cfg, i);
> > -
> > -             if (gather && !iommu_iotlb_gather_queued(gather))
> > -                     for (int j =3D 0; j < i; j++)
> > -                             io_pgtable_tlb_add_page(iop, gather, iova=
 + j * size, size);
> > +                     ptep++;
> > +                     i++;
> > +             }
> >
> >               return i * size;
> >       } else if (iopte_leaf(pte, lvl, iop->fmt)) {

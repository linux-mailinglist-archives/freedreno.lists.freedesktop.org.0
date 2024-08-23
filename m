Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6207695D439
	for <lists+freedreno@lfdr.de>; Fri, 23 Aug 2024 19:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BAF10E032;
	Fri, 23 Aug 2024 17:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ncqhK+N7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77A710E032
 for <freedreno@lists.freedesktop.org>; Fri, 23 Aug 2024 17:23:40 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5bf006f37daso3753253a12.1
 for <freedreno@lists.freedesktop.org>; Fri, 23 Aug 2024 10:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724433819; x=1725038619; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=igaQ+cq5DGxYKGyVENdg674ni4YlsPPzIF+5a4ikTl4=;
 b=ncqhK+N7SumClQMWZMUExHLtknuuA1IL//GLJz4DJX55z4ydiomufygjZv1mitya3p
 pOzpw7B0Tn/rjMmVnyKosv1S+c3rCRPDMj3XlOgVXo6tmG7eCPoYSvyLwOkDLu8HxLmt
 jVEz2gNSYBpcHsjCA1TCcBw5xOC87bgbjdPIFgkHpcrctmmW3a/kn4j7fD93aw+4q2UO
 U2kx8SeZqTrQNkqMKMq8EuqUmhstTFDjOuvHaF+vQ2yu93Y/3uBm7ijfTuOm92lIuX6k
 z/Gcx49cS601yEwXUkBixxYhKJin45d2vD4egUJ2P2Lyf9fpkMHXiS7Eu/85w4nNTzai
 VE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724433819; x=1725038619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=igaQ+cq5DGxYKGyVENdg674ni4YlsPPzIF+5a4ikTl4=;
 b=OTpsjy8kpAe7FBcXE4yfIMbWhl6JzcVUoz8O4zjvT5nc16C3FLwojK5oxhdRtxY83b
 Iuu+G34ESfQ+7Zgt00wmP/emxkoCgFormU6EB1pvp4Sw0Z5BwCjGiThhZz6MFZr0jF0u
 Ecfn2T3G7mY259ml4UkORE1s/pJbVdziq8JQ0L4Xz77aWqms9AkN/Q9z20UYow2nby7s
 nH49dqBBqGNxc8yyfCxYLBpqWBYqpvXNIFLSlUN/780020LMZYCgTqXBTsqVwrI3KDlo
 JtZTiQegc45xPJqcVVf6IiaPUgiyetHzwwI3+DVJ015Y+OFPSvYZr2WIGSVD1QuisYgg
 +FyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXufHGuQNwZRGpJUtq0sYUXHyc4afHEHWTa1eKqAU13YlZv1g3HWysmHgI6rGH5qo0uoXAOhkihejQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzVcQOvnJgNTcIV9345HIGYUmDMokX2Rwni42mmqFMcqd1M151
 fs4PuuMs4bJEnxPWxsIkMhmIRrPvG16gB4/vnzdF9jmOZSiijABUXsk3d2+ug9zPbhxdTq25nN+
 Rc96eWZZ+RgWroyljljjq3Dv4L8k=
X-Google-Smtp-Source: AGHT+IEvKoYswWA+Kv16z62fxTPQiFoASnuCbE+YY/d9Vq/hDJvvJimzLBjRmNdz9Z390iTh/rA9GLCllZDWraUA9ZU=
X-Received: by 2002:a05:6402:35ce:b0:5c0:8ff8:d7da with SMTP id
 4fb4d7f45d1cf-5c08ff8d8d6mr1124508a12.12.1724433818375; Fri, 23 Aug 2024
 10:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240820171652.145673-1-robdclark@gmail.com>
 <20240820171652.145673-2-robdclark@gmail.com>
 <20240823160929.GA851@willie-the-truck>
In-Reply-To: <20240823160929.GA851@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 23 Aug 2024 10:23:25 -0700
Message-ID: <CAF6AEGtkwjs4XLEBpo2O7W+UgbdxGoMAsYd+3Cr_qY88ofpMjQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] iommu/io-pgtable-arm: Make pgtable walker more
 generic
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Mostafa Saleh <smostafa@google.com>, 
 Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>, 
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

On Fri, Aug 23, 2024 at 9:09=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Aug 20, 2024 at 10:16:44AM -0700, Rob Clark wrote:
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index f5d9fd1f45bf..b4bc358740e0 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -747,33 +747,31 @@ static phys_addr_t arm_lpae_iova_to_phys(struct i=
o_pgtable_ops *ops,
> >  }
> >
> >  struct io_pgtable_walk_data {
> > -     struct iommu_dirty_bitmap       *dirty;
> > +     void                            *data;
> > +     int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
> > +                  arm_lpae_iopte pte, size_t size);
> >       unsigned long                   flags;
> >       u64                             addr;
> >       const u64                       end;
> >  };
> >
> > -static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *dat=
a,
> > -                                    struct io_pgtable_walk_data *walk_=
data,
> > -                                    arm_lpae_iopte *ptep,
> > -                                    int lvl);
> > +static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
> > +                              struct io_pgtable_walk_data *walk_data,
> > +                              arm_lpae_iopte *ptep,
> > +                              int lvl);
> >
> > -static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
> > -                               struct io_pgtable_walk_data *walk_data,
> > -                               arm_lpae_iopte *ptep, int lvl)
> > +static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
> > +                         struct io_pgtable_walk_data *walk_data,
> > +                         arm_lpae_iopte *ptep, int lvl)
> >  {
> >       struct io_pgtable *iop =3D &data->iop;
> >       arm_lpae_iopte pte =3D READ_ONCE(*ptep);
> >
> >       if (iopte_leaf(pte, lvl, iop->fmt)) {
> >               size_t size =3D ARM_LPAE_BLOCK_SIZE(lvl, data);
> > -
> > -             if (iopte_writeable_dirty(pte)) {
> > -                     iommu_dirty_bitmap_record(walk_data->dirty,
> > -                                               walk_data->addr, size);
> > -                     if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
> > -                             iopte_set_writeable_clean(ptep);
> > -             }
> > +             int ret =3D walk_data->visit(walk_data, lvl, pte, size);
> > +             if (ret)
> > +                     return ret;
> >               walk_data->addr +=3D size;
> >               return 0;
> >       }
> > @@ -782,13 +780,13 @@ static int io_pgtable_visit_dirty(struct arm_lpae=
_io_pgtable *data,
> >               return -EINVAL;
> >
> >       ptep =3D iopte_deref(pte, data);
> > -     return __arm_lpae_iopte_walk_dirty(data, walk_data, ptep, lvl + 1=
);
> > +     return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
> >  }
> >
> > -static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *dat=
a,
> > -                                    struct io_pgtable_walk_data *walk_=
data,
> > -                                    arm_lpae_iopte *ptep,
> > -                                    int lvl)
> > +static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
> > +                              struct io_pgtable_walk_data *walk_data,
> > +                              arm_lpae_iopte *ptep,
> > +                              int lvl)
> >  {
> >       u32 idx;
> >       int max_entries, ret;
> > @@ -803,7 +801,7 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_l=
pae_io_pgtable *data,
> >
> >       for (idx =3D ARM_LPAE_LVL_IDX(walk_data->addr, lvl, data);
> >            (idx < max_entries) && (walk_data->addr < walk_data->end); +=
+idx) {
> > -             ret =3D io_pgtable_visit_dirty(data, walk_data, ptep + id=
x, lvl);
> > +             ret =3D io_pgtable_visit(data, walk_data, ptep + idx, lvl=
);
> >               if (ret)
> >                       return ret;
> >       }
> > @@ -811,6 +809,20 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_=
lpae_io_pgtable *data,
> >       return 0;
> >  }
> >
> > +static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl=
,
> > +                    arm_lpae_iopte pte, size_t size)
> > +{
> > +     struct iommu_dirty_bitmap *dirty =3D walk_data->data;
> > +
> > +     if (iopte_writeable_dirty(pte)) {
> > +             iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
> > +             if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
> > +                     iopte_set_writeable_clean(&pte);
>
> Are you sure that's correct? I suspect we really want to update the actua=
l
> page-table in this case, so we probably want to pass the pointer in inste=
ad
> of the pte value.

oh, right

> Will

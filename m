Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807BB95D434
	for <lists+freedreno@lfdr.de>; Fri, 23 Aug 2024 19:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5780910E032;
	Fri, 23 Aug 2024 17:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YA6rs5JI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4584A10E032
 for <freedreno@lists.freedesktop.org>; Fri, 23 Aug 2024 17:22:25 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5bec78c3f85so2599123a12.1
 for <freedreno@lists.freedesktop.org>; Fri, 23 Aug 2024 10:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724433743; x=1725038543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=to9+ooQ8roiiPWwijQQKyxvjukW+kYNzLti9AMo/t7c=;
 b=YA6rs5JIF3qhaZqk24sVa4GN9WhLppqa1MsOm9wvjNh2BQK4cw94yjDc9v3zdTRuaL
 7G8nrDh/Xm4+J8IViLIIqjAWYNIvV9oM+U7IpdTS74Zu1C+WQ/NqqGrtxMZbX/M9ktcI
 ep0hQ6annwkJjlm32M5ZZ/Z/rR9dWaox50yVm2tkhSWA9NamghuTj/HpxwC5PGmTnzH+
 b9BQ8X+yWi04SoKQoIOIoAK5x7Iauj8sI8mD52zGZOZz8Rfg5Gh7d1hyXrORsgkyvJEi
 7lWUuNZ/JHidTn0zaHpd1LTko+Lt9LmeifVCls/L5Pjk1HL8mqBDx50zIALLban7i/VW
 LniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724433743; x=1725038543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=to9+ooQ8roiiPWwijQQKyxvjukW+kYNzLti9AMo/t7c=;
 b=KDJ5ClCxIQIvO9LKZWT45LDlsO8k40iw8/oE9e2L9xmzdsoXZ9CFnPoPHGoIfH7Vri
 7Baa2Iu5Bk5PPVqYcEG7LTx7Wyy/YMUX65UwrR4xBQzgvC5F9vA4U+xL/8hq49g6bLD6
 iOf5t8MNI3CvDjMVDkXsMxamhfiiO4rRwsffa/ucMMujrK4XCssEGvSMDPu8EAY3ryid
 aZCQRpMMY6jkyuqcd8BPcKGmBtJe0TxVATUexjzi5gK1phAtNAlmLovZfp+3S8QUdu5e
 qvohUrGMw9+tvxjJmqCTqd2RPfJsYnieQgJjwNDAAnfUrpU1NVUjz4ng+Qu8lZv7lMVy
 8y3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUH22hcxTya3RYm2YSQHmIXm266qfOTJvGr1Ne3v3Z6uSMWADBRkdpGjdOFlkQrfTEUIvPVrzEjvw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS/t191XUaMaqLQrQAeUZavEpuD5q5nHMmvQs95XTQ8EI2FFs4
 0a9gsi0rIIMUEQFkSqiLzqfyAH2/l+dXYSPzL9x23MzSWZauvdk5U75BfXvA2BM+2tD1mq2mG5s
 ZthfEMkAgw5HbE6Xg1pls210zRmA=
X-Google-Smtp-Source: AGHT+IFuXT0FKUkEk5+963PnUNJ3N6G9Q52jPVUXuTKK5Gcc+EuJjboxEWGL4C/ondtpTBM89q0Dd2Hl/8/TbjklQKc=
X-Received: by 2002:a05:6402:5109:b0:57c:a422:677b with SMTP id
 4fb4d7f45d1cf-5c08915f498mr2302771a12.8.1724433742982; Fri, 23 Aug 2024
 10:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240820171652.145673-1-robdclark@gmail.com>
 <20240820171652.145673-3-robdclark@gmail.com>
 <20240823161148.GB851@willie-the-truck>
In-Reply-To: <20240823161148.GB851@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 23 Aug 2024 10:22:10 -0700
Message-ID: <CAF6AEGvdKc3APaYVZ1G9iQfw22yb2MGssADhXU50MhZqp8tcrA@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk for
 iova_to_phys
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

On Fri, Aug 23, 2024 at 9:11=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Aug 20, 2024 at 10:16:45AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Re-use the generic pgtable walk path.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 73 +++++++++++++++++-----------------
> >  1 file changed, 36 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index b4bc358740e0..5fa1274a665a 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -710,42 +710,6 @@ static size_t arm_lpae_unmap_pages(struct io_pgtab=
le_ops *ops, unsigned long iov
> >                               data->start_level, ptep);
> >  }
> >
> > -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> > -                                      unsigned long iova)
> > -{
> > -     struct arm_lpae_io_pgtable *data =3D io_pgtable_ops_to_data(ops);
> > -     arm_lpae_iopte pte, *ptep =3D data->pgd;
> > -     int lvl =3D data->start_level;
> > -
> > -     do {
> > -             /* Valid IOPTE pointer? */
> > -             if (!ptep)
> > -                     return 0;
> > -
> > -             /* Grab the IOPTE we're interested in */
> > -             ptep +=3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> > -             pte =3D READ_ONCE(*ptep);
> > -
> > -             /* Valid entry? */
> > -             if (!pte)
> > -                     return 0;
> > -
> > -             /* Leaf entry? */
> > -             if (iopte_leaf(pte, lvl, data->iop.fmt))
> > -                     goto found_translation;
> > -
> > -             /* Take it to the next level */
> > -             ptep =3D iopte_deref(pte, data);
> > -     } while (++lvl < ARM_LPAE_MAX_LEVELS);
> > -
> > -     /* Ran out of page tables to walk */
> > -     return 0;
> > -
> > -found_translation:
> > -     iova &=3D (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
> > -     return iopte_to_paddr(pte, data) | iova;
> > -}
> > -
> >  struct io_pgtable_walk_data {
> >       void                            *data;
> >       int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
> > @@ -760,6 +724,41 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_i=
o_pgtable *data,
> >                                arm_lpae_iopte *ptep,
> >                                int lvl);
> >
> > +struct iova_to_phys_data {
> > +     arm_lpae_iopte pte;
> > +     int lvl;
> > +};
> > +
> > +static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, =
int lvl,
> > +                           arm_lpae_iopte pte, size_t size)
> > +{
> > +     struct iova_to_phys_data *data =3D walk_data->data;
> > +     data->pte =3D pte;
> > +     data->lvl =3D lvl;
> > +     return 0;
> > +}
> > +
> > +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> > +                                      unsigned long iova)
> > +{
> > +     struct arm_lpae_io_pgtable *data =3D io_pgtable_ops_to_data(ops);
> > +     struct iova_to_phys_data d;
> > +     struct io_pgtable_walk_data walk_data =3D {
> > +             .data =3D &d,
> > +             .visit =3D visit_iova_to_phys,
> > +             .addr =3D iova,
> > +             .end =3D iova + 1,
> > +     };
> > +     int ret;
> > +
> > +     ret =3D __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->=
start_level);
> > +     if (ret)
> > +             return 0;
> > +
> > +     iova &=3D (ARM_LPAE_BLOCK_SIZE(d.lvl, data) - 1);
> > +     return iopte_to_paddr(d.pte, data) | iova;
> > +}
> > +
> >  static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
> >                           struct io_pgtable_walk_data *walk_data,
> >                           arm_lpae_iopte *ptep, int lvl)
> > @@ -776,7 +775,7 @@ static int io_pgtable_visit(struct arm_lpae_io_pgta=
ble *data,
> >               return 0;
> >       }
> >
> > -     if (WARN_ON(!iopte_table(pte, lvl)))
> > +     if (WARN_ON(!iopte_table(pte, lvl) && !selftest_running))
>
> Why do you care about the selftest here?

Otherwise we see a flood of WARN_ON from negative tests in the selftests

BR,
-R

> Will

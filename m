Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5240D96F761
	for <lists+freedreno@lfdr.de>; Fri,  6 Sep 2024 16:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBF410EA76;
	Fri,  6 Sep 2024 14:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cet02MOz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14B510EA76
 for <freedreno@lists.freedesktop.org>; Fri,  6 Sep 2024 14:49:57 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-39fbf29379bso6425065ab.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Sep 2024 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725634197; x=1726238997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WiU9IZHhVnUquHSWM6EXfjGaXokDouEcllR2dgh+6Fg=;
 b=cet02MOz8gjvg5VCO3X7d2cepTGAvuCcRmw2V3fshN/YH2Oua7Ma/vGRQ3H7/X/kY5
 dYTOyJUy6GoKr7K7R0HvL1q31H/k0/TM0wED/CqLRxQkkr4PbU3ovHgun6l9MW3f7Ft7
 RFFCi6ntJVYGdQ1IwZCyLg6KTNuYhhGhhDlNBUu2rLoA91ggXe6FRlgG14mD5FYwFZgZ
 3KDTedU1pGcPX8q2PSQr7EyPCIL6JrC6VahhJnYybROgtsGdUNUeMTsO+KUI6coEPe4a
 S+E1GDTVV3Z3SVharPzUFniwOGfOVz65Phj7H+ZNBHA7Iadt4hIHlkkyPQbllMhF7xHG
 JBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725634197; x=1726238997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WiU9IZHhVnUquHSWM6EXfjGaXokDouEcllR2dgh+6Fg=;
 b=tyNROqXU3F4fiEfIcCwZkdu3acXv2pr6dEYTGpt44hyVi3twZIg9JTwSykToV16Ahj
 yJDXsM/L4psthLveJKY3XY1fTQWyxKclkt+hwFnUch/+ywCrNVPwaIE78njjc2rj/Drz
 +l9/NCyHt/kBfKtiam7aHZY16AlDOL/HSo+EjoCQfD5hzyAjIgRstJH2uOGwXwbt29C4
 vrX1DVX9JdSu6gSV8NcskCsEv+m/RC5qdQFz2r9XNtv2JMzm1LwejEOTR0D9df9gBhVg
 jS2R85/0CxxyxcRQoJoIgax40l+f6XFdpEQxO6/0yj1oZZwYrIgtRpqYe/7FAYeR6pLZ
 WfCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7TKrQ4U9Ioql77AkvSTwNYJT88bn2fftxKdXThzjdeGhHUsmvFSISVdqC5lp33oQdagNtB9JiMSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzf3E0mljerAxQfZ3YVFiguKEsFkRM+tGLRvmgiLzCUbVyC/vgI
 4JO3sb+DpO0+eTBqdSlAcTuLkToMe+Y68ftVxNtgMDpVqPj8qhYIvCq6oCuWm8Ga6FMhPuyatiI
 knhqB5jIx+qNyyKD79F1o5/+4gRs=
X-Google-Smtp-Source: AGHT+IH2V8kqjqZuzSiTu4xQgwjYHiNYJlnlag3YQqW/lfLyCQXUGePymWo0HTTtWi+nAbzXenEPCYoGuvVe1VR7+es=
X-Received: by 2002:a05:6e02:526:b0:39f:4f85:3ae6 with SMTP id
 e9e14a558f8ab-39f4f853c36mr199765265ab.1.1725634196676; Fri, 06 Sep 2024
 07:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240905124956.84932-1-robdclark@gmail.com>
 <20240905155330.GA15246@willie-the-truck>
 <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
 <CAF6AEGs3aRXbnnhD84GBbz9wJmyNR=dA3hbGuMLcM22Vs8CU_g@mail.gmail.com>
 <CAF6AEGsqdxO4+kaz6jOLBS_syjEkZg-7Veqh3j-o=RiGNcBH8A@mail.gmail.com>
 <a30d3968-5fb8-423d-9524-0e694930a6b1@arm.com>
In-Reply-To: <a30d3968-5fb8-423d-9524-0e694930a6b1@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 6 Sep 2024 07:49:43 -0700
Message-ID: <CAF6AEGueETnUhcf8KA8SNEWBieZ=OvYg7jJ4bgd3wJzT7_D7hA@mail.gmail.com>
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

On Fri, Sep 6, 2024 at 5:24=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 2024-09-05 6:10 pm, Rob Clark wrote:
> > On Thu, Sep 5, 2024 at 10:00=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> On Thu, Sep 5, 2024 at 9:27=E2=80=AFAM Robin Murphy <robin.murphy@arm.=
com> wrote:
> >>>
> >>> On 05/09/2024 4:53 pm, Will Deacon wrote:
> >>>> Hi Rob,
> >>>>
> >>>> On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> >>>>>
> >>>>> It was causing gpu smmu faults on x1e80100.
> >>>>>
> >>>>> I _think_ what is causing this is the change in ordering of
> >>>>> __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> >>>>> memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
> >>>>> this patch is supposed to work correctly in the face of other
> >>>>> concurrent translations (to buffers unrelated to the one being
> >>>>> unmapped(), because after the io_pgtable_tlb_flush_walk() we can ha=
ve
> >>>>> stale data read back into the tlb.
> >>>>>
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> ---
> >>>>>    drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++--------------=
---
> >>>>>    1 file changed, 14 insertions(+), 17 deletions(-)
> >>>>
> >>>> Please can you try the diff below, instead?
> >>>
> >>> Given that the GPU driver's .tlb_add_page is a no-op, I can't see thi=
s
> >>> making a difference. In fact, given that msm_iommu_pagetable_unmap()
> >>> still does a brute-force iommu_flush_iotlb_all() after io-pgtable
> >>> returns, and in fact only recently made .tlb_flush_walk start doing
> >>> anything either for the sake of the map path, I'm now really wonderin=
g
> >>> how this patch has had any effect at all... :/
> >>
> >> Yeah..  and unfortunately the TBU code only supports two devices so
> >> far, so I can't easily repro with TBU enabled atm.  Hmm..
> >> __arm_lpae_unmap() is also called in the ->map() path, although not
> >> sure how that changes things.
> >
> > Ok, an update.. after a reboot, still with this patch reverted, I once
> > again see faults.  So I guess that vindicates the original patch, and
> > leaves me still searching..
> >
> > fwiw, fault info from the gpu devcore:
> >
> > -------------
> > fault-info:
> >    - ttbr0=3D0000000919306000
> >    - iova=3D0000000100c17000
> >    - dir=3DWRITE
> >    - type=3DUNKNOWN
> >    - source=3DCP
> > pgtable-fault-info:
> >    - ttbr0: 000000090ca40000
> >    - asid: 0
> >    - ptes: 000000095db47003 000000095db48003 0000000914c8f003 00000008f=
d7f0f47
> > -------------
> >
> > the 'ptes' part shows the table walk, which looks ok to me..
>
> But is it the right pagetable at all, given that the "ttbr0" values
> appear to be indicating different places?

hmm, the gpu does seem to be switching to the new table before it is
done with the old one..

BR,
-R

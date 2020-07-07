Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C4216EAB
	for <lists+freedreno@lfdr.de>; Tue,  7 Jul 2020 16:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4268E6E159;
	Tue,  7 Jul 2020 14:24:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746026E159
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jul 2020 14:24:48 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id lx13so28070669ejb.4
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jul 2020 07:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=McOB/0yYDJQ83thcjyemD5c9BdlKzyjDAog3KEfKSkg=;
 b=o3fLamn66/sQMIHRnVoui2FDdrvygbfj/EJvB9Xw4rIv+X9x15ea1yKUTl/955fnzN
 ilaKEb8ttIYKv59wL5G/bO46wHEJ9VdVfjJ9hiJOKl977QUGjg4Lf2pxJ3+c+cBdo7qj
 9cWYbEmJ0jAhS6KOF1mcCJOuaA0rI4YlTAepyHevjsGqCiKKzJ3Id+g6qy6HcrAzgRMy
 OuF87k/dWiLVPrbDxTo+ontV3+3tl9qTGWQUwmfVKEoEu9xKK70cbuv4fiMG+aXvoLBv
 MUubXLSuPp/SumMQ9Kn9iV2TGdU4QyxK2sw7Bx1d+C9FOSmta10Wl7OGhkkaIccGlxwy
 Mifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=McOB/0yYDJQ83thcjyemD5c9BdlKzyjDAog3KEfKSkg=;
 b=OBAoXUCl3zHuSACCwNaDWNdqm+zg9qdkuMQI+81wMpX6Dta52svwKJugQK5Xd/PC+B
 yh9SD7b+xwv/Xmq1IBhyBBwkQqw/Gxejenqwsl068eOwK+488TeYYZmKOcjK/87bJq2t
 cmY8oOJC3j8TohjSK4dYzpjSIBtMD556jFegD4EQXxZgqh1O8pbczpjTBncDuwB4SR6y
 ujx1oU7kiPoGtFi4xpELDat9zokFlbM5CbmL74gLET/bWYtQ036k/jcz2aSds9hkN8af
 JAJRQr1opy2+24KKU6RIawscdZgYoKCymj2JpdL4nBJgL9p1MCW85F9BCiba9Zu7cKQR
 SIPQ==
X-Gm-Message-State: AOAM5304DLX9+zgrv6OxthWQCZ4sUyY0tm/fCdGrXoZMPGNCW/9wOQd/
 IQoJGYeXLvHQ3aVcsHekhCCmJAfuiLxNhRe7PUA=
X-Google-Smtp-Source: ABdhPJwm/0c5b1pm+RO/PcvtbbwfHWJUpLgSJZX4m+kdgXqWpEywCtvCuyEdwfXmE9Q48ukNOV1sECfMMVrbTNnIlGw=
X-Received: by 2002:a17:906:1187:: with SMTP id
 n7mr41984337eja.161.1594131887033; 
 Tue, 07 Jul 2020 07:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-3-jcrouse@codeaurora.org>
 <99ecd948-7476-b9b4-12b4-1ced0084654f@arm.com>
In-Reply-To: <99ecd948-7476-b9b4-12b4-1ced0084654f@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 Jul 2020 07:25:18 -0700
Message-ID: <CAF6AEGv2YXu44r9O0ZRkNM2ny4oMStxn4=GoCS3CLpPAKh_KZw@mail.gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [Freedreno] [PATCH v2 2/6] iommu/io-pgtable: Allow a pgtable
 implementation to skip TLB operations
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Joerg Roedel <jroedel@suse.de>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, John Stultz <john.stultz@linaro.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jul 7, 2020 at 4:34 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-06-26 21:04, Jordan Crouse wrote:
> > Allow a io-pgtable implementation to skip TLB operations by checking for
> > NULL pointers in the helper functions. It will be up to to the owner
> > of the io-pgtable instance to make sure that they independently handle
> > the TLB correctly.
>
> I don't really understand what this is for - tricking the IOMMU driver
> into not performing its TLB maintenance at points when that maintenance
> has been deemed necessary doesn't seem like the appropriate way to
> achieve anything good :/

No, for triggering the io-pgtable helpers into not performing TLB
maintenance.  But seriously, since we are creating pgtables ourselves,
and we don't want to be ioremap'ing the GPU's SMMU instance, the
alternative is plugging in no-op helpers.  Which amounts to the same
thing.

Currently (in a later patch in the series) we are using
iommu_flush_tlb_all() when unmapping, which is a bit of a big hammer.
Although I think we could be a bit more clever and do the TLB ops on
the GPU (since the GPU knows if pagetables we are unmapping from are
in-use and could skip the TLB ops otherwise).

On the topic, if we are using unique ASID values per set of
pagetables, how expensive is tlb invalidate for an ASID that has no
entries in the TLB?

BR,
-R

>
> Robin.
>
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >   include/linux/io-pgtable.h | 11 +++++++----
> >   1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > index 53d53c6c2be9..bbed1d3925ba 100644
> > --- a/include/linux/io-pgtable.h
> > +++ b/include/linux/io-pgtable.h
> > @@ -210,21 +210,24 @@ struct io_pgtable {
> >
> >   static inline void io_pgtable_tlb_flush_all(struct io_pgtable *iop)
> >   {
> > -     iop->cfg.tlb->tlb_flush_all(iop->cookie);
> > +     if (iop->cfg.tlb)
> > +             iop->cfg.tlb->tlb_flush_all(iop->cookie);
> >   }
> >
> >   static inline void
> >   io_pgtable_tlb_flush_walk(struct io_pgtable *iop, unsigned long iova,
> >                         size_t size, size_t granule)
> >   {
> > -     iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
> > +     if (iop->cfg.tlb)
> > +             iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
> >   }
> >
> >   static inline void
> >   io_pgtable_tlb_flush_leaf(struct io_pgtable *iop, unsigned long iova,
> >                         size_t size, size_t granule)
> >   {
> > -     iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
> > +     if (iop->cfg.tlb)
> > +             iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
> >   }
> >
> >   static inline void
> > @@ -232,7 +235,7 @@ io_pgtable_tlb_add_page(struct io_pgtable *iop,
> >                       struct iommu_iotlb_gather * gather, unsigned long iova,
> >                       size_t granule)
> >   {
> > -     if (iop->cfg.tlb->tlb_add_page)
> > +     if (iop->cfg.tlb && iop->cfg.tlb->tlb_add_page)
> >               iop->cfg.tlb->tlb_add_page(gather, iova, granule, iop->cookie);
> >   }
> >
> >
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

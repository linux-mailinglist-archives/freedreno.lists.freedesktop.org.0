Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6351C2224E4
	for <lists+freedreno@lfdr.de>; Thu, 16 Jul 2020 16:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5C16E287;
	Thu, 16 Jul 2020 14:10:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F736E287
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jul 2020 14:10:12 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id o18so6695012eje.7
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jul 2020 07:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UgByZr2tdGXMxqTrpo6Qkdxy8e0b0j8qrLrKzyPeff4=;
 b=p/oY63OM+jm2WcLptMiuLRuvaLTNDJmdQ/usKdVo5BQ2xnnssf+08/52kx3SBxP7Y3
 I47BFQ3ap6TYnx/2SbzKSeaghmr1JlKhjgMB2gECCOTUXVuRqY3qYqlFDpx63eV9Kd9v
 k+yZoMOvct+w+jptYyDvwmFbIfP5gXFnp+bAG8MaeZvMVxGZpqG8vZ2obkaDb8nu+nHm
 kBYZtuaFIGRbH/GkbGUfwFWXsCtYIV3RxDWgSFlSmtAH6OXNgsvRF5d4RqklcxD092Gw
 vrF7juWcsMx/odaCP1UN3JQWRXNWhAP5y16WC13irLPuEXdTsRf1ehSNCrxLTT9+ogdJ
 6oRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UgByZr2tdGXMxqTrpo6Qkdxy8e0b0j8qrLrKzyPeff4=;
 b=Bqn1jv63nBUDMBjUvLYrE5veHM5b0wPBKCgNr2XkOJOoBnej1uAmDWDyMs9S0/UtwV
 3lIEixVO/+AAjTDDmdCgQ/8CSSXqeunVWQ/ckIS8pmLHLz8Ttgg8BaPQUj8mnQYTP8cq
 3m/xjp8OoQiCfJScCdm64Ejy7MRkz/kaxorH4aNKqnunhiByh4BQLJDZL8cAfB6kpCrJ
 KEqhwKAZqF6UM3B4iQB5dY2Vd6e4zVBUhQAGEoinI1mouohDshGygEKkgfGAPpjsuC64
 CUVsmWUeZXYhCB7Z1oR2rezKaHy9iYeV+tmsPdG6Sp0oIs7SpsneudrUr7sQCByYqmFN
 Z1RA==
X-Gm-Message-State: AOAM531dj8YGIHtoF8IfgSmuPwBQ2IrBi7VJ1SgN0hS5aUKErfoT6mP/
 7AtiadacGMplBlvS/6QITc4ROetpKnNEcJ/Z4No=
X-Google-Smtp-Source: ABdhPJyz8imIlovqA4rnHstW4ckjKTIH95Kru8h/9+b4cY5spXHzvx8IM2dpEFBVY9OsnhnhxXdZW6/cN3g6oedlr7k=
X-Received: by 2002:a17:906:328d:: with SMTP id
 13mr3973061ejw.71.1594908610972; 
 Thu, 16 Jul 2020 07:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
 <20200626200042.13713-5-jcrouse@codeaurora.org>
 <20200713150901.GA3072@willie-the-truck>
 <20200713171917.GA3815@jcrouse1-lnx.qualcomm.com>
 <20200716085053.GB6771@willie-the-truck>
In-Reply-To: <20200716085053.GB6771@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 16 Jul 2020 07:10:43 -0700
Message-ID: <CAF6AEGtf2Ts5_S-3DDA0i_ega-MjJK5tyy=peW6ar0c1ZD72Rw@mail.gmail.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [Freedreno] [PATCH v9 4/7] iommu/arm-smmu: Add a pointer to the
 attached device to smmu_domain
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 John Stultz <john.stultz@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 1:51 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Jul 13, 2020 at 11:19:17AM -0600, Jordan Crouse wrote:
> > On Mon, Jul 13, 2020 at 04:09:02PM +0100, Will Deacon wrote:
> > > On Fri, Jun 26, 2020 at 02:00:38PM -0600, Jordan Crouse wrote:
> > > > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > > > index 5f2de20e883b..d33cfe26b2f5 100644
> > > > --- a/drivers/iommu/arm-smmu.h
> > > > +++ b/drivers/iommu/arm-smmu.h
> > > > @@ -345,6 +345,7 @@ struct arm_smmu_domain {
> > > >   struct mutex                    init_mutex; /* Protects smmu pointer */
> > > >   spinlock_t                      cb_lock; /* Serialises ATS1* ops and TLB syncs */
> > > >   struct iommu_domain             domain;
> > > > + struct device                   *dev;   /* Device attached to this domain */
> > >
> > > This really doesn't feel right to me -- you can generally have multiple
> > > devices attached to a domain and they can come and go without the domain
> > > being destroyed. Perhaps you could instead identify the GPU during
> > > cfg_probe() and squirrel that information away somewhere?
> >
> > I need some help here. The SMMU device (qcom,adreno-smmu) will have at least two
> > stream ids from two different platform devices (GPU and GMU) and I need to
> > configure split-pagetable and stall/terminate differently on the two domains.
>
> Hmm. How does the GPU driver know which context bank is assigned to the GPU
> and which one is assigned to the GMU? I assume it needs this information so
> that it can play its nasty tricks with the TTBR registers?
>
> I ask because if we need to guarantee stability of the context-bank
> assignment, then you could match on that in the ->init_context() callback,
> but now I worry that it currently works by luck :/

Yeah, it is basically by luck right now.. some sort of impl callback
which was passed the dev into impl->init_context() might do the trick
(ie. then the impl could match on compat string)

BR,
-R

> Do we need to add an extra callback to allocate the context bank?
>
> Will
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

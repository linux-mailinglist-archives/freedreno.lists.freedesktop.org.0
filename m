Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D8FAB89C8
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 16:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB3510E8D8;
	Thu, 15 May 2025 14:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YYpYyWdw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6599F10E8D8
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 14:47:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8EA055C563F;
 Thu, 15 May 2025 14:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FC8C4CEE7;
 Thu, 15 May 2025 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747320421;
 bh=iF+js4BBt+dLaStQ/POI5wyD5ubyMTtYNLC8o9vroH8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YYpYyWdwrt+f9YnMLuNgTFAl3ivW6cEUiWNHBS/7LDc/3eBf1Uptx2po9ABYU9/Rj
 fScf8zR93phvR+Qpxf4iOGOF3g4f2QBA++Tbz7O4c7Uv077ekrYxJcj0nAUkn1vAY1
 K4Qj87AbwzMuiekhWRcSuIF76y9KtH8HXu3ftZv78K6zNSHbrxK4Qp3Wo4reTcYtLs
 wFhTKb6r8PoXDzMlpYSgRGYB2PkPbdj4mr8IsDbOi6y8Heu6hBeegqDZqDL2MeN4Su
 JpFM5zeyNKhLE6ofif2/AbqmyQeeFN6Jun31OlxsbSxf74PF95nj9c1ar/wOYVtQQi
 Zo9w2FUQ0XVQg==
Date: Thu, 15 May 2025 15:46:56 +0100
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, quic_c_gdjako@quicinc.com
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
Message-ID: <20250515144653.GC12165@willie-the-truck>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
 <20250506122449.GB723@willie-the-truck>
 <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
 <20250506145324.GA1246@willie-the-truck>
 <CACu1E7FcQU3NXro8uYxzEJ1pvfYG5WLvY8BscbF9Sj+P3Wh_2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7FcQU3NXro8uYxzEJ1pvfYG5WLvY8BscbF9Sj+P3Wh_2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Tue, May 06, 2025 at 11:18:44AM -0400, Connor Abbott wrote:
> On Tue, May 6, 2025 at 10:53 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, May 06, 2025 at 10:08:05AM -0400, Connor Abbott wrote:
> > > On Tue, May 6, 2025 at 8:24 AM Will Deacon <will@kernel.org> wrote:
> > > > On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab913750e6079edc6393d1938c98 100644
> > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> > > > >       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
> > > > >               return IRQ_NONE;
> > > > >
> > > > > +     /*
> > > > > +      * On some implementations FSR.SS asserts a context fault
> > > > > +      * interrupt. We do not want this behavior, because resolving the
> > > > > +      * original context fault typically requires operations that cannot be
> > > > > +      * performed in IRQ context but leaving the stall unacknowledged will
> > > > > +      * immediately lead to another spurious interrupt as FSR.SS is still
> > > > > +      * set. Work around this by disabling interrupts for this context bank.
> > > > > +      * It's expected that interrupts are re-enabled after resuming the
> > > > > +      * translation.
> > > >
> > > > s/translation/transaction/
> > > >
> > > > > +      *
> > > > > +      * We have to do this before report_iommu_fault() so that we don't
> > > > > +      * leave interrupts disabled in case the downstream user decides the
> > > > > +      * fault can be resolved inside its fault handler.
> > > > > +      *
> > > > > +      * There is a possible race if there are multiple context banks sharing
> > > > > +      * the same interrupt and both signal an interrupt in between writing
> > > > > +      * RESUME and SCTLR. We could disable interrupts here before we
> > > > > +      * re-enable them in the resume handler, leaving interrupts enabled.
> > > > > +      * Lock the write to serialize it with the resume handler.
> > > > > +      */
> > > >
> > > > I'm struggling to understand this last part. If the resume handler runs
> > > > synchronously from report_iommu_fault(), then there's no need for
> > > > locking because we're in interrupt context. If the resume handler can
> > > > run asynchronously from report_iommu_fault(), then the locking doesn't
> > > > help because the code below could clear CFIE right after the resume
> > > > handler has set it.
> > >
> > > The problem is indeed when the resume handler runs asynchronously.
> > > Clearing CFIE right after the resume handler has set it is normal and
> > > expected. The issue is the opposite, i.e. something like:
> > >
> > > - Resume handler writes RESUME and stalls for some reason
> > > - The interrupt handler runs through and clears CFIE while it's already cleared
> > > - Resume handler sets CFIE, assuming that the handler hasn't run yet
> > > but it actually has
> > >
> > > This wouldn't happen with only one context bank, because we wouldn't
> > > get an interrupt until the resume handler sets CFIE, but with multiple
> > > context banks and a shared interrupt line we could get a "spurious"
> > > interrupt due to a fault in an earlier context bank that becomes not
> > > spurious if the resume handler writes RESUME before the context fault
> > > handler for this bank reads FSR above.
> >
> > Ah, gotcha. Thanks for the explanation.
> >
> > If we moved the RESUME+CFIE into the interrupt handler after the call
> > to report_iommu_fault(), would it be possible to run the handler as a
> > threaded irq (see 'context_fault_needs_threaded_irq') and handle the
> > callback synchronously? In that case, I think we could avoid taking the
> > lock if we wrote CFIE _before_ RESUME.
> >
> 
> We need the lock anyway due to the parallel manipulation of CFCFG in
> the same register introduced in the next patch. Expanding it to also
> cover the write to RESUME is not a huge deal. Also, doing it
> synchronously would require rewriting the fault handling in drm/msm
> and again I'm trying to fix this serious stability problem now as soon
> as possible without getting dragged into rewriting the whole thing.

This has never worked though, right? In which case, we should fix it
properly rather than papering over the mess.

Georgi (CC'd) added support for threaded interrupts specifically to
permit sleeping operations in the fault handler. You should be able to
use that and I don't understand why that would require "rewriting the
whole thing". You can kick the async work and then wait for it to
complete, no?

That would then open the door to handling the RESUME in the core driver
in future based on the return value from report_iommu_fault().

You also need to fix qcom_tbu_halt() as I mentioned before.

Will

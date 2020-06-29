Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C12C20CF4B
	for <lists+freedreno@lfdr.de>; Mon, 29 Jun 2020 16:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60A689A4F;
	Mon, 29 Jun 2020 14:57:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C039F89864
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jun 2020 14:57:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593442633; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=tNiuQ+4uhjgZPnPAVe1RZE3rFmZ//xK6MB4wZLBlQDU=;
 b=F7lwTmEkx/9ziCTaNlkQ2nkpJtV4ELcyyAVw3R+a4jxtwVMDDeJa1Q7h7eBHqdDfHipIkAsQ
 2YQ4GswtymnTPrqTjKDvEKBZ5ku29kZbLSPeQnm4XMOZSg+7MUMtRQhLDblrg/feDvPa2Uqv
 GmLWWOCf9egl3ylPGIREfHmNuFE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5efa0138bfb34e631c8f836e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Jun 2020 14:56:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EF49AC433C6; Mon, 29 Jun 2020 14:56:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D5F8C433C8;
 Mon, 29 Jun 2020 14:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D5F8C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 29 Jun 2020 08:56:50 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200629145650.GC25740@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Eric Anholt <eric@anholt.net>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>, 
 John Stultz <john.stultz@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-7-jcrouse@codeaurora.org>
 <CAF6AEGvFPtiFcBg5j3An5piPWy3Sg3=-o2k8Xzzf6anzVi9_ZA@mail.gmail.com>
 <CAF6AEGtOcA1V33KgaYKjn=FBk9_q4u8fF5Tgoyq7Y3vUp2pKjg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtOcA1V33KgaYKjn=FBk9_q4u8fF5Tgoyq7Y3vUp2pKjg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH v2 6/6] drm/msm/a6xx: Add support for
 per-instance pagetables
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
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Eric Anholt <eric@anholt.net>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 John Stultz <john.stultz@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Jun 27, 2020 at 01:11:14PM -0700, Rob Clark wrote:
> On Sat, Jun 27, 2020 at 12:56 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, Jun 26, 2020 at 1:04 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > >
> > > Add support for using per-instance pagetables if all the dependencies are
> > > available.
> > >
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > ---
> > >
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 43 +++++++++++++++++++++++++++
> > >  drivers/gpu/drm/msm/msm_ringbuffer.h  |  1 +
> > >  2 files changed, 44 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > index aa53f47b7e8b..95ed2ceac121 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -79,6 +79,34 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
> > >         OUT_RING(ring, upper_32_bits(iova));
> > >  }
> > >
> > > +static void a6xx_set_pagetable(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> > > +               struct msm_file_private *ctx)
> > > +{
> > > +       phys_addr_t ttbr;
> > > +       u32 asid;
> > > +
> > > +       if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> > > +               return;
> > > +
> > > +       /* Execute the table update */
> > > +       OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 4);
> > > +       OUT_RING(ring, lower_32_bits(ttbr));
> > > +       OUT_RING(ring, (((u64) asid) << 48) | upper_32_bits(ttbr));
> > > +       /* CONTEXTIDR is currently unused */
> > > +       OUT_RING(ring, 0);
> > > +       /* CONTEXTBANK is currently unused */
> > > +       OUT_RING(ring, 0);
> > > +
> > > +       /*
> > > +        * Write the new TTBR0 to the memstore. This is good for debugging.
> > > +        */
> > > +       OUT_PKT7(ring, CP_MEM_WRITE, 4);
> > > +       OUT_RING(ring, lower_32_bits(rbmemptr(ring, ttbr0)));
> > > +       OUT_RING(ring, upper_32_bits(rbmemptr(ring, ttbr0)));
> > > +       OUT_RING(ring, lower_32_bits(ttbr));
> > > +       OUT_RING(ring, (((u64) asid) << 48) | upper_32_bits(ttbr));
> > > +}
> > > +
> > >  static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> > >         struct msm_file_private *ctx)
> > >  {
> > > @@ -89,6 +117,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> > >         struct msm_ringbuffer *ring = submit->ring;
> > >         unsigned int i;
> > >
> > > +       a6xx_set_pagetable(gpu, ring, ctx);
> > > +
> > >         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
> > >                 rbmemptr_stats(ring, index, cpcycles_start));
> > >
> > > @@ -872,6 +902,18 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
> > >         return (unsigned long)busy_time;
> > >  }
> > >
> > > +struct msm_gem_address_space *a6xx_address_space_instance(struct msm_gpu *gpu)
> > > +{
> > > +       struct msm_mmu *mmu;
> > > +
> > > +       mmu = msm_iommu_pagetable_create(gpu->aspace->mmu);
> > > +       if (IS_ERR(mmu))
> > > +               return msm_gem_address_space_get(gpu->aspace);
> > > +
> > > +       return msm_gem_address_space_create(mmu,
> > > +               "gpu", 0x100000000ULL, 0x1ffffffffULL);
> > > +}
> > > +
> > >  static const struct adreno_gpu_funcs funcs = {
> > >         .base = {
> > >                 .get_param = adreno_get_param,
> > > @@ -895,6 +937,7 @@ static const struct adreno_gpu_funcs funcs = {
> > >                 .gpu_state_put = a6xx_gpu_state_put,
> > >  #endif
> > >                 .create_address_space = adreno_iommu_create_address_space,
> > > +               .address_space_instance = a6xx_address_space_instance,
> >
> > Hmm, maybe instead of .address_space_instance, something like
> > .create_context_address_space?
> >
> > Since like .create_address_space, it is creating an address space..
> > the difference is that it is a per context/process aspace..
> >

This is a good suggestion. I'm always open to changing function names.

> 
> 
> or maybe just .create_pgtable and return the 'struct msm_mmu' (which
> is itself starting to become less of a great name)..
> 
> The only other thing a6xx_address_space_instance() adds is knowing
> where the split is between the kernel and user pgtables, and I suppose
> that isn't a thing that would really be changing between gens?

In theory the split is determined by the hardware but its been the same for all
a5xx/a6xx targets.

Jordan

> BR,
> -R
> 
> > BR,
> > -R
> >
> > >         },
> > >         .get_timestamp = a6xx_get_timestamp,
> > >  };
> > > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > > index 7764373d0ed2..0987d6bf848c 100644
> > > --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> > > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > > @@ -31,6 +31,7 @@ struct msm_rbmemptrs {
> > >         volatile uint32_t fence;
> > >
> > >         volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
> > > +       volatile u64 ttbr0;
> > >  };
> > >
> > >  struct msm_ringbuffer {
> > > --
> > > 2.17.1
> > >
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

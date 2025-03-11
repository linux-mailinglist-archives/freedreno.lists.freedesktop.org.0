Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79DA5D043
	for <lists+freedreno@lfdr.de>; Tue, 11 Mar 2025 21:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C805A10E5E4;
	Tue, 11 Mar 2025 20:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MHteGuOw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7234E10E5E4
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 20:00:47 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3ce868498d3so20686875ab.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 13:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741723247; x=1742328047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gpeic0WcwHZpDjI5JkWgQuSUr4e/vgwMJ9BK0UvjAlo=;
 b=MHteGuOwUfi8U4F7TsMkle+Myt9euKK8uGqpiVqBynpVhswXdLde49jCntsOv3Ju5e
 WZiIrejTmc0EiSaACN/rq72udNEJeBExL+9F4MY4aA40RHK0c2roUSyeb603a0AAteYQ
 +BVtibhlZhh+6WsFnczIO5QdcPet+U/ZamC1Gx9qF7zJ6a6UYnBcnxXj2MelSevY+7/G
 T6mg9yjDF0iVXYM123rXhdassN1DnPZfu2nca0rYd0COhm8n7XiuYL69SOIeMwPRAsWw
 NUWCHPK+khDJQM/1c+/EcNQ0apfltBWY2PpiMuXJKCatz0SymCJf81KiqwzwDP4Q0QLT
 mfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741723247; x=1742328047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gpeic0WcwHZpDjI5JkWgQuSUr4e/vgwMJ9BK0UvjAlo=;
 b=oSlQWfBBdtpljSn2tWXgFODZLYujufiX0MbgL+rs/KSbCZrxYi9VpNgHWKRruX2/o+
 bx/1DiCo55fTNE31u9rB9WZwsAO+77rzmKY+Chu56A/Dn1bk9cQ/T4VWHWF6dguTzdos
 4oRmcwE3LgpjpGU0Gy37TwZALHdhJV0WQjwarCfKCiTii1knLKLhWEgtMPB5Q8FuspST
 2eRACQZ3jch+p+tyEI/92ckCGw5vZUBtsvP6wNQE3aGW+cS/IAaWqdCqxfx6EuhonsSk
 qG7K0JQ7B8MHljnmqh/Bqw8IXtIG2NyxbeUiw6KiunIIPBcBJdnH7Peyxp+05ijsly6w
 iEhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqFrYFkpSwsAU7D9bgJLiHdZl8qDW9R2eG/v8x2O0zvP49quRZ8JuLisgvK1sC8E42Drus7xUXaLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymPs7L4QhBJVfwSoo2ZoY8W1TQReykqrPLKaO4sGFBRs8T7Oob
 VGb/4PCxOBxCJR/RDQJpse34UMUX4Q72LDMV2R/SADmFXEgRDH4CURZugDpy0CZV+O+fnHpe7oh
 sDQzhKajaWBgiyHzxdfxfxBGx5cQ=
X-Gm-Gg: ASbGncuIF1uSChUAniA7jeDlV8tEdg7WLg7DMlSSZcbZRq6880/BqG+XGmzH+TLNe9x
 G5CmTsQddqnWUOAHycXKimPW5pQmUWBl6I3Xq0EtQyZ4pkk7UDes+bKoVbu7dv3tz+GKBGv0TiO
 QybG3FXhAPbWLPWzsqhRP1A6plksOIsbGr4Bf1HAOGed2puEOiCgnCg4iH
X-Google-Smtp-Source: AGHT+IHnEnfmBrcYN5CgiJSCUEKuYdpRvskKfowRAYORIl7YVlWFJTR/3hVXxyuW1gKd0NsDNWQe7lPtHwZEAYj9Mqw=
X-Received: by 2002:a05:6e02:164a:b0:3d0:235b:4810 with SMTP id
 e9e14a558f8ab-3d4418d50e2mr212944605ab.2.1741723246490; Tue, 11 Mar 2025
 13:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
 <20250311180807.GC5216@willie-the-truck>
 <CACu1E7Hw6vGbTQ7t-Hj3ziycZhPxtOGSDkt7o4fNUx91KDcXfg@mail.gmail.com>
In-Reply-To: <CACu1E7Hw6vGbTQ7t-Hj3ziycZhPxtOGSDkt7o4fNUx91KDcXfg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Mar 2025 13:00:34 -0700
X-Gm-Features: AQ5f1JqJJW0DJckWYNGGABDX1xOTUcg1Jhe5MZo7XOUNOKHatuENCACaKvteaIA
Message-ID: <CAF6AEGs8PoZBpFesQ_DGcngn4X24wzFy=zn2mAUJepdibxoKog@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 freedreno@lists.freedesktop.org
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

On Tue, Mar 11, 2025 at 12:42=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com=
> wrote:
>
> On Tue, Mar 11, 2025 at 2:08=E2=80=AFPM Will Deacon <will@kernel.org> wro=
te:
> >
> > On Tue, Mar 04, 2025 at 11:56:48AM -0500, Connor Abbott wrote:
> > > In some cases drm/msm has to resume a stalled transaction directly in
> > > its fault handler. Experimentally this doesn't work on SMMU500 if the
> > > fault hasn't already been acknowledged by clearing FSR. Rather than
> > > trying to clear FSR in msm's fault handler and implementing a
> > > tricky handshake to avoid accidentally clearing FSR twice, we want to
> > > clear FSR before calling the fault handlers, but this means that the
> > > contents of registers can change underneath us in the fault handler a=
nd
> > > msm currently uses a private function to read the register contents f=
or
> > > its own purposes in its fault handler, such as using the
> > > implementation-defined FSYNR1 to determine which block caused the fau=
lt.
> > > Fix this by making msm use the register values already read by arm-sm=
mu
> > > itself before clearing FSR rather than messing around with reading
> > > registers directly.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++---------=
-
> > >  3 files changed, 27 insertions(+), 27 deletions(-)
> >
> > [...]
> >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/ar=
m/arm-smmu/arm-smmu.h
> > > index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a70338337166=
35efb3968a0bd3ff237 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
> > >       ARM_SMMU_DOMAIN_NESTED,
> > >  };
> > >
> > > +struct arm_smmu_context_fault_info {
> > > +     unsigned long iova;
> > > +     u64 ttbr0;
> > > +     u32 fsr;
> > > +     u32 fsynr0;
> > > +     u32 fsynr1;
> > > +     u32 cbfrsynra;
> > > +     u32 contextidr;
> > > +};
> > > +
> > >  struct arm_smmu_domain {
> > >       struct arm_smmu_device          *smmu;
> > >       struct io_pgtable_ops           *pgtbl_ops;
> > > @@ -380,6 +390,7 @@ struct arm_smmu_domain {
> > >       const struct iommu_flush_ops    *flush_ops;
> > >       struct arm_smmu_cfg             cfg;
> > >       enum arm_smmu_domain_stage      stage;
> > > +     struct arm_smmu_context_fault_info cfi;
> >
> > Does this mean we have to serialise all faults for a given domain? That
> > can't be right...
> >
> > Will
>
> They are already serialized? There's only one of each register per
> context bank, so you can only have one context fault at a time per
> context bank, and AFAIK a context bank is 1:1 with a domain. Also this
> struct is only written and then read inside the context bank's
> interrupt handler, and you can only have one interrupt at a time, no?
>
> Connor

And if it was a race condition with cfi getting overridden, it would
have already been an equivalent race condition currently when reading
the values from registers (ie. the register values could have changed
in the elapsed time)

So no additional serialization needed here.

BR,
-R

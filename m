Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A28AAC942
	for <lists+freedreno@lfdr.de>; Tue,  6 May 2025 17:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DD810E6D2;
	Tue,  6 May 2025 15:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="laRmfSfl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403D410E6D2
 for <freedreno@lists.freedesktop.org>; Tue,  6 May 2025 15:18:56 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-73de140046eso997855b3a.1
 for <freedreno@lists.freedesktop.org>; Tue, 06 May 2025 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746544736; x=1747149536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihwIKJtv6TLBR/OI0Dx++tOWSWHwkJU0gov7VsGhIAg=;
 b=laRmfSflHJjPjLL9DqJtPnsGjjD88uELjpppJSxSkt0mY1WjBCCN/DwW+ZvwlCX9Wa
 XeK8JVzwHcZ9In7c3ar371UqIXiWNIbP6EgLFr7k1Q74HXPvamlW1hy9vHRdTuMJgW0K
 q3p6aA93HFYHMkM652FxsaIMYqa9s0DRJ9Zl2bl/LW6IDpkv0UmwNT0rppAhDCvQzVDx
 ZbDxyOdQxqii9ly2uU0cNRc38ktmgxOtgF+299kVQ20pXUrtgvE61tAaiOqRDa8cjCG0
 EH2uRfZKqRDymvuuEvGO9Hu7cv1aaxgrUqB5/vQUUI/7eUrgl6qAFF8muxYFZyU2gH7+
 J5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746544736; x=1747149536;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ihwIKJtv6TLBR/OI0Dx++tOWSWHwkJU0gov7VsGhIAg=;
 b=QBdW3CgsHiahUHPIV5WMrkvRFJtUMHe8cQXt8bnnzJPih9K+VQzfaUzW/3zl89d6cZ
 pldcFFJ1njz02rbg4DRkZ/t8SBdD0dgijpqic8g7AvFHsBHmA2r7CcBXBPOOv3uvawqq
 a5EoCvThz25JJcjBkkHD9fM8bjiykkHhppll+599bA2JErBBQ5ju/mwQh2Uo4OVCbJ6S
 rbexWHjrhH1rgcMBMPJZ3HOASaLbNJqudiOtPeUO/yDt7NGUe4cHGax6ZSF5Gp6+g1Ky
 4/5NXA+5Wof4bqtPeXB/LUW+FTG463peJMRfLpMPqKHJkfkKzqMIho2gN5rRmdcEI+ny
 Zpww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJT0s5ZN8Veutv/Q6RQZ6A/H9MbgxdsIqOmFi/+3lCFVqRP55VpSnhkR1/iGo/6zP0o2AuPPJFFjg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm8GnHoyhjD0XO00IsPGGeX9Yh8fjWV5In3QndaG1Ea74OIyYy
 HBjGqrTsEP6FRHT5gPYOCuEv9+RB+ZZ0eNokgvcSB5p9JRxBbT67Zs9EcmScq/IMhghbESwnGDT
 db1uOfrFwfzfwI2nAH1oP8t3REnE=
X-Gm-Gg: ASbGnctLhInsRHzCSuwdhWQiboeEkWh50U3vAXQZqjHIubx9QNyDY0pMxMdNw9ZRO43
 heIhI5LAQwJGBB2TbW66QJ/RbOGPUkTv36SQkhUjxpd+wYsrAqqXalbYopw24JdWqaImb42Gqyp
 h1Fya/Nj4+HuEG+umOQcaYww==
X-Google-Smtp-Source: AGHT+IGL6zvGfKRHCeOyJw86qk5Rtichxh0QI1NF1NjzDjI2bE5Xp0U89TjTculYg2ARVj82+Jn/HSEeNbzQmRWcjwY=
X-Received: by 2002:a05:6a00:3394:b0:736:89bd:ffb9 with SMTP id
 d2e1a72fcca58-7409b78f76bmr67926b3a.0.1746544735683; Tue, 06 May 2025
 08:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
 <20250506122449.GB723@willie-the-truck>
 <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
 <20250506145324.GA1246@willie-the-truck>
In-Reply-To: <20250506145324.GA1246@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 6 May 2025 11:18:44 -0400
X-Gm-Features: ATxdqUHApCvIBLWVxzAKGWehj2Jn9c8bDSVhoYqNoYQYukt99xBU21U5GE3iI-8
Message-ID: <CACu1E7FcQU3NXro8uYxzEJ1pvfYG5WLvY8BscbF9Sj+P3Wh_2A@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
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

On Tue, May 6, 2025 at 10:53=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, May 06, 2025 at 10:08:05AM -0400, Connor Abbott wrote:
> > On Tue, May 6, 2025 at 8:24=E2=80=AFAM Will Deacon <will@kernel.org> wr=
ote:
> > > On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/=
arm/arm-smmu/arm-smmu.c
> > > > index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab91375=
0e6079edc6393d1938c98 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int=
 irq, void *dev)
> > > >       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
> > > >               return IRQ_NONE;
> > > >
> > > > +     /*
> > > > +      * On some implementations FSR.SS asserts a context fault
> > > > +      * interrupt. We do not want this behavior, because resolving=
 the
> > > > +      * original context fault typically requires operations that =
cannot be
> > > > +      * performed in IRQ context but leaving the stall unacknowled=
ged will
> > > > +      * immediately lead to another spurious interrupt as FSR.SS i=
s still
> > > > +      * set. Work around this by disabling interrupts for this con=
text bank.
> > > > +      * It's expected that interrupts are re-enabled after resumin=
g the
> > > > +      * translation.
> > >
> > > s/translation/transaction/
> > >
> > > > +      *
> > > > +      * We have to do this before report_iommu_fault() so that we =
don't
> > > > +      * leave interrupts disabled in case the downstream user deci=
des the
> > > > +      * fault can be resolved inside its fault handler.
> > > > +      *
> > > > +      * There is a possible race if there are multiple context ban=
ks sharing
> > > > +      * the same interrupt and both signal an interrupt in between=
 writing
> > > > +      * RESUME and SCTLR. We could disable interrupts here before =
we
> > > > +      * re-enable them in the resume handler, leaving interrupts e=
nabled.
> > > > +      * Lock the write to serialize it with the resume handler.
> > > > +      */
> > >
> > > I'm struggling to understand this last part. If the resume handler ru=
ns
> > > synchronously from report_iommu_fault(), then there's no need for
> > > locking because we're in interrupt context. If the resume handler can
> > > run asynchronously from report_iommu_fault(), then the locking doesn'=
t
> > > help because the code below could clear CFIE right after the resume
> > > handler has set it.
> >
> > The problem is indeed when the resume handler runs asynchronously.
> > Clearing CFIE right after the resume handler has set it is normal and
> > expected. The issue is the opposite, i.e. something like:
> >
> > - Resume handler writes RESUME and stalls for some reason
> > - The interrupt handler runs through and clears CFIE while it's already=
 cleared
> > - Resume handler sets CFIE, assuming that the handler hasn't run yet
> > but it actually has
> >
> > This wouldn't happen with only one context bank, because we wouldn't
> > get an interrupt until the resume handler sets CFIE, but with multiple
> > context banks and a shared interrupt line we could get a "spurious"
> > interrupt due to a fault in an earlier context bank that becomes not
> > spurious if the resume handler writes RESUME before the context fault
> > handler for this bank reads FSR above.
>
> Ah, gotcha. Thanks for the explanation.
>
> If we moved the RESUME+CFIE into the interrupt handler after the call
> to report_iommu_fault(), would it be possible to run the handler as a
> threaded irq (see 'context_fault_needs_threaded_irq') and handle the
> callback synchronously? In that case, I think we could avoid taking the
> lock if we wrote CFIE _before_ RESUME.
>
> Will

We need the lock anyway due to the parallel manipulation of CFCFG in
the same register introduced in the next patch. Expanding it to also
cover the write to RESUME is not a huge deal. Also, doing it
synchronously would require rewriting the fault handling in drm/msm
and again I'm trying to fix this serious stability problem now as soon
as possible without getting dragged into rewriting the whole thing.

Connor

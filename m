Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF2AA1AB49
	for <lists+freedreno@lfdr.de>; Thu, 23 Jan 2025 21:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E7410E3F5;
	Thu, 23 Jan 2025 20:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bmu6N461";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8556210E3F5
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 20:29:50 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2f74e6c6cbcso307934a91.2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 12:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737664190; x=1738268990; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xhXUcAh2hlUnon67PlT/agcOsGJGx82H3mKA5T5zmFk=;
 b=bmu6N461+nL3FcQr+dKltBhhRnDbftu9ktCC2gRicwNJlPkzdVeLdmrHahL2tpNDE5
 1xE0i8ow1XoAFMXGOGU+e3h2OgOHOZMrjYXOsIv/4CcFk+IwaufKOC4DoBHGbxr/Up3G
 62LXA8pj641Oo8Jr8o6xA5imhMznYJC/nGk1BQpG/lIgT7jkb6yo5RJJQNKwGPXdqsFM
 ffjyx/sVvI48FqF/Ks/9xL9RJ9/DFUzkHtI1la6eD2lUwtUNYSDs/npV0VO+gvhAj7aJ
 2Im8st9yS0+UfyEipY780ssE7bXowu0Qt7kvofI141oXlTvbHzQl2D+fW+6WLwMfd9F6
 TWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737664190; x=1738268990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xhXUcAh2hlUnon67PlT/agcOsGJGx82H3mKA5T5zmFk=;
 b=ihIulzZGIS7wCalFsWaVC227Xv0kQnIWJwfsXkwBqPEE59Qze0NCCqYJDv6CuJq+8o
 7yCAPVMFts3Z8BJKmG6dRwhJ8ZundZcLKALGSz3KbuM1ilDRPB+oMlYnMSGqtquK0dMz
 CPOns96hgYTkRIyRIscFtHbQ+hYYaf5jIOzdNy5bG5hRrx80MgBYQqPqbx9YDGIlkKd6
 skQxA1mDXkDi7wJnWT63zZps1VRvqIT2uokQkZ8JYFIyauwXbCfls+xKLv4ZDjtfSJQ9
 zp/rGARfr9vhwF3Nj8N/UR1GULhnpDNnffU0Ekahfofe9KOfc2tIz7dOr126d1uNHobe
 wLrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNXlf3McAso1nX+G0ALH6XAvn5/9VNRv5qb5OtjwLJTZdjVsf05CcxHHEr6XZVuQWqpni9iicda+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIcT+wBZiLemSYdgRS2fhJnthsymffpoZes5J9jc0bCXoMb8UE
 qfyrTXsikaViMuot+fvddFcsQoBGM8eWEa8GnmyZT/c7zho+EI2xU0/fFQ32e5KRNwuwcO6wCzr
 p5wJRyd7DSSgfIDjdmLzuhdD1Tjs=
X-Gm-Gg: ASbGncvZ8Q/WLCrdQU920MMU8BRHf5xA5vnJpAia5qEhxF4fhG5pGe5+mMqn7qC4rnf
 Ez22SsQGrCgoGmwnVke0s1m9ZC/GlD7tqYjKBfd17Y3TqgNcHAhAj8HhcjVXsGA==
X-Google-Smtp-Source: AGHT+IEl/Vyc8QmUbX/0GWfiscTSIPf6SvYZLBKkQKTl7lLUFAx/A3wbK7xRIXAG5nlkFHCAISdwVSqrdyt6dZww7dM=
X-Received: by 2002:a05:6a00:3a1d:b0:72d:8a01:bb6c with SMTP id
 d2e1a72fcca58-72daf7a1db7mr13737192b3a.0.1737664189916; Thu, 23 Jan 2025
 12:29:49 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
 <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
In-Reply-To: <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 23 Jan 2025 15:29:38 -0500
X-Gm-Features: AWEUYZlzwCzK_Ns_Li_73IXsL90hsOwVuugbU7LWSAnvDp0ILCSA2EsoYowsZGM
Message-ID: <CACu1E7Hw3WxNzwdA2A8hG2yWNVMLy=r=68_X0C3tkVttgRzXVQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
To: Prakash Gupta <quic_guptap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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

On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_guptap@quicinc.=
com> wrote:
>
> On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_guptap@quic=
inc.com> wrote:
> > >
> > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> > >
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
> Not sure if multiple context bank with shared interrupt supported for
> arm-smmu driver, but even if does than context fault handler they would
> operate on their respective context register space, so I don't see the ra=
ce
> at context register update.
>
> > > > +      * re-enable them in the resume handler, leaving interrupts e=
nabled.
> > > > +      * Lock the write to serialize it with the resume handler.
> > > > +      */
> > > > +     if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
> > > > +             u32 val;
> > > > +
> > > > +             spin_lock(&smmu_domain->cb_lock);
> > > > +             val =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR=
);
> > > > +             val &=3D ~ARM_SMMU_SCTLR_CFIE;
> > > > +             arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
> > > > +             spin_unlock(&smmu_domain->cb_lock);
> > > > +     }
> > > > +
> > > > +     /*
> > > > +      * The SMMUv2 architecture specification says that if stall-o=
n-fault is
> > > > +      * enabled the correct sequence is to write to SMMU_CBn_FSR t=
o clear
> > > > +      * the fault and then write to SMMU_CBn_RESUME. Clear the int=
errupt
> > > > +      * first before running the user's fault handler to make sure=
 we follow
> > > > +      * this sequence. It should be ok if there is another fault i=
n the
> > > > +      * meantime because we have already read the fault info.
> > > > +      */
> qcom_adreno_smmu_get_fault_info() reads the fault info as part of client
> fault hanlder. So it would not be ok to clear FSR before reporting the
> fault to client.

That's a good point, but as long as stall-on-fault is enabled it
doesn't matter because subsequent transactions that fault will be
stalled. Patch 3 of this series disables stall-on-fault after the
first fault in drm/msm, but we don't care as much about the accuracy
of those subsequent faults.

>
> > > The context would remain stalled till we write to CBn_RESUME. Which i=
s done
> > > in qcom_adreno_smmu_resume_translation(). For a stalled context furth=
er
> > > transactions are not processed and we shouldn't see further faults an=
d
> > > or fault inerrupts. Do you observe faults with stalled context?
> >
> > Yes. I've observed that on MMU-500 writing RESUME before the interrupt
> > has been cleared doesn't clear SS. This happened with v2 in the case
> > where there was already a devcoredump and drm/msm called
> > qcom_adreno_smmu_resume_translation() immediately from its fault
> > handler, and we'd get a storm of unhandled interrupts until it was
> > disabled. Given that the architecture spec says we're supposed to
> > clear the interrupt first this may have been an attempt to "help"
> > developers.
> >
>
> Just to clarify, present sequence is:
> 1. context fault with stall enable. FSR.SS set.
> 2. Report fault to client
> 3. resume/terminate stalled transaction
> 4. clear FSR
>
> At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is FSR.SS
> cleared and interrupt storm is observed.  The way CFIE disable is helping
> with current patch indicates write FSR is unstalling context and subseque=
nt
> transactions are faulted.  Do you stop getting interrupt storm after writ=
e
> RESUME. If you can mention your SCTLR configuration and FSR state in test
> sequence, it would be clearer.
>
> An aside, If reducing delay between FSR and RESUME write helps then both
> can be done as part of qcom_adreno_smmu_resume_translation(). This will
> follow spec recommendation and also make sure fault registers are not
> cleared before reporting fault to client.
>
> Thanks,
> Prakash

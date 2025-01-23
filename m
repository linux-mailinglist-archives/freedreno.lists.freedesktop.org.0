Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB764A1AB07
	for <lists+freedreno@lfdr.de>; Thu, 23 Jan 2025 21:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A277E10E3EC;
	Thu, 23 Jan 2025 20:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dzZtVvGP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4803110E3EC
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 20:14:28 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-21bb2c2a74dso3011605ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 12:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737663268; x=1738268068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/2QDlQ7ciLXyACEdbXlxDxDDAFIjM/sxdbl1ogTU8Rc=;
 b=dzZtVvGPDQGzW/tQP2pszqnMzE3bftnwKfevJbjK7m++z0cxc6KUE/Psn2ny2vCCGA
 Da0Mw48Ah+UlN9dbFos2mZ5/sbnjGA/XWSsiWO+5lEtqhAHPmrp42Lb8aYqX0XthvVqz
 O7g03eeIuQ/h/lpd3zKtLoIIqKiYO2mRDI32wWvJkAKjtQgC0WA4qiY4Nr3pqpQRBZxI
 WSWNd6SGM3I+Fyd9FznEuFtjoHZV1nDz8t8zk1n3QqL0QCH9+PI07eITzzvPqMwz5bys
 ku0zn1xlouXXu+I1Jyxpvf/dS1hFvIP1cVYHf89ydTqKrBl7IcoipfGpeOvQ3FhFX98n
 9cGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737663268; x=1738268068;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/2QDlQ7ciLXyACEdbXlxDxDDAFIjM/sxdbl1ogTU8Rc=;
 b=ngSIaq0Y9Y8AKRW6pCmXafu8DlHQIgxX7+Bf5ngYTp171bmZfqJSKOVbxGVgjg31ug
 PDEMRI1ykf6hvVDIW/YRuhtXxS887pxK2ld8xqn1L7GTfIn3zMrdXJuwZ1QYjfF4VPmC
 x8OlbZWbGbf5dgdMrNaLUVfn9tmT06EmoiSThG9L5rU7Zp3ZiPdRy0om51SKLxM7W5yC
 Bd+CW9bQu+yMCvZnlg+fyZdQKmYTeS1GPskEvt+5vo18tc/02B+l83cJhKSrUnYU9azX
 M3MDuT5Y7JYuonYmEOgZxGJpC6BsVaY0z4aGAjdkHsSRPQeCRm7CFF1JxWVnLyprJVXz
 uBew==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/wr5jiU6XoSBDPLamGAt0Vipil7VzPwmud1GYzvORiJdFv8AxJ3ZcwY8nqbO3Ba/pomQXlbuM968=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeVjlNVfDCo9U3xYlirV/t+VIJb4j0dVTKfKex2Evzn+OmTG+c
 zRqaQ55ZPlE5fcVpnCL7GfAcM/hDJLKrkxdvH4U9pyfZcUKsxLU+33mAkhRSIgsrG9geWbRCVtz
 KVGCnPQwIWBNjMGkS0UP0V9S+A34=
X-Gm-Gg: ASbGnctUTLmR8yCT8ijVNi/qkbIx3w0vEyP0jVC5e59cynwNx3vzo8wwjYdSuQg0d6I
 IGvLeHTKUtbj4AwUbu84o/RoSIKWVp8LvdTzxXf2lkv4D6Fh38EXphrVH+aFXIilxt3YE/Wol
X-Google-Smtp-Source: AGHT+IF9WRUJHlC8pSwIAj8cVYowT1BAbQRT46w/zBvudQ5hCUtVjX57p1AYxilwi3P5ZVSk1dKDYES+SrAcrckfCwM=
X-Received: by 2002:a05:6a21:9215:b0:1e1:c26d:d81a with SMTP id
 adf61e73a8af0-1eb5d21c42cmr6183007637.8.1737663267550; Thu, 23 Jan 2025
 12:14:27 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
 <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
In-Reply-To: <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 23 Jan 2025 15:14:16 -0500
X-Gm-Features: AWEUYZm4s0a1_xJx4E19lGpX9b_gFH6RT3FcZVLxCaBZ0uPB-4Bak4CDyfFUWL4
Message-ID: <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
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

Let's say CB1 enables stall-on-fault. The sequence is something like this:

- CB0 faults, context fault handler for CB0 runs first
- resume handler writes RESUME for CB1
- CB1 faults on some other pending transaction
- context fault handler for CB1 runs due to the fault from CB0 on
shared interrupt line, discovers there is an additional fault because
we just wrote RESUME
- context fault handler for CB1 writes SCTLR disabling CFIE
- resume handler writes SCTLR enabling CFIE

At the end CFIE is incorrectly enabled while the second CB1 fault is
pending and we get an interrupt storm.

Realistically this is only going to happen if the resume handler gets
interrupted in between the two register writes, otherwise it will
probably win the race and write SCTLR before CB1 can run its context
fault handler. But technically we need the spinlock.

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
> cleared and interrupt storm is observed.

With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
interrupt storm with only FSR.SS asserted. With #4->#2->#3 there is no
interrupt storm. From this we conclude that MMU-500 does not clear
FSR.SS unless #4 happens before #3.

> The way CFIE disable is helping
> with current patch indicates write FSR is unstalling context and subseque=
nt
> transactions are faulted.

No, it does not indicate that. The interrupt storm happens even when
there is exactly one context fault, and when the interrupt storm
happens *only* FSR.SS is asserted. I've verified this with debug
prints. Once more, MMU-500 will assert an interrupt when only FSR.SS
is asserted. This has nothing to do with subsequent transactions.

> Do you stop getting interrupt storm after write
> RESUME.

Yes, as long as the write to RESUME happens after all other bits in
FSR are cleared.

> If you can mention your SCTLR configuration and FSR state in test
> sequence, it would be clearer.

SCTLR has both HUPCF and CFCFG enabled.

>
> An aside, If reducing delay between FSR and RESUME write helps then both
> can be done as part of qcom_adreno_smmu_resume_translation(). This will
> follow spec recommendation and also make sure fault registers are not
> cleared before reporting fault to client.
>
> Thanks,
> Prakash

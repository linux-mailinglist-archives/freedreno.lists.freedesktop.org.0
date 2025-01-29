Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B00BA2167B
	for <lists+freedreno@lfdr.de>; Wed, 29 Jan 2025 03:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F065810E0D2;
	Wed, 29 Jan 2025 02:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gx2MHgpi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E452C10E33C
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2025 02:21:18 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3a9c9f2a569so42600325ab.0
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jan 2025 18:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738117278; x=1738722078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZtnR7A7UffQmykf4aH6iAO9KgDfrU8EA6JB2nIaAYW0=;
 b=gx2MHgpiwBRyFz54+oZOtffFhTzhY86N0X1GBEUpmpzrpbGbX/S2YKmxaV435BWi9l
 EzzaMv41W7JCc0xilgvzgjZHdZu9jDrjtIBgireEwNSJ33zEHgoBtYdmOtwpXWSNpiee
 Y1WyShQWR5qkUE3dnlarwts+rG+Djxueh2tLAky8559lcci3vWC55wIzOAlM5C/Qcrl+
 EOuX6/gllInqaD2m0pu/gLflvxcrjmE/0KSV5K3l+JbqWwTHnSSmBYsiI/zGZl7dVzb4
 fVXoTcHoOS/UrKK+4nDu69ESegbuyPhK9/UQPkzOpu5xEsP/TWuTuP26KnTehH+4SFRl
 rNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738117278; x=1738722078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZtnR7A7UffQmykf4aH6iAO9KgDfrU8EA6JB2nIaAYW0=;
 b=I8sHJjZd2NrXW2+JyoAB5M4B10pgSH9s2IVf8d/jSg/Uy1ihyG0EfoxyoFrSBos28M
 UA7BEDV4L9AfZpa3dHgaJj8NyyNeh+6bS99h5nrxdBpIPL//tPXZJuU7cXlC8ncRrTWl
 3TiwLP8aufDSXv6wDq/z5qxAQvYMXU+CbJD2vo+SsTobVesUD2Rg3lKiwW5swym/lAoN
 dtwqi89TT4EL40wEHikh5wKvwyBwiWO8hV/+gTwCnqpwJFvwauW8Q+HNR0LaYkwq7WYJ
 9fXxx8bCeSip2OVtDjF2wzSPf1eetiM/xXlKuMIG0kqN1SwNlSTlS00YDy7XOKW3YZqK
 cwjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQlZoGKjlIvEVoOd0/+8d96xzTKCtZBK3c00aQVUbWrU6lXyQdxoBKZx/TEHsY54GkUgNCGR55v44=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiaBkOmhhUHI2Y0EqxnNxZJCS9POSOKGESYzn/hdaf4Ar7qA6P
 z3FIMV7t97AazAtMFezS/BPqx9VeoMiW5miBHqphwkfYUoC8GAkGTcS6LUjgRpmQEmIbTj1CY5P
 D2+qIUlwEAdsD5hg78EwUw8jkFac=
X-Gm-Gg: ASbGnctUYo/6xCfw+0+mVTPw5YG+jmvypdX02Niez78EXNogESgdS9E50mKt+XZCFp7
 ugDV5P/Ds9Nnbn+dpbGAxNRyVJZNNzlsqB81O2IZc1SZF9KFBJ+BclDNaBqPtDDi3ZdicMeVm8w
 ==
X-Google-Smtp-Source: AGHT+IHB6eolsV4aH/hplP2BpTqjii/IaDUSxjMDLt9An83E2DQ2Sqv+/y5nVv5os4CQTqahC3lJBJ0CAAndOUs/AC0=
X-Received: by 2002:a05:6e02:198b:b0:3cf:fcc4:eff9 with SMTP id
 e9e14a558f8ab-3cffe3e5dbemr15157515ab.8.1738117278041; Tue, 28 Jan 2025
 18:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
 <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
 <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
 <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com>
 <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
 <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com>
In-Reply-To: <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Jan 2025 18:21:06 -0800
X-Gm-Features: AWEUYZnLX6CXtNjm5Fg1x_aeoKRaj1zqbCfN_3LTjAFaHbtGLWrCztq9g_rdAEY
Message-ID: <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Prakash Gupta <quic_guptap@quicinc.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
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

On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@quic=
inc.com> wrote:
> > >
> > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_guptap@=
quicinc.com> wrote:
> > > > >
> > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_gup=
tap@quicinc.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote=
:
> > > > > > > The context would remain stalled till we write to CBn_RESUME.=
 Which is done
> > > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled conte=
xt further
> > > > > > > transactions are not processed and we shouldn't see further f=
aults and
> > > > > > > or fault inerrupts. Do you observe faults with stalled contex=
t?
> > > > > >
> > > > > > Yes. I've observed that on MMU-500 writing RESUME before the in=
terrupt
> > > > > > has been cleared doesn't clear SS. This happened with v2 in the=
 case
> > > > > > where there was already a devcoredump and drm/msm called
> > > > > > qcom_adreno_smmu_resume_translation() immediately from its faul=
t
> > > > > > handler, and we'd get a storm of unhandled interrupts until it =
was
> > > > > > disabled. Given that the architecture spec says we're supposed =
to
> > > > > > clear the interrupt first this may have been an attempt to "hel=
p"
> > > > > > developers.
> > > > > >
> > > > >
> > > > > Just to clarify, present sequence is:
> > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > 2. Report fault to client
> > > > > 3. resume/terminate stalled transaction
> > > > > 4. clear FSR
> > > > >
> > > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is =
FSR.SS
> > > > > cleared and interrupt storm is observed.
> > > >
> > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
> > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 there is=
 no
> > > > interrupt storm. From this we conclude that MMU-500 does not clear
> > > > FSR.SS unless #4 happens before #3.
> > > >
> > > Thanks Connor for clarification. I get your point now. I think it's
> > > expected interrupt storm with #2->#3->#4 sequence is expected.  With
> > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the sequenc=
e of
> > > #1->#2->#4->#3, which is spec recommended.
> > >
> > > so, common fault handler can be modified to follow the same sequence,=
 but I
> > > have concern regarding clearing FSR before reporting fault to client.
> > > qcom_adreno_smmu_get_fault_info() is an example I gave but other clie=
nt
> > > handler may have similar expecation of fault register not changed bef=
ore
> > > client fault handler is called.
> >
> > Simple solution would be to move the clearing of FSR to after the
> > fault is reported.  It doesn't really matter if it is before or after,
> > as long as it happens before the irq handler returns, AFAIU.  And
> > drm/msm will collect the fault info from the irq handler.
>
> As I said in the earlier mail: "From this we conclude that MMU-500
> does not clear FSR.SS unless #4 happens before #3." #4 is clearing FSR
> and #3 is writing RESUME. So no, unfortunately it does actually matter
> and we get a storm of unhandled IRQs if we don't clear FSR first. Your
> solution is what v2 did and it didn't work.

So, just clear FSR also in the resume path

BR,
-R

> Connor
>
> >
> > BR,
> > -R
> >
> > > > > The way CFIE disable is helping
> > > > > with current patch indicates write FSR is unstalling context and =
subsequent
> > > > > transactions are faulted.
> > > >
> > > > No, it does not indicate that. The interrupt storm happens even whe=
n
> > > > there is exactly one context fault, and when the interrupt storm
> > > > happens *only* FSR.SS is asserted. I've verified this with debug
> > > > prints. Once more, MMU-500 will assert an interrupt when only FSR.S=
S
> > > > is asserted. This has nothing to do with subsequent transactions.
> > > >
> > > > > Do you stop getting interrupt storm after write
> > > > > RESUME.
> > > >
> > > > Yes, as long as the write to RESUME happens after all other bits in
> > > > FSR are cleared.
> > > >
> > > > > If you can mention your SCTLR configuration and FSR state in test
> > > > > sequence, it would be clearer.
> > > >
> > > > SCTLR has both HUPCF and CFCFG enabled.
> > > >
> > > > >
> > > > > An aside, If reducing delay between FSR and RESUME write helps th=
en both
> > > > > can be done as part of qcom_adreno_smmu_resume_translation(). Thi=
s will
> > > > > follow spec recommendation and also make sure fault registers are=
 not
> > > > > cleared before reporting fault to client.
> > > I think this sequence should address the issue you are observing.
> > >
> > > > >
> > > > > Thanks,
> > > > > Prakash

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB5A5E540
	for <lists+freedreno@lfdr.de>; Wed, 12 Mar 2025 21:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F1E10E0C7;
	Wed, 12 Mar 2025 20:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aCzVqusj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C53310E0C7
 for <freedreno@lists.freedesktop.org>; Wed, 12 Mar 2025 20:20:59 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3d3db3b68a7so1840345ab.0
 for <freedreno@lists.freedesktop.org>; Wed, 12 Mar 2025 13:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741810858; x=1742415658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=leDzS7eIFvtHXIQQ9eglVb87YCz9EMBQq+7ox6gc9Qk=;
 b=aCzVqusjZxLIvRjXdPpksJN2dBdLRqBB0f1JTVbF16DUhwrJMW1LKUvgZfBg7JlAvB
 zVpVsqw8awVtahMt5MaUq84ojifwTjbIsmBEOXaqK+1riSREJ+xosiWmAwrCBL4WnKyd
 D8c8BCrhIeLtryZWyvPEBaIb/tm3gbYKbhTenruDHMRGoo2QMg3wb17HmN7b9TRS07Nj
 /aIyGR2MkS9UfNgvvYiPwWHXbLutduaYJlZPpv5YTWtQCf6DFEGjZj6CM4Fxm8CMBm5t
 NrE7GKZ3nvLWCQBqRjFol/uj/kkB71rSvLRPsWSFHoInpx689brrxi+QbEZ38XN+77KY
 7tHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741810858; x=1742415658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=leDzS7eIFvtHXIQQ9eglVb87YCz9EMBQq+7ox6gc9Qk=;
 b=BwOxHR3l/EHJBs7EgBWVjSey2y/ZSnuAnrWnASBP8o+ox9wRtdjFUXBYIA4m4hOWCY
 i6EWcqdZJI8HLSAAEGbFgsTYxcq8QJT/poW2bn0Gqb94+YRYd/FukmsQVYm1S2ZNOsou
 Szae7vuSWC62UjTw1FkvpEFWKBOXH9aPNmSH8lFpQgKrlunO/MpAyHs5Gw1yJJgbNG1Z
 b0e+fB5ivlh6yuMO86c+8bzBwsSZZ+CA6O+5n62EdAVzrfgVpY3hBCYr3bZ7hD6wgIr0
 kLsW8wtL0wxZJru2zOOB7RMDahq7Yw2tys/gJSNlvFD1tS5VD6L0CNJgl75+QnBZKKaF
 ciQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO1B2YmMHoh4gXkv4h35VvX6JNlf0JBGUTJin/GY5b6w3ffHTaugt7cBycVX4gTJ/vyMf576hXdp8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS8OrYAhsz+VcuEQSGxrCmO/Yn9MZ2lQhdMA55vT/Hs1SUGxh6
 9glPleO9csvlrDc0ynBSME4douOMZBqaxDxEKLiRKMbaeE+5cbVh8e01+HCFxn6XLxN2AC+uiBM
 ykGZwCzH401KtXXto6LVJGnpNy2g=
X-Gm-Gg: ASbGncst2OLx7+YlqH8Bydbo96ZccdYRIdKKx9fROtpJ50oK0Eh2ltDP9mqxc9yWKhX
 Vc/J+MFhzG58RUHA1+Q+/D7qG+ImzEAQl0tj7kOFN8jciHSGcdcAGJskvEEvE0xcoVnbYVA3JtH
 RsEmhQrjQp4OdRlhio4Ln+fxxWQbNnVdtDLFG2G+WSiwK1Mmuu2i70164=
X-Google-Smtp-Source: AGHT+IED4T6DLDIo3SmEhvYjhrVEJRweu80/CkvzBfXjIoBQfKIpAoBxfGcLmBmU9mYcxJ7671LtEDQ7s45JySuNKLY=
X-Received: by 2002:a05:6e02:5a1:b0:3d4:700f:67e7 with SMTP id
 e9e14a558f8ab-3d4700f6b02mr43315405ab.17.1741810857983; Wed, 12 Mar 2025
 13:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck>
 <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck>
 <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
 <20250312164735.GA6561@willie-the-truck>
 <CAF6AEGskyoemQDrTXh=ewf61e-hVzWMjmqe=nX2J-65W5-M6Zw@mail.gmail.com>
 <2d47815d-6bee-4d1f-8b60-854763794bf6@arm.com>
In-Reply-To: <2d47815d-6bee-4d1f-8b60-854763794bf6@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Mar 2025 13:20:45 -0700
X-Gm-Features: AQ5f1Jr0TpL3RJwurfnQxJV3DndqXaN2cYc9nQyOJQLHZCc7asLNsX0jHJOoZ20
Message-ID: <CAF6AEGvhixYvXghvD+itnSDjr7bO4i3Ls0Y-kXC-ohFN=CS0PQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, 
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

On Wed, Mar 12, 2025 at 11:01=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
>
> On 12/03/2025 5:23 pm, Rob Clark wrote:
> > On Wed, Mar 12, 2025 at 9:47=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> >>
> >> On Wed, Mar 12, 2025 at 07:59:52AM -0700, Rob Clark wrote:
> >>> On Wed, Mar 12, 2025 at 6:05=E2=80=AFAM Will Deacon <will@kernel.org>=
 wrote:
> >>>> On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> >>>>> On Tue, Mar 11, 2025 at 2:06=E2=80=AFPM Will Deacon <will@kernel.or=
g> wrote:
> >>>>>> On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> >>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iomm=
u/arm/arm-smmu/arm-smmu.c
> >>>>>>> index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3b=
e0bfba75eea1d5de23117de 100644
> >>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>>>>>> @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct=
 arm_smmu_device *smmu, int idx,
> >>>>>>>                                      struct arm_smmu_context_faul=
t_info *cfi)
> >>>>>>>   {
> >>>>>>>        cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR=
);
> >>>>>>> +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTB=
R0);
> >>>>>>>        cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> >>>>>>> -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYN=
R0);
> >>>>>>> +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSY=
NR0);
> >>>>>>> +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSY=
NR1);
> >>>>>>
> >>>>>> We already have an implementation hook (->get_fault_info()) which =
the
> >>>>>> qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info=
().
> >>>>>> That thing dumps these registers already so if we're moving that i=
nto
> >>>>>> the core SMMU driver, let's get rid of the hook and move everybody=
 over
> >>>>>> rather than having it done in both places.
> >>>>>
> >>>>> As you probably saw, the next commit moves over
> >>>>> qcom_adreno_smmu_get_fault_info() to use this. The current back doo=
r
> >>>>> used by drm/msm to access these functions is specific to adreno_smm=
u
> >>>>> and there isn't an equivalent interface to allow it to call a gener=
ic
> >>>>> SMMU function so it isn't possible to move it entirely to the core.=
 At
> >>>>> least not without a bigger refactoring that isn't justified for thi=
s
> >>>>> series that is just trying to fix things.
> >>>>
> >>>> Ok :(
> >>>>
> >>>>>>>        cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CB=
FRSYNRA(idx));
> >>>>>>> +     cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB=
_CONTEXTIDR);
> >>>>>>
> >>>>>> I think the CONTEXTIDR register is stage-1 only, so we shouldn't d=
ump
> >>>>>> it for stage-2 domains.
> >>>>>>
> >>>>> Does it matter if we read the register though, as long as users are
> >>>>> aware of this and don't use its value for anything?
> >>>>
> >>>> I think the contents are "UNKNOWN", so it could be hugely confusing =
even
> >>>> if they just got logged someplace. Why is it difficult to avoid touc=
hing
> >>>> it for stage-2?
> >>>>
> >>> Fwiw, we are only ever using stage-1
> >>
> >> Sure, but this is in arm-smmu.c which is used by other people and supp=
orts
> >> both stages.
> >
> > Sure, but no one else is using this field in the fault-info.  So maybe
> > the addition of a comment in the struct would be enough if it isn't
> > going to cause an SError/etc to read it for S2 cb?
>
> Any worthwhile comment isn't going to be significantly shorter or
> clearer than 1 extra line of "if (smmu_domain->stage =3D=3D
> ARM_SMMU_DOMAIN_S1)"...

Just that smmu_domain isn't passed to
arm_smmu_read_context_fault_info(), so it would add some extra churn
on top of that one extra line

> TBH it's the Qualcomm register-middle-man firmware I'd be more worried
> about than real hardware, given how touchy it can be even with register
> accesses which *should* be well defined. But then I guess it also has
> the habit of killing the system if anything other than the GPU dares
> cause a fault in the first place, so maybe it OK?

If we have qc hyp, then we don't get S2 in the first place ;-)

BR,
-R

> If anyone still uses Arm Fast Models SMMUv1/2 components it'll probably
> squawk an annoying warning there too - ISTR I had at least one patch
> motivated by that in the past.
>
> Thanks,
> Robin.

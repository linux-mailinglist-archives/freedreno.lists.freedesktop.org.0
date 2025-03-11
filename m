Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B44A5CFA0
	for <lists+freedreno@lfdr.de>; Tue, 11 Mar 2025 20:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC45A10E09C;
	Tue, 11 Mar 2025 19:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZkRaRc0U";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDC710E09C
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 19:42:51 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2240d930f13so9594355ad.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 12:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741722171; x=1742326971; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8N/4+Bu0y09vjMihB3VFFSKzM9LtDAemE75jVPYGVnw=;
 b=ZkRaRc0U/mbQXX53n2B/iM7juFPryPE3qrz1jREwHk5XUFh3EPs4Ip03JrybixCxDn
 6UculpYmtcTRGJuWm7vh20B74nBiVf1nm0woensr1OXOTMu4NhyXV139uPMuGnbW+GIU
 FxD1Nh9xP6DG/yf40j81p4H8gL5AUtAgC+Hi7Bee8tjQs5rV1mAgiHdrG7durwJGiZ9Z
 JhllRgbv6qSlx8ITeZZ7mT1Yf409KhldELjf9uYzyIZr3HofNiD3ieEVEVslh/NpqEve
 lIEymTwV8qKC2GVApCmklMpUYP3oZUNEZzVnaRwyNqfrhR6B2J+tDXPD21pciUWrF311
 mOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741722171; x=1742326971;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8N/4+Bu0y09vjMihB3VFFSKzM9LtDAemE75jVPYGVnw=;
 b=NT9o/TBlZwV4AD3/S91dgSKErqGjYEiom1u1fEyxXSzldGoD6Tqm4UVcvsxQmf+xcI
 LrjhNnG7ts687ckYs+65Z5Oo4oo+7UwbtpqfoKo6rS6mnuh/OiSuxBaqxfF3f+yQ0Vhl
 rOqI1aWDq6/Cf+2vmyUx8M3yp6yFogdKLpYOqconx4nf0xfdIoTH0tDumYcZn9URDTwp
 hYRpifWz1i8NCPpCtQPBO1OkmJxpJD8B+lt90D7PWZ/IdHuPM2AzloDNtfBjdJbax048
 Wis3pQt4Z87MqsX8x40hJD254rAA86ya5VP5UnBlYwYh6zl/DKTYGWa5ftjQsA8xgls9
 SW2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGZ9N2Xg68n/NwQ854b7T2KyyIGqI6oez5u8+dls5r7WqnmswpLbz6tTE2nJHJv4dVmhi+pNY4g4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVM1dwo6xrMCVs0rMs3z2nyaJayqMbhA77Nnkqyxu9zhFPORsq
 7Z23sYoWDxwDFI3vqzHrpihCkafDPkthFCSX98cIUeAdCf/OInci7hs0hn3d3lXj/t6OnxOjpiV
 /XjbrBxRONaVczXouqROFrfCitH0=
X-Gm-Gg: ASbGncvcXCtQ26jDp/tXtJt23RwBj+n4C7QX16lKAC8g5wPXTPA792S/TuBVSXDb7hH
 BBrfyyiXfmrowkzaBXMC+LoY2YQRPaRJPaK1M+V1PzrNx6t3Naf3x5/Fvl95DeL09oo6HlYDf/e
 kp3fkJAXoZVbWJikAo/s3lQVkPMa2eQ0zwEu6s
X-Google-Smtp-Source: AGHT+IFUV+t76koSVwvfP0DiZwzaDgX4TU97m1RDJMgX9rF6Maeao/NZF5n1twVNajoiVfnFuWNdcIiFIJEURljqxUQ=
X-Received: by 2002:a05:6a00:3e04:b0:730:9989:d2d4 with SMTP id
 d2e1a72fcca58-736eba65be7mr2466708b3a.3.1741722171206; Tue, 11 Mar 2025
 12:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
 <20250311180807.GC5216@willie-the-truck>
In-Reply-To: <20250311180807.GC5216@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 11 Mar 2025 15:42:38 -0400
X-Gm-Features: AQ5f1Jpiv6Ky6TiyCXBXNy8BjxnsE1wP6MKIErri1CZPIQdm5BNmyqGHT0u49Nw
Message-ID: <CACu1E7Hw6vGbTQ7t-Hj3ziycZhPxtOGSDkt7o4fNUx91KDcXfg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
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

On Tue, Mar 11, 2025 at 2:08=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 04, 2025 at 11:56:48AM -0500, Connor Abbott wrote:
> > In some cases drm/msm has to resume a stalled transaction directly in
> > its fault handler. Experimentally this doesn't work on SMMU500 if the
> > fault hasn't already been acknowledged by clearing FSR. Rather than
> > trying to clear FSR in msm's fault handler and implementing a
> > tricky handshake to avoid accidentally clearing FSR twice, we want to
> > clear FSR before calling the fault handlers, but this means that the
> > contents of registers can change underneath us in the fault handler and
> > msm currently uses a private function to read the register contents for
> > its own purposes in its fault handler, such as using the
> > implementation-defined FSYNR1 to determine which block caused the fault=
.
> > Fix this by making msm use the register values already read by arm-smmu
> > itself before clearing FSR rather than messing around with reading
> > registers directly.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
> >  3 files changed, 27 insertions(+), 27 deletions(-)
>
> [...]
>
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/=
arm-smmu/arm-smmu.h
> > index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a7033833716635=
efb3968a0bd3ff237 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
> >       ARM_SMMU_DOMAIN_NESTED,
> >  };
> >
> > +struct arm_smmu_context_fault_info {
> > +     unsigned long iova;
> > +     u64 ttbr0;
> > +     u32 fsr;
> > +     u32 fsynr0;
> > +     u32 fsynr1;
> > +     u32 cbfrsynra;
> > +     u32 contextidr;
> > +};
> > +
> >  struct arm_smmu_domain {
> >       struct arm_smmu_device          *smmu;
> >       struct io_pgtable_ops           *pgtbl_ops;
> > @@ -380,6 +390,7 @@ struct arm_smmu_domain {
> >       const struct iommu_flush_ops    *flush_ops;
> >       struct arm_smmu_cfg             cfg;
> >       enum arm_smmu_domain_stage      stage;
> > +     struct arm_smmu_context_fault_info cfi;
>
> Does this mean we have to serialise all faults for a given domain? That
> can't be right...
>
> Will

They are already serialized? There's only one of each register per
context bank, so you can only have one context fault at a time per
context bank, and AFAIK a context bank is 1:1 with a domain. Also this
struct is only written and then read inside the context bank's
interrupt handler, and you can only have one interrupt at a time, no?

Connor

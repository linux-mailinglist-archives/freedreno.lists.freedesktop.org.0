Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2D1AACADF
	for <lists+freedreno@lfdr.de>; Tue,  6 May 2025 18:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596F910E267;
	Tue,  6 May 2025 16:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OCrsluLM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973DC10E267
 for <freedreno@lists.freedesktop.org>; Tue,  6 May 2025 16:26:37 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7393eab4a75so603085b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 06 May 2025 09:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746548797; x=1747153597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2iEPT31lWJmfZ711HkWVQ8QdQyTw1Ihj+viAfDs+a4=;
 b=OCrsluLMxbpNFLyf8a0wQTr4OXGMWWPaWck7bdHFY5Z1JiEbVUzx0HGzc8sPQYQWe5
 HedebDgnZD1IwJE/nkSPLhklkyHFtpboDQWKeGfkyZPc2SETnU6Jn8HlKqxcvYkZ5kqR
 1YecURgiOpgZEVdfU/mRa0o2idGAFnH9VycEHQWpD2XzcAcF3ec2hdNwsGWpFV4hEd6l
 n3DTjVJ4Kpz0kIcQyg/gNgW9g/PRnFNjemsEvdmeZc94XWBcVTICLZ3toQ5EluINpm1l
 cW0f23Yw3LpMONr9pHO6ACmSaPEfpit0O56AVawWE9GodKEabicMdOnOz/LIKZ4H9x7e
 YhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746548797; x=1747153597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2iEPT31lWJmfZ711HkWVQ8QdQyTw1Ihj+viAfDs+a4=;
 b=oCUDAhuMMoI4GAYwAzq52LOaHUaUEoYw4eriyVkjWl73Zx5cTdVSd1wcbCsoS6bUcg
 6Hn1zwr+yVN/cmBlLjyiBzopwrnJVsJpEf1HOVTztYTRE8d87F6wHIJSjiW914a8pgM6
 FQbRe4bF5svhn2vhBUeZV2dQxH/wLaKALSs+zDWyNA4CCVdMMj8M94W01nUkZN+adVbb
 bnlHSmznLpb88GT5TN/qucL4UxolSu6ZMNNv00cRa1tQvHe+tAn5JSK5S564hHuazmgg
 j2uQpznbmGDFR8aLj0j1TtlW8zabFt/jieHLlGK/oQhp0lKOsGOfoCjcOX42DIc5nvNR
 k9XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUZkgZj/66cv1pUReBq2iCEC/JSZkM1B0p/t7qwldSY4aTslSf6NstkPtHPA1eR3iIiIU3qe6fkiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWEaulCZNcZJMx3cSod7hp6dECdlUxooijbn1NBEDaBpvATDj6
 Ye8IcF/IinRuJbKKJcLF9iaKW+N1qoeIM1P4Go8OxNTC7PGJr48oXPAKmroSOHwAdyqIwqZhNYm
 Vm6ccUKGvTvjDJD6rdXdwYq1nIPw=
X-Gm-Gg: ASbGncsXdmeGYCpbvvqKP36d5TqewnKbpfdY+cD6CFjutO+8WODhlJtJdM0vrxoiMee
 KQA0IGQoFfd72JRChBxAbyQtcmgU+8yUUnCH/BxUNiwKtm8mgRMQw5GP4utg18HOCHTOAX5VMq+
 q1ZexxnFhA5/HUTnvQKWIOtA==
X-Google-Smtp-Source: AGHT+IFevbIXo6chZ46DVNlJBWVZ9S7rGrPtFFMLAbHqHbciNEKnYEm+KoSXMjS7AzymQV/ccrlzB9i7DV6tVCsE5Kc=
X-Received: by 2002:a05:6a00:4296:b0:730:87b2:e848 with SMTP id
 d2e1a72fcca58-7409ba60c50mr111599b3a.5.1746548797029; Tue, 06 May 2025
 09:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-1-97561209dd8c@gmail.com>
 <20250506113246.GA723@willie-the-truck>
In-Reply-To: <20250506113246.GA723@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 6 May 2025 12:26:25 -0400
X-Gm-Features: ATxdqUGyVeePAC0AKGU6Pbw5gC5TE6nCefsVqalCzAGzu-h58HCMKVxLU73Zb-o
Message-ID: <CACu1E7HXd9bUWwPCa_XxkQYRwCg6aobr8snFzArE=D99Z+iRJQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] iommu/arm-smmu: Save additional information on
 context fault
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

On Tue, May 6, 2025 at 7:32=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Mar 19, 2025 at 10:44:00AM -0400, Connor Abbott wrote:
> > This will be used by drm/msm for GPU page faults, replacing the manual
> > register reading it does.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > Reviewed-by: Rob Clark <robdclark@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  6 ++--
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 35 ++++++++++++++--=
--------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  7 +++--
> >  3 files changed, 29 insertions(+), 19 deletions(-)
>
> [...]
>
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/=
arm-smmu/arm-smmu.c
> > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a02078eb968b81a35c1c086=
ed7007ea2a453ef94 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -405,13 +405,20 @@ static const struct iommu_flush_ops arm_smmu_s2_t=
lb_ops_v1 =3D {
> >  };
> >
> >
> > -void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, in=
t idx,
> > +void arm_smmu_read_context_fault_info(struct arm_smmu_domain *smmu_dom=
ain,
> >                                     struct arm_smmu_context_fault_info =
*cfi)
> >  {
> > +     struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > +     int idx =3D smmu_domain->cfg.cbndx;
> > +
> >       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> >       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
> >       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA=
(idx));
> > +     if (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_S1)
> > +             cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_=
CB_CONTEXTIDR);
>
> I think this leaves 'cfi->contextidr' uninitialised for stage-2 domains.
> We should probably either zero it here or just zero-initialise the whole
> 'cfi' struct in arm_smmu_context_fault() with a:
>
>         struct arm_smmu_context_fault_info cfi =3D {};
>
> line.
>
> Will

The next patch moves the context fault info into arm_smmu_domain which
is already zero-initialized.

Connor

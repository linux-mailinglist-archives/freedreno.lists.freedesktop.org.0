Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38599F3BBB
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2024 21:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DF410E61C;
	Mon, 16 Dec 2024 20:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZLOk3/fQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C05110E19F
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 20:54:56 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a8aed87a0dso15906715ab.3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 12:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734382496; x=1734987296; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pGu56YKO1XlSS7wwJkm05qsGyYVWIdWmEMISHyf2DmA=;
 b=ZLOk3/fQd4IhBCS6CQw3rgBsTjFu+lrf3dc1u4j84B3vebLuqZdOkJ9n5ZHKk47+s9
 yDGME/lj/mMPK/fdIdrnAvGw5knrgIi2t21ASYscK7AIHK7iQmX8Fhfykl82r9un6faC
 d1yJXGiQrO8uQYBLZekd0Z8OfapyKpOXkFjEy8/BkmlmeYSSJYcgNRcRMbh/SYaeCA00
 E+F+Qcmr9BT18rNuIkd7tu5eXcYRggA4vL2oQ2UqFuZi/JfJjf2ZuBHt+jD+5mZuA9ZX
 X4v1zxjUmcdFg6io9utxBC9AcuujK605XnYg0udpCzI4WpBSFDMZApWVvMpg7eeltoaa
 s8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734382496; x=1734987296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGu56YKO1XlSS7wwJkm05qsGyYVWIdWmEMISHyf2DmA=;
 b=npSYvd4nrK9n2GfE2MKUwFr+wMntLhXB/KAhxpz/pBbN7RkE38CCBD9I7l/387mZ90
 vr5gCtVZi+gxbNKqJHFzrJ0XTc73JUsscONz7ZGPlh3sq/uYEeIbqrqHhP3y6n/SRbeI
 ogc8ZJFjLDFBtiWfQ3CwjhMXLDs410pDqqNrviqTaUiHZsTaURqcxEVdc4ZpIHpHC85K
 tD6i7xMMm8QUl9zTXwYx6GSyWqzNVRZnKXS/UYT4ovOfmXwyO4/H59y1i+zRhtVeIRWy
 E/dJPM2fI58/xLdCnGhWVyRRQwn1lk7VCxnUJ1sQPziBX5ps7wyKFhPO03ulGomzcoCr
 sYqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr5WTycRiBfwoC9WOvaQWbE/nS7wT9M6gwg0/lBZHaTbfyZMqcwiwAogwwOJ7w81sDL3YuKhC1sL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL1IlciNoT2YgTmiPS11JYZM1ihjT77e3hCEQhu1/6Uis040/g
 Q3yWNm/1abOewu3437Bb8k5qKsHy43AGXGWK5TYNWfeeHxD7sE5PZue/6xHnxUfM4/9VPuh5uOg
 tsf9XtgrFjSVzdg5CtjASa48oC8s=
X-Gm-Gg: ASbGncub02pRwd/jHTJ1y/U51ZnGkGvtLSbbydr4zlGv1WfzUU+sEt0sdd2VKW5+Lpx
 G37IBzeK94z+s4+UrnmMFHLqW29gBl6WudLykF7T0BBI9XwYJPs3tWImMTBHfXIn4e+dB
X-Google-Smtp-Source: AGHT+IE6NSDPDfv/Nr17YFiwuwQ8NV0QFzK1yfUD5+dRWkpGvLeKWKyM4SsI5zKJl53NjUsanNs56HL6Xdim8pgvJWw=
X-Received: by 2002:a05:6e02:1a07:b0:3ab:4bea:df97 with SMTP id
 e9e14a558f8ab-3affbbb656fmr160374485ab.23.1734382495871; Mon, 16 Dec 2024
 12:54:55 -0800 (PST)
MIME-Version: 1.0
References: <20241216171017.4881-1-robdclark@gmail.com>
 <a15a7594-8793-478b-a86e-81a06812e4ff@quicinc.com>
In-Reply-To: <a15a7594-8793-478b-a86e-81a06812e4ff@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 16 Dec 2024 12:54:43 -0800
Message-ID: <CAF6AEGsFeibyH5_a7m=9PMKReD4Xb+c=dEGsbCN0_UHiJK1vbA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, 
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>
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

On Mon, Dec 16, 2024 at 12:28=E2=80=AFPM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 12/16/2024 10:40 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > On mmu-500, stall-on-fault seems to stall all context banks, causing th=
e
> > GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >
> > This fixes an issue with an older mesa bug taking outo the system
> > because of GMU going off into the year.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom.c
> > index c4c52f7bd09a..1c881e88fc4d 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -331,8 +331,10 @@ static int qcom_adreno_smmu_init_context(struct ar=
m_smmu_domain *smmu_domain,
> >       priv->get_ttbr1_cfg =3D qcom_adreno_smmu_get_ttbr1_cfg;
> >       priv->set_ttbr0_cfg =3D qcom_adreno_smmu_set_ttbr0_cfg;
> >       priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
> > -     priv->set_stall =3D qcom_adreno_smmu_set_stall;
> > -     priv->resume_translation =3D qcom_adreno_smmu_resume_translation;
> > +     if (of_device_is_compatible(np, "qcom,smmu-v2")) {
> > +             priv->set_stall =3D qcom_adreno_smmu_set_stall;
> > +             priv->resume_translation =3D qcom_adreno_smmu_resume_tran=
slation;
> > +     }
>
> Shall we disable this from the driver instead? A debugfs knob to trigger
> coredump after a pagefault is very convenient.

It would require the driver to find the compatible for the smmu, so it
could differentiate btwn smmu-v2 and mmu-500, which seemed like it
might be a bit uglier.

Ideally/hopefully we could figure out how to make GMU a bit more
resilient in the face of stalled translations, because it is useful to
get accurate devcore dumps on smmu faults.  At that point we could
revert this change.

BR,
-R

>
> -Akhil
>
> >       priv->set_prr_bit =3D NULL;
> >       priv->set_prr_addr =3D NULL;
> >
>

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812C2A213F1
	for <lists+freedreno@lfdr.de>; Tue, 28 Jan 2025 23:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED7D10E025;
	Tue, 28 Jan 2025 22:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G4laICpY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4617610E025
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jan 2025 22:10:02 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3cfe17f75dfso21510945ab.2
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jan 2025 14:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738102201; x=1738707001; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyJffkBFdN8fIysYz8PGYmBGwUKqJch+7WjonIterd4=;
 b=G4laICpYt7xBhFfLDnArCw0clKZ0dfeC9FzfFqdiU98W9y772mwjEB7qfMnkuCvXKe
 mNzu8C5fCEZLVJC4heHgGQHypdlkDOF0MlaJt+sjp7ELcXirC9JQgStcuiWX9BaSinYu
 7iJOEe6XFl7s0T2ptaPX0YBm6i0Z5btwWDBX84waMWhqeOY7wrYzzv07Vk3n5Thb7wVQ
 R2nsgGgGx9LOI711eBxxD9b+DhKpPF6n42+sZ8OJULuBwO9gAs9xK8F40iCnOEjn6Aej
 lfEK0cKoThpqWazeptx+dzn48vRPsyZKzMHdh2ixKSPUodVtZlH8oHhGw7ouTGSbrzfc
 83vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738102201; x=1738707001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dyJffkBFdN8fIysYz8PGYmBGwUKqJch+7WjonIterd4=;
 b=KKvQpLfIJ8W+w4hd1DWHCfT125MG2yfjDezUSmtNsFXz/BwUNSnYnoKz0cML8UuEJm
 7BzRT3df9bUPpF1vnsgzQWqmw45A1WCLW4g2zg2TpV+FtplVzRhLV2VBTejvkV2gcTTT
 84mrH19M3RS1rX9PY2Y1drXLh/hsJFI1Dql9yr9ks2RbpBuf2YbNxcAR2FRwRaPm8h4V
 VVrm9VOL8KtziPx8BTtSkn1b5gJlkuYBOmU5MuSR/YNqfxAdHlsWZlzGCEBLiwNwZwG5
 fvvoo/Se8RwAjQHiwHAV4tseU1WVx3nFsiu781NNaU6023Le9lZrveRKJTdm5Ai+YNu7
 iqDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmfKgCeFutlUF36OgtJQalhiJKSP2BYjVZYRJHcvwrWo2iKgsxSIVuU/BUZwEPdrTnlwwWHXGXdHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1hj7Wvh8RHDs5tqwGbuSZgCbkD2uUMdNbTU5X9ey2minBTcO/
 9nH9kKMsrYFD2c8EuCJD/1/wv5UHvUx/X1nVpZSs4W/AvSu6wXz+S+OKpzOQbx7xY8pUg46cstr
 ljDlZ6lMvHRLpH7iFhf0GEVuKLYY=
X-Gm-Gg: ASbGnctxrhnr3q2XS+SIhuVXDyiOCNB5vp6P/4cK50ovoV5E9vpeWfQ74+6Km/mcN6S
 wQvVijYvqgD8FNJHxW/4WbNjxQFjB0Ja1269P87bA/4HaCeiM7REZIV7z4HdkcDc0mSQjoZNA8z
 XED5V7AqsM24UEndWBzipYOIqmwg==
X-Google-Smtp-Source: AGHT+IHgfYpA0VMAacYmWKH7JphTu43Ivw7JChSTcf6n7PHDLpUdxL7L5C0eaN2l2Zyi0/kWh6WQspB+VO1SCyrGhQU=
X-Received: by 2002:a92:cda9:0:b0:3cf:bb3e:884c with SMTP id
 e9e14a558f8ab-3cffe44793amr7793705ab.16.1738102201257; Tue, 28 Jan 2025
 14:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
 <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
 <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
 <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com>
In-Reply-To: <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Jan 2025 14:09:48 -0800
X-Gm-Features: AWEUYZl2-uHarNn2psbsrw1v352rDEu3UlOhpWnD80DHoE6YTIxA3r72Hj27dzk
Message-ID: <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
To: Prakash Gupta <quic_guptap@quicinc.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Will Deacon <will@kernel.org>, 
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

On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@quicinc.=
com> wrote:
>
> On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_guptap@quic=
inc.com> wrote:
> > >
> > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_guptap@=
quicinc.com> wrote:
> > > > >
> > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> > > > > The context would remain stalled till we write to CBn_RESUME. Whi=
ch is done
> > > > > in qcom_adreno_smmu_resume_translation(). For a stalled context f=
urther
> > > > > transactions are not processed and we shouldn't see further fault=
s and
> > > > > or fault inerrupts. Do you observe faults with stalled context?
> > > >
> > > > Yes. I've observed that on MMU-500 writing RESUME before the interr=
upt
> > > > has been cleared doesn't clear SS. This happened with v2 in the cas=
e
> > > > where there was already a devcoredump and drm/msm called
> > > > qcom_adreno_smmu_resume_translation() immediately from its fault
> > > > handler, and we'd get a storm of unhandled interrupts until it was
> > > > disabled. Given that the architecture spec says we're supposed to
> > > > clear the interrupt first this may have been an attempt to "help"
> > > > developers.
> > > >
> > >
> > > Just to clarify, present sequence is:
> > > 1. context fault with stall enable. FSR.SS set.
> > > 2. Report fault to client
> > > 3. resume/terminate stalled transaction
> > > 4. clear FSR
> > >
> > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is FSR.=
SS
> > > cleared and interrupt storm is observed.
> >
> > With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
> > interrupt storm with only FSR.SS asserted. With #4->#2->#3 there is no
> > interrupt storm. From this we conclude that MMU-500 does not clear
> > FSR.SS unless #4 happens before #3.
> >
> Thanks Connor for clarification. I get your point now. I think it's
> expected interrupt storm with #2->#3->#4 sequence is expected.  With
> CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the sequence of
> #1->#2->#4->#3, which is spec recommended.
>
> so, common fault handler can be modified to follow the same sequence, but=
 I
> have concern regarding clearing FSR before reporting fault to client.
> qcom_adreno_smmu_get_fault_info() is an example I gave but other client
> handler may have similar expecation of fault register not changed before
> client fault handler is called.

Simple solution would be to move the clearing of FSR to after the
fault is reported.  It doesn't really matter if it is before or after,
as long as it happens before the irq handler returns, AFAIU.  And
drm/msm will collect the fault info from the irq handler.

BR,
-R

> > > The way CFIE disable is helping
> > > with current patch indicates write FSR is unstalling context and subs=
equent
> > > transactions are faulted.
> >
> > No, it does not indicate that. The interrupt storm happens even when
> > there is exactly one context fault, and when the interrupt storm
> > happens *only* FSR.SS is asserted. I've verified this with debug
> > prints. Once more, MMU-500 will assert an interrupt when only FSR.SS
> > is asserted. This has nothing to do with subsequent transactions.
> >
> > > Do you stop getting interrupt storm after write
> > > RESUME.
> >
> > Yes, as long as the write to RESUME happens after all other bits in
> > FSR are cleared.
> >
> > > If you can mention your SCTLR configuration and FSR state in test
> > > sequence, it would be clearer.
> >
> > SCTLR has both HUPCF and CFCFG enabled.
> >
> > >
> > > An aside, If reducing delay between FSR and RESUME write helps then b=
oth
> > > can be done as part of qcom_adreno_smmu_resume_translation(). This wi=
ll
> > > follow spec recommendation and also make sure fault registers are not
> > > cleared before reporting fault to client.
> I think this sequence should address the issue you are observing.
>
> > >
> > > Thanks,
> > > Prakash

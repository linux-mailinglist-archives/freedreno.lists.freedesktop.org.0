Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2839A216F3
	for <lists+freedreno@lfdr.de>; Wed, 29 Jan 2025 04:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D99610E2AB;
	Wed, 29 Jan 2025 03:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i1gtPEER";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A14D10E2AB
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2025 03:34:53 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-216325f516fso13275145ad.3
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jan 2025 19:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738121692; x=1738726492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FSEMixmPIS7Z8ruVPkos6z93kW0au3BNEj38QU0bOXo=;
 b=i1gtPEERQYYqO3Ggs5f9nxnDLjgGq3aHNcQHrhOuTzBXnZY2flpguASxWBcZVvDxgt
 OGdsf8Q8/2cbkFjTyVeBp0O4vilNbMjfTaqGvXye5teaTBEPlA7eqo3hQmUtmXkc33+U
 l661eWHhaReeLN1qFrF6mQIOsQli+wFGbklBmPy7fsURKGOp/Te1aFl6tmEFeqapYLU9
 JSGUS+O7iDNR6+05snVVt47A3IR0q32V6HWBgtqIKBXwFdyBYQynYe1e/OlnJsikVpz2
 vYmx521oVNgEPsvGspgvVnRUVr+q2d4A06IIiogR0YQb5Lm3B/7Lymvzy7aRT5KIJlDE
 9YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738121692; x=1738726492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FSEMixmPIS7Z8ruVPkos6z93kW0au3BNEj38QU0bOXo=;
 b=AU6Bs1WK8w89MWASmI3B+iuFxyM2UUQ8H1VRKBjQvzm7IkPltl4vCQFoQoeX3IooIH
 Bx1Q88GO/pWzYHihHSe+VYIPC3Xry2oR2sQc+vu4QK7nDDznt4SXhMKTVvpLUbD/rJi0
 WJC7iaYOn+Z8R9duAV2fE2kqTfARO0M9MstZKhkef+qSrMIHlurPn9w+isdA7tBAVlOb
 +xTygDnuWxyVJdXrD9oYrIi6MkUNnA95mO483/jGMRNUZUiB/h8z0WqpRfGbuupklQyM
 /bufD21gbZRzG2Roxn5ihcEthzqX743B+bKdTyKQR/0nTn/zdxXuSKtjZETtxY0pGiHN
 MaRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp5LUSN9HOhjDo8Cv4o8PDibMEABda/cAwsIOR9qZMQoMNvRFFgTCwmJ56DzNrvrOzoPbNwfxIgp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbnh8e2LIK1Hwqqo6rYwV1c2xeZnTFl/2+F2YRHDmXxrOJPqxR
 Uh0cWbs4cK6Ot7rOTqVee5uniZ7GumuJKnm6fo/yuSZ74ngwHp4sdcURskfooQFXbIqdKT7qMX+
 v1Fj5SIiuQtDwTmZSvDGZqxbptEc=
X-Gm-Gg: ASbGncsdTw4EVQNc1Bi87lETJ3mszq9Lj7yc515HhQr69TOK0BWnjUqJ/AB8JSfwi+C
 HNfEqVO10qRu4by9FjbSFJgLnWWSpYstahJqwJkwu+jqHBoBFvkNIDxaoXm9WXzrCGL+T2VAz
X-Google-Smtp-Source: AGHT+IFbFQSYTvKU6Tn/jYbbxgPrehvkrB0XAVXsOwTCtBnwvAVfgVvZVo8IQ1hdLTPS9gNaQI/uOQ9lmAgGhGlB37U=
X-Received: by 2002:a05:6a21:329c:b0:1e5:d3cc:4632 with SMTP id
 adf61e73a8af0-1ed7a5c5535mr1035370637.1.1738121692412; Tue, 28 Jan 2025
 19:34:52 -0800 (PST)
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
 <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com>
 <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com>
 <CAF6AEGugDxYjH63+Up_T_pt+jQ2D0m=x1tSg3fGPteu3XgR2qA@mail.gmail.com>
In-Reply-To: <CAF6AEGugDxYjH63+Up_T_pt+jQ2D0m=x1tSg3fGPteu3XgR2qA@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 28 Jan 2025 22:34:41 -0500
X-Gm-Features: AWEUYZnSb6QYpR0Fp9PLawYr9P-QPjVvmIEP1Nm8egoDpm1trM7-ebAtlM8-HK8
Message-ID: <CACu1E7F0UTTapsLEUuKVFN0MF=kwhbSJqN2MU305Ab3cg+u_Lg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
To: Rob Clark <robdclark@gmail.com>
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

On Tue, Jan 28, 2025 at 10:25=E2=80=AFPM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> On Tue, Jan 28, 2025 at 6:31=E2=80=AFPM Connor Abbott <cwabbott0@gmail.co=
m> wrote:
> >
> > On Tue, Jan 28, 2025 at 9:21=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gmai=
l.com> wrote:
> > > >
> > > > On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.=
com> wrote:
> > > > >
> > > > > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_gupta=
p@quicinc.com> wrote:
> > > > > >
> > > > > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > > > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_g=
uptap@quicinc.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wro=
te:
> > > > > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <qu=
ic_guptap@quicinc.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott=
 wrote:
> > > > > > > > > > The context would remain stalled till we write to CBn_R=
ESUME. Which is done
> > > > > > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled=
 context further
> > > > > > > > > > transactions are not processed and we shouldn't see fur=
ther faults and
> > > > > > > > > > or fault inerrupts. Do you observe faults with stalled =
context?
> > > > > > > > >
> > > > > > > > > Yes. I've observed that on MMU-500 writing RESUME before =
the interrupt
> > > > > > > > > has been cleared doesn't clear SS. This happened with v2 =
in the case
> > > > > > > > > where there was already a devcoredump and drm/msm called
> > > > > > > > > qcom_adreno_smmu_resume_translation() immediately from it=
s fault
> > > > > > > > > handler, and we'd get a storm of unhandled interrupts unt=
il it was
> > > > > > > > > disabled. Given that the architecture spec says we're sup=
posed to
> > > > > > > > > clear the interrupt first this may have been an attempt t=
o "help"
> > > > > > > > > developers.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Just to clarify, present sequence is:
> > > > > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > > > > 2. Report fault to client
> > > > > > > > 3. resume/terminate stalled transaction
> > > > > > > > 4. clear FSR
> > > > > > > >
> > > > > > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequenc=
e, is FSR.SS
> > > > > > > > cleared and interrupt storm is observed.
> > > > > > >
> > > > > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subseq=
uent
> > > > > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 th=
ere is no
> > > > > > > interrupt storm. From this we conclude that MMU-500 does not =
clear
> > > > > > > FSR.SS unless #4 happens before #3.
> > > > > > >
> > > > > > Thanks Connor for clarification. I get your point now. I think =
it's
> > > > > > expected interrupt storm with #2->#3->#4 sequence is expected. =
 With
> > > > > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the s=
equence of
> > > > > > #1->#2->#4->#3, which is spec recommended.
> > > > > >
> > > > > > so, common fault handler can be modified to follow the same seq=
uence, but I
> > > > > > have concern regarding clearing FSR before reporting fault to c=
lient.
> > > > > > qcom_adreno_smmu_get_fault_info() is an example I gave but othe=
r client
> > > > > > handler may have similar expecation of fault register not chang=
ed before
> > > > > > client fault handler is called.
> > > > >
> > > > > Simple solution would be to move the clearing of FSR to after the
> > > > > fault is reported.  It doesn't really matter if it is before or a=
fter,
> > > > > as long as it happens before the irq handler returns, AFAIU.  And
> > > > > drm/msm will collect the fault info from the irq handler.
> > > >
> > > > As I said in the earlier mail: "From this we conclude that MMU-500
> > > > does not clear FSR.SS unless #4 happens before #3." #4 is clearing =
FSR
> > > > and #3 is writing RESUME. So no, unfortunately it does actually mat=
ter
> > > > and we get a storm of unhandled IRQs if we don't clear FSR first. Y=
our
> > > > solution is what v2 did and it didn't work.
> > >
> > > So, just clear FSR also in the resume path
> >
> > Then we'd run the risk of incorrectly accepting a second fault if it
> > happens immediately after we resume. Not terrible for our use-case
> > where we only really need the first fault to be accurate and we
> > disable stall-on-fault afterwards, but if you ever leave it on then it
> > would result in another interrupt storm.
> >
>
> Howso? We'd still be ensuring that #4 happens before #3?  If needed we
> can add a param to resume_translation() so drm can tell it to only
> clear FSR if it calls resume_translation from the interrupt handler,
> or something like that.  But I don't want to lose capturing the FSR,
> and I don't think we need to.
>
> BR,
> -R

Because we could clear FSR in the resume handler (ok), then resume,
then fault again, then clear FSR again in arm_smmu_context_fault() and
unintentionally acknowledge the fault without a corresponding resume.
Again, it's not possible with drm/msm after this series since we
disable stall-on-fault before resuming but still this means it's very
fragile.

To be clear, FSR should already be frozen until we resume, if the
SMMUv2 architecture pseudocode is to be believed. So any fault that's
recorded in the devcoredump will still be accurate with this patch,
just subsequent faults might not be accurate.

Connor

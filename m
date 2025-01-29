Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ADBA21684
	for <lists+freedreno@lfdr.de>; Wed, 29 Jan 2025 03:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A9810E0D2;
	Wed, 29 Jan 2025 02:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GV9iqwi1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F324D10E0D2
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2025 02:30:59 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2f2f5e91393so1492988a91.0
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jan 2025 18:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738117859; x=1738722659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XSly2TaNffKLGTngVYEFGfP2OiXY7SuVwdUXwB6ys4U=;
 b=GV9iqwi1/rK9k7Bpk79/rFtNkKrYMgRDo7NAkUIz688Gqrh9/CkAgK4774WgEBR6vD
 7CYj00i7kiHXPWlu6ZO5SA+x3STcxZ4djbHiLxsk4j0JIOvfTcQA0WhUaP+GTbuOLD4M
 /uVGkqOOXPLXFC3qrwfJkFxDWkhYkQDcVjTJK4wy6GgBL8QNPfn8ay6xTW41rYyh/WYn
 pUyrU5rg0N46DKa2IvXg4qn23acOrprwOMnhluRExGmtyqsXemN4QSZHm9q8Px7QUlzY
 LfX+MY0yeNgI0con9xHsVMOIQJG6fduZS/AMzGVJvp0lLPiF52sHKhnEcO8ApVdX7pAZ
 nTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738117859; x=1738722659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XSly2TaNffKLGTngVYEFGfP2OiXY7SuVwdUXwB6ys4U=;
 b=vEJYjh/n7EfTTvM09LtB/rEQ8oHNHX6hcPQAl7pVjVq1uBiD8GdJl5Xp6X8atUv9Ea
 VAKv9Ghw6bAeBuqigTWL0joAEAkSRKx+JcRcTSz4cu2TLo6ZvQd0yYG/9HRrMAJQLLc0
 jfxTlrX+7mbyTtnU+AbUXtASOwnqj+j8TIIgwZhKYajpNxDfdALexXivQM2WzqL6OtNS
 XPf1KiLB7bofhveBYLBNSb8b+Y9goELW1bxcyjMKk4Sl7ECHtxhGGoylTunEzJQXCI1r
 /8BiLwkyjbvZW0s3O9YxtSEzhQ+F5bAvUpmwNWaXO532nazUa/laQPkIZlhdfiMEq90B
 T9wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEqvF00DChpXxLbmhN4m7ILpK3wlH/dUvQFyB9j6m8d4o7kBj+henB8YiF75mvig21j9THw9XCsZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSJeTOXReIOs9Aw5/Jca2RY57TJiTBiPyI5M83F80rEWEJwow5
 By57c7lp2/suEHeqxw6qq9dnqSknSIUpb7gOZW489kiO8GPzSkfLh/Le0OJ99H18bc8cJ0jCqiz
 uidG4qc3RCm6adicyJJjLqQPPE1o=
X-Gm-Gg: ASbGncu58GqUJN+cO6NiIh8UWLUiwms8Ej2dUupwah4HkbvDJ40HA1zD4JuJttbBM01
 tiFoxO7lewRm5RHXLMPO6m1bgNrMlh8XtF6plzDnYRvgYSz+hrdrwChyV0S8gR7GFIz76m2bQ
X-Google-Smtp-Source: AGHT+IEjgYmsQ4btVO6NoeAtHUBYo6uBU9FQXTRAoppwQkfpqn+YG0TztYlkbmmr8DweH3LafBf4eykvGJwllpwO6II=
X-Received: by 2002:a05:6a00:3920:b0:72a:83e4:42e2 with SMTP id
 d2e1a72fcca58-72fd0bcee41mr883477b3a.2.1738117859086; Tue, 28 Jan 2025
 18:30:59 -0800 (PST)
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
In-Reply-To: <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 28 Jan 2025 21:30:48 -0500
X-Gm-Features: AWEUYZnXKpZmksZEDv9wE4ehxlAcfC2ZYtvFlEvNuv90BQMKMLlkT9uISLaRedQ
Message-ID: <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com>
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

On Tue, Jan 28, 2025 at 9:21=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gmail.co=
m> wrote:
> >
> > On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@qu=
icinc.com> wrote:
> > > >
> > > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_gupta=
p@quicinc.com> wrote:
> > > > > >
> > > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_g=
uptap@quicinc.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wro=
te:
> > > > > > > > The context would remain stalled till we write to CBn_RESUM=
E. Which is done
> > > > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled con=
text further
> > > > > > > > transactions are not processed and we shouldn't see further=
 faults and
> > > > > > > > or fault inerrupts. Do you observe faults with stalled cont=
ext?
> > > > > > >
> > > > > > > Yes. I've observed that on MMU-500 writing RESUME before the =
interrupt
> > > > > > > has been cleared doesn't clear SS. This happened with v2 in t=
he case
> > > > > > > where there was already a devcoredump and drm/msm called
> > > > > > > qcom_adreno_smmu_resume_translation() immediately from its fa=
ult
> > > > > > > handler, and we'd get a storm of unhandled interrupts until i=
t was
> > > > > > > disabled. Given that the architecture spec says we're suppose=
d to
> > > > > > > clear the interrupt first this may have been an attempt to "h=
elp"
> > > > > > > developers.
> > > > > > >
> > > > > >
> > > > > > Just to clarify, present sequence is:
> > > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > > 2. Report fault to client
> > > > > > 3. resume/terminate stalled transaction
> > > > > > 4. clear FSR
> > > > > >
> > > > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence, i=
s FSR.SS
> > > > > > cleared and interrupt storm is observed.
> > > > >
> > > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
> > > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 there =
is no
> > > > > interrupt storm. From this we conclude that MMU-500 does not clea=
r
> > > > > FSR.SS unless #4 happens before #3.
> > > > >
> > > > Thanks Connor for clarification. I get your point now. I think it's
> > > > expected interrupt storm with #2->#3->#4 sequence is expected.  Wit=
h
> > > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the seque=
nce of
> > > > #1->#2->#4->#3, which is spec recommended.
> > > >
> > > > so, common fault handler can be modified to follow the same sequenc=
e, but I
> > > > have concern regarding clearing FSR before reporting fault to clien=
t.
> > > > qcom_adreno_smmu_get_fault_info() is an example I gave but other cl=
ient
> > > > handler may have similar expecation of fault register not changed b=
efore
> > > > client fault handler is called.
> > >
> > > Simple solution would be to move the clearing of FSR to after the
> > > fault is reported.  It doesn't really matter if it is before or after=
,
> > > as long as it happens before the irq handler returns, AFAIU.  And
> > > drm/msm will collect the fault info from the irq handler.
> >
> > As I said in the earlier mail: "From this we conclude that MMU-500
> > does not clear FSR.SS unless #4 happens before #3." #4 is clearing FSR
> > and #3 is writing RESUME. So no, unfortunately it does actually matter
> > and we get a storm of unhandled IRQs if we don't clear FSR first. Your
> > solution is what v2 did and it didn't work.
>
> So, just clear FSR also in the resume path

Then we'd run the risk of incorrectly accepting a second fault if it
happens immediately after we resume. Not terrible for our use-case
where we only really need the first fault to be accurate and we
disable stall-on-fault afterwards, but if you ever leave it on then it
would result in another interrupt storm.

Connor

>
> BR,
> -R
>
> > Connor
> >
> > >
> > > BR,
> > > -R
> > >
> > > > > > The way CFIE disable is helping
> > > > > > with current patch indicates write FSR is unstalling context an=
d subsequent
> > > > > > transactions are faulted.
> > > > >
> > > > > No, it does not indicate that. The interrupt storm happens even w=
hen
> > > > > there is exactly one context fault, and when the interrupt storm
> > > > > happens *only* FSR.SS is asserted. I've verified this with debug
> > > > > prints. Once more, MMU-500 will assert an interrupt when only FSR=
.SS
> > > > > is asserted. This has nothing to do with subsequent transactions.
> > > > >
> > > > > > Do you stop getting interrupt storm after write
> > > > > > RESUME.
> > > > >
> > > > > Yes, as long as the write to RESUME happens after all other bits =
in
> > > > > FSR are cleared.
> > > > >
> > > > > > If you can mention your SCTLR configuration and FSR state in te=
st
> > > > > > sequence, it would be clearer.
> > > > >
> > > > > SCTLR has both HUPCF and CFCFG enabled.
> > > > >
> > > > > >
> > > > > > An aside, If reducing delay between FSR and RESUME write helps =
then both
> > > > > > can be done as part of qcom_adreno_smmu_resume_translation(). T=
his will
> > > > > > follow spec recommendation and also make sure fault registers a=
re not
> > > > > > cleared before reporting fault to client.
> > > > I think this sequence should address the issue you are observing.
> > > >
> > > > > >
> > > > > > Thanks,
> > > > > > Prakash

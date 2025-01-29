Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B8FA216E8
	for <lists+freedreno@lfdr.de>; Wed, 29 Jan 2025 04:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D2010E05C;
	Wed, 29 Jan 2025 03:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dpJlw+pr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406B510E05C
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2025 03:25:38 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3cfc154874eso48868345ab.3
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jan 2025 19:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738121137; x=1738725937; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6dDIqA4VDST4yPwcwWTbRUjv9OaOCjso0egT8E2lAps=;
 b=dpJlw+prYqpQsQFpgEGENm7UuiqGf4+f+AQgxFSf8hzPXsMoHj21lLt21ndHAUT2eV
 UqQ1+uTFS3pYLhbzMzTQo+liq9lOZSH4VNCMHHu/TEK/KLLpk8lANFzQgtWOihGxUKtZ
 fdJdnsuAw8RPywEob4ynp5c5i6/TSam0FNhh69lT/0ah9vByA2kSl5DCH9HL7jtzmQ4H
 F+egISgkbiPtXxjxlvEua0v+aoqFc1aCkm7Hf+Nt+zl8Vq6KQP7jaEOzmW68vYSd38Qu
 zIVpe79qT6LhURAs+3GaqmYUJrE2PGVeJljwIpe2yMexzSOmGwh+s55ibLv1EaYRYgk3
 k51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738121137; x=1738725937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6dDIqA4VDST4yPwcwWTbRUjv9OaOCjso0egT8E2lAps=;
 b=FIhg8cJtx0JeewaXD8vs9CnS/CLf6lfdViTD08yFvCnWcU9oMJLDLCZfC5dk9erK5F
 7mv9t0/2GH8uygYrXHmdGQy565ynEgwvUPkv6X1hkuYoQWxuyKMnTpWnKkE3eib0ayio
 TQxbXoMqFBI5Wm4tZSG5rIPVOrhqIQHlblqBC+i8ToRd4qx2kX6FQg9XAHO/FVy7fzF1
 hvZExnTzmIPHqvDVorfWVWhN5EG9DcY9mIoYg+hGPzY0LK2kvvHo8KjHNYND64ZXm/gz
 9CrWwKY+47bzRWw7e84LDnFral4ON/qI0KH7HFwTCyJZ1cu1sL29dAEn7oPg8U67tWWe
 Gqhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3YAiYNTQBd6L7N10KYhECyGPrppxsKEgf5MUTWc+DUpZXmaEfirwvELQhZg7cV83yMLKeFpeNPqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIXcCEjPPAkfJpz6+X+Wd/wSQjzLdgQqoY+RZpX+npunXOq8vS
 OpBO/qQXAQwwQVUGmmNDh560Tv54qyHUi94Lq5IgHHpHZAicFY0sQ+1/79oeppHx/mKkxSoB/qg
 ytfxUuNail7LqrGljfULZ9dLTaek=
X-Gm-Gg: ASbGncvDzKBC0V+zkpYjwboNgTG1OKn1ltZNE/gq3zZi5OgOKQxYWnD2ng9ZLjHig+K
 WAU86Jhwt3BNsyWCp9MsGiTHDdvlLrGM2Cd+A9HB+wMiAB/riHU+1H+2TxSfE0hQ0IFkZBzpdTw
 ==
X-Google-Smtp-Source: AGHT+IGpMyCuuvxRf9JKn/IGg4EgOQrCoMhpqUUmXymP6ydEXopJZ7pGxrRwB8qnqi6LFxZVbq4bt2PZZlGgSUMT9/8=
X-Received: by 2002:a05:6e02:138c:b0:3cf:ba60:e2fd with SMTP id
 e9e14a558f8ab-3cffe3e5d81mr18188015ab.12.1738121137443; Tue, 28 Jan 2025
 19:25:37 -0800 (PST)
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
In-Reply-To: <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Jan 2025 19:25:25 -0800
X-Gm-Features: AWEUYZkXMQul2iCS8g_lBAK6cifDDx4C71uDvFmo8QxPAIsqMGize_ZuktCSrPU
Message-ID: <CAF6AEGugDxYjH63+Up_T_pt+jQ2D0m=x1tSg3fGPteu3XgR2qA@mail.gmail.com>
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

On Tue, Jan 28, 2025 at 6:31=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Tue, Jan 28, 2025 at 9:21=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > >
> > > On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@=
quicinc.com> wrote:
> > > > >
> > > > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_gup=
tap@quicinc.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote=
:
> > > > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic=
_guptap@quicinc.com> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott w=
rote:
> > > > > > > > > The context would remain stalled till we write to CBn_RES=
UME. Which is done
> > > > > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled c=
ontext further
> > > > > > > > > transactions are not processed and we shouldn't see furth=
er faults and
> > > > > > > > > or fault inerrupts. Do you observe faults with stalled co=
ntext?
> > > > > > > >
> > > > > > > > Yes. I've observed that on MMU-500 writing RESUME before th=
e interrupt
> > > > > > > > has been cleared doesn't clear SS. This happened with v2 in=
 the case
> > > > > > > > where there was already a devcoredump and drm/msm called
> > > > > > > > qcom_adreno_smmu_resume_translation() immediately from its =
fault
> > > > > > > > handler, and we'd get a storm of unhandled interrupts until=
 it was
> > > > > > > > disabled. Given that the architecture spec says we're suppo=
sed to
> > > > > > > > clear the interrupt first this may have been an attempt to =
"help"
> > > > > > > > developers.
> > > > > > > >
> > > > > > >
> > > > > > > Just to clarify, present sequence is:
> > > > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > > > 2. Report fault to client
> > > > > > > 3. resume/terminate stalled transaction
> > > > > > > 4. clear FSR
> > > > > > >
> > > > > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence,=
 is FSR.SS
> > > > > > > cleared and interrupt storm is observed.
> > > > > >
> > > > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subseque=
nt
> > > > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 ther=
e is no
> > > > > > interrupt storm. From this we conclude that MMU-500 does not cl=
ear
> > > > > > FSR.SS unless #4 happens before #3.
> > > > > >
> > > > > Thanks Connor for clarification. I get your point now. I think it=
's
> > > > > expected interrupt storm with #2->#3->#4 sequence is expected.  W=
ith
> > > > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the seq=
uence of
> > > > > #1->#2->#4->#3, which is spec recommended.
> > > > >
> > > > > so, common fault handler can be modified to follow the same seque=
nce, but I
> > > > > have concern regarding clearing FSR before reporting fault to cli=
ent.
> > > > > qcom_adreno_smmu_get_fault_info() is an example I gave but other =
client
> > > > > handler may have similar expecation of fault register not changed=
 before
> > > > > client fault handler is called.
> > > >
> > > > Simple solution would be to move the clearing of FSR to after the
> > > > fault is reported.  It doesn't really matter if it is before or aft=
er,
> > > > as long as it happens before the irq handler returns, AFAIU.  And
> > > > drm/msm will collect the fault info from the irq handler.
> > >
> > > As I said in the earlier mail: "From this we conclude that MMU-500
> > > does not clear FSR.SS unless #4 happens before #3." #4 is clearing FS=
R
> > > and #3 is writing RESUME. So no, unfortunately it does actually matte=
r
> > > and we get a storm of unhandled IRQs if we don't clear FSR first. You=
r
> > > solution is what v2 did and it didn't work.
> >
> > So, just clear FSR also in the resume path
>
> Then we'd run the risk of incorrectly accepting a second fault if it
> happens immediately after we resume. Not terrible for our use-case
> where we only really need the first fault to be accurate and we
> disable stall-on-fault afterwards, but if you ever leave it on then it
> would result in another interrupt storm.
>

Howso? We'd still be ensuring that #4 happens before #3?  If needed we
can add a param to resume_translation() so drm can tell it to only
clear FSR if it calls resume_translation from the interrupt handler,
or something like that.  But I don't want to lose capturing the FSR,
and I don't think we need to.

BR,
-R

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E88A61F84
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 22:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FED10E1B4;
	Fri, 14 Mar 2025 21:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S2qaorgy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875A910E1B4
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 21:57:08 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3d0465a8d34so22846225ab.0
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 14:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741989428; x=1742594228; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3pSQUHrWVuSLKRWpQqodHH8qEwKj4GPXN/zyJnWOEM=;
 b=S2qaorgyOZyQmle8dO5jWhJt5MWa1yTTdnHnAIeV5G95AxxmQUTPDMC9WHOFP3Zgbr
 4pWDE9cZ4K0dpbAHy9YtwdOExGpYHGhCYP73xi6cWN98wd/p13DzaarE+VvEpIFGteXN
 h0OAvnvhEvgkh9C3mT28pm5aNCagRkNPnbtIIMLrrf8YtNiUyStF36mc61vbUfeKrakM
 qHGVgT2kGfciP4xregFoTBDcp3X5KrseqK+PR6lGE0ojx89iXtbsekJ3y9d1DezPllB7
 WGjdkwY0QH9bt+y1kW5dcOVIe1V+Ew1jqVNgn3xJIyzDrfI3o2Du5kXdo1Db9vjULZAW
 yVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741989428; x=1742594228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P3pSQUHrWVuSLKRWpQqodHH8qEwKj4GPXN/zyJnWOEM=;
 b=o/8ATQmtjpTxLkfdvw4kK7uoNI01FQ4W3ZFsQ2oQhp2dVohfQCno0S+QesE/DTFoF/
 oP21IefuLArUXRcw57NrHFjRLpRmytqaBTHDzbMj5ABTf8owACTLykfYyDBu7Xj1Fmbj
 qIJxNM1iyJBwXXvk0b4WUUKcMz6bg9hBdsoeTT9y90KZPF7czFdQZALFvdkvXi8DwA8f
 tDQWerCS6RypUwI2hfvuRuZFmLohqOB1QZL2MOkiS3DCWIz64IFQmxCgea7qUZZBqc27
 x4rZ4IS2oUSyhgQwR1wSJ3PgaM762oKFqAOE6LOlv1VpfejX25bOk0UxexIY6ahkO+kM
 qKjw==
X-Gm-Message-State: AOJu0YzY4mH0brsmdJ4rAn718IOBbiBlZpMwiIy42zJ+jUnbOSv7fkNs
 Mlwb5lVuO7Op4IKDljwVo9Zmlz8u54fnEh1229oXt7SC46AzDQWCPHyy32WzzdX5JT7nYhzW9b8
 PboTsrZ1pcaJUvFHy1+CUiLAePfSvCA==
X-Gm-Gg: ASbGncvcTqYvxk3QfrCINpeWSk8oqr6myED/RjAvfSWvMbvNn5fZv9KbBuokifxbl+Q
 bq/hqMI2IQ+XY0BX41VIPg4z00mTa/jF75nVD5/zbQyDt4fCInduivyjS5Go51S8hwTHeuOTLH7
 yE31S1ibcJ7Bp2O5quG0xxDy+a7qaDlduUoYQ4DRGHmLky7Rf9FeFSaFfy/4FUMbBylmE=
X-Google-Smtp-Source: AGHT+IG2LEAIPajfuluTWHQgIOBesw3ZvmcbUFomrCBi7RmfSAg4szbGWiHvUmOrzXwWJrUhQamOkTUXRfsx0ePq2II=
X-Received: by 2002:a05:6e02:1d04:b0:3d3:f7ed:c907 with SMTP id
 e9e14a558f8ab-3d483a63332mr34218255ab.15.1741989427756; Fri, 14 Mar 2025
 14:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250314183455.120824-1-robdclark@gmail.com>
 <4525d045-745a-4d8b-987e-45d3fa9917b5@quicinc.com>
 <CAF6AEGuneF8Yi0ViA4ActvmGL7aOFT75jNBN=YZf37YyoBkCFA@mail.gmail.com>
 <642de5da-e6c5-464f-82a7-6f881323b429@gmail.com>
In-Reply-To: <642de5da-e6c5-464f-82a7-6f881323b429@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 14 Mar 2025 14:56:55 -0700
X-Gm-Features: AQ5f1JptKMou4Cbkv5xYe8cTOyAkTcNscCMA0BTyVRqMQD2p9fbgKpFoSstB8dU
Message-ID: <CAF6AEGvCmAVtmYi9bO_YQgQtbBvWXt1K_Y3i8QU49erhXLPU0g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/a6xx+: Don't let IB_SIZE overflow
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: freedreno@lists.freedesktop.org
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

On Fri, Mar 14, 2025 at 2:35=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> On 3/14/25 10:08 PM, Rob Clark wrote:
> > On Fri, Mar 14, 2025 at 1:07=E2=80=AFPM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> >>
> >> On 3/15/2025 12:04 AM, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> IB_SIZE is only b0..b19.  Starting with a6xx gen3, additional fields
> >>> were added above the IB_SIZE.  Accidentially setting them can cause
> >>> badness.  Fix this by properly defining the CP_INDIRECT_BUFFER packet
> >>> and using the generated builder macro to ensure unintended bits are n=
ot
> >>> set.
>
> I wonder if we should be returning -EINVAL from the ioctl when a size
> larger than max is submitted. I say this because we do a 0 check when
> submitting which this bug allows to bypass therefore putting a 0 sized
> CP_INDIRECT_BUFFER pkt in the ring.
> Fw is inconsistent as to how this is treated (should be a NOP but will
> sometimes hang) and that is very confusing.

tbh, I'm not sure I remember why we check for zero.. at least sqe fw
explicitly handles this case on newer devices.  Maybe it made older
devices grumpy?

But I wanted to avoid hard-coding (potentially) device specific limits
in the frontend.  And decided that userspace is allowed to shoot it's
own foot if it really wants to.

BR,
-R

> >>>
> >>> v2: add missing type attribute for IB_BASE
> >>>
> >>> Reported-by: Connor Abbott <cwabbott0@gmail.com>
> >>> Fixes: a83366ef19ea ("drm/msm/a6xx: add A640/A650 to gpulist")
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> ---
> >>> Backport notes, prior to commit ae22a94997b8 ("drm/msm: import A2xx-A=
4xx
> >>> XML display registers database"), just open code, ie:
> >>>
> >>>     OUT_RING(ring, submit->cmd[i].size & 0xfffff);
> >>>
> >>> Prior to commit af66706accdf ("drm/msm/a6xx: Add skeleton A7xx
> >>> support"), a7xx_submit() did not exist so that hunk can be dropped.
> >>>
> >>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c               | 8 ++++----
> >>>   drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 7 +++++++
> >>>   2 files changed, 11 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> >>> index d3978cfa3f20..ea52b7d0b212 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> @@ -245,10 +245,10 @@ static void a6xx_submit(struct msm_gpu *gpu, st=
ruct msm_gem_submit *submit)
> >>>                                break;
> >>>                        fallthrough;
> >>>                case MSM_SUBMIT_CMD_BUF:
> >>> -                     OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
> >>> +                     OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
> >>>                        OUT_RING(ring, lower_32_bits(submit->cmd[i].io=
va));
> >>>                        OUT_RING(ring, upper_32_bits(submit->cmd[i].io=
va));
> >>> -                     OUT_RING(ring, submit->cmd[i].size);
> >>> +                     OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZ=
E(submit->cmd[i].size));
> >>>                        ibs++;
> >>>                        break;
> >>>                }
> >>> @@ -382,10 +382,10 @@ static void a7xx_submit(struct msm_gpu *gpu, st=
ruct msm_gem_submit *submit)
> >>>                                break;
> >>>                        fallthrough;
> >>>                case MSM_SUBMIT_CMD_BUF:
> >>> -                     OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
> >>> +                     OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
> >>>                        OUT_RING(ring, lower_32_bits(submit->cmd[i].io=
va));
> >>>                        OUT_RING(ring, upper_32_bits(submit->cmd[i].io=
va));
> >>> -                     OUT_RING(ring, submit->cmd[i].size);
> >>> +                     OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZ=
E(submit->cmd[i].size));
> >>>                        ibs++;
> >>>                        break;
> >>>                }
> >>> diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/dr=
ivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> >>> index 55a35182858c..a71bc6f16cbf 100644
> >>> --- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> >>> +++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
> >>> @@ -2259,5 +2259,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
> >>>        </reg32>
> >>>   </domain>
> >>>
> >>> +<domain name=3D"CP_INDIRECT_BUFFER" width=3D"32" varset=3D"chip" pre=
fix=3D"chip" variants=3D"A5XX-">
> >>> +     <reg64 offset=3D"0" name=3D"IB_BASE" type=3D"address"/>
> >>> +     <reg32 offset=3D"3" name=3D"3">
> >>
> >> Why is the offset 3 here? It looks to me that it doesn't match the cod=
e
> >> above.
> >
> > oh, bad copy/pasta.. it should be 2 (dword offset)
> >
> > BR,
> > -R
> >
> >> -Akhil.
> >>
> >>> +             <bitfield name=3D"IB_SIZE" low=3D"0" high=3D"19"/>
> >>> +     </reg32>
> >>> +</domain>
> >>> +
> >>>   </database>
> >>>
> >>
>
> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>

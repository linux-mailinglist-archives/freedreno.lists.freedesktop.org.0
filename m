Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D454ABDD89
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 16:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B83410E619;
	Tue, 20 May 2025 14:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="amAIUs52";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC36D10E5B6
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 14:43:01 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-30eccc61eacso369616a91.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 07:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747752181; x=1748356981; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NL9VnS5cf/6NW/p94tIKHT/4gGzvfJ3RyyiZ0fUNEek=;
 b=amAIUs52OiXxuPgUkoqOH898qL8wnqoItND4wYBgfwyOZag94xppq/0zQmE8wu7cIg
 Gxe2GmX5l/2xzIEZLJFhnxNjCl/ucPw/DRXTW5Onrj131IM/oqzTh9StOltkBlj3xexA
 vqcmMjJ0V7BmM3eCGwDymDjQibayd0P57vRRElT9MSb+6SW3hHLCuaniWu5L/sUdPNos
 fdD3LL6YAzRRvCmZhHrb7ywoyaGY6FjCBqd0iQWmihu8xztzRHrqO/OhJAkzinuYc5uP
 N22mov8OR8JHBhFmJ79NSkhYTXEkTY2F10nxiiehrCJ4t9HqOTjQF9TyOamb+tKbpwr6
 YhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747752181; x=1748356981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NL9VnS5cf/6NW/p94tIKHT/4gGzvfJ3RyyiZ0fUNEek=;
 b=hmUdO0eSRbLyxty//LzcA8oSLCyNS83Kxc6DwmIbp7cL5r4aOXLoFz5uNdoJVpC9fZ
 XV2LROQPwfPqR/1BXybIJN7Y1Na1qyhZTCFrTqB0BUkE52JU7o9sshRZYJ7SRRJPSKr1
 3yQ1fzNUUzS9YF1v/Ff3Ipecv7GmvWtGoQ/YqXNv624MA31X6k6v4H10IDh/z68J3Lm5
 oTcRpmFwUOQH7nTtkL+cGWPUZJrOTi+8DjmUcy7TL0+ZyszdSe9Cy4kLjLdrpqNFpEIh
 sSFuAkl7cXceedJ44shGcMOgzc9xc2y0KPh2hY9+/9s9QsmCMguR+BA6QEdFCeVp043x
 4swA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBe+3TXrX6mR09AHNpTJ3ZdtJ8NSKunztR5d1OLkeLWgK3AXMI3l0uZWq/mV/ZALWEvjQg/BOfrhw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxroILEstwxUzc+3ozl8V+kPiMoV39v3ZLvNeBYiD/CR9PJDuXX
 DVKRw3s0F00w/nzlYkLxNqcuHwlkn+wWDfou2fVRmdfUTGGJMxBjpIgEcwfCslxeE9dxkdglNdP
 AKfzZ6rs+BebGMJLw3UPEXr6WHFo6MY0=
X-Gm-Gg: ASbGncsRhuHt5fBc3rd3NcIHFHEBxrKPcykrhOP/A29wthDUmAmskOUkE29qqi2GFeO
 lQRINypczr3EjBv8bXoOJSb/FhRIk4GyPs9AB/VlOHyG0siAWErEnJFeAbeTbV1Cyf0yVuzXHrq
 wdU1p0Ol8mbeYtSOhnTdHDMm+mk0bW2IEr
X-Google-Smtp-Source: AGHT+IF/aCn3KuIR/kknx0aBZr7IzoK3GvwOK/L+4l4anpA0Ks1VE8JmQjWR6x3bz5ayRXEdRHZ1M4ocBueOSYEkMnU=
X-Received: by 2002:a17:90b:3b48:b0:30c:4b09:5f3d with SMTP id
 98e67ed59e1d1-30e7d61316bmr10052600a91.8.1747752181324; Tue, 20 May 2025
 07:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
 <20250520141857.GC18711@willie-the-truck>
In-Reply-To: <20250520141857.GC18711@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 10:42:49 -0400
X-Gm-Features: AX0GCFsH2VOZ8YMhHMV3BqM8wqyCOVzoUFywTVBwakEJMPVYAMwwsNIEoTGSpRU
Message-ID: <CACu1E7HdJvbx_6L9KvX3n78_cbkrey8npo=O=AkEzg335wJC=g@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
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

On Tue, May 20, 2025 at 10:19=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> Hi Connor,
>
> On Thu, May 15, 2025 at 03:58:42PM -0400, Connor Abbott wrote:
> > drm/msm uses the stall-on-fault model to record the GPU state on the
> > first GPU page fault to help debugging. On systems where the GPU is
> > paired with a MMU-500, there were two problems:
> >
> > 1. The MMU-500 doesn't de-assert its interrupt line until the fault is
> >    resumed, which led to a storm of interrupts until the fault handler
> >    was called. If we got unlucky and the fault handler was on the same
> >    CPU as the interrupt, there was a deadlock.
> > 2. The GPU is capable of generating page faults much faster than we can
> >    resume them. GMU (GPU Management Unit) shares the same context bank
> >    as the GPU, so if there was a sudden spurt of page faults it would b=
e
> >    effectively starved and would trigger a watchdog reset, made even
> >    worse because the GPU cannot be reset while there's a pending
> >    transaction leaving the GPU permanently wedged.
> >
> > Patches 1-2 and 4 fix the first problem by switching the IRQ to be a
> > threaded IRQ and then making drm/msm do its devcoredump work
> > synchronously in the threaded IRQ. Patch 4 is dependent on patches 1-2.
> > Patch 6 fixes the second problem and is dependent on patch 3. Patch 5 i=
s
> > a cleanup for patch 4 and patch 7 is a subsequent further cleanup to ge=
t
> > rid of the resume_fault() callback once we switch resuming to being don=
e
> > by the SMMU's fault handler.
>
> Thanks for reworking this; I think it looks much better now from the
> SMMU standpoint.
>
> > I've organized the series in the order that it should be picked up:
> >
> > - Patches 1-3 need to be applied to the iommu tree first.
>
> Which kernel version did you base these on? I can't see to apply the
> second patch, as you seem to have a stale copy of arm-smmu-qcom.c?
>
> Will

Sorry about that, for the next version I'll rebase on linux-next. I
was using an older version of msm-next for a while now.

Connor

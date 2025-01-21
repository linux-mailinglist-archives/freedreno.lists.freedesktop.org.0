Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ED9A1875A
	for <lists+freedreno@lfdr.de>; Tue, 21 Jan 2025 22:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050C610E2E4;
	Tue, 21 Jan 2025 21:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GxqHoghG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C4210E2E4
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jan 2025 21:33:12 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2ef718cb473so1269641a91.1
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jan 2025 13:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737495192; x=1738099992; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DFUI3MpGGkbseTkztZ+yIQpjol+PGIuUpMv3ocf4nfE=;
 b=GxqHoghG51/9gan3mDNbMbhVZjlDKzlQj2bprgp3yiR4YAP1xwKyM5Xu94A7l7FtqQ
 XQCoKSs0dOkZp8MJLZCmhKXKAc2P747uYKIGZXOUey8CCU8a6hkWW/sg3RAZ245tOiIo
 5KaM1cfeUQEZhABSbwCQFgrKgYSDGd4f7qbPcDvVTBbWURS/B6XbHDsHThPv+WSLfzKa
 k4s2Sau/NwEUNGkIgsRlVcKlIsfsgY/NekdJKFgnCseZrlhf5pomNSbPS4qINrQdT6Nh
 Zddb4OvcLh9N932+oetEJ5803hGdyD5mMeg6wLFn/ee4H+vdYwIyyHWwDxe3q4L8vEPS
 7gnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737495192; x=1738099992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DFUI3MpGGkbseTkztZ+yIQpjol+PGIuUpMv3ocf4nfE=;
 b=ioFBpfEofMxtf5W9bUlFFP6GtmfcDk97wzfax5MwDzVfSTq6ONSrWZ5AEYRVOxa2kN
 eCQJDKJehGcFx9yADjsyGoAyrQjDnYgl13sb3AldekniY7oF7PFBf9LN77d62yN1BrIN
 0BJNQl1CJqbGljbQW24lWW2UtB00rpzJq6OwCQPCtULGMnPgPPDCH/F0hKcxEksVBA1S
 4LFFfk/k7boDRkyf7EOsNyR+fE0LPVbj1f8BQzhHvXGnX3U/KJlBUGeiNjhsMl4xycJm
 /tThdQA3MstJlSU45qAK38jPZ7Dlf8Aj/AYke99mnrVJGd2liwkTawkF4b1MmNVl5W8d
 qdDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4H0crkAjxwDYjPPIHCHecO5Icf5xRn6i+dR1lyehDI+7GKQYwhFuEWs3RRN8MDIIObkBMW04SrFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbBvZ6sCF+bCkC+4AWTtMskarX1ANv6oUZjrgf/4AW3zlZbPtj
 Ykkh2uteQ4J+UKjxwHDTGB06E/yVlEOLAaySV6/KWZe6Kd5nTWaHpt/rIoL1qwGG69Z+AXHgrgG
 HNUwnXLQU1OkEQ08y38e89FYuuFI=
X-Gm-Gg: ASbGncs4ubqdP0/lToo9WHtcnKTSGyUfpHcz9GAkfgyXjOEODZQXGhmQNak/G7Bbb+Q
 bYTL3E1uAFW83Ad6HFOAZv/2BWaLAVX07LEvjRQrpXuOJAmfieuI=
X-Google-Smtp-Source: AGHT+IEcjzdGu7qYqGn5N4xEYIBOsyWiwpCUBMJHTPuLbHn2zBtCvYF5lxRNHxNZ86fRxljxMK5FHYvAnIcG7/4OKIA=
X-Received: by 2002:a05:6a00:2e14:b0:725:e499:5b9d with SMTP id
 d2e1a72fcca58-72f6ab9b6f0mr666087b3a.3.1737495191872; Tue, 21 Jan 2025
 13:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
 <20250120-msm-gpu-fault-fixes-next-v2-3-d636c4027042@gmail.com>
 <20250121210818.GS674319@ziepe.ca>
In-Reply-To: <20250121210818.GS674319@ziepe.ca>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 21 Jan 2025 16:33:01 -0500
X-Gm-Features: AbW1kvb6ejz0Edpb-LSeUnSnuaoYq5_MYqcriJkrf00pfJrPDWvH4y-7_JTCMIM
Message-ID: <CACu1E7EgYzsU1AJfi7MJ9QjX8mypPw0mxcCkX-H59hSaDFnd5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm: Temporarily disable stall-on-fault after
 a page fault
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
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

On Tue, Jan 21, 2025 at 4:08=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Jan 20, 2025 at 10:46:47AM -0500, Connor Abbott wrote:
>
> > To work around these problem, disable stall-on-fault as soon as we get =
a
> > page fault until a cooldown period after pagefaults stop. This allows
> > the GMU some guaranteed time to continue working. We also keep it
> > disabled so long as the current devcoredump hasn't been deleted, becaus=
e
> > in that case we likely won't capture another one if there's a fault.
>
> I don't have any particular interest here, but I'm surprised to read
> this paragraph, maybe you could explain this some more in the commit
> message?
>
> I would think terminating transactions and returning a failure to the
> GPU would be fatal to the GPU operating model when the entire point of
> stall and fault handling is to make OS paging transparent to the GPU??
>
> What happens on the GPU side when it gets this spurious failure?
>
> Jason

It's touched on in an earlier commit, but OS paging is not (yet?)
transparent to the GPU, and we aren't using stall-on-fault for that.
Instead we're (ab)using it to stall the GPU while we capture a
devcoredump with the state of the GPU when it first faults. Stalling
prevents the GPU from moving onto another job while we capture the
devcoredump. We only keep one devcoredump at a time, so we don't care
about subsequent faults until it's read and deleted by userspace. This
idea is taken directly from downstream, which I suspect is why the old
Qualcomm MMU used before MMU-500 violates spec and terminates
subsequent transactions after the first one stalls - it's helping
downstream implement devcoredump without this workaround.

I can add some of that context to the commit message.

Connor

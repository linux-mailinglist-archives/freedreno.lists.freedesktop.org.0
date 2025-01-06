Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32213A031D6
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 22:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D22010E647;
	Mon,  6 Jan 2025 21:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CcX4Z7Do";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF9F10E647
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 21:08:09 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4679ea3b13bso111188821cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 06 Jan 2025 13:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736197628; x=1736802428; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOzmxccnce1E7CXNiUs8eoUX3tWPwgiUu+2R9Zn1q5U=;
 b=CcX4Z7DorhSZW5aDBdIA1xCHt9fJxCe4nzZSw1PB9OuZDaErG03P5UhQL5x5dwqp4I
 jw7TrrsHeGtRz0txUDrJCkVkUq3J1aBelTvKsaRsK4jhzw3KkV5Gi83uOi5Sf1U9J5pR
 mxagd8+Dqrli6J37Zwd3NXvcJD+CbVjm/iik1Cba2OgVx4IJVabCqPLc35V8ufMyKie2
 tjBqQZfUfSZON4s2kr4sdCY/5o2wHdSJI4HUQw/pMiYWtIMAmqYSSjYCNcuMNSwYPEdS
 PunJ8H1eVz0cMC8JkPku6kIqQQbFNbiERKUkOPdZMAkXaPFaFBC2YwGz4M1bH6Vp/uOd
 hhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736197628; x=1736802428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOzmxccnce1E7CXNiUs8eoUX3tWPwgiUu+2R9Zn1q5U=;
 b=fszyoZADWi7GR7n8FRG+vBVUI3wOJ34p0N1igiSe2zPnwkckWycjdhxKmH9JPMZsXB
 r9ULlusWWh+L3gZ2wOh05F6jD02pGRDM7JI70pH2teFCsV2lLwZxbcCMIS9bVClgzFxk
 Q30klwLrAq+y71mm8UQjRxpUlYvu6DUP3TK/i1waxLkXOXupShpqspk6ZQ7+q02V4EA5
 7HZPeTYHt/JoaS7w9t1R1QpFs1Xf03SWRxI0rQZ8AZLLX/7csuyxnIgcQJjbcyhlGsZE
 TCbqFMuJYYFMKk0xsRClBaJzutddoIAk1wxDZzuINbUJKi2wqX/ASFRTeQYIAee/8u77
 mvYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc81yqdVofQ+SwA8FKP4nU3wn9fwNMw59c5bS0rbQUu5n4U2errHbB5m8+/8Lw0IldkLkpAmY0Uac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPGZpMHwaf7vyOyHSasgr3i4CGIMInYTdxWK4yldPVsle4qlPd
 paiR5CvJY3TR+30ZLkIrigEE6/hplhWLrw3xQ7NBN4/kKFBWVYYDxiQgyDErtt9deZ48YU1YTcP
 NfjgnED8IK9lagHxf1RijHO1lX1LsrA==
X-Gm-Gg: ASbGncs8KxZciTFn09WYkTZZdhYge+wy2iCxGRgvSHyqcvesXWfpYjXQeBEX189aX/+
 4f1G5ZrmweFG5pL1J21+D4gBJ8hwY5pzNIcO3KqKWm3Hm6/vV/xWef9X9rejUeHJGvBTO
X-Google-Smtp-Source: AGHT+IHqQnod+WLMTaza+oYE9/HZ2z8HLcXB/MzbtBLsKVq4Jqi09Mbkpt4Wcf/3+HNCWqrXskcu8GZwWbHmP3/D/R8=
X-Received: by 2002:a05:6e02:18cd:b0:3a7:81a4:a557 with SMTP id
 e9e14a558f8ab-3c2d65e508dmr468450635ab.24.1736197263407; Mon, 06 Jan 2025
 13:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20250102183232.115279-1-robdclark@gmail.com>
 <76b822f0-c4c5-4d47-8e0b-c1eee513e228@quicinc.com>
 <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
In-Reply-To: <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 6 Jan 2025 13:00:51 -0800
Message-ID: <CAF6AEGtNBoWnLA_dBBC-4U7DrWLO+hM_-9iraXgc45Aj885nCQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>, 
 Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
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

On Mon, Jan 6, 2025 at 12:11=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 1/3/2025 1:00 AM, Akhil P Oommen wrote:
> > On 1/3/2025 12:02 AM, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> On mmu-500, stall-on-fault seems to stall all context banks, causing t=
he
> >> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >>
> >> This fixes an issue with an older mesa bug taking outo the system
> >> because of GMU going off into the weeds.
> >>
> >> What we _think_ is happening is that, if the GPU generates 1000's of
> >> faults at ~once (which is something that GPUs can be good at), it can
> >> result in a sufficient number of stalled translations preventing other
> >> transactions from entering the same TBU.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >
>
> Btw, if stall is not enabled, I think there is no point in capturing
> coredump from adreno pagefault handler. By the time we start coredump,
> gpu might have switched context.

Hmm, we do at least capture ttbr0 both in fault info and from the
current submit, so it would at least be possible to tell if you are
looking at the wrong context.

BR,
-R

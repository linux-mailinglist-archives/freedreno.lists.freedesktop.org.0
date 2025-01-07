Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8872FA0445B
	for <lists+freedreno@lfdr.de>; Tue,  7 Jan 2025 16:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644EC10E1AE;
	Tue,  7 Jan 2025 15:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I9dRz7Sq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C0610E1AE
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jan 2025 15:27:56 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3ab29214f45so54580295ab.0
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jan 2025 07:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736263616; x=1736868416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bYd26+ANvMzt3bh8JMGQhBXRVd6LUHx6ZcNpu+1HZ/s=;
 b=I9dRz7Sqpfrl5qnTJ78u/t132N7kKpfEPDmp1HegMmd8yWZkJyd8xDkW8MUlDtxT+T
 YPBfAqmo5ht5tqGioszCNxjlGhNKKLK7q42lSGwrUyBeZcufhsvs2GVuxIhL88BDX1Hy
 9LplqSjwsjYv+cK7PyeSdujjORRNm5xc+6IeIxG7042paDuv9DwAKBGCJyBhLQ5tD7mb
 2vGYVcXh1cLT5LVtf8OD2BkDPmDxzd4EJrDlSVqp/F5upgJC74fNXrjWYN/1rTjII4XQ
 xAbDImuUHu1wRcyoX9YURuhqkvARfvax9mHsJx7Qhk/3fflk102py6GqDEscyPSgP0uf
 NRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736263616; x=1736868416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bYd26+ANvMzt3bh8JMGQhBXRVd6LUHx6ZcNpu+1HZ/s=;
 b=Cd2fgE/varlOMFRrW8OKKsPVthZXS52zQRcR2ANRvIOVD68OByfHx+drQEnfhiY+qF
 /gxs191zA11kXetqt/Yyh+E8dnwR+zlAIglfC4sZa7CL5hz2nWDONvxzTpHxvTX3aWHU
 eb8XVoH+T3fKWHKxKJdFlatHSFl6xUDxoEU7rj8FhPZx/9MvRk8P51f0elIA06OxSpKn
 88T1bIMqBNKtClA9SK6eXtOdPlJrMWF/RdhpRc8046Me9259donhd8Y2zog7kAQ/0duf
 HAaP18kBlc3rNRtUQzJzMsUOEo0HFqg4xWHiD3+pwj4eWhuEdZDptGkFfdiBWkiqRSIN
 nVoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ64SasAjxi38TKxnViu26XBzIgEDADsLwAmbGMHggDggo2EpSfWSFpaPygrcet6unBTBSF8J5Tz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmBZ1IzXTcSBTh2ay0sL8+TwKkLysAIjU4W/kbkyLmaMKG3WqZ
 xp0Ch7Dvg5sz+l4egIarh49xXFpU3GRexQNiKvXOf/GVgIfAlJ4VgXlDDdie1n03kiSMafHap9C
 STqlevpAEitFIcGEWqxVdJJn6blQ=
X-Gm-Gg: ASbGncslpAAdYsOrGuq/IPIeDZ38CD4sBCAycuMh3VWV7zN2/ufsExBXZPilGKmPYhS
 SBY40spL90JWXo8HFK30zu61Toi4ujCO6XmrYZtIBfmBsYbB86sW4ChQ9ZXoZM2wXCiRV
X-Google-Smtp-Source: AGHT+IHwuMLCJR6Vl2J967epV117Dufpeur0fSxmS2hJJtoEYpotAHxco0Dw2fvR3j5a3grMMCdXDq+mOt2AdoHs9GI=
X-Received: by 2002:a05:6e02:20eb:b0:3a7:6c6a:e2a2 with SMTP id
 e9e14a558f8ab-3c2d2568e30mr508063205ab.9.1736263615657; Tue, 07 Jan 2025
 07:26:55 -0800 (PST)
MIME-Version: 1.0
References: <20250102183232.115279-1-robdclark@gmail.com>
 <20250107125738.GA6991@willie-the-truck>
In-Reply-To: <20250107125738.GA6991@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 Jan 2025 07:26:44 -0800
Message-ID: <CAF6AEGtZSOMi-=AOmjoXSVkwfyvKOymSuRRMZ7jOcM2wyhu5qg@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>, 
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, 
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

On Tue, Jan 7, 2025 at 4:57=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Thu, Jan 02, 2025 at 10:32:31AM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > On mmu-500, stall-on-fault seems to stall all context banks, causing th=
e
> > GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >
> > This fixes an issue with an older mesa bug taking outo the system
> > because of GMU going off into the weeds.
> >
> > What we _think_ is happening is that, if the GPU generates 1000's of
> > faults at ~once (which is something that GPUs can be good at), it can
> > result in a sufficient number of stalled translations preventing other
> > transactions from entering the same TBU.
>
> MMU-500 is an implementation of the SMMUv2 architecture, so this feels
> upside-down to me. That is, it should always be valid to probe with
> the less specific "SMMUv2" compatible string (modulo hardware errata)
> and be limited to the architectural behaviour.

I should have been more specific and referred to qcom,smmu-v2

> So what is about MMU-500 that means stalling doesn't work when compared
> to any other SMMUv2 implementation?

Well, I have a limited # of data points, in the sense that there
aren't too many a6xx devices prior to the switch to qcom,smmu-500..
but I have access to crash metrics for a lot of sc7180 devices
(qcom,smmu-v2), and I've been unable to find any signs of this sort of
stall related issue.

So maybe I can't 100% say this is qcom,smmu-500 vs qcom,smmu-v2, vs
some other change in later gens that used qcom,smmu-500 or some other
factor, I'm not sure what other conclusion to draw.

BR,
-R

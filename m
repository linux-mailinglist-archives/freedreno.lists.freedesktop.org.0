Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBC09F7D81
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 16:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34A910E48C;
	Thu, 19 Dec 2024 15:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W3tylp9y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD1F10E48C
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 15:01:01 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a9caa3726fso3027535ab.1
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734620461; x=1735225261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGSpD3+3yxS9yz0CYWixS3C/FoBfovGzSM7W4jlHvCA=;
 b=W3tylp9yctyx9NutBV6b7oNCKNFdkifrlSPutlbnubq7W2CESCQqeNLK4saLNWdy5u
 yErwl+8f6X89DDXDm5xVilD+H2LpOQkUFY1kI175J4LjRXLbsvVIrZBAuXJAQjB9+uWG
 7Mls8dB8djiQQvYRofrXvLetDcsNg88osEV56TnB9CCbpd/ZS8OMe4nK9MX5Us63fMeu
 qLGXzsDwsFzlW2agFX0y1qwXFZ6rmGppZy24JW468qOitJ+sKKXL4/OvB6okwTVsvaZP
 /Cw+9fVknwXsagvQw430eqriU90KjfeXK555cIaOKuFAiJJw4RXJTx+sRwKQzuFECaXn
 Ha9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734620461; x=1735225261;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kGSpD3+3yxS9yz0CYWixS3C/FoBfovGzSM7W4jlHvCA=;
 b=r4soBCD8zUjI6YdcqwoQdT//Yhb+vPVy2PN41u9j49bUFSjizrsq3QlLD6rvwcP/j+
 THjDsC/sRSy+i+EWirHNYPm/IbZlURD1cJVSIDV+wy/jILm2UBhCtOarz7qgfRutE7Dy
 wJc0DjT4L8q8EiO6z/lC26a9hKFROnZrQzQjb+YS5iJvcTHPkITDjncVOK4rJha+Y1wh
 mhVHTFpfjctM0ZbJH97wHyA5ffGNH6PKtX+ivZbIK6mNKlV9WsL1AjUpldeJVXclKLDX
 qxK9s3g5dczEnVYZtBeEwu1LVYOupZAZWEwJtqQM8wocwBV2J+7bSG38ewQuoNyZjV2q
 oHuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpTU/Ln7gasgaKjXoSiljB+aiGjcCehHfD1FCGsHRymtNZHTeW/213rBHZOGrV4B9TESNJHyD2nt4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztFkuLygzfAvmi+K9GHB/I6pc65exGAWNm2Ml5aoNMhzzkefNb
 /49QiNH8Tot1l5qCzr1aBdYywmBPNWR8/AdJ8xNVy9YzgAVx3qZTbH0TinAXuEqALH/p2l0dE+8
 Gtk6waAzbWBbJJMWezC9j7il80I4=
X-Gm-Gg: ASbGncvgM3An01/V2N5fJZZNPdDkrKAILdboVvEnEIrVgCEQDH764nNi4D11a9l24fX
 GHprRP/4HURuXsqcx/LbGltVNV0yi5JeYDVXJBQ==
X-Google-Smtp-Source: AGHT+IHp8ABABtvQh+2yyPlFSULZ37QjpTpYXLauYn/rtYNis49Ni4sKHQpdMdeMDdPO+HGJ2/oxRYIljcvIQuXYhZ4=
X-Received: by 2002:a05:6e02:1649:b0:3a7:c81e:825f with SMTP id
 e9e14a558f8ab-3c02e1e9aa7mr36636045ab.9.1734620460446; Thu, 19 Dec 2024
 07:01:00 -0800 (PST)
MIME-Version: 1.0
References: <20241216171017.4881-1-robdclark@gmail.com>
 <20241219113019.GA23640@willie-the-truck>
 <41d93dac-4ef1-4cc7-a7b2-24c8289f905f@arm.com>
In-Reply-To: <41d93dac-4ef1-4cc7-a7b2-24c8289f905f@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 19 Dec 2024 07:00:48 -0800
Message-ID: <CAF6AEGshSjOr1DE63WiXwAyH39-Tz9B3MEkKUo6sg1jpQPYZcA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
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

On Thu, Dec 19, 2024 at 4:08=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2024-12-19 11:30 am, Will Deacon wrote:
> > On Mon, Dec 16, 2024 at 09:10:17AM -0800, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> On mmu-500, stall-on-fault seems to stall all context banks, causing t=
he
> >> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >
> > MMU-500 has public documentation so please can you dig up what the
> > actual behaviour is rather than guess?
>
> Yeah, I'm pretty sure that's not true as stated, especially with
> SCTLR.HUPCF set as qcom_adreno_smmu_write_sctlr() does. However it is
> plausible that at the system interconnect level, a sufficient number of
> stalled transactions might backpressure other transactions from entering
> the same TBU, even if they are destined for a different context. That's
> more about the configuration and integration of individual SoCs than the
> SMMU IP used.

I am aware of the docs and I've spent most of the last couple days
going thru them, as well as the errata, since it would be unfortunate
for debugging to disable this ;-)

The scenario where things lock up involves at least a few thousand
faults in rapid succession.  Disabling CFIE in the irq handler and
re-enabling when I resume translation does stop the flood of irq's but
not the lockup.  It might well be something about how the smmu is
integrated with the interconnect.

BR,
-R

> Robin.
>
> >> This fixes an issue with an older mesa bug taking outo the system
> >> because of GMU going off into the year.
> >
> > Sorry, but I don't understand this sentence.
> >
> > Will
>

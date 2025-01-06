Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447B0A031BB
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 22:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136BF10EA14;
	Mon,  6 Jan 2025 21:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nf9cb4Wm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F2B10EA14
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 21:00:51 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-844e7bc6d84so579344539f.0
 for <freedreno@lists.freedesktop.org>; Mon, 06 Jan 2025 13:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736197191; x=1736801991; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xHlppqM6gvLh+wGWzZMvi4bmlnS1UEsF/Gy7XASBKeY=;
 b=Nf9cb4WmA5gDeETVj2Mb5KnfEuslpif4YHSs1sKctUpjkG/h4zjw9H0QRFgt67EeT1
 HX37eV2UkYSoV4d/wcL3xjAxXfVobRWvc86BiGvOf9CR54AQR3BPn1EBosfadSeB8rx6
 ZQBlNk6fo/tVzzTnDOinC03MsnC3ED4CMMrEuxjFgtoUZJ/hIE/1tS0o1kk8xvHJiE6k
 7sAYsXNnMNr+u3V15992Dh2CAG83LOoE3wTTRLitmQkU2yRftJZ4+PsNx+SrjI1HuQCQ
 B3hSK5znI2uAP2jZOW7TCptKU+eRJdA3cqIFAIYUNsuU/l7RF1B43shHTEH6ywZBCku+
 nHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736197191; x=1736801991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xHlppqM6gvLh+wGWzZMvi4bmlnS1UEsF/Gy7XASBKeY=;
 b=ckwswwCs4f1EqbTJLNyKi3FVE3ToG9wEjUCw7BnsNO+f/k8pMyC0XDeTpA09XcteRH
 n8M3tDJZw6AbwdQx2OLCghvOK1L7u3oGltlAbUFlQjf8dndW25kmmIFN11kEXH/sBjat
 SapZ0xlON5fZwop1YIRP/egaSwwELsgPD4RsbmP3bQgqkn+UG8+/Kks5xHlmlwKfne3d
 cudobF2OxolfzqqQ+pChwn6r12L4nWmw6aH5sF8pPMsbdXMqdPniGjhxSKj0KhnNiiJO
 KTj7kk05p8MSxooSUwat3/YvqSAaU4sduYoGzTdQVG/+qO32uhHcTbrk27ANUPlIs310
 xbuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqoF1dQxdjBVnV7Hoo9MqgMaf/nO6MpKMdEw7LdUatceaEjuL2jhbSpAIvMTuRzuDOQCytmH8bRBg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmDgb95ZNPRXb7d4YgqlLkH6mauCSUxFYWHXxkTTMZLzWfvRuW
 mekZ+72CGiwbSJEhpJXdSrBURnGDMKk1364PVO0+XGAd2v3KdhASLJZPXar53NNaXdlF2/zUFA/
 /nNH9kpF/90/N/ay8NgmZoFY8/A4=
X-Gm-Gg: ASbGncs9HWRi/5OxlF32nsjE0POqZgnEwjhbjfckpZC9zHQXAcmgIpSum9Lv0b4FZ1r
 nUzKEnPz9hlq2/qgsSmmtW2Yu3XLWCYzb+bav6EnldpqmgVOidmCQT2Qo8T4GQl2yg5ED
X-Google-Smtp-Source: AGHT+IFsoTqFksRVcj1Uq3xa18RTL4eR+t+8QWVvILYJNxKFRhJkMed879iGVSYCfUIJr246vFnKVIb3m+mEWzm/jDc=
X-Received: by 2002:a05:6e02:3385:b0:3cd:d14c:be69 with SMTP id
 e9e14a558f8ab-3ce31d7b353mr6421065ab.11.1736197190870; Mon, 06 Jan 2025
 12:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20250102183232.115279-1-robdclark@gmail.com>
 <76b822f0-c4c5-4d47-8e0b-c1eee513e228@quicinc.com>
 <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
In-Reply-To: <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 6 Jan 2025 12:59:38 -0800
Message-ID: <CAF6AEGvDGtP_AAwDYnv5C3Bdg5dJk2muNUpT+yGYe8bn97OSwA@mail.gmail.com>
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
>
> -Akhil.
>
> > -Akhil
> >

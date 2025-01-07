Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A5A04C94
	for <lists+freedreno@lfdr.de>; Tue,  7 Jan 2025 23:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B091110E3F9;
	Tue,  7 Jan 2025 22:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gBRsTH9l";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15ED10E3F9
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jan 2025 22:44:33 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso181312221fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jan 2025 14:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736289812; x=1736894612; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pa3RqmxudYJyFQPRnw18vNuYTg6IZacGgInKXmkuvPY=;
 b=gBRsTH9lYdJathrLq2CWKQvNc/l3kych6iYn5n53DB0AvcharS7NrSkQE+O3fPbpE3
 yK0tXqx7yV525yikALcvFOroo8VHM48p96NW+HlmJVYi1M1xxcP5B2tfg47sEVpkaWa7
 QRbJeJnFHTznjVW9KFEIvIrKMseuby4lCyYFounC35dQKnId15HgUIh7IVYNHbZeu8GR
 4h92HZJBRJm8XiN7My/UoMee4jGPaTM7K45vH7hxckggqbQlvHX3S+w4Ke4+xt2OF+Hn
 oPkCbqR6oSdlXeZLakGdbTUcNafdigl3up6ctTq+GkoB80jPaBwhv8D7pPnek08z10vM
 Ne4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736289812; x=1736894612;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pa3RqmxudYJyFQPRnw18vNuYTg6IZacGgInKXmkuvPY=;
 b=Trpxwv0C9ELZr9YMkhYX7uoMuj5qmMu2P5+ta4vtRwa/M2tmWrvSxtG8pxxrjR2PqJ
 POPLZkeuyS6t+9gZPNQpi3M9O0Ah+cu8jEnIuIGrmO4N8XM3dgLMV1yZt7+Cm2+1I8Qv
 e79Qs+rapU8Uinu6TczzxW7obDWKCxNcO8POOX1UBLfPNyTj7950vcu1A0+cuFR6lMe6
 DXVsBQwR8jsWx/go0eFx4Z96gPlY9O7ghNkNdLx6RvumIiF/GtkoJQrFtd/eRihXNOvk
 hgLesK6u+o+O/+1I1RYIqzTNvsoBfZez7xGZr7bkBc0KXD/qj1Hf2kzfe7lLLwGd75Ws
 xhlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcFN0FEJszDVqjLw9u0FZ+k+oc62CGTha82vyNfq2dQPEqcu3pLgc7bWFhbp1ZyIdgBpeo21zzefc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM+H+hA75nj4sBxevYxU3fhuKufhT3tt4tmzykhkreaB3nBt8E
 iZ5sXy3t+v4hsjdAYDEMRU3v+6IK4HAa/GkyWtERQ94cCMgRSehpOGUw7ldCiHY=
X-Gm-Gg: ASbGncujkd2iN8RcxbN3JS+iik4IsBXWqFxsYqekA6PCTcfK2UXjQeA9+ZsuAGKC88o
 89UaR7z+DFnRyUQvXcXPqPCN7+6uvK+JGT1LoqwhIk8hM8T1npMJ2hG52wtflJ7oTyEC+frGMhZ
 46lDif3PgdCUrd34hqhYWpW2pdTI4n4B9rCCixifufiraEeU48uiDuOcuf7EsoQvE96iYxvtArB
 oDD2gTZYBxqHUiEQtphZqLRKEe8p7f/S7AkspADof5fHWLiSnjbiulH1Gp6E5ZR95oo5Ddlp7JV
 iBMCBc4yD8TJxpKYfdHl26SU5soIytNxnPKn
X-Google-Smtp-Source: AGHT+IHy5V27gDH+by9fnJ68iOhPGvEIJqeaut59nvgCwr8FXp2+T/5yYWYjCX3jT2mFaBHiG+I4UA==
X-Received: by 2002:a2e:bea8:0:b0:302:1b18:2c09 with SMTP id
 38308e7fff4ca-305f45ba080mr1149561fa.27.1736289812296; 
 Tue, 07 Jan 2025 14:43:32 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9b9c4sm61091001fa.31.2025.01.07.14.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 14:43:31 -0800 (PST)
Date: Wed, 8 Jan 2025 00:43:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Robin Murphy <robin.murphy@arm.com>, Rob Clark <robdclark@chromium.org>, 
 Joerg Roedel <joro@8bytes.org>, 
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Message-ID: <fipxf3vf3nrbiqgwtu7z4vqcyt52dludehdvqc2cnfbal6poyv@uj4hxrlhnqeg>
References: <20250102183232.115279-1-robdclark@gmail.com>
 <20250107125738.GA6991@willie-the-truck>
 <CAF6AEGtZSOMi-=AOmjoXSVkwfyvKOymSuRRMZ7jOcM2wyhu5qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtZSOMi-=AOmjoXSVkwfyvKOymSuRRMZ7jOcM2wyhu5qg@mail.gmail.com>
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

On Tue, Jan 07, 2025 at 07:26:44AM -0800, Rob Clark wrote:
> On Tue, Jan 7, 2025 at 4:57 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Thu, Jan 02, 2025 at 10:32:31AM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > On mmu-500, stall-on-fault seems to stall all context banks, causing the
> > > GMU to misbehave.  So limit this feature to smmu-v2 for now.
> > >
> > > This fixes an issue with an older mesa bug taking outo the system
> > > because of GMU going off into the weeds.
> > >
> > > What we _think_ is happening is that, if the GPU generates 1000's of
> > > faults at ~once (which is something that GPUs can be good at), it can
> > > result in a sufficient number of stalled translations preventing other
> > > transactions from entering the same TBU.
> >
> > MMU-500 is an implementation of the SMMUv2 architecture, so this feels
> > upside-down to me. That is, it should always be valid to probe with
> > the less specific "SMMUv2" compatible string (modulo hardware errata)
> > and be limited to the architectural behaviour.
> 
> I should have been more specific and referred to qcom,smmu-v2
> 
> > So what is about MMU-500 that means stalling doesn't work when compared
> > to any other SMMUv2 implementation?
> 
> Well, I have a limited # of data points, in the sense that there
> aren't too many a6xx devices prior to the switch to qcom,smmu-500..
> but I have access to crash metrics for a lot of sc7180 devices
> (qcom,smmu-v2), and I've been unable to find any signs of this sort of
> stall related issue.
> 
> So maybe I can't 100% say this is qcom,smmu-500 vs qcom,smmu-v2, vs
> some other change in later gens that used qcom,smmu-500 or some other
> factor, I'm not sure what other conclusion to draw.

Might it be that v2 was an actual hw, but mmu-500 is somehow
virtualized? And as such by these stalls we might be observing some kind
of FW bug in hyp?

> 
> BR,
> -R

-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4716B887C77
	for <lists+freedreno@lfdr.de>; Sun, 24 Mar 2024 12:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F7B10E0EB;
	Sun, 24 Mar 2024 11:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MoObhDNi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DB210E0F3
 for <freedreno@lists.freedesktop.org>; Sun, 24 Mar 2024 11:14:07 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so3170798276.1
 for <freedreno@lists.freedesktop.org>; Sun, 24 Mar 2024 04:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711278846; x=1711883646; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Mj6u+B8xlCB9159mUHz7E1aaC9KkzXuH6GFNH3xNBoM=;
 b=MoObhDNiwgOeB/hlkmRkoz7fwBSCkMeX+4nAuqRcgQXXWuMRe3N5Yqo3uDC1PSsjiE
 bFsu1kA9e4MGMKBnHXaQnJxzt7R/j8b7Ymom+X04UICMycRLeWLhOwdTR8qrMCDShWe/
 i+vtr7dlFEh1rmKnutzBSKsBDB95DHu2IIBvxNIOqzTjXqIUo48LshKyteiVNd5N2yL3
 J2b0FGpPhKBA9Jch9Is3DMWsKLDxtWOF8mcpCP2m0caRxzEfvPiRXrZ7yFxxllfGEn9g
 Rh1gA18VLFpmcLn+jD+pTYZkmCI5Yr6sbYCQ3gpYma7qct8rCxgCGqVjjaccxy8be5hO
 rQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711278846; x=1711883646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mj6u+B8xlCB9159mUHz7E1aaC9KkzXuH6GFNH3xNBoM=;
 b=kUQTIT6wKVZEIZPTBJIGNm/veasxVNTyuMcbR76iCn9PIEh378sRY/TvtLHv7PgnMb
 XM9XhzUST0J0KaCMCc65TomDRMj1V0xnr+RLDvcNbQcgI11Lb3U0MQ4vCcwdFOeoQGcs
 GSfjWgKcjRZvKMHkoYoOKzwc3rwW/GyWNMFACD+qEEf2A+qMZuyCWsF2MvTYHuvQb7Rb
 MCBr3rCyWfrDFCCnWblO/U4NgF3Vc6lOxCujFpbUjKS5wnZX0baf35ykPViBbwk4tBds
 ESnFiFkiKXAkVDKAQufwbijrvl+5IKcpLL6JPRaN5lGVNTXf5b2tGwJXr6sgLULvcWkb
 vFEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCBhcof6+c4j5XnB1/mjDZmSElfHgBMyGNAgSU1qvqpmfF6vMKzGfiO+PCdL+73RUTciaufjzx7O4S/5YrAXam4ME7Pm+t5Wz2oYvCKBC2
X-Gm-Message-State: AOJu0YyNN7A3IUaTWZTVrNQ9pwR8WlLG75yQsGEv9+pj8vwjfzlHgzWd
 zNLggwhc+lKM9cuJoMk2GIFOsvAfPd7U5mPgZTBQg43HF3Qyu+FeS6swiIK6sHuR4L1YXuaOuLx
 Eow+i1CI1XK7lV79jjB6g1zetEcI20dVLQMXkdA==
X-Google-Smtp-Source: AGHT+IGr0tNnaqUlmK0eR1f5FzQiWKbsnubMD9+Wo9vIvgCqe8WTw3q8zUfy/4luXP0YRCD2+8dSeF51lmB7BvOZ22A=
X-Received: by 2002:a25:ba90:0:b0:dcd:a28e:e5e0 with SMTP id
 s16-20020a25ba90000000b00dcda28ee5e0mr2155613ybg.25.1711278846456; Sun, 24
 Mar 2024 04:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-4-cca5e8457b9e@linaro.org>
 <20240324095222.ldnwumjkxk6uymmc@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240324095222.ldnwumjkxk6uymmc@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Mar 2024 13:13:55 +0200
Message-ID: <CAA8EJppAsy9a0b4WzqWCaa=-fPYrKOMePo3vsAaJ4Nu3okoL7Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/16] drm/msm: move msm_gpummu.c to
 adreno/a2xx_gpummu.c
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 24 Mar 2024 at 11:55, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Sat, Mar 23, 2024 at 12:56:56AM +0200, Dmitry Baryshkov wrote:
> > The msm_gpummu.c implementation is used only on A2xx and it is tied to
> > the A2xx registers. Rename the source file accordingly.
> >
>
> There are very few functions in this file and a2xx_gpu.c is a relatively
> small source file too. Shall we just move them to a2xx_gpu.c instead of
> renaming?

I'd prefer to keep them separate, at least within this series. Let's
leave that to Rob's discretion.

> -Akhil
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/Makefile                       |  2 +-
> >  drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |  4 +-
> >  drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |  4 ++
> >  .../drm/msm/{msm_gpummu.c => adreno/a2xx_gpummu.c} | 45 ++++++++++++----------
> >  drivers/gpu/drm/msm/msm_mmu.h                      |  5 ---
> >  5 files changed, 31 insertions(+), 29 deletions(-)


-- 
With best wishes
Dmitry

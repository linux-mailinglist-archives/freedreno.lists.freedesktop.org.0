Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88271887C5E
	for <lists+freedreno@lfdr.de>; Sun, 24 Mar 2024 11:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6A410E058;
	Sun, 24 Mar 2024 10:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GScLsZkZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FF110E05C
 for <freedreno@lists.freedesktop.org>; Sun, 24 Mar 2024 10:57:55 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-609f359b7b1so39734247b3.1
 for <freedreno@lists.freedesktop.org>; Sun, 24 Mar 2024 03:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711277874; x=1711882674; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dKOizG9PbYAwIIoEzDwzNQWV7wqYGQ4/VdGXW3+D0uE=;
 b=GScLsZkZnCnxEfxDPL2PXrhRDqYxdsDEo4eBFE511VE+2ZCs3vLyzMUACYEW+hFP8i
 H07LmnL17Uo+RcTf8wuMXbE/OvW0jk0k5oVodjBbiOjcylSY1ZeV3Ma1ijUL4GBNz62x
 9EJv9qjkFSyy2RLLerAUmonCRn2riAvgjYvmxXRwqL112WUJoCRT+681e7wiI+6YOcnI
 GSrwxf3S/pYXL7ADhrF8bHKL/sZ/5jSeVh7EylrHjv19ewswS56sWKzZGfR9r3GEql9c
 aZcn+zrdXO9n3uDhnVkTcNVBYBWgedZK4z12ZX4+6R1DtXxDauDw2ZgS0pX+GR9g6dCH
 +u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711277874; x=1711882674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dKOizG9PbYAwIIoEzDwzNQWV7wqYGQ4/VdGXW3+D0uE=;
 b=uT55SgAUg7y3azcur/76IaXdQk3sPUtpMZAb0LcjUoc2sWLCVkJrHUpsGPexCETrG2
 ZFB4JGaQphcZ2CLa7tEKONZ20fUBieiwCD30N7pIlNJZ6e5KWRagMF/TVrsVibeC3IMw
 zZUtwTDuHyh8TfbJIW7VTYQuwYz/O9OGzWWg3dudHIaFLnXRCr96U1VokllhPU64/8Bn
 z03X6Ib04BUzD8eFgZajMDGlSmT8eZR5n5djgL0jx3E/ysYv1tSyya+ePnNU65H54ZZn
 /qxocFHaQwcOcCHcVzbLnMh1NE/r9kDI1H/w7tf+V/zZtAsiCtFeoAkPWMDkRt7ot8e7
 AARA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCpha14SpxH3WuLNj8LdqZsY3QsXO3AaluOLe6iAoa0604TSr1bC8Jb7d4yEBNpbGx0yw7DibTnu4v/ABVHAeTqH6HqaeGl1r5Ig9L9bVK
X-Gm-Message-State: AOJu0YwpzbGuZTpLLNip2BV5A9TQvFZ+xz+B7llQfcT0KflBmCWEhkO/
 x7ReykStX3jmY5nSdgTAf1Z+5Zn6zDjQcOoOs2XD6MkbE+fRZ1vFdbsrFn8PbGNCBAfePCu04Ks
 IHI8gqtlBB4H8U1yVUdds5yjO+uOE2KCVCjz3Nw==
X-Google-Smtp-Source: AGHT+IFkNNzpGCHNVGuHvvSWfPZSgwg1RAQpdjkiNapdwrzO0RfGnrZYm+TKLaP2muu4ukqjYZ8fO611rcTztYESaRU=
X-Received: by 2002:a05:690c:ec6:b0:611:2f86:7864 with SMTP id
 cs6-20020a05690c0ec600b006112f867864mr4318637ywb.3.1711277874516; Sun, 24 Mar
 2024 03:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
 <20240324102936.6eojmk3k2qabtasq@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240324102936.6eojmk3k2qabtasq@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Mar 2024 12:57:43 +0200
Message-ID: <CAA8EJppO8zMq5R7hBPG04Zsr9c3-Z9mqpnJQ88Dbjv3uYDbrUQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
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

On Sun, 24 Mar 2024 at 12:30, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Sat, Mar 23, 2024 at 12:57:02AM +0200, Dmitry Baryshkov wrote:
> > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > need to push register changes to Mesa with the following manual
> > synchronization step. Existing headers will be removed in the following
> > commits (split away to ease reviews).
>
> Is this approach common in upstream kernel? Isn't it a bit awkward from
> legal perspective to rely on a source file outside of kernel during
> compilation?

As long as the source file for that file is available. For examples of
non-trivial generated files see
arch/arm64/include/generated/sysreg-defs.h and
arch/arm64/include/generated/cpucap-defs.h

-- 
With best wishes
Dmitry

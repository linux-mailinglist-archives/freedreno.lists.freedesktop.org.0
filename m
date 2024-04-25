Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537B8B2D69
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 01:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A83E10E742;
	Thu, 25 Apr 2024 23:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VPeCAnyL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED4310E742
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 23:03:36 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-61ab6faf179so15706717b3.1
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 16:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714086215; x=1714691015; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IHagRpxhRv8E4M664glhr6i4IPcgo78U/4ccBwCQ2jo=;
 b=VPeCAnyLLVmVZ0ZcHLFurE6/4zFrIw0apC0HQX02n+3jWvyaeXhA9491UMpuqECSpg
 kPejJjxidYY1/Hufp/25PS0eqYSb6ZaVFlQTfbXkz5wBkhfUUXcXpLGBTTOaxIKjamy6
 EJQup2HSnrf8wR4nU8Gy+60JqpzBGJF8GXeFCbytDqTyPmedkH3g8ZaEn5ApzFIVS+xX
 9dQXEubEt54vy4lB7JOCpbZ235I66Zvbfywr5M7ADlFRc22W813gzmrD2Yj0q9MDUDVc
 nfKpBCorfpZwEm66iBbKyH7vRXaT+bkU3U8BcpATIqF8xK+Fd/EJzkBLR5jndNjW8z3G
 d6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714086215; x=1714691015;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IHagRpxhRv8E4M664glhr6i4IPcgo78U/4ccBwCQ2jo=;
 b=oo51PjjxT1vpE8wMO16sZSWW6n6q/sMlYRZ2nS7jeCE/px/jpOvOF4qg33UdNPbEOl
 YSMP76NmtgEpuAg6FCucRcfY412jUz9DDuRZxab+aw37jFLLYQJosCPqh5RmgAGfddlG
 csRnt1ieEJroN6wz2JWxjI+Yiruvs84gPcIhlGM37khZg5Ax50MWNQIhsmliXz15Y0Cv
 YF5W8xtXse2hIpup0OkC4JclDAjaD5nZi8yfTqENK3d8Bgmk3hkdLVM6wKWQ0DsRvo1H
 BDde8QhjyKajpApp/n1gwBFyoRUFHVJ3f/B0sa6q8QLXOuTypbH/CivZGJEjXkHPLE2d
 zeng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/hpibN64L14wT1Sb0mz73cH/k2C20FuY2I5yGWP1VDiceYVh58r/ILT2rLgMTgCyENjrtUONFb32pQX2tXq1XYy2Jf/EvJ2O56RSVHORo
X-Gm-Message-State: AOJu0Yy1F/S5xxyHaRZvootpMnxZiHyt2hHg3sgCXZHlq7QoSD9Wpq/X
 8VH8qj0ob6UkKBF19L0YJpvzODvWc1VO92rPIHcPLCoUqJnzydtCgSsFdqx9L/dPpGavHChHt7g
 JNGHOHmPdmEvo8kOHtuEsKHjHDooyEXW1/llqww==
X-Google-Smtp-Source: AGHT+IFi6Fa96cZocrneBG4jFva/n4YMGR4e+ytDr3dukU+Wo3e26hXS0LJufmTCWEJP4N/7pkKDRFqUv4UcEpyPf08=
X-Received: by 2002:a05:690c:c11:b0:615:800d:67b2 with SMTP id
 cl17-20020a05690c0c1100b00615800d67b2mr1184461ywb.29.1714086215597; Thu, 25
 Apr 2024 16:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
 <20240425134354.1233862-6-cwabbott0@gmail.com>
In-Reply-To: <20240425134354.1233862-6-cwabbott0@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 02:03:24 +0300
Message-ID: <CAA8EJpo1mfBH+H4Z4uvZk6T_sKFt4-CBgOwJjaFVEx+zy1ZD8Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/msm: Add MSM_PARAM_RAYTRACING uapi
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> Expose the value of the software fuse to userspace.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
>  include/uapi/drm/msm_drm.h              | 1 +
>  2 files changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

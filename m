Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F59D8B2482
	for <lists+freedreno@lfdr.de>; Thu, 25 Apr 2024 17:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E620211A514;
	Thu, 25 Apr 2024 15:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eFA0apq8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A37711A517
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 15:03:34 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-61ac45807cbso11904447b3.1
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714057413; x=1714662213; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G5VORDwXJXgsLkAz45WqUj99ksDJmdeIVfKJG4lpuCM=;
 b=eFA0apq8SbwqNwPX6nt1DRHBhslKPQbwBBJnS+PDvfBwStYudmUIoGPysZpRPkXmu2
 c/PsQqgSfit4AEhOgK1yYTI6umcAeqrXUhyXAqYuK2KjfgaQbMPZt6m/GpQZMCXahbN+
 gaKK8tGEl7P2Co41XGeljEQPAhZYMg83xgO0TtptOQYMn3j0vhW6huNDsIFMcpn9bira
 qddXn9mK/9js/lo0x83bWQmycS6pdLt5SqZQFL99fIAMIU4K3D1mDDOv2HAuFhUS5yca
 DLokM/wQvw9MCGlXkkSjrBlY8ZU20Z64ZXo5BZvr4zPkQ25KXcO4sT5jc9iqnc0nz0wy
 QROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714057413; x=1714662213;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G5VORDwXJXgsLkAz45WqUj99ksDJmdeIVfKJG4lpuCM=;
 b=Z6mZhS+Guidm0rE7oq+WizLWT5pfDDRfMBVD9pNdmhgRYU8/nMYgv1sMuk0D2w93+e
 K0aMTglxDYrzqoV0vTcM/ihTUAuJSy5/HXbwKjBP9fHNSfyAQgoRUeNlWx8aru0jpKMq
 IWHUEkEmGkPoBJeF0H2LfRSMt33pAvVSqNm4MJz0Mz+ynBcTB6IQNOqqcB1I2rEhau2L
 s+gybeZeYK6ehn6h07ocL38wqP6CvWm/59kKqkQJlkhsieG8YUoe14m59MOq46uJIled
 /PbPyXZiR2O1xXulI6O7Fzug/V7BE5dtVS9lW8k5xIqyHCpvuQ+k/3rtBtO8+GrZGtJA
 uEeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV59iwQ0GITaUUWE5XE6vzv49DC319D/Gqc5+TArem0fgmXFmBilkUrUGZi0tw5xbxNoderXvtNDwkWP6+la2eay4n4n+iT7YPwUgnBRDau
X-Gm-Message-State: AOJu0YwY4JXlCHFdOvtpUZTUpaPyYHNoyl44g2PfSYxAeC5fh/oxAsq4
 qfLlYgm8fCVt9RgWXry+nuDUDcqjl5IK24t48jyphLpaMG0noJ6Ml3+VkZUuCwhO7kz4tIe2JJR
 e7i2Ix7iOe+HlXtm2RPa9jJyRpjJViRyrJ9EEsg==
X-Google-Smtp-Source: AGHT+IGd0Nqkcroaa8wB4M1xXsdf6Lu6WvMxzAgGJCCZn89+9S8X3fjLDFaV6NVaIaNNPCck6RUmGPMtCFV4lAu5J3Y=
X-Received: by 2002:a05:6902:1b02:b0:de5:5b0c:9c4d with SMTP id
 eh2-20020a0569021b0200b00de55b0c9c4dmr6474342ybb.56.1714057412968; Thu, 25
 Apr 2024 08:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
In-Reply-To: <20240425134354.1233862-1-cwabbott0@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Apr 2024 18:03:21 +0300
Message-ID: <CAA8EJpp+4By9901d4M9M5u878gd=VnKsVguHiY-mPmY4O=wO-A@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/msm: Support a750 "software fuse" for raytracing
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
> On a750, Qualcomm decided to gate support for certain features behind a
> "software fuse." This consists of a register in the cx_mem zone, which
> is normally only writeable by the TrustZone firmware.  On bootup it is
> 0, and we must call an SCM method to initialize it. Then we communicate
> its value to userspace. This implements all of this, copying the SCM
> call from the downstream kernel and kgsl.
>
> So far the only optional feature we use is ray tracing (i.e. the
> "ray_intersection" instruction) in a pending Mesa MR [1], so that's what
> we expose to userspace. There's one extra patch to write some missing
> registers, which depends on the register XML bump but is otherwise
> unrelated, I just included it to make things easier on myself.
>
> The drm/msm part of this series depends on [2] to avoid conflicts.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28447
> [2] https://lore.kernel.org/all/20240324095222.ldnwumjkxk6uymmc@hu-akhilpo-hyd.qualcomm.com/T/
>
> Connor Abbott (6):
>   arm64: dts: qcom: sm8650: Fix GPU cx_mem size
>   firmware: qcom_scm: Add gpu_init_regs call

I don't see patch 2 at all. Granted that patches 1 and 3-6 have
different cc lists, might it be that it went to some blackhole?

>   drm/msm: Update a6xx registers
>   drm/msm/a7xx: Initialize a750 "software fuse"
>   drm/msm: Add MSM_PARAM_RAYTRACING uapi
>   drm/msm/a7xx: Add missing register writes from downstream



-- 
With best wishes
Dmitry

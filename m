Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE088D301
	for <lists+freedreno@lfdr.de>; Wed, 27 Mar 2024 01:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1057C10F53D;
	Wed, 27 Mar 2024 00:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xTCuPwMq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2727B10F53D
 for <freedreno@lists.freedesktop.org>; Wed, 27 Mar 2024 00:04:27 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dcbcea9c261so6271191276.3
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 17:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711497866; x=1712102666; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cdWwjlLjRKWPoRjlQky5MiZwOYfdmEHMy7nWkUa2pJg=;
 b=xTCuPwMqvuu7N8Yq0+9e9cd9VhqPO0lYc6Ja4cYoouv8KtkBxIOs2YEpGy3kXwjUQ4
 IXK1h3e8G9bo816qyacihaU/3mCSTjQaHPaJCv/W7SilktWApaOzdyjQPh8YKd/27Nq3
 BX0VE8bwbfnzkWVovhqN9UE4mJRfjNvUSvi+5qFTnxMLIDYCe1vj/i9/k4HHQXOnIdIO
 GdCSurr7ov0fGqFD3f2yN6DdwscfaEyOjeJvrhgEadCwJw9pLcN7FVjUSFELVx+exju3
 dxqXRmMyhI8UMdm/C6FZGLoj5yN1029N5Zgk1RctXrk1oIWxpj9x9YgTY8zPjIQ90QHl
 k1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711497866; x=1712102666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cdWwjlLjRKWPoRjlQky5MiZwOYfdmEHMy7nWkUa2pJg=;
 b=BpI3FeGUVQpShgI2UGxlvmadqnQhJmVntFqTAYMDEE6nJ7EvW0EVqSzTm0vKgVB5eo
 xM4TmiZW0czbpVeIZ7sk0HuWJZ48BxY2iiSgye9jfrJipOuqo4r4OpFgKvOllZe6swhc
 UXkN8GHq6eqB7o03ZyfNba/b1+qdq6HPgEO32DdC79bB1h7qsuEkXifDI7IJ0ULL0Brk
 CbtHdYsRGB87rnWjuXr0qyDOeioTRZwB6rLaN/aOVp/XWVEJ2tXvYT4gnGPgemvMlXv+
 LNZefCXapdgWPfWRgpbM0NkgD/b2bNwUT7iuzQTHB5uNUxigICgMRFc4LxaRMYZ5mVDO
 MjTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm2Je3Oj6Bfy//cEpH0lwqxxF7RWX1MOOvBKFm7+ti8ZYohzrrFMt8EXpBv+hrb/5J7N6rG36ke+67Z43JWwD12fMn1BIlnGBdrN8fK84h
X-Gm-Message-State: AOJu0Ywco3C+dMH/CBir1526nGkzL3gm3FoGzgCag+Aw6dnpFLEIf8O9
 tp32zV3tTp9dR+BhBQQCpTo6DsRXErirTM6ujZmfmvWi+FzA2VL0RBcoD+j4zrJmzVp//AaG6MV
 OefK5mCA2TlqGd11n0Q6q/iq4Lm2YQVMW6nEf9w==
X-Google-Smtp-Source: AGHT+IHHf7+YNvPzDN4JuLfBI6UVtPxAG+UoXbABP3viX1ebb038qkns6OH4xyJU4zdD7VxtUJLuinCpZqrd6ZCFyoY=
X-Received: by 2002:a05:6902:4c5:b0:dcf:f525:2b81 with SMTP id
 v5-20020a05690204c500b00dcff5252b81mr2609255ybs.46.1711497866103; Tue, 26 Mar
 2024 17:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
 <8c866d80-f98d-29de-59f5-3055184fa115@quicinc.com>
In-Reply-To: <8c866d80-f98d-29de-59f5-3055184fa115@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 02:04:15 +0200
Message-ID: <CAA8EJppGmUPympav=NR1oYTPGs=b-DKs3a_h3oWs8tToLQOK=w@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
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

On Wed, 27 Mar 2024 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
> > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > need to push register changes to Mesa with the following manual
> > synchronization step. Existing headers will be removed in the following
> > commits (split away to ease reviews).
> >
>
> This change does two things:
>
> 1) move adreno folder compilation under "adreno-y", move display related
> files compilation undere "msm-display-y", move common files under "msm-y"
>
> 2) changes to generate the header using gen_header.py
>
> Why not split it into two changes?

Basically because there is no difference between object files before
we start moving headers.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/.gitignore |  1 +
> >   drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
> >   drivers/gpu/drm/msm/msm_drv.c  |  3 +-
> >   drivers/gpu/drm/msm/msm_gpu.c  |  2 +-
> >   4 files changed, 80 insertions(+), 23 deletions(-)
> >
>
> <snip>
>
> Are below two changes related to this patch?

Ack, I'll move it to a separate patch.

>
> > +targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 97790faffd23..9c33f4e3f822 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -17,8 +17,9 @@
> >
> >   #include "msm_drv.h"
> >   #include "msm_debugfs.h"
> > +#include "msm_gem.h"
> > +#include "msm_gpu.h"
> >   #include "msm_kms.h"
> > -#include "adreno/adreno_gpu.h"
> >
> >   /*
> >    * MSM driver version:
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index 655002b21b0d..cd185b9636d2 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -11,7 +11,7 @@
> >   #include "msm_mmu.h"
> >   #include "msm_fence.h"
> >   #include "msm_gpu_trace.h"
> > -#include "adreno/adreno_gpu.h"
> > +//#include "adreno/adreno_gpu.h"
>
> you can just drop this line

Ack

>
> >
> >   #include <generated/utsrelease.h>
> >   #include <linux/string_helpers.h>
> >



-- 
With best wishes
Dmitry

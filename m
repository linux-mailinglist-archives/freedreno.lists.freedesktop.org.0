Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCC688D0C0
	for <lists+freedreno@lfdr.de>; Tue, 26 Mar 2024 23:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F5A10F3FB;
	Tue, 26 Mar 2024 22:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gb2kdBWp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40C610F3FB
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 22:25:31 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dcbf82cdf05so5510162276.2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 15:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711491930; x=1712096730; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3dOnXvDtR1ZmPGDB+HPKB5I6v7/354f5+TzY/Xk/FFQ=;
 b=Gb2kdBWpYPDgOzAdgVG/YCrlUnPxDetbAZe+TiSC4aRjX/Up7SqP5U5yOESrEY9OSY
 J7wDKvFBP/LEZgYAU3M33n2dK4QV9KRQAI7VODiuXq1NOX5Ejgt8sEAZkAQ7ZjhixfSF
 kqh9BPUWgQwAgrT6OusCdYivqQnBRyDRpecsFMMcuVY5Pzz/cKGcGYXfG33VoQuCjl2w
 /vnJBPpphaceNfFUiU20YId5MQN4Y7pWRU7dE2938awCoknvOWVRON8eve0onsS2LoJU
 d9gjIwE8rTnfNQTWA06vzItgdmkGY1X+3fHvqpF5T1/9yBitmAas/a0BktKjgjT6J2Dg
 ZiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711491930; x=1712096730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3dOnXvDtR1ZmPGDB+HPKB5I6v7/354f5+TzY/Xk/FFQ=;
 b=MpfTcBF12Dsr+xWSGCiT+bhzHoAWPR/t69lutfmQtIE2uLncTiqaEL7HRL4PA1xy8D
 bBJ+8CIQgpYPOGOjZQajH/P7odsRH2gHMfeLbhXUQzx6n99GRAgXEh73HFljnm344Ng8
 dGCFKniyjudutSExX501ZvLWVafyV7j7cMAn9A6OK0FVtNgkBvIMibEvfMS6HRnD51xT
 pdeJwL3JtntOWndNlJpg3pSt6Zh2hzBn8lBpgAqT1PiRV0VUkRqm9GFYC6GciO3SxBHw
 PaqlqmsyedaotyLWwXizIsVWCNi9s38OctU6ZMHwpmZ43Towb7rf5HCH3wvYcrw3IYKN
 680w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXud7zqbu2iOuqcSY5rJ39fe0VR/9tXpBF6W8xBxShVtxoGJOybWPE5FBj/9AcVHsf4bomsiKjcmLcvrQ6/kk0Nx1XPqdzNc4heQpweac6h
X-Gm-Message-State: AOJu0Yy2N1kgAb1jicBqDKaeDBbcGSbk+cz3155LgktaXQFqZLJYaOzm
 J92sMMKknGXsCedmN3D9U8SpZAvZlXYUwU3nYZboxXzKTeXScBR+KMy7D48kwkAr/3dtWHG1HSu
 NRGUQdFBrF+mA3XptShZYdvUUcSNei12Sbvh9UQ==
X-Google-Smtp-Source: AGHT+IHwP/VQYXSJY8boUvlnYpU9XYRDMYCIvQHPAfNdssF4udkpcZrs+Wcd7aiGb0FDo2fOx1SpFfj5CMA+/MWpqcU=
X-Received: by 2002:a25:df54:0:b0:dcd:4878:1f9 with SMTP id
 w81-20020a25df54000000b00dcd487801f9mr1108120ybg.8.1711491930685; Tue, 26 Mar
 2024 15:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-9-cca5e8457b9e@linaro.org>
 <510de518-da75-f0c4-479d-c5f95c7c72b6@quicinc.com>
In-Reply-To: <510de518-da75-f0c4-479d-c5f95c7c72b6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 00:25:19 +0200
Message-ID: <CAA8EJpry2dHyBF4wyXeFAyLu+9_tYg3xyP6eAM7RzJzOiOqypA@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] drm/msm: import gen_header.py script from Mesa
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

On Wed, 27 Mar 2024 at 00:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
> > Import the gen_headers.py script from Mesa, commit FIXME. This script
> > will be used to generate MSM register files on the fly during
> > compilation.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/registers/gen_header.py | 957 ++++++++++++++++++++++++++++
> >   1 file changed, 957 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> > new file mode 100644
> > index 000000000000..ae39b7e6cde8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> > @@ -0,0 +1,957 @@
> > +#!/usr/bin/python3
> > +
>
> We need a licence and copyright here.

Yes, this is going to be fixed in the next revision. Mesa already got
the proper SPDX header here.

>
> Also is something like a "based on" applicable here?
>
> <snip>
>
> > +import xml.parsers.expat
> > +import sys
> > +import os
> > +import collections
> > +import argparse
> > +import time
> > +import datetime
> > +
> > +class Error(Exception):
> > +This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> > +http://gitlab.freedesktop.org/mesa/mesa/
> > +git clone https://gitlab.freedesktop.org/mesa/mesa.git
> > +
> > +The rules-ng-ng source files this header was generated from are:
>
> Is this still applicable ?
>
> Now gen_header.py is moved to kernel.
>

Copied, not moved. So Mesa remains the primary source for Adreno
headers and gen_header.py


-- 
With best wishes
Dmitry

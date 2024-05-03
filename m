Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3C98BB4B1
	for <lists+freedreno@lfdr.de>; Fri,  3 May 2024 22:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4900A113235;
	Fri,  3 May 2024 20:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UrpKY3p3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A083811322F
 for <freedreno@lists.freedesktop.org>; Fri,  3 May 2024 20:20:17 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-de604ca3cfcso87075276.3
 for <freedreno@lists.freedesktop.org>; Fri, 03 May 2024 13:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714767616; x=1715372416; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i/q/SogMvCoOqZoAt+GfE+x38sUg5iDJ97SmB2A6bj8=;
 b=UrpKY3p3tmQlKCcEn56z8WS1e9lP5GwbVZhgjeJKMGJxWLe0EnMkCSRSP3sP87ohX8
 0ax6Zy41Eyhy/eMRWWNAT9GxZzwlTX+9CXulmeUwo/VBOIXcrN/pOQph9HabBFOKaMgI
 dSaKHVrawiaSzg99Cg+R4A/AOBLfw6tNWuX/2z07M1RN58hM1bUW7jIcpi6ozWR6LyiP
 9N7qzZ35GWzcPH0z2HmA7n4eIg3VjRE8KfsWk1tZWisnlCe/rLXbFE2HYjw44ObQfV44
 3zTPQo1sdMMVniOgEz27ajLonbYEcMLoS0pg+29FRdZYY1n9mXUai+qULTSMcbNPZd5H
 X58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714767616; x=1715372416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i/q/SogMvCoOqZoAt+GfE+x38sUg5iDJ97SmB2A6bj8=;
 b=qer/G7jY/xd+W2SsqK7m2t+lE8vDjOLibpzkME5Q9JNZkux057im2m0uBvuBOO9Ffv
 L6m0lvGHrqUNMtcWWzQbHTEknGhHkM/yBGNmf2BxT71UhJigCPiU+Hh1fsjR3vXrNpUN
 +XrSWY4C5lra95NsyDRcz3AQjuEvNUYLWnXGXJ7ezpm/EdI0HD3aL9Irxyk2r9qwCZD6
 kzDAYvVoUEXR2/UV9aWQ1h9Ar+SLsLdoLpYc5evgaihdQnsUlrytfTyHnuWVQmB6v/BV
 TSlST9qOmUyHS2r55OR6Zc+fvQ3c7znOJ69dxuiFeNMVsP/hAff2GwOpWz63R2aXZkDI
 3IfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+cuW1dgnw0HtHamruBG+CPr7h2H8pgukBFJtjt7Wr2jtXa13lvZ2xTebNzWpxhCaUudR7QYQB1DNaaYRjPdIZfjAYmh/zSzAAPEl2NFKu
X-Gm-Message-State: AOJu0Yy4C4B0OWOBCxSMG6QOKsZ3mheVA4CcBlfAfp8lgfYVxbEqmaT/
 NulZ4lzGKAiatyO34syerKfupu02cASOj7BwoANzAMVLmdQukQMuEGHAY6Umif1gKQkz0R6dW6g
 HqM5TtfrUFpLsM+bTYHkhSmzzkgdQKIxWZKjCkA==
X-Google-Smtp-Source: AGHT+IF12FMQpgSacsvMJfXaH57exZcVdrXcTVSS3Xjq/IP0kmCZmWj8nzgcfH/Kp8QpD6oWbL2jBz3ac6XWQ05VSLQ=
X-Received: by 2002:a5b:acd:0:b0:de6:1c59:bdaa with SMTP id
 a13-20020a5b0acd000000b00de61c59bdaamr4064323ybr.40.1714767616600; Fri, 03
 May 2024 13:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org>
 <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
In-Reply-To: <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 3 May 2024 23:20:05 +0300
Message-ID: <CAA8EJpp4x+NEpMAGtgOmu-0NY8ycTu0iQX6-1Vv76mkKPea_Cw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/ci: validate drm/msm XML register files
 against schema
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Fri, 3 May 2024 at 22:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/3/2024 11:15 AM, Dmitry Baryshkov wrote:
> > In order to validate drm/msm register definition files against schema,
> > reuse the nodebugfs build step. The validation entry is guarded by
> > the EXPERT Kconfig option and we don't want to enable that option for
> > all the builds.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/ci/build.sh  | 3 +++
> >   drivers/gpu/drm/ci/build.yml | 1 +
> >   2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> > index 106f2d40d222..28a495c0c39c 100644
> > --- a/drivers/gpu/drm/ci/build.sh
> > +++ b/drivers/gpu/drm/ci/build.sh
> > @@ -12,6 +12,9 @@ rm -rf .git/rebase-apply
> >   apt-get update
> >   apt-get install -y libssl-dev
> >
> > +# for msm header validation
> > +apt-get install -y python3-lxml
> > +
> >   if [[ "$KERNEL_ARCH" = "arm64" ]]; then
> >       GCC_ARCH="aarch64-linux-gnu"
> >       DEBIAN_ARCH="arm64"
> > diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
> > index 17ab38304885..9c198239033d 100644
> > --- a/drivers/gpu/drm/ci/build.yml
> > +++ b/drivers/gpu/drm/ci/build.yml
> > @@ -106,6 +106,7 @@ build-nodebugfs:arm64:
> >     extends: .build:arm64
> >     variables:
> >       DISABLE_KCONFIGS: "DEBUG_FS"
> > +    ENABLE_KCONFIGS: "EXPERT DRM_MSM_VALIDATE_XML"
> >
>
> Wouldnt this end up enabling DRM_MSM_VALIDATE_XML for any arm64 device.
>
> Cant we make this build rule msm specific?

No need to. We just need to validate the files at least once during
the whole pipeline build.

-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D4F88D055
	for <lists+freedreno@lfdr.de>; Tue, 26 Mar 2024 22:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B641710E419;
	Tue, 26 Mar 2024 21:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HzSljhZL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9633710F3A8
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 21:52:57 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dcbf82cdf05so5488338276.2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 14:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711489976; x=1712094776; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SLKQTjO7evp8ff/Z4Z6Ri3JN3vYy5yYHtQbf9bGHDrA=;
 b=HzSljhZLUuQ1b1leRTiM66w71/EsifsjuUUFHHJhgW5diJ0ZITCAoxWd0x9HkAGS3W
 UvMo3YltRFy8SIqylVEHrv2J1zDnb0jknqymUqmreo+ZwWRfrVW4m6pJJclOu9bczUoO
 nIG0h/rZf9XyKbh0gMctrwXaMmOuOfXBr/TFR6TyZGwr/pA08z1fLDLFUbx5GJRXuFBv
 r5pbPKRIESRxccBup+fk0kBPB/Uj3GUl2WEzgr5n7BQNFOqqn0bH+fdlRlu8hfN601pV
 VRjEFJZlL/sJPD5IunT9tP5t3QsqCbsRpvILV9jZGL58ivMnc9N9oFl9yopS9Fanj/OO
 IutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711489976; x=1712094776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLKQTjO7evp8ff/Z4Z6Ri3JN3vYy5yYHtQbf9bGHDrA=;
 b=NlT0fyQMgEICbA0qWC3dfviuGoQ7tc3WAXzcdZm/owP1MqIIBCdqkH5pg3wnn2Rs/e
 RhRtA7Euif4dZg/CQqVxPo9MjE27bmL7lmh36GS5ETm1C8fmIfsvXRXVaQYx99OMXmOl
 XhR6HDrvB9cBCHPmRAiVVVPzdOF7EnXxvx+40EMC14IrguarFH7grSyhhYn4vCcJot/g
 uj72Y99Lw68WNwx/XKFdjVIgFwD1K5rVuwTXPHDa62vqT2GdCun+ZY9r4KEvFHzapFxo
 Oy35+abamp0G/5xHlyNk4N4okd3QzEb+2ozxC8VTwvmExVxkLaqbrGU35jLnTrSLiJsw
 ODpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa4nD05bHX4M+N1gTuZgNjrJ055m1xfa6tqqkHcUJSAxRpedQLBaHmdNJcNWJ61YiYt199vZgWc49o9f1ENl6WTTXWZ9PR3ixImqGdT0Lt
X-Gm-Message-State: AOJu0YznYwo6tZJU7thva+eQXTGdziTduILShtEGqch7lrJ9xKw2VakK
 vkMzSnkv5eMKJehB74Km5Wai/onZbdDm7dZxLBjOKPhoGDUTp2DLFZYK47EPibGl1Nu6IBjLpGG
 /9Ea/1K55YqhYnE/DTQ2dgk16LngVwUEHNFl0pg==
X-Google-Smtp-Source: AGHT+IHwmwht+jbFfFX/AO7g6m6kcu9g5ldVuD/vPH3YDlyYIZOkuMHWGLBTx0aLMf5TKE4lY0jQzKUPbM8GlApUefw=
X-Received: by 2002:a25:10c1:0:b0:dcd:3d6:68ad with SMTP id
 184-20020a2510c1000000b00dcd03d668admr981590ybq.0.1711489976441; Tue, 26 Mar
 2024 14:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-1-cca5e8457b9e@linaro.org>
 <d2670f94-213c-bc82-7ae6-a3668f9721df@quicinc.com>
In-Reply-To: <d2670f94-213c-bc82-7ae6-a3668f9721df@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 23:52:45 +0200
Message-ID: <CAA8EJprmeSqgMNVDw9Z=n4xBhmCtBzTJuSQKzLSg9NyPegYyFw@mail.gmail.com>
Subject: Re: [PATCH v4 01/16] drm/msm/mdp5: add writeback block bases
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

On Tue, 26 Mar 2024 at 23:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/22/2024 3:56 PM, Dmitry Baryshkov wrote:
> > In order to stop patching the mdp5 headers, import definitions for the
> > writeback blocks. This part is extracted from the old Rob's patch.
> >
> > Co-developed-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
>
> This is unused today right?
>
> Is it just being migrated now in advance as all the mesa mdp5 headers
> are moving to kernel?
>

Exactly. I had three options: pick up this patch, implement applying
'fixup' patches or drop corresponding doffests from the mdp5.xml. I've
chosen the first option.


--
With best wishes
Dmitry

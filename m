Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFBD8BB4BC
	for <lists+freedreno@lfdr.de>; Fri,  3 May 2024 22:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D20112986;
	Fri,  3 May 2024 20:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K+drEIqJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53ED9112988
 for <freedreno@lists.freedesktop.org>; Fri,  3 May 2024 20:23:29 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso95796276.2
 for <freedreno@lists.freedesktop.org>; Fri, 03 May 2024 13:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714767808; x=1715372608; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QRmAFj/9U+Uajdd6x3M/dD18I6JWR5bc4eiv7eGP42o=;
 b=K+drEIqJLkcX8XUjDsx1cF8FW/9tWxIFSnK4sLGsHbsEtsGDdWPMmVZ3j4wHv8xUUb
 68lmSgpjdEWFJN0h8P3ZuxlCAZ1TZq+ur4zwEYVNCSiolM2/xiSd+F3IY9QtVkdPcJcP
 0weVULaWnUDXmmz5UiR6LXJI5BSDznSDLeowDfCu7wntweCVv2+K3yZv2NIItZxwJUOb
 N189eBVTSg+j5d4k9dV/zgxYdDl5/P/IK2fQbJ3Jdk2xdq/ru3VIU1HADATjMtHXHuzw
 KollZRXbVgdzP3EknpYcpferOG1hke6gwbY8+qpRIs0Ghvc6KkZRF6z2DvC1YbF9IOov
 I9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714767808; x=1715372608;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QRmAFj/9U+Uajdd6x3M/dD18I6JWR5bc4eiv7eGP42o=;
 b=kNDpX4hMRrKGfmgPS4uc2VsCX/Fftvb/hAhcz9zb9kEGBjN3jFXFXPhX36ZKxVJl8x
 HfDkgwe2sisS3Rlno0tfyf/mfTMsTfDRHPc/T7tmIEDvg8xkCTBHwV9kib6R/qi0ciyq
 gIxmGnhHGUCGezhgz5sQNOJ79Fzq1oUpRJWLsCjvBXllu0SlNdALXeJTbQSeHfr9uQzS
 vC+RQh6a86/vgYA3M5GuYEIpmEQjuCqWGPDnBZXZ2oFp85D5PWjJ212CIrwAceQH/y6K
 4/p5YXF+1gXLzu+dam6pnUStcxm0uw/8OJ5I+cB92iWbE9f7/ET+CDFFUwBk6LdOvko4
 hF0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCiXAqXIII3n1Z7p6VugXH6dkTxTE1TjzaTLlemSy+5INm2iMauMjlDJwVvaq67sVB/Y0aDbsKkVBJL0KM3qIdNVhymZG06/1KtpjMk/Ww
X-Gm-Message-State: AOJu0YxmwZxgYjIZJmrCDGkuWAtGWYyBfdy46HwfXpOkeFwkhzu8k277
 jxd7eUZoDCQNgmlA4ItyHz2DXcxUQY3w/LmqsMiQV1PjBEsRVsU34WVpazquGrZAaAj/8VXXMH9
 0wk0ZaOb3B5Y5OBuAhFZGc7j74BbSnlaL552vpA==
X-Google-Smtp-Source: AGHT+IGvQha35/imk3620zAp+cduQL37Ue4t9pcxEoFaRdg9M7Ew2+UWFyuG6+rsdeo7pK2XRYbn1ArX9BPa00SR03Y=
X-Received: by 2002:a25:698d:0:b0:de5:4c3a:5ab6 with SMTP id
 e135-20020a25698d000000b00de54c3a5ab6mr4052983ybc.3.1714767808227; Fri, 03
 May 2024 13:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
In-Reply-To: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 3 May 2024 23:23:17 +0300
Message-ID: <CAA8EJppDNYR1D4NacrurY2e_xf5ycrtFBAAWaB2QVRBgSMESnQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/msm/gen_header: allow skipping the validation
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
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

On Fri, 3 May 2024 at 21:15, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> In order to remove pointless messages regarding missing lxml, skip
> validation of MSM register files against the schema. Only the driver
> developers really care and/or can fix the files.
>
> Keep the validation enabled during one of DRM CI stages, so that we
> still catch errors, introduced by mistake.

Helen, could you please ack merging the second patch through drm/msm tree?

> ---
> Dmitry Baryshkov (2):
>       drm/msm/gen_header: allow skipping the validation
>       drm/ci: validate drm/msm XML register files against schema

-- 
With best wishes
Dmitry

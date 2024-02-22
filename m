Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8846C85EF29
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 03:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBAA10E852;
	Thu, 22 Feb 2024 02:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eVTgwVg0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C553110E852
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 02:36:44 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-607eefeea90so4069377b3.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Feb 2024 18:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708569403; x=1709174203; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ex/qgQGXt7I+7DTRMMrl9hcZbKjDkDxeMDhblP7uzZo=;
 b=eVTgwVg0VW8xmQT32dTkbaRxn16aDf3dewPH8PTSdTQaZG5VT3E/uaJg3muSbyr1+d
 80pP8DfzoCL8Py7MNZjS1FlBkDCIPZ4Bj4JuZoUlKLN2kpuWUl305Zve4sDGEe8/ocDq
 Ao8jDIkcxAeWo1pKVQFiRGW8a9C9ro4xO7nJSsOSJOiHwWDiqslcyDWxTb8J5zvXEhu/
 vmSUvArcaQJWtRzUUQjP1XiJrXH1Fivd1O8DIA4Y4uwlsFCVZtYjKP1THaSCDcRrieBl
 tvER9sIrP4qm6n6QKyWuWg4U9r1WNo8Fzl3u5FWWXbVj4RZ/KEOnmZj93ZUx4pMu8EWJ
 vESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708569403; x=1709174203;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ex/qgQGXt7I+7DTRMMrl9hcZbKjDkDxeMDhblP7uzZo=;
 b=Yzd7J/kjfMAGvk/it2MJMPLisMhcYlYDmI1tECIDLJfrC5yd+EY626fdAzSoGiJoJ1
 klpk4ToPX7X46HdU0S+jy8ZJXDpA/ajMwxigiSzXf6Pb7wwuph999ENJBIufgwlL7jyG
 pqm94SLGtc4f9gZzlOEQ4106zZu5rjWnxA5jMd3O5YaSG3ZRzFALm2ivSXRJtaljr+jK
 5zazON8rc9DK1GQzqiHyKZKjRkKKv6vxS1gDrdiAXXlbtPLTOy62d5yf/hGFQGBlhBkX
 MIQD14Iw6hOZuAxXS1s3V6swCcYlWBlvXJAPr6/y0iZBz0UFj/vPpijEtL5+rPBGBQl5
 JK/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhN77yRhk9QlNBCfRLPkbCaa4DFq6l/RWKBwOT2PjtGKh1TMyXqh0dMdMJ5J5r6dBGIAkUalGNENCwFT85LjEvI8Kz4m7dFMSIt+Hdi89d
X-Gm-Message-State: AOJu0Yz/nEyMGb6Ej1LJOWA1gQ8i5qE4Q7b71GRBS3xaZKV2Hq1olIpK
 xjNRaJcTnfW2o+lNw2RDVeK2J+jutkaTOREeelWEm7PMh0UY5zDqj7c9gHBKpTJ+abto3Uc8Oia
 szgs8GO72ukvxxEWtdzTXtjZEDceB9BYEF6M9SQ==
X-Google-Smtp-Source: AGHT+IF6DtJIMjCodEyUY/qWcBvG/l4B5U7/74mJYMS7Q6XDQkr9ZX6fbumrpxwW4rEDcCk4U6VVw8CKa+BUHQDEgd4=
X-Received: by 2002:a81:844c:0:b0:608:93a7:3d8d with SMTP id
 u73-20020a81844c000000b0060893a73d8dmr611679ywf.25.1708569403647; Wed, 21 Feb
 2024 18:36:43 -0800 (PST)
MIME-Version: 1.0
References: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org>
 <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
In-Reply-To: <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 04:36:32 +0200
Message-ID: <CAA8EJpq-17XSwmoT1HKVgxi=fUKD-fETtwbtpznR+RY+iFCE6w@mail.gmail.com>
Subject: Re: [PATCH] drm: ci: uprev IGT
To: Helen Koike <helen.koike@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
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

On Tue, 20 Feb 2024 at 16:31, Helen Koike <helen.koike@collabora.com> wrote:
>
>
>
> On 20/02/2024 09:17, Dmitry Baryshkov wrote:
> > Bump IGT revision to pick up Rob Clark's fixes for the msm driver:
> >
> > - msm_submit@invalid-duplicate-bo-submit,Fail
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Do you have a gitlab pipeline link I can check?

Before uprev: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1109455

After uprev: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1109501

-- 
With best wishes
Dmitry

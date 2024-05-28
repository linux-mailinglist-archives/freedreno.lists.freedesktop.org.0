Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267048D1116
	for <lists+freedreno@lfdr.de>; Tue, 28 May 2024 02:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E8710E332;
	Tue, 28 May 2024 00:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yRPgEYhW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE7F10E332
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2024 00:45:55 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5295f012748so380258e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 May 2024 17:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716857153; x=1717461953; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XOWy7EeQHptnyQiZmhO+uVmW6cGOWfsT+AnLGJBX70I=;
 b=yRPgEYhWqHAejXzjNBqQ91h/4/ntl9GSq8B7LZ8+OydSfoSqiuB9pze4q+cpnwLSFB
 3APnKEC/f9Psonbhazqk4w2XBBbW4uHMEeVx7VXV7f4pKab/hrMNqQDRV4ApJEETEyCs
 w8kPaVzJPMW0C6iAEb6wISyhLSGPZk+NjzKvuAlJEY7ljA2oybESGmFZivXMpUDC9K1R
 8R3mTNk883cJTCf0L7wXD0voBwTjGtAweXFLOgfPYI8KWgvev4I9gkQtp+h3M+dfmBzl
 4ZB1+JVqEikmbxhDzD2x8qhSEcGkT3D86t6EYk+TDqb4bKH1bjCfMVEvV8QEYaU6AY2G
 llGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716857153; x=1717461953;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XOWy7EeQHptnyQiZmhO+uVmW6cGOWfsT+AnLGJBX70I=;
 b=lJx47xkwAEdbTh7Yr6PRsOAdmPbJe3MLlY8xvltlh0c116uhUOSfil8ovktRS/YANU
 wR1SnUoEwiYIQMXkd+FMYu6n1Xbwz7WbsE5trSG+g6VIWSKFAeNtKtGmUJLMPdfa8JyC
 eZGTKYl//nW5M05Iwf1/aPVYklW43f1nVuZeVxvdJCYWhibtPl0hOD095Q4x7YQxUX6H
 JQXtvQemf+Vsag5t3LdP4X2ovfUCpxPplbsQeP52AKm3DZrhkg+ewgORu/q2/d9rxxpY
 Be0sKxeyHj3305SQEOcBLpz+GhTwrTc7lhpo+nA0o/tDLW49Wm7qaNeZCzllZ9FAJckV
 O8+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJq/V+lEnfNuDB3zN7yy+lr8584e+/m71jkXV/A88f2elheabNpiAMIYsBC/a0tBF5xRvJulp/1XxaTUQwJA+gmIXvo8SoEzQjH7mc9MvU
X-Gm-Message-State: AOJu0YzsAybUrdEhcLhP6kPGsqqMwR/U5Ed4kax+SOEoZ6QZ7pDjB2b2
 aew9ukkJ3hxhk3JhTRWI+5jJyyHmAr1GKlBlvOWheFVse2vRjUOzFos70o0pn2s=
X-Google-Smtp-Source: AGHT+IEeVOq5H+mPCLvlXwPGTkXAziCy2DXE3RRA3lEao7/kITRzHNGqTbqSesNqPvwwhBkkwxU/JA==
X-Received: by 2002:a05:6512:2387:b0:51e:41a1:4d5 with SMTP id
 2adb3069b0e04-529646e363bmr8255722e87.9.1716857153315; 
 Mon, 27 May 2024 17:45:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066bb04sm812775e87.142.2024.05.27.17.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 17:45:52 -0700 (PDT)
Date: Tue, 28 May 2024 03:45:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v5 1/6] drm/msm/dpu: fix video mode DSC for DSI
Message-ID: <w5qtzevizjq3626uzhdnspefnojcludcdrbcbxnre2fxjfdei7@s7yqvofew3tu>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-1-f797ffba4682@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-1-f797ffba4682@linaro.org>
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

On Mon, May 27, 2024 at 10:21:47PM +0800, Jun Nie wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Add width change in DPU timing for DSC compression case to work with
> DSI video mode.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 18 ++++++++++++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

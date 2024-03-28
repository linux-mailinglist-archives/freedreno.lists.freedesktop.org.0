Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C49890273
	for <lists+freedreno@lfdr.de>; Thu, 28 Mar 2024 15:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF71112477;
	Thu, 28 Mar 2024 14:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LjLjEtTY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC52110EB49
 for <freedreno@lists.freedesktop.org>; Thu, 28 Mar 2024 14:58:58 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dccb1421bdeso1034969276.1
 for <freedreno@lists.freedesktop.org>; Thu, 28 Mar 2024 07:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711637938; x=1712242738; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lVCKoZbBGmgPMba+uygt1ZNYOjbI400KcrPMv9qgScQ=;
 b=LjLjEtTYP0BsP59ypla4wD4AzG981pWeBfA4YqHhSebiKYODC/W0u3NZE8sINGzBx9
 dGOVGjP6taXFJXucf+XXrv9Xom4XeRciUdw3Yjx4IPTy2d+N1QRQSogAaEYyK3dyeFEz
 aitmTO+Wfi6+txo0/eV1FSUjMMtw/7cXV3/4oh3yxIB98sIn8zm/3irbDx2LvO8YQfyN
 b5zrFGs98J5ozCtrCfh4vbchlth/Kqq0eMunlyaRaNUIH5Di0vXzEBKduTB6+4rOgkAm
 Ic5Hu+vn1bxSE1gQf+OKJWK1XxmgRBaVCaJVxLYWYizFiUnS+dG7GwsqGtwgtBh9OpFr
 0QCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711637938; x=1712242738;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lVCKoZbBGmgPMba+uygt1ZNYOjbI400KcrPMv9qgScQ=;
 b=IydyAD3j6+RL832Z03DRSQ+/ZjwHwQqPD0RgDDOUwsiM0AD4NHuT0IsvzBW0PQShxJ
 LLAUaVGAe5Iv4fzk9NIah/c0u3B4Jx7O7Paw1pdX4B7teeNcNXOZrS1ft6QNlqz96FD3
 etYGRPlz1zy4biG/b1bN8wg30Oxmbg2AvqZFPCp5f0LsOnbukbFXekT5vh4/2tunO/ub
 s/wz+nxT+4uDt2u7/4003/DYSbK+GUo0KaeaLPIB7Ov7YRI6fSuNsXcCRvHJUKbJKpKp
 lrtoV8DwV1EAr0oFGw2nJ3TXo/z2FG004nOtDnIui2tAgr+g5q1YMv/q6N8zrrdIVRz8
 N2cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFJv1GR3Jro6h+kFYCOXtX7HDZcApJPtkrG0GdoUYAPMgmLtZK8YQQfA+++HBvWaHknS1tpyyxWIzl4IuaLKaMkHK56lZ8eIPzafS4ulYV
X-Gm-Message-State: AOJu0Yzlc0evLixmiOiD/zyPhZRMRu9MpTqSo7EPL8aYi8mTaLLtwpQG
 qeDvAKWy3Tx9qmT7jRPcE72F8QghM+AwOtZmK8yVvQoVeBiRHz6Gz8AbV1jEg+ysAmaX/gy3fTW
 pBJFLR8/5BPkyz2UyqtIgE5fPfd2swbAUdIx8fA==
X-Google-Smtp-Source: AGHT+IF+BfSq3vmTR71It1RsEmYi9x9S3nf8WUR4Z19wo3uyG6m3RAGGX4yROeCZyzIC+VlGw62uQlxPCj6DGfxVw0Y=
X-Received: by 2002:a25:ddc6:0:b0:dcb:38d3:3c6a with SMTP id
 u189-20020a25ddc6000000b00dcb38d33c6amr3189252ybg.46.1711637937782; Thu, 28
 Mar 2024 07:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240328-msm-dp-cleanup-v2-0-a5aed9798d32@quicinc.com>
 <20240328-msm-dp-cleanup-v2-1-a5aed9798d32@quicinc.com>
In-Reply-To: <20240328-msm-dp-cleanup-v2-1-a5aed9798d32@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 16:58:47 +0200
Message-ID: <CAA8EJpqr=SE_-9JMNd+QksTkVsPJGk-F2tJcAyH95t4RAW5aoA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/msm/dp: Drop unused dp_debug struct
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
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

On Thu, 28 Mar 2024 at 16:35, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The members of struct dp_debug are no longer used, so the only purpose
> of this struct is as a type of the return value of dp_debug_get(), to
> signal success/error.
>
> Drop the struct in favor of signalling the result of initialization
> using an int, then merge dp_debug_get() with dp_debug_init() to avoid
> the unnecessar boilerplate code.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c   | 59 +++++++++++--------------------------
>  drivers/gpu/drm/msm/dp/dp_debug.h   | 38 +++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 ++-----
>  3 files changed, 31 insertions(+), 76 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

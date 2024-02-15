Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40F3855CFA
	for <lists+freedreno@lfdr.de>; Thu, 15 Feb 2024 09:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE86610E15D;
	Thu, 15 Feb 2024 08:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d+klJNSY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB1110E26F
 for <freedreno@lists.freedesktop.org>; Thu, 15 Feb 2024 08:56:12 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso584913276.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Feb 2024 00:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707987371; x=1708592171; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Fs4SETNb1lvqVZ8gWpZC/Rt9HqyJWvbYB6LQacF0iGM=;
 b=d+klJNSYRPE/HjO4xpUq5vu4gyqjN9ZqWKz9uPUGU8Cpiabc92FuyCf9b5u+n1JV19
 W5gXAzojg2xBllnKYNieqSXV7zdkbjGOyM3pTRwIL4QJUVCtO9WbnTTtA8sjGFWkexpw
 Hv3jI1Qa9y6di2B57iMgpFSsATcuPNbEOQ1Vid0uDaJcngN1JA6zk4i+ceZj12YybiL2
 KNKtPNzm5TrTEU4ktOyavU2yhcgg5P2jUwiA2L1AoVIDtCtILM7gL2o5CQIqpVJ99bCK
 blNB+NbFvHy6b6D4N2n1IQIvEDlZNeeYFVcGNqsJ68r+R/4kveEmxQtroV71DIZ00TRx
 jPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707987371; x=1708592171;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fs4SETNb1lvqVZ8gWpZC/Rt9HqyJWvbYB6LQacF0iGM=;
 b=UgOi6umIJZnk658xEcjvSIfTC3p2q3Dc4WWv7toYJm5pcsxhamY8jVP1JAaQn/JKAb
 kYZ2CuAVohYYRb22+kXJdkHPNTrlrRBVZE6URYu2uIWVps94yPnCqfBHSJTkKjAg69kG
 XL/xyEGlqfLpvqHBViZZX5jLeCEFhuJ5U/+322Lx4Rg3+R70Rx/bjr+39JEBJy0aXfGp
 GCKpjIpO7dya6GsAAaLPrnrm1x54oPyj0AEFVLHwlOfU0Janc7nVPom8EBuwb/12HsMc
 y99WVj0FMemjUlXsPWawTJduzQgC0Q52zG5qB8x4oKJCbsTIna3zCF4okfo5ofGiYJ5M
 skbQ==
X-Gm-Message-State: AOJu0YxcX8DaHmHKS2JTgWMM1yGE6h63nrfq8XYNLJ8Rlj0RIDBj00gH
 HBnsLR5Y358HW9Q9IfCcTeQtreCeLtGPoVoRd+ktUQsY5w14IV/40aa8PfotK/hdbp+9nCDghDL
 XjBDDmojeS2kHzO6s8oN659x31y23tFU9y3PQtQ==
X-Google-Smtp-Source: AGHT+IHHRlxCdvGNha4XCXxq2zUtJjoqVlUr8oWoPF6SvyMgi8dq/k3AKGlE3v79seUFy5PqY7Z4u85rCS9NwbgpEd4=
X-Received: by 2002:a25:b124:0:b0:dbc:decf:e511 with SMTP id
 g36-20020a25b124000000b00dbcdecfe511mr927285ybj.6.1707987371322; Thu, 15 Feb
 2024 00:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-3-quic_parellan@quicinc.com>
In-Reply-To: <20240214180347.1399-3-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 10:56:01 +0200
Message-ID: <CAA8EJpoCYvz5Ucd9tKiz1DdAyv=k5y6LTxK=Srbfmc7615bFJQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/19] drm/msm/dpu: add division of drm_display_mode's
 hskew parameter
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Setting up the timing engine when the physical encoder has a split role
> neglects dividing the drm_display_mode's hskew parameter. Let's fix this
> since this must also be done in preparation for implementing YUV420 over
> DP.
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

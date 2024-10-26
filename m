Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D5D9B1934
	for <lists+freedreno@lfdr.de>; Sat, 26 Oct 2024 17:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAA410E0AE;
	Sat, 26 Oct 2024 15:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IEkCmKXd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8528410E2DD
 for <freedreno@lists.freedesktop.org>; Sat, 26 Oct 2024 15:36:54 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo535924e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 26 Oct 2024 08:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729957012; x=1730561812; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KWck6eIL58uZzSAub6tD78hTuIVPy9/y+aNlZR8moG0=;
 b=IEkCmKXdZ+vjTfM/iFPo53cdv88+rH6LfmMSbGKKHoldW37VWuHL6w4crVhHsKrnP+
 eUGV+B+neoT1vdcsn3KJcAQ/zC/aFDW8DaYs59FqcWOw35qfPW5Y3ua6PrbBNYI5EVgh
 5dEjch95XK0+ibX33OfaZfYJclQ9Ey6fjTQmFrNC1e3/KeLGzZTeHjzzkL3EcgsSUOyG
 WPwGddxWQNddf+Nw5BkP4rPCPSBvtLiZYjkvKY/tcbYEzzVUOcfGYSlTtNUDqi1Xgxyc
 SzEG+EBhcqYX+U6r/YG88n9aTF2pXjLkPkely/kVpzNrWxvuS5hcFpdHRYSjFOUHIknL
 /J5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729957012; x=1730561812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KWck6eIL58uZzSAub6tD78hTuIVPy9/y+aNlZR8moG0=;
 b=o8AKcVcwjBhXrSQ5QHlP+elqqlUljvJ+nCUYdnTArQvj/X4NmS+YcMXOzNGJnDZb8Y
 Ch+Xa+1vvQ3xNi79cpkj0adtyGN9VAeWsURIlvOS+u5DHwv/z6CCmdoVVAQg4hR/+Jt7
 WG8jmcNT9hDn5ayt/xe1snk8aK/JwhLsx/VxKrtAd9uI8UYInLBC9ejIsflm4pUJaSKQ
 ku3voLJJkDYJ7tyarI83f0CsdMZHBrIC5ej7A2Vl3BR/iDFULCoYJJFj2zjspWukXF+P
 CVwKcyoophRGmOX1w5hwi11E/6VXLnRq0mkszH8t7AVNF8gf/BVLQy0ECtjDrYO4pKpQ
 pfzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMB8C3SnV1UXwTxq+eUG9nWzmq0jC3qo6+cxVOH7oSMF04+3Y1gQTFgckpzsUYDsI6NoSXV2Pb9Ts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywha7W0qOxNkynuFTC9hp5yfryUSdCqCZYViHH/J39V2bD0p91a
 3rZzhhi7qgsDD3Uz5XYImeJBMfQnhyYxFS2t+jkZfdqnaWBJZppaIynexRA25hU=
X-Google-Smtp-Source: AGHT+IEYw0zyqkyjhXmQoZPWSefeN4g3iItCWqhnrUze/+8BNQVvNaHa9jvcY6diKY38/iJBVJWP0A==
X-Received: by 2002:a05:6512:ba2:b0:539:968a:9196 with SMTP id
 2adb3069b0e04-53b34a2d6e3mr1048350e87.48.1729957012345; 
 Sat, 26 Oct 2024 08:36:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1de0b2sm538020e87.246.2024.10.26.08.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 08:36:51 -0700 (PDT)
Date: Sat, 26 Oct 2024 18:36:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org, 
 quic_abhinavk@quicinc.com, marijn.suijten@somainline.org, airlied@gmail.com, 
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/gpu: Fix missing error check for
 dev_pm_qos_add_request()
Message-ID: <mq5tggw4x6gsiidxzllay55wlqfvtdvdgwsirty5uqjfuzw3ym@j2vuy22ixffi>
References: <20241026093738.523882-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026093738.523882-1-ruanjinjie@huawei.com>
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

On Sat, Oct 26, 2024 at 05:37:38PM +0800, Jinjie Ruan wrote:
> dev_pm_qos_add_request() can fail, and it returns -EINVAL in case of
> wrong parameters, return -ENOMEM if there's not enough memory to allocate
> for data structures, and return -ENODEV if the device has just been
> removed from the system. If it fails in msm_devfreq_init(), there is
> no point in going on, also call dev_pm_qos_remove_request() in the next
> error path is also meaningless
> 
> Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

I'm sorry, a similar patch has already been sent:

https://patchwork.freedesktop.org/series/140162/

-- 
With best wishes
Dmitry

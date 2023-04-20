Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1396E967C
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 16:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C0810E2D6;
	Thu, 20 Apr 2023 14:00:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E72410E2D6
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 14:00:47 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4eed6ddcae1so2733149e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 07:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681999245; x=1684591245;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y1aD8yQeVZIHs8X5n3y1xoP0pKOQ0cX0sJ2U9iOb/YY=;
 b=mweWLE8mGevQKG3eonSrFfNjPVMtr9CqnUhAh3XDI/JMVjCtoCCXMR0EXQuc2d6yC0
 6b/FNEZLChWS9F4pMA2tY1u2/Vei9NkXmmiwEI8xIx9WRrCe3X8WcSYEbl16jnL9KnH3
 Edvsm/34C8W4HnXF5DSI6YVwUEdK+td/cXEahE3wMIuXGWKpOpLe7A04Fcn1QTfL3+R4
 La66Q8ngkyADp03bu9pZxT0hT1eqIEjCXjZhDXh+712cURb5XNh+cjRm8kuXHu1IQLZX
 KJsnic0kQla/JoIq7r+ur5ySBo+p1GSW6TmPX8cK/WJ+QBIi8u3M5NUY2CohHTd5Kr/I
 YZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681999245; x=1684591245;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1aD8yQeVZIHs8X5n3y1xoP0pKOQ0cX0sJ2U9iOb/YY=;
 b=kYRXcpmdD6tFG8f6ZgT9gotfuG7QSFt7ZOkcjrU+TukmlrhdVF3EjkphPTpCInxigs
 kTHu4cnLrgksRF2Ib/G1KYn5ka75fHMp3wofl1dQIs4+IBuOKKDvggHj6UVxkbASZRwK
 VNSiOLcZtghhB4zPtrOyiTqqUsFmeWmvu2Ys2yrc+ABw7P3WdmNRiMW9TYPDkBbENo+f
 XFJj05jMNoZSC3z0vTERtdGxyV5MAq5f3rLSR+KE8LVmsF4hr7vq3SfIATT/2sRozTU0
 PnEGflHS4VCphG1wPwM9LRNMo3XrMq6/58027NNEBl+tJbWVKEAVpzWeJbjWu0Zepghc
 7UKQ==
X-Gm-Message-State: AAQBX9dxy4fzLxUKhYHvwfEir+SiEzWrFJ1IUFJyjxv9hjCQayr8lFrU
 FkK+Ml2voVqLfbi3O7RrTETE8g==
X-Google-Smtp-Source: AKy350ZPmF4ZLO4m/OWGZMLwwoUErjLDsugYjBHHz9Q3fIzRhrn+TYbRCmTKwCu0qVUzhwRAo9J4dw==
X-Received: by 2002:a05:6512:38c6:b0:4ed:d5ce:7dea with SMTP id
 p6-20020a05651238c600b004edd5ce7deamr526856lft.27.1681999245245; 
 Thu, 20 Apr 2023 07:00:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac24428000000b004db44babad7sm224318lfl.260.2023.04.20.07.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 07:00:44 -0700 (PDT)
Message-ID: <551496a1-caf6-cebf-65b3-64b41a31e28d@linaro.org>
Date: Thu, 20 Apr 2023 17:00:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230412224311.23511-1-robdclark@gmail.com>
 <20230412224311.23511-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230412224311.23511-3-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 2/6] drm/msm: Switch to fdinfo helper
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/04/2023 01:42, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 11 +++++------
>   drivers/gpu/drm/msm/msm_gpu.c |  2 --
>   2 files changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


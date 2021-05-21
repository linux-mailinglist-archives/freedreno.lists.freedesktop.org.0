Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24DF38D1B9
	for <lists+freedreno@lfdr.de>; Sat, 22 May 2021 00:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE0D89B18;
	Fri, 21 May 2021 22:58:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF4689686
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 22:58:24 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso19509935ote.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 15:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=WWt/k9Je81/trW2ess0PPge81hA65LJflgpCeG95+Ro=;
 b=SHnMgnsQJTouHaGQqt9wUdT3Zp6Q/2DQMhh/lSL8MYm5uRkqyz9bPZjceu/fZmZUaC
 /bi+E7zLw635BjJ7M9yaoZqTwGwgqP8qmim5ZbMQ9pxM9LwhTtCN2JFbe0kP1e6NP67y
 ojzYKDjY2t7pxLukiK31Sb29vOfYJlay0n+Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=WWt/k9Je81/trW2ess0PPge81hA65LJflgpCeG95+Ro=;
 b=GITp8+ZUJ5NuIXjvJ59p6I7JUPJ9XT3T4VDsv0ePjikQIyjJAjpCBttbkc04X8O56H
 u1s4kAA4+y0R/iBC/zWi/ozg88fyLjKY2sanZreaKcpuB8neuw1zQc5M8AE5YIGCs5z0
 2DKKHdBsbKzm/n7xlt+gJA8In8tu8OiF6nyrmhAcesLPchqy23w0mPVjR6PlIYReCXVS
 03VfDZb5JmW87CSconObEPT+YsxchJAn7j95MG2dyZrN2waBZ+gw8mSAV+JiGCYcM2hM
 t3v+1y9YsnmOyVw55AvtgTdC58v/ASQHMgPioaZ1YLGz/abqTHtah2QOO2T8I7EyMUqz
 RczA==
X-Gm-Message-State: AOAM531rbYSbaQHedBT91GsHJ+x/bR6iLDy3MRB4mQI6jukDfV17NEUz
 tygkCfAxhu0uN7dwDyZP58b8+VIZ8wuGmjQAqsODwg==
X-Google-Smtp-Source: ABdhPJwO86MrFBCtOIipE84r+ZTQINMq6JbXFOgjgA7d8nzGf6JSBROtp+5gY0cJjmLE/r/p5TiM2xjvF8dIa/zGIQI=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr10482377otn.233.1621637903832; 
 Fri, 21 May 2021 15:58:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 15:58:23 -0700
MIME-Version: 1.0
In-Reply-To: <20210520120248.3464013-28-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-28-lee.jones@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 21 May 2021 15:58:23 -0700
Message-ID: <CAE-0n53gjZKSByr+ny_Mp4MJtkwejJW2RLj0jp1D7fZtbeOvJg@mail.gmail.com>
To: lee.jones@linaro.org
Subject: Re: [Freedreno] [PATCH 27/38] drm/msm/dp/dp_catalog: Correctly
 document param 'dp_catalog'
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Lee Jones (2021-05-20 05:02:37)
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Function parameter or member 'dp_catalog' not described in 'dp_catalog_aux_reset'
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Excess function parameter 'aux' description in 'dp_catalog_aux_reset'
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

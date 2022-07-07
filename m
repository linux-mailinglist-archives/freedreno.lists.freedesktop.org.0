Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890C256A343
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 15:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB7218A94B;
	Thu,  7 Jul 2022 13:16:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C7B18A94B
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 13:16:33 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id ck6so22566622qtb.7
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 06:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MqlMfZ8fQXOwxTDqrntRkHE3D7MxEI/E5lq6JAfP4jE=;
 b=WfQtu9rHhospRacVsjlUlb0LkygWfaJnaJaKYCL/TG+u0P+63HS6EvDZhohiyhLVCJ
 BTZLcvVKMf4pSGEueFQNRTjePXe0vRWOBR7lBUOdX+4Ib+h/m8zte/7AP7d/81+15MSq
 07tny2LKbipaTDVNGyfxCRcciiO56WQ7aPdpCr31REiLrLVi9zYmmnGeE3yQXEDmiwyj
 U85JSfCvACZ5RO2nQnGcA8Mn5kvQIv5MI8wtRLBxTtsLJHazAQQi1uvLwxbIVasSxZvD
 GVy0JZ2lcjCRv4gb5F0hfN3+YAZx4Uq7ZXUSkje+guR/BzCGhAI1a+ty8myJ4xvnZJ95
 4hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MqlMfZ8fQXOwxTDqrntRkHE3D7MxEI/E5lq6JAfP4jE=;
 b=msf+6IEXtVnP8RxucjBmcl8YSPbQ+3n9rzrRLFB7LIbk+gQrzKz78BC73/DJJN7ZM9
 SA8fbTBf1Oy/EObNaBtxqftCb57D5rICmLcb6dAaaFyydK6mWo7Wy2KzZmCGfanM+tw9
 9OAWZjSQcKkTeO/LCHkigWtXSu+nPaZ4pffTzf/W4qK7dKMrOHSq++korfuoB5/YQzT6
 DCsmPLmQrBrsQARBkeZDdT6/xi4iepl+nhZkxZ0dT+AWfobwmze/wmRSdLX3we8P/6/d
 t7KuIffwPDiunyAHtA7hkekdRZM0j0w/I5Uw9Rgb+wXbGZbIN0HvHCGKzC5a8ULS1WTh
 s3Zw==
X-Gm-Message-State: AJIora+NIMmxHxrVt6/rrJB4wJ0+0feCM0nwkSRpxcI+ZTWikn0Ax8Og
 6MGeuUAvitJFxq4IOIBC0CORbeVT5dxJpbg4AQDSCA==
X-Google-Smtp-Source: AGRyM1ul3iuz5ajc9yApAncXOGwSRLVhNG/Nr3i0uRHfHk55LX9XPHmvYzBTEwB1AM2+4S/r20SQNdu1vMCLrBeKBFo=
X-Received: by 2002:a05:6214:2a84:b0:473:2958:2b02 with SMTP id
 jr4-20020a0562142a8400b0047329582b02mr3813815qvb.122.1657199791909; Thu, 07
 Jul 2022 06:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220707125848.379610-1-sunliming@kylinos.cn>
In-Reply-To: <20220707125848.379610-1-sunliming@kylinos.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Jul 2022 16:16:20 +0300
Message-ID: <CAA8EJpoXaJgU_oGmkHiMjX366+eWLYDBAbaLRCJfOm9ySFb+ig@mail.gmail.com>
To: sunliming <sunliming@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: fix the inconsistent indenting
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 kelulanainsley@gmail.com, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, robdclark@gmail.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 7 Jul 2022 at 15:59, sunliming <sunliming@kylinos.cn> wrote:
>
> Fix the inconsistent indenting in function msm_dsi_dphy_timing_calc_v3().
>
> Fix the following smatch warnings:
>
> drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:350 msm_dsi_dphy_timing_calc_v3() warn: inconsistent indenting
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
>  2                                     | 947 ++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c |   2 +-
>  2 files changed, 948 insertions(+), 1 deletion(-)
>  create mode 100644 2
>
> diff --git a/2 b/2
> new file mode 100644
> index 000000000000..56dfa2d24be1
> --- /dev/null
> +++ b/2

Please drop this part & resubmit.

> @@ -0,0 +1,947 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2015, The Linux Foundation. All rights reserved.
> + */

[skipped the rest]

-- 
With best wishes
Dmitry

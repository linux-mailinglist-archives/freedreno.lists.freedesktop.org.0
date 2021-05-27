Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC06D393953
	for <lists+freedreno@lfdr.de>; Fri, 28 May 2021 01:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711E56F517;
	Thu, 27 May 2021 23:45:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCBC6F516
 for <freedreno@lists.freedesktop.org>; Thu, 27 May 2021 23:45:10 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id 131so3037904ljj.3
 for <freedreno@lists.freedesktop.org>; Thu, 27 May 2021 16:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Agf93Ei+9Tdc8Zvz0bPaizkEiLAVgHXWf+4M50aPaoE=;
 b=nMLBX5g3X755skTAhGoSjvtud9YhlWMACVOScm/kNloVrVed8R0YJUV775o79Jx9Wl
 MDSDih8RcL440wYlNQpFDNytOoigNMc04LUUwX4qflmZjpJfPGt1d9e8j5xKUVgiNWJq
 UtaarziZM/3+2DOLG1Mp8D1+hrRjYRMFsaGFwMLiCjVw2DLYv0ifSiJT0LHxL4WSJil/
 oSJ82ZDgS/UpNpLj0CnbRLmoeHkbULctk4u2GDbHvm1L7sukyOExw6gXoDTmFQRbFfmr
 rSM0UbGJLzvlMpR2BAwpVz+5XaT7ECbXnuit+qUapS5gUbtJI03LwJhbvNBAg2t9oTfX
 ReoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Agf93Ei+9Tdc8Zvz0bPaizkEiLAVgHXWf+4M50aPaoE=;
 b=ArpHxtlJbhDDIstHPikTt0Ush66QAk32ccvEljXWXpKk3lJJXJVfRRF8xSvjjcLiqn
 y/7vU3oeloudhtmn7Nm8xNQdUQQUnoRdagAn6zId581XmR2yhVvrXb+mKkjBxjMaucAo
 bchR7mwbV9WPSo4N5ZUFc9xYyifyTigKf++tzlidl7uykgsSY1C+jD9yJjX/S0SSZFpu
 PazoWxn8e3qaboCRMZA6rB7waol1DooIGnA1p3utrnbXAkXezcxCGJd4E0k166jRgHrB
 QmT54iombk1fBUvWaPsUGFA/mXynTgQOv6zMhaQLRg9cmxUNDiMeL1ExrVqR6+Ehtnls
 qoLg==
X-Gm-Message-State: AOAM530TCS+yxIbK/DJ4L3B7Eax4mDE3sT6hGR0u08xGTfy0krj1xl+V
 uTpisqkoOMLvpbqhvJPuscdS4SZnFzo7GA==
X-Google-Smtp-Source: ABdhPJwpm9LP4ARZQheOF4vnrUK8YBrm3JYilKh6GFbYW+t31vOsjf6nmJE0sqqDaGqQ4CfmeZEBTA==
X-Received: by 2002:a2e:9196:: with SMTP id f22mr4363198ljg.88.1622159108474; 
 Thu, 27 May 2021 16:45:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s1sm368494ljj.69.2021.05.27.16.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 16:45:07 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-5-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <73815f0b-b6d1-f6f3-d7aa-f77492861967@linaro.org>
Date: Fri, 28 May 2021 02:45:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521124946.3617862-5-vkoul@kernel.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [RFC PATCH 03/13] drm/msm/dsi: add support for dsc
 data
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/05/2021 15:49, Vinod Koul wrote:
> DSC needs some configuration from device tree, add support to read and
> store these params and add DSC structures in msm_drv
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 170 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h      |  32 ++++++
>   2 files changed, 202 insertions(+)
> 


[skipped]


>   		DRM_DEV_ERROR(dev, "%s: invalid lane configuration %d\n",
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 2668941df529..26661dd43936 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -30,6 +30,7 @@
>   #include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_fb_helper.h>
> +#include <drm/drm_dsc.h>
>   #include <drm/msm_drm.h>
>   #include <drm/drm_gem.h>
>   
> @@ -70,6 +71,16 @@ enum msm_mdp_plane_property {
>   #define MSM_GPU_MAX_RINGS 4
>   #define MAX_H_TILES_PER_DISPLAY 2
>   
> +/**
> + * enum msm_display_compression_type - compression method used for pixel stream
> + * @MSM_DISPLAY_COMPRESSION_NONE:	Pixel data is not compressed
> + * @MSM_DISPLAY_COMPRESSION_DSC:	DSC compresison is used
> + */
> +enum msm_display_compression_type {
> +	MSM_DISPLAY_COMPRESSION_NONE,
> +	MSM_DISPLAY_COMPRESSION_DSC,
> +};
> +

Seems to be unused

>   /**
>    * enum msm_display_caps - features/capabilities supported by displays
>    * @MSM_DISPLAY_CAP_VID_MODE:           Video or "active" mode supported



-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

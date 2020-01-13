Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F73113993E
	for <lists+freedreno@lfdr.de>; Mon, 13 Jan 2020 19:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144396E139;
	Mon, 13 Jan 2020 18:47:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389326E13B
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jan 2020 18:47:01 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id n96so4532007pjc.3
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jan 2020 10:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nkKcrpfRktLxX1CbhkASh0ZgiXrDCjQ/rkJuojojUnc=;
 b=ujQRXp2YvLtclnx11K7oBOcejLFOyQFwj58UqRNU7zBtRruAaLk67YO50bm6mKRVxA
 J6yWNPN9lmNc/uDHMN9uHLppYs5g/BbWlz6M7Ipu6fESZZRjxwan3w1AD+KcYeem66YA
 uKQepQRA4TVALY8wjWJ4bEuH+yhECR7zrhX5KdaR1AcTq6j5MKAjS8sZlN8xSzB2NVRc
 yVitHUurf+dhp08Ai6grh7+AyqQhtp5yDX11Kv0pDcqVIKJJfuArmh6uI1YpjMeNQVws
 GiDqE1uRZM2M0sW6N7/M3Zl3Isk/ycic+VwC5rrRkiY7EsTCoE9fp3595p9UiPyLhWTl
 I0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nkKcrpfRktLxX1CbhkASh0ZgiXrDCjQ/rkJuojojUnc=;
 b=QObtBp4Ox3FC+1+l9Bw9PqCz9tFqlDbbcaKN0TufpIowTIMYkG0qRSDDJxsjOeXKQE
 uVGgbSdf/9tD1XeDfdCo7W0GXyZaTBcGUK0XUf4F9Q42h5YzpN/Df5PP5ZI6GEJd/CBN
 wAI7hKcDuikM+7uVPmE2A52GL0xafJ6abY6tw7K62REogu+b22oR3hMsMynTyeBkGEBz
 ASGtLg8pmp9WL1uMHNxpxl5lkDfAS/1xzmspD6iB3Nr1+KJlGuv89w6tKlxmwCVWumz7
 a67/GxkbLF9+uJGqfqfRLEVgASqT5AQA/+mxLeOY7xqPa0LamoJSiLhRf9eLUAW6hvmR
 F+Sg==
X-Gm-Message-State: APjAAAVvrL9y/VKWRZfm1SJDB6ox/5Kk2DpuRMdAWHiPhK0n3YX1b2MV
 gzPzOvTwNPtjLH2tC6Ek5QlqSg==
X-Google-Smtp-Source: APXvYqxJZXXWOV0LcU0vL+gUH24Y47uvIirDua/ouRmYSRHpxMBcNqnxv6yjKM4MR8jtBciwh/Y71g==
X-Received: by 2002:a17:90b:11d7:: with SMTP id
 gv23mr23879662pjb.94.1578941220805; 
 Mon, 13 Jan 2020 10:47:00 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id b19sm14726680pfo.56.2020.01.13.10.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 10:47:00 -0800 (PST)
Date: Mon, 13 Jan 2020 10:46:57 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200113184657.GD1511@yoga>
References: <20200112195405.1132288-1-robdclark@gmail.com>
 <20200112195405.1132288-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200112195405.1132288-3-robdclark@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Freedreno] [PATCH v2 2/4] drm/msm: allow zapfw to not be
 specified in gpulist
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
Cc: Rob Clark <robdclark@chromium.org>, Fabio Estevam <festevam@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, freedreno@lists.freedesktop.org,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun 12 Jan 11:53 PST 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> For newer devices we want to require the path to come from the
> firmware-name property in the zap-shader dt node.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 456bb5af1717..c146c3b8f52b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -79,9 +79,21 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  		ret = request_firmware_direct(&fw, fwname, gpu->dev->dev);
>  		if (ret)
>  			fw = ERR_PTR(ret);
> -	} else {
> +	} else if (fwname) {
>  		/* Request the MDT file from the default location: */
>  		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> +	} else {
> +		/*
> +		 * For new targets, we require the firmware-name property,
> +		 * if a zap-shader is required, rather than falling back
> +		 * to a firmware name specified in gpulist.
> +		 *
> +		 * Because the firmware is signed with a (potentially)
> +		 * device specific key, having the name come from gpulist
> +		 * was a bad idea, and is only provided for backwards
> +		 * compatibility for older targets.
> +		 */
> +		return -ENODEV;
>  	}
>  
>  	if (IS_ERR(fw)) {
> @@ -170,14 +182,6 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>  		return -EPROBE_DEFER;
>  	}
>  
> -	/* Each GPU has a target specific zap shader firmware name to use */
> -	if (!adreno_gpu->info->zapfw) {
> -		zap_available = false;
> -		DRM_DEV_ERROR(&pdev->dev,
> -			"Zap shader firmware file not specified for this target\n");
> -		return -ENODEV;
> -	}
> -
>  	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>  
> -- 
> 2.24.1
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

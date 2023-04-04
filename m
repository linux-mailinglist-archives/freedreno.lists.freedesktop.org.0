Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C036D6F7A
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 23:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F76310E7C6;
	Tue,  4 Apr 2023 21:59:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FDA10E7C9
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 21:59:18 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id x20so35411205ljq.9
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 14:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680645557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qc9bc6tTbiRDYjjzkH3Dn1lF9b4A5edsJ7eV3k3CanY=;
 b=lJCEXWR5FF5jrzyD2Dsxzsyh6F6rJziVxx/I4LORfN9WbfUBqUrzKNS4NVVT3Joqqy
 Y3HO6G9oWMX8y14rJ/M0h/nqFcjJQpoYJM5Kc7x20uwBAtXqZ1ra3Fzfgddg5ESz1/j6
 odP9vlBcSsAczZLaYFnwd7ha1Uo06KwX4d4MDlXVj0gNveWIGV0omX80q8/koKo/SqXa
 3yM9fDwlcXxyvn9eNrkn6DZtBKftc2mNTRrS1Ne9HpyKHWsDIf92ShK4x5kIB1Luu3aB
 oACXUhC28MReOtYKsFguA5SCx+hdTmOi3Mctw/dyyr++um5RRxCzmySfdPEgguWx8eDV
 mpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680645557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qc9bc6tTbiRDYjjzkH3Dn1lF9b4A5edsJ7eV3k3CanY=;
 b=DyVdIiqSPTRRKdmdqD60Qo2Rj7rme9/aNHBY3Ew8mZLlzcCJyzscjf+tstLyPi3ifS
 Q0het+X4X1hrOAkR1p0LzLDOmfXYDRuzj+jeaxhBPEVzYnJVfF45wAC31krsGLKb/Fqm
 LfKFYd2CRXLbgmPpqEiiHNnnu24p4QcbcYgdFULKHfEV8RQigV05nqGiBzXdq/lfeYfk
 Ikf9BufmkOyiH3woqHKXkoNoG+jyTBQ5DMJFpfNG8aGeX4rKZkyAetjQcoPWzK/Hyv6P
 v/7YkSZTDUIUdnQc1Idt+A/P6Ummts9Y+Ur7kxo2gxoIM8X6wvLrwonoBJQ+MvJMSYkZ
 ih/Q==
X-Gm-Message-State: AAQBX9eZ7lxHFkdBqu8+04/IdLWQlBsnZ0berNStrXNwVkYwA6k5K1bm
 GVqU8EYdQf7RfxEi3A2cJzkApw==
X-Google-Smtp-Source: AKy350abW8zKOO17B9uj3N5oxgSBw1h1fNQf79atr5mI43M1mGj8QGnBIxCnWqzvv3BUylfRljK3+g==
X-Received: by 2002:a2e:8657:0:b0:29f:1c6:84 with SMTP id
 i23-20020a2e8657000000b0029f01c60084mr1430726ljj.4.1680645556870; 
 Tue, 04 Apr 2023 14:59:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a2e8058000000b00295b842c2dbsm2576980ljg.133.2023.04.04.14.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 14:59:16 -0700 (PDT)
Message-ID: <d1aaa1e7-6557-a750-1e0c-d02ffbd472eb@linaro.org>
Date: Wed, 5 Apr 2023 00:59:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <20230403124538.8497-3-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403124538.8497-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/8] drm/msm: Clear aperture ownership
 outside of fbdev code
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/04/2023 15:45, Thomas Zimmermann wrote:
> Move aperture management out of the fbdev code. It is unrelated
> and needs to run even if fbdev support has been disabled. Call
> the helper at the top of msm_drm_init() to take over hardware
> from other drivers.
> 
> v2:
> 	* bind all subdevices before acquiring device (Dmitri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/msm/msm_drv.c   | 6 ++++++
>   drivers/gpu/drm/msm/msm_fbdev.c | 6 ------
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index aca48c868c14..2a1c6ced82c9 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -12,6 +12,7 @@
>   #include <linux/uaccess.h>
>   #include <uapi/linux/sched/types.h>
>   
> +#include <drm/drm_aperture.h>
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_file.h>
> @@ -451,6 +452,11 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	if (ret)
>   		goto err_drm_dev_put;
>   
> +	/* the fw fb could be anywhere in memory */
> +	ret = drm_aperture_remove_framebuffers(false, drv);
> +	if (ret)
> +		goto err_drm_dev_put;

This should be goto err_msm_uninit to unbind devices. I'll fix this 
while applying.

> +
>   	dma_set_max_seg_size(dev, UINT_MAX);
>   
>   	msm_gem_shrinker_init(ddev);
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index d26aa52217ce..fc7d0406a9f9 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -4,7 +4,6 @@
>    * Author: Rob Clark <robdclark@gmail.com>
>    */
>   
> -#include <drm/drm_aperture.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
> @@ -154,11 +153,6 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>   		goto fail;
>   	}
>   
> -	/* the fw fb could be anywhere in memory */
> -	ret = drm_aperture_remove_framebuffers(false, dev->driver);
> -	if (ret)
> -		goto fini;
> -
>   	ret = drm_fb_helper_initial_config(helper);
>   	if (ret)
>   		goto fini;

-- 
With best wishes
Dmitry


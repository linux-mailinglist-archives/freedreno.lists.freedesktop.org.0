Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A5C54C8D3
	for <lists+freedreno@lfdr.de>; Wed, 15 Jun 2022 14:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E7610E58D;
	Wed, 15 Jun 2022 12:45:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B517510E58A
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 12:45:34 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id be31so18723722lfb.10
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 05:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2zOauB4b7g5lcbnITMMxeE2s0wgTpDslehgvoxa82L8=;
 b=UMAfnrE2aWigR/q6xMPtvhg2ojjat/jbG6oiLiFyBq+r77LyfInB/UMBk0IZsK/KTN
 bXJCj64jpBE273Mdgpj6B4Iwfw5bchCRj3qT6ZNRvb7KglCzvVzMpkWT1ShGllZkTGVA
 JRLBof22O17mYlvel5ag4PwkY4hU6i9DoP09yHKsHhtQJcOoifgDHkyLHTcyIPUFtrFL
 k7KhZHVn7eEynoa4tNELhdGo2DxCKcqEWT1y1ewG8NyNJnWlmSUGJW2jC6DMHlOfSGX6
 LxRwaaQt9NG2rmzZ6ymFOsB7ofiiWR6/kYw9FzQ+fjNP98X4/Efj4sFhuDkazw+exMvC
 FcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2zOauB4b7g5lcbnITMMxeE2s0wgTpDslehgvoxa82L8=;
 b=ts8YaMCyXQCfaldsarDaZpCxKQLsWDNt5/8NHYCE38xvhMkRuMqegGsbpsRkWtV3Ur
 NU53x3JlnStGOFJ7x9lois9a3Dj1PMk8V5pnRh5lXeE2DGYCPm+JVWjQrhPcAg1Jk5pG
 EhEQh4kFC4g99dat5X3Lna+iE9yjK2IRg7u1B9+CgL5Bwb/8f6bxfe8xgPmfg7ybQKiz
 Dt4t0XspHCobom9N6wzXe6fBd5JcMDbv1qGJcLXDLEtWhnf9oo8JF8RkTvoS2irLFvVR
 yAcu+sdQk5EP1U0Q1DPfZqQDWpD+mRGUKZdjwIgJnjDOya9iPU1TO4KtK/qSHanXv5bO
 QVJg==
X-Gm-Message-State: AJIora/oS8jxEtzltHliSPqio4Mxj8sVoUQ3LZCyHH7w4KMO54H8dDC/
 rWd/LwNToiVAVrk4TDZ5Q0dnJw==
X-Google-Smtp-Source: AGRyM1uErqHFJQHAFNutC12wS6K6kS65Ce/no+PwzNQ7oDUszt3CS3a7ktVh56u8Xg1iwUq49+/qrw==
X-Received: by 2002:ac2:4e86:0:b0:479:242:61da with SMTP id
 o6-20020ac24e86000000b00479024261damr5995734lfr.40.1655297133091; 
 Wed, 15 Jun 2022 05:45:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 br21-20020a056512401500b0047255d2114asm1780870lfb.121.2022.06.15.05.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:45:32 -0700 (PDT)
Message-ID: <5066e977-52b5-ce18-98e9-44dcfe018127@linaro.org>
Date: Wed, 15 Jun 2022 15:45:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220609174213.2265938-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220609174213.2265938-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 1/2] drm: Add DRM_GEM_FOPS
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 Chris Healy <cphealy@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/06/2022 20:42, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The DEFINE_DRM_GEM_FOPS() helper is a bit limiting if a driver wants to
> provide additional file ops, like show_fdinfo().
> 
> v2: Split out DRM_GEM_FOPS instead of making DEFINE_DRM_GEM_FOPS
>      varardic
> v3: nits
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

I suspect that with Tomas's ack we can pick this through the drm/msm. Is 
this correct? (I'll then pick it for the msm-lumag).

> ---
>   include/drm/drm_gem.h | 26 ++++++++++++++++++--------
>   1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9d7c61a122dc..87cffc9efa85 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -314,6 +314,23 @@ struct drm_gem_object {
>   	const struct drm_gem_object_funcs *funcs;
>   };
>   
> +/**
> + * DRM_GEM_FOPS - Default drm GEM file operations
> + *
> + * This macro provides a shorthand for setting the GEM file ops in the
> + * &file_operations structure.  If all you need are the default ops, use
> + * DEFINE_DRM_GEM_FOPS instead.
> + */
> +#define DRM_GEM_FOPS \
> +	.open		= drm_open,\
> +	.release	= drm_release,\
> +	.unlocked_ioctl	= drm_ioctl,\
> +	.compat_ioctl	= drm_compat_ioctl,\
> +	.poll		= drm_poll,\
> +	.read		= drm_read,\
> +	.llseek		= noop_llseek,\
> +	.mmap		= drm_gem_mmap
> +
>   /**
>    * DEFINE_DRM_GEM_FOPS() - macro to generate file operations for GEM drivers
>    * @name: name for the generated structure
> @@ -330,14 +347,7 @@ struct drm_gem_object {
>   #define DEFINE_DRM_GEM_FOPS(name) \
>   	static const struct file_operations name = {\
>   		.owner		= THIS_MODULE,\
> -		.open		= drm_open,\
> -		.release	= drm_release,\
> -		.unlocked_ioctl	= drm_ioctl,\
> -		.compat_ioctl	= drm_compat_ioctl,\
> -		.poll		= drm_poll,\
> -		.read		= drm_read,\
> -		.llseek		= noop_llseek,\
> -		.mmap		= drm_gem_mmap,\
> +		DRM_GEM_FOPS,\
>   	}
>   
>   void drm_gem_object_release(struct drm_gem_object *obj);


-- 
With best wishes
Dmitry

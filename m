Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D77501D5A
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 23:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB6310E247;
	Thu, 14 Apr 2022 21:22:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1762B10E21D
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 21:22:53 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id h11so7603425ljb.2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 14:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=N4HLGfvB+8+NMPcma6ojtQZuOsbor7W890ru+Wl5k+A=;
 b=Vtu2zM9TgoLp0lFsN8cZ84YFteD6ZDK8uHWYw9y4EpaMfzQIj55ErNEGzbMA6Ij+Nx
 Hdq9rICuROBOdBoBNCwt02Z47zs+QKwjYYvCrZ5VfikSNEbtsrPY7IF0Qn9s2ruKYdSV
 MqMepUNNvdia8syLrys1RUq1FFwoj6hLCpFcDjmpTpuIUP2Hl4f4PNYk/MCTeVj+vvpB
 NFtiuputIq5Kq/D1ogchg8xfjaCT3ieidhvRxZghb7BnQskt1+vS2Q/fz8TwPczcFomr
 csnScCGdu4XkhtyqfP20lKWV18tpTNxLG2Phuis/fHu/fglP2zhDI9YuNbM5dsoy9Y9d
 Yryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N4HLGfvB+8+NMPcma6ojtQZuOsbor7W890ru+Wl5k+A=;
 b=qAmw5U6ZT7Fw7Hj6c2vLCD4XavcnFjIuTwSDwJeXwBJPhpxTvC+LBLZcoOitnbQA/U
 11lHWDKrfCP4fGcKlyDA/X+TBcubP9iAUhfsBROeHrxK0lIDan2CQJ6wUC6B1ESuFGKR
 ryilXaOW2euJ2MWJQGCyyV463eYn6es7KEaRJSf28w9flvd9hIx5ES+CMeQ8dH6wX4iC
 /46GgZwgiqdsHcBgDEiuj/n8w3RQrTo25o03dZgP5u42+pJd0RzAzh0N19EYsxPhpk95
 W+lAB8BBrVwu06xe/FDrBTV2wuQ2GDPekICeeLeCtHrbnpOF718yseihuWWTEor6F9dn
 2fmw==
X-Gm-Message-State: AOAM532LHDL0UKsZbI7zh5wrHnSyiMScv4D2cz9GM7camGxM/miT/ogR
 qm3op07CEyXpIZoI359m+ykQHAnvk18otA==
X-Google-Smtp-Source: ABdhPJz3h3GOjyhWlMc5Z/uIaPCL2LUsnN4ZjhJCyjF7rOnkzpRWDzc13CNpIFg3DaMvmP4G15bTeQ==
X-Received: by 2002:a05:651c:508:b0:24b:147b:161c with SMTP id
 o8-20020a05651c050800b0024b147b161cmr2605943ljp.459.1649971371418; 
 Thu, 14 Apr 2022 14:22:51 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a056512330600b0046d11847ccasm112122lfe.227.2022.04.14.14.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 14:22:50 -0700 (PDT)
Message-ID: <be83952d-d411-d0c8-e05f-ad50a8ba9c0e@linaro.org>
Date: Fri, 15 Apr 2022 00:22:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220411215849.297838-1-robdclark@gmail.com>
 <20220411215849.297838-4-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220411215849.297838-4-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 03/10] drm/msm/gem: Convert some missed
 GEM_WARN_ON()s
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/04/2022 00:58, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gem_vma.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index f914ddbaea89..64906594fc65 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -44,7 +44,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>   	unsigned size = vma->node.size << PAGE_SHIFT;
>   
>   	/* Print a message if we try to purge a vma in use */
> -	if (WARN_ON(vma->inuse > 0))
> +	if (GEM_WARN_ON(vma->inuse > 0))
>   		return;
>   
>   	/* Don't do anything if the memory isn't mapped */
> @@ -61,7 +61,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>   void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
>   		struct msm_gem_vma *vma)
>   {
> -	if (!WARN_ON(!vma->iova))
> +	if (!GEM_WARN_ON(!vma->iova))
>   		vma->inuse--;
>   }
>   
> @@ -73,7 +73,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>   	unsigned size = npages << PAGE_SHIFT;
>   	int ret = 0;
>   
> -	if (WARN_ON(!vma->iova))
> +	if (GEM_WARN_ON(!vma->iova))
>   		return -EINVAL;
>   
>   	/* Increase the usage counter */
> @@ -100,7 +100,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>   void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>   		struct msm_gem_vma *vma)
>   {
> -	if (WARN_ON(vma->inuse > 0 || vma->mapped))
> +	if (GEM_WARN_ON(vma->inuse > 0 || vma->mapped))
>   		return;
>   
>   	spin_lock(&aspace->lock);
> @@ -120,7 +120,7 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
>   {
>   	int ret;
>   
> -	if (WARN_ON(vma->iova))
> +	if (GEM_WARN_ON(vma->iova))
>   		return -EBUSY;
>   
>   	spin_lock(&aspace->lock);


-- 
With best wishes
Dmitry

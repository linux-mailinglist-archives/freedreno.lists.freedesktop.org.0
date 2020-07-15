Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6022215B7
	for <lists+freedreno@lfdr.de>; Wed, 15 Jul 2020 22:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798B76EC12;
	Wed, 15 Jul 2020 20:05:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AC76EC0F
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jul 2020 20:05:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594843541; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=fvwWPJ4nfvf5fMLrZzvo42MkdKAWewsiREaDmkMYpTg=;
 b=IJa56gLQKU/ewKUzviyOW2n04NYcbQtKfsivz4kP94iDPrDf7hIwrvXeb0YHZ5dkM6gXgzeK
 f7PR9z4X//miRh7SbXBa0YHTsHWWFlYQTkCX8no9sBkT+EN4z0H4yMPI/Cv12kB5Zr7mIfzE
 Jz6Bpou61oRM4wCBEJFXNhnNcks=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5f0f618ae3bee125101734d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 15 Jul 2020 20:05:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A2BE0C433A0; Wed, 15 Jul 2020 20:05:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B37ADC433C9;
 Wed, 15 Jul 2020 20:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B37ADC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Wed, 15 Jul 2020 14:05:24 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200715200523.GA26861@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Brian Masney <masneyb@onstation.org>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200715190732.3116556-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715190732.3116556-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: fix gpu probe if no
 interconnect-names
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Fabio Estevam <festevam@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 12:07:30PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> If there is no interconnect-names, but there is an interconnects
> property, then of_icc_get(dev, "gfx-mem"); would return an error
> rather than NULL.
> 
> Also, if there is no interconnect-names property, there will never
> be a ocmem path.  But of_icc_get(dev, "ocmem") would return -EINVAL
> instead of -ENODATA.  Just don't bother trying in this case.
> 
> v2: explicity check for interconnect-names property
> 
> Fixes: 8e29fb37b301 ("drm/msm: handle for EPROBE_DEFER for of_icc_get")
> Fixes: 00bb9243d346 ("drm/msm/gpu: add support for ocmem interconnect path")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 0527e85184e1..e23641a5ec84 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1003,22 +1003,23 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	if (ret)
>  		return ret;
>  
> -	/* Check for an interconnect path for the bus */
> -	gpu->icc_path = of_icc_get(dev, "gfx-mem");
> -	if (!gpu->icc_path) {
> -		/*
> -		 * Keep compatbility with device trees that don't have an
> -		 * interconnect-names property.
> -		 */
> +	/*
> +	 * The legacy case, before "interconnect-names", only has a
> +	 * single interconnect path which is equivalent to "gfx-mem"
> +	 */
> +	if (!of_find_property(dev->of_node, "interconnect-names", NULL)) {
>  		gpu->icc_path = of_icc_get(dev, NULL);
> +	} else {
> +		gpu->icc_path = of_icc_get(dev, "gfx-mem");
> +		gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
>  	}
> +
>  	if (IS_ERR(gpu->icc_path)) {
>  		ret = PTR_ERR(gpu->icc_path);
>  		gpu->icc_path = NULL;
>  		return ret;
>  	}
>  
> -	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
>  	if (IS_ERR(gpu->ocmem_icc_path)) {
>  		ret = PTR_ERR(gpu->ocmem_icc_path);
>  		gpu->ocmem_icc_path = NULL;
> @@ -1026,6 +1027,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		if (ret != -ENODATA)
>  			return ret;
>  	}
> +

Nit for an extra blank line but otherwise looks fine.  I like this workaround.

With that, Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

>  	return 0;
>  }
>  
> -- 
> 2.26.2
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

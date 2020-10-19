Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082972929E5
	for <lists+freedreno@lfdr.de>; Mon, 19 Oct 2020 16:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12386E9F5;
	Mon, 19 Oct 2020 14:59:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1713E6E9F5
 for <freedreno@lists.freedesktop.org>; Mon, 19 Oct 2020 14:59:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603119596; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=I/SKOMpzOnnwt8n9VF8We3fcphMOzmAuFiM8CKtC4dU=;
 b=M8DIhnylaUfpvuxKwTNIYNXcj/E+N+rWgpkhQ5vsJCQf3fZecFH6uuEcjCw5Ij1K5T1/INwo
 5l2ilUMMyeSJiJDPFVukd1MMgkg+kkraURy5fJ2ah9OEGw7hyppe3a1voDvNpzgb0wwCShGW
 P8RR3tqWVs0Kx3TriL29uBl0qQM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f8da9cf42f9861fb1f50d14 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Oct 2020 14:59:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3D468C433FE; Mon, 19 Oct 2020 14:59:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A67A0C433F1;
 Mon, 19 Oct 2020 14:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A67A0C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 19 Oct 2020 08:59:22 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <20201019145922.GB31882@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Akhil P Oommen <akhilpo@codeaurora.org>,
 freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mka@chromium.org, robdclark@gmail.com, dianders@chromium.org
References: <1603113558-23330-1-git-send-email-akhilpo@codeaurora.org>
 <1603113558-23330-2-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603113558-23330-2-git-send-email-akhilpo@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: Fix duplicate gpu node in icc
 summary
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org, robdclark@gmail.com, mka@chromium.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 06:49:18PM +0530, Akhil P Oommen wrote:
> On targets with a6xx gpu, there is a duplicate gpu icc node listed in
> the interconnect summary. On these targets, calling

This first sentence is confusing to me. I think the following few sentences do
a better job of explaining what you are trying to do.

> dev_pm_opp_of_add_table() api initializes the icc nodes for gpu indirectly.
> So we should avoid using of_icc_get() api in the common probe path. To fix
> this, we can move of_icc_get() to target specific code where it is
> required.

> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c   | 21 +++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   | 20 ++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 29 +----------------------------
>  3 files changed, 38 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index f29c77d..93da668 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -519,6 +519,8 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
>  	struct msm_gpu *gpu;
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
> +	struct icc_path *ocmem_icc_path;
> +	struct icc_path *icc_path;
>  	int ret;
>  
>  	if (!pdev) {
> @@ -566,13 +568,28 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
>  		goto fail;
>  	}
>  
> +	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
> +	ret = IS_ERR(icc_path);
> +	if (ret)
> +		goto fail;
> +
> +	ocmem_icc_path = devm_of_icc_get(&pdev->dev, "ocmem");
> +	ret = IS_ERR(ocmem_icc_path);
> +	if (ret) {
> +		/* allow -ENODATA, ocmem icc is optional */
> +		if (ret != -ENODATA)
> +			goto fail;
> +		ocmem_icc_path = NULL;
> +	}
> +
> +
>  	/*
>  	 * Set the ICC path to maximum speed for now by multiplying the fastest
>  	 * frequency by the bus width (8). We'll want to scale this later on to
>  	 * improve battery life.
>  	 */
> -	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> -	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> +	icc_set_bw(icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> +	icc_set_bw(ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);

This seems reasonable but I hope we can get somebody to sign off on a real a3xx
part.

>  
>  	return gpu;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index 2b93b33..c0be3a0 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -648,6 +648,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>  	struct msm_gpu *gpu;
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
> +	struct icc_path *ocmem_icc_path;
> +	struct icc_path *icc_path;
>  	int ret;
>  
>  	if (!pdev) {
> @@ -694,13 +696,27 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>  		goto fail;
>  	}
>  
> +	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
> +	ret = IS_ERR(icc_path);
> +	if (ret)
> +		goto fail;
> +
> +	ocmem_icc_path = devm_of_icc_get(&pdev->dev, "ocmem");
> +	ret = IS_ERR(ocmem_icc_path);
> +	if (ret) {
> +		/* allow -ENODATA, ocmem icc is optional */
> +		if (ret != -ENODATA)
> +			goto fail;
> +		ocmem_icc_path = NULL;
> +	}
> +
>  	/*
>  	 * Set the ICC path to maximum speed for now by multiplying the fastest
>  	 * frequency by the bus width (8). We'll want to scale this later on to
>  	 * improve battery life.
>  	 */
> -	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> -	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> +	icc_set_bw(icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> +	icc_set_bw(ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);

Less confident we can find any 4xx fans to test this, but if a3xx works then so
should this (in theory).

>  	return gpu;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index fd8f491..6e3b820 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -920,35 +920,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  
>  	ret = msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
>  			adreno_gpu->info->name, &adreno_gpu_config);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * The legacy case, before "interconnect-names", only has a
> -	 * single interconnect path which is equivalent to "gfx-mem"
> -	 */
> -	if (!of_find_property(dev->of_node, "interconnect-names", NULL)) {
> -		gpu->icc_path = of_icc_get(dev, NULL);
> -	} else {
> -		gpu->icc_path = of_icc_get(dev, "gfx-mem");
> -		gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> -	}
>  
> -	if (IS_ERR(gpu->icc_path)) {
> -		ret = PTR_ERR(gpu->icc_path);
> -		gpu->icc_path = NULL;
> -		return ret;
> -	}
> -
> -	if (IS_ERR(gpu->ocmem_icc_path)) {
> -		ret = PTR_ERR(gpu->ocmem_icc_path);
> -		gpu->ocmem_icc_path = NULL;
> -		/* allow -ENODATA, ocmem icc is optional */
> -		if (ret != -ENODATA)
> -			return ret;
> -	}
> -
> -	return 0;
> +	return ret;

This could go even further:

return msm_gpu_init(...);

>  }
>  
>  void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
> -- 
> 2.7.4
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

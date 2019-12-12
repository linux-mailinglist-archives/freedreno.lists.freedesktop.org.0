Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79A011C634
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2019 08:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AB46EC63;
	Thu, 12 Dec 2019 07:12:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F95B6EC67
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2019 07:12:52 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id k20so179564pll.13
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2019 23:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pzvbMvksIeRzLHPUfhZRb4G8rwpYHOZcVb2OFZ2VjU8=;
 b=eCzo+pmZKR5fF8dArzFSpVmbtK2mtqqm2VaPcm+gaRkpR/ZakpY0oYFCIoXxrVRtyE
 jrnXFQbzkJaEkUP0w3W8J2UChgLC/5xQL8hY/DeTGMm6DhFdhlizzl6zfEZdO/R6jeEn
 KtN7WfSco0VkklnCT23TppkBkj4Hc1+0HCdo2PpbuvKI7V1VNbaS5ktns9B82xB6BOBk
 vYyXQPl2iXB7LQsVbXqBBBTVPoAz5hTxYkOuUOeq6ncLbM7S3nfcmT/CKvLKlQMnR7pn
 lGBJCqyjAnw6/WRUYxXnBxdjgB7E+w0Ka6Pl+1EeU4nN+h77R5hmSaRAGQ0Yb1AzBz/p
 RpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pzvbMvksIeRzLHPUfhZRb4G8rwpYHOZcVb2OFZ2VjU8=;
 b=rduKlYvR8UYsoGYlnmcABlKKS24eeapa71q3xvu9A1fcu6EEWvFCqKkWgh0QddHMxN
 VQaYZsZVNwPKaqvwVAtfaGE45Yl3tmBqSmEjZfoUCrC1JcppSNDcl/M/803a+uRo2EAC
 kVlgLoztn9SdDmz+i6oRJcMD8cPZiRvsheuhWulM3OIroJxc2pDkgM/r3EhRfqLfpSU+
 pYkdeB6g6xawjuhejJ9oWAimTCSAjQD3giJR6zizSyLFe4IeBbVOzLI0/bXy/hO+nCeP
 NWdu5SYIiYzfNywE3bZxsh9nllQxIM14Qm0f7ID+/GmlnJtYTMWwKuRXJEX8gE/3MU+i
 JBqA==
X-Gm-Message-State: APjAAAX+SqCE8cAkYczzuxas3idxO/xIRV7E03tQ+WRZGKM3mBJtyR6h
 ePeFxmR+Zdn5Xf7VG7aulCYp5pFTEQk=
X-Google-Smtp-Source: APXvYqyNNjHa/A1b0Jzbj51OTA3nttYn3rIvaHSHmyfvgctwgTKy97oy1R+YT+wxbc1PEjgqYkUidg==
X-Received: by 2002:a17:90a:20aa:: with SMTP id
 f39mr8401328pjg.35.1576134771826; 
 Wed, 11 Dec 2019 23:12:51 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id e7sm5610222pfe.168.2019.12.11.23.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 23:12:51 -0800 (PST)
Date: Wed, 11 Dec 2019 23:12:48 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Message-ID: <20191212071248.GK3143381@builder>
References: <20191122012645.7430-1-masneyb@onstation.org>
 <20191122012645.7430-3-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122012645.7430-3-masneyb@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Freedreno] [PATCH v2 2/4] drm/msm/gpu: add support for ocmem
 interconnect path
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 jcrouse@codeaurora.org, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, daniel@ffwll.ch, sean@poorly.run,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu 21 Nov 17:26 PST 2019, Brian Masney wrote:

> Some A3xx and all A4xx Adreno GPUs do not have GMEM inside the GPU core
> and must use the On Chip MEMory (OCMEM) in order to be functional.
> There's a separate interconnect path that needs to be setup to OCMEM.
> Add support for this second path to the GPU core.
> 
> In the downstream MSM 3.4 sources, the two interconnect paths for the
> GPU are between:
> 
>   - MSM_BUS_MASTER_GRAPHICS_3D and MSM_BUS_SLAVE_EBI_CH0
>   - MSM_BUS_MASTER_V_OCMEM_GFX3D and MSM_BUS_SLAVE_OCMEM
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 +++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu.h           |  7 +++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 0783e4b5486a..d27bdc999777 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -887,10 +887,21 @@ static int adreno_get_pwrlevels(struct device *dev,
>  	DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);
>  
>  	/* Check for an interconnect path for the bus */
> -	gpu->icc_path = of_icc_get(dev, NULL);
> +	gpu->icc_path = of_icc_get(dev, "gfx-mem");
> +	if (!gpu->icc_path) {
> +		/*
> +		 * Keep compatbility with device trees that don't have an
> +		 * interconnect-names property.
> +		 */
> +		gpu->icc_path = of_icc_get(dev, NULL);
> +	}
>  	if (IS_ERR(gpu->icc_path))
>  		gpu->icc_path = NULL;
>  
> +	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> +	if (IS_ERR(gpu->ocmem_icc_path))
> +		gpu->ocmem_icc_path = NULL;
> +
>  	return 0;
>  }
>  
> @@ -977,6 +988,7 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
>  		release_firmware(adreno_gpu->fw[i]);
>  
>  	icc_put(gpu->icc_path);
> +	icc_put(gpu->ocmem_icc_path);
>  
>  	msm_gpu_cleanup(&adreno_gpu->base);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index ab8f0f9c9dc8..be5bc2e8425c 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -111,8 +111,15 @@ struct msm_gpu {
>  	struct clk *ebi1_clk, *core_clk, *rbbmtimer_clk;
>  	uint32_t fast_rate;
>  
> +	/* The gfx-mem interconnect path that's used by all GPU types. */
>  	struct icc_path *icc_path;
>  
> +	/*
> +	 * Second interconnect path for some A3xx and all A4xx GPUs to the
> +	 * On Chip MEMory (OCMEM).
> +	 */
> +	struct icc_path *ocmem_icc_path;
> +
>  	/* Hang and Inactivity Detection:
>  	 */
>  #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
> -- 
> 2.21.0
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

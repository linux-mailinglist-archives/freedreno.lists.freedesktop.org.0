Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC321F589
	for <lists+freedreno@lfdr.de>; Tue, 14 Jul 2020 16:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6810E6E1CD;
	Tue, 14 Jul 2020 14:57:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7FE6E1CD
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jul 2020 14:57:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594738661; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=rPT/6bcoi+yeld8ZbjkMYo22+/QxPs1ApgbqbZ3wZM8=;
 b=JDJFnXyXUkQRLbGbzngtXOSRPHC1UIqqmeBqdU6a1gajATHMgniLfUAo6tXq+PhyET1jG5am
 zK/7tAQkY08/szoqxGIbUHflpmtgGvCHtGZZ2G9ZLqfbxA9dZHUBmKsUiJlEOJN04sJfOLWa
 A83RCId9fhmbsteFedbpbqz27R0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5f0dc7d6ee86618575552739 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 14:57:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B6DD1C433CA; Tue, 14 Jul 2020 14:57:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C80EC433C8;
 Tue, 14 Jul 2020 14:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9C80EC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 14 Jul 2020 08:57:21 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <20200714145721.GD24345@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Akhil P Oommen <akhilpo@codeaurora.org>,
 freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, mka@chromium.org, jonathan@marek.ca,
 robdclark@gmail.com, rnayak@codeaurora.org
References: <1594733130-398-1-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594733130-398-1-git-send-email-akhilpo@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH] drm: msm: a6xx: fix gpu failure after
 system resume
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
Cc: devicetree@vger.kernel.org, rnayak@codeaurora.org, jonathan@marek.ca,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, mka@chromium.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 06:55:30PM +0530, Akhil P Oommen wrote:
> On targets where GMU is available, GMU takes over the ownership of GX GDSC
> during its initialization. So, take a refcount on the GX PD on behalf of
> GMU before we initialize it. This makes sure that nobody can collapse the
> GX GDSC once GMU owns the GX GDSC. This patch fixes some weird failures
> during GPU wake up during system resume.

The change looks fine but this explanation is confusing. When I read it I
thought "oh, man, we weren't taking a reference to the GX PD during resume???"
but that's not really the case. We *are* taking a reference, just not soon
enough to avoid possible issues. It would be helpful if you reworded this to
explain that you are moving the reference and perhaps to shine a bit more light
on what the "weird" failures are.

Jordan

> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index a6f43ff..5b2df7d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -873,10 +873,19 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  	/* Turn on the resources */
>  	pm_runtime_get_sync(gmu->dev);
>  
> +	/*
> +	 * "enable" the GX power domain which won't actually do anything but it
> +	 * will make sure that the refcounting is correct in case we need to
> +	 * bring down the GX after a GMU failure
> +	 */
> +	if (!IS_ERR_OR_NULL(gmu->gxpd))
> +		pm_runtime_get_sync(gmu->gxpd);
> +
>  	/* Use a known rate to bring up the GMU */
>  	clk_set_rate(gmu->core_clk, 200000000);
>  	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
>  	if (ret) {
> +		pm_runtime_put(gmu->gxpd);
>  		pm_runtime_put(gmu->dev);
>  		return ret;
>  	}
> @@ -919,19 +928,12 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  	/* Set the GPU to the current freq */
>  	a6xx_gmu_set_initial_freq(gpu, gmu);
>  
> -	/*
> -	 * "enable" the GX power domain which won't actually do anything but it
> -	 * will make sure that the refcounting is correct in case we need to
> -	 * bring down the GX after a GMU failure
> -	 */
> -	if (!IS_ERR_OR_NULL(gmu->gxpd))
> -		pm_runtime_get(gmu->gxpd);
> -
>  out:
>  	/* On failure, shut down the GMU to leave it in a good state */
>  	if (ret) {
>  		disable_irq(gmu->gmu_irq);
>  		a6xx_rpmh_stop(gmu);
> +		pm_runtime_put(gmu->gxpd);
>  		pm_runtime_put(gmu->dev);
>  	}
>  
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

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473DF1B60A0
	for <lists+freedreno@lfdr.de>; Thu, 23 Apr 2020 18:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34E26E8F9;
	Thu, 23 Apr 2020 16:21:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1456E95A
 for <freedreno@lists.freedesktop.org>; Thu, 23 Apr 2020 16:21:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587658896; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=/ec5W44u9De0++LHrjQhntfIZazSbxcz9iOGmXSVsp0=;
 b=irRA8AaTa8+1iFUi9Bz1qIEwzG5HPnOsA9/gAUjRxP5+aw+yHSHJvSBotaUCjY4N9OGvqTco
 5dL28+92RfqL6nzEbpbZ9f1fY5WLazNwTKwu3xRu0ItMdu4fDdtXWn+8WJ3/LyRyfU1Svr8o
 d3SuFo9WHs3tkuf9IB0Om3jX5eU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea1c08e.7f279c612030-smtp-out-n05;
 Thu, 23 Apr 2020 16:21:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ABF79C432C2; Thu, 23 Apr 2020 16:21:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 48D2DC433BA;
 Thu, 23 Apr 2020 16:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48D2DC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 23 Apr 2020 10:21:30 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Message-ID: <20200423162130.GA23271@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200421234127.27965-1-jonathan@marek.ca>
 <20200421234127.27965-9-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421234127.27965-9-jonathan@marek.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH v2 8/9] drm/msm/a6xx: enable GMU log
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 07:41:26PM -0400, Jonathan Marek wrote:
> This is required for a650 to work.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 15 +++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |  4 ++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 60ed5360fd8a..f24e436daafe 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -201,6 +201,12 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
>  	u32 val;
>  
>  	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
> +
> +	/* Set the log wptr index
> +	 * note: downstream saves the value in poweroff and restores it here
> +	 */
> +	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP, 0);
> +
>  	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
>  
>  	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
> @@ -740,6 +746,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  
>  	gmu_write(gmu, REG_A6XX_GMU_HFI_SFR_ADDR, chipid);
>  
> +	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG,
> +		  gmu->log.iova | (gmu->log.size / SZ_4K - 1));
> +
>  	/* Set up the lowest idle level on the GMU */
>  	a6xx_gmu_power_config(gmu);
>  
> @@ -1046,6 +1055,7 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
>  	msm_gem_kernel_put(gmu->icache.obj, gmu->aspace, false);
>  	msm_gem_kernel_put(gmu->dcache.obj, gmu->aspace, false);
>  	msm_gem_kernel_put(gmu->dummy.obj, gmu->aspace, false);
> +	msm_gem_kernel_put(gmu->log.obj, gmu->aspace, false);
>  
>  	gmu->aspace->mmu->funcs->detach(gmu->aspace->mmu);
>  	msm_gem_address_space_put(gmu->aspace);
> @@ -1450,6 +1460,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	if (ret)
>  		goto err_memory;
>  
> +	/* Allocate memory for the GMU log region */
> +	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_4K, 0);
> +	if (ret)
> +		goto err_memory;
> +
>  	/* Map the GMU registers */
>  	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
>  	if (IS_ERR(gmu->mmio)) {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index aed02b2b7659..be65720f32cf 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -61,6 +61,7 @@ struct a6xx_gmu {
>  	struct a6xx_gmu_bo icache;
>  	struct a6xx_gmu_bo dcache;
>  	struct a6xx_gmu_bo dummy;
> +	struct a6xx_gmu_bo log;
>  
>  	int nr_clocks;
>  	struct clk_bulk_data *clocks;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> index b4357ea550ec..176ae94d9fe6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> @@ -205,6 +205,10 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
>  
>  #define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
>  
> +#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG			0x00005100
> +
> +#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP			0x00005101
> +
>  #define REG_A6XX_GMU_BOOT_KMD_LM_HANDSHAKE			0x000051f0
>  
>  #define REG_A6XX_GMU_LLM_GLM_SLEEP_CTRL				0x00005157
> -- 
> 2.26.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

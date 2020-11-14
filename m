Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B332B2E67
	for <lists+freedreno@lfdr.de>; Sat, 14 Nov 2020 17:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E84D6E929;
	Sat, 14 Nov 2020 16:22:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00DA6E929;
 Sat, 14 Nov 2020 16:22:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B112867373; Sat, 14 Nov 2020 17:21:59 +0100 (CET)
Date: Sat, 14 Nov 2020 17:21:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jonathan Marek <jonathan@marek.ca>
Message-ID: <20201114162159.GB24411@lst.de>
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-4-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201114151717.5369-4-jonathan@marek.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Freedreno] [RESEND PATCH v2 3/5] drm/msm: call
 dma_direct_bypass()
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
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 10:17:11AM -0500, Jonathan Marek wrote:
> Always use direct dma ops and no swiotlb.
> 
> Note: arm-smmu-qcom already avoids creating iommu dma ops, but not
> everything uses arm-smmu-qcom and this also sets the dma mask.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/Kconfig   | 1 +
>  drivers/gpu/drm/msm/msm_drv.c | 8 +++++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index e5816b498494..07c50405970a 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -20,6 +20,7 @@ config DRM_MSM
>  	select SND_SOC_HDMI_CODEC if SND_SOC
>  	select SYNC_FILE
>  	select PM_OPP
> +	select DMA_OPS_BYPASS
>  	help
>  	  DRM/KMS driver for MSM/snapdragon.
>  
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 49685571dc0e..bae48afca82e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/dma-mapping.h>
> +#include <linux/dma-direct.h>
>  #include <linux/kthread.h>
>  #include <linux/uaccess.h>
>  #include <uapi/linux/sched/types.h>
> @@ -1288,10 +1289,11 @@ static int msm_pdev_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto fail;
>  
> -	/* on all devices that I am aware of, iommu's which can map
> -	 * any address the cpu can see are used:
> +	/* always use direct dma ops and no swiotlb

Again, and implementation detail.  Comments should not explain details
obvious from the code (especially layers away) but the intent.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

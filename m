Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD23299383
	for <lists+freedreno@lfdr.de>; Mon, 26 Oct 2020 18:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B2A6E28B;
	Mon, 26 Oct 2020 17:15:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8D06E177
 for <freedreno@lists.freedesktop.org>; Mon, 26 Oct 2020 17:15:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603732550; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ubLgLNz4mruxjMMlVTL1wQFtrF+CIhu/zLVlKRGmGmg=;
 b=P1MUhQshFGln03JF1qekU80WgV2YsRPMZiBs0oPncWNJuGfqqjBGRK5VBgv8Z8xkP2e1ocXV
 Zp8YXtokFahwKLOK45+fPUeIqIQcNTyInFzsd6FN9vyNDp0fX7vibyS9L+ycLK+N9U6AZthV
 DkTyKxusSwLaMy8Fp8sTzzGDuj8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f97043e6b827c4eef6341e3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 17:15:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D543AC4339C; Mon, 26 Oct 2020 17:15:42 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 72C2CC433F0;
 Mon, 26 Oct 2020 17:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72C2CC433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 26 Oct 2020 11:15:37 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <20201026171537.GA23509@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>,
 iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 freedreno@lists.freedesktop.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 dri-devel@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <cover.1603448364.git.saiprakash.ranjan@codeaurora.org>
 <863b0eb175fb2a4ebfefca09344e0055722190cf.1603448364.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <863b0eb175fb2a4ebfefca09344e0055722190cf.1603448364.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCHv6 3/6] drm/msm: rearrange the gpu_rmw()
 function
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
Cc: freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Akhil P Oommen <akhilpo@codeaurora.org>,
 linux-arm-msm@vger.kernel.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Sharat Masetty <smasetty@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 05:24:02PM +0530, Sai Prakash Ranjan wrote:
> From: Sharat Masetty <smasetty@codeaurora.org>
> 
> The register read-modify-write construct is generic enough
> that it can be used by other subsystems as needed, create
> a more generic rmw() function and have the gpu_rmw() use
> this new function.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Rob - this should be safe to pull with msm-next regardless of the merge status
of the iommu side of things. Hopefully everything will be pulled for 5.11 but if
it isn't it would be good to get this out of the cycle.

Jordan

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 8 ++++++++
>  drivers/gpu/drm/msm/msm_drv.h | 1 +
>  drivers/gpu/drm/msm/msm_gpu.h | 5 +----
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 49685571dc0e..a1e22b974b77 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -180,6 +180,14 @@ u32 msm_readl(const void __iomem *addr)
>  	return val;
>  }
>  
> +void msm_rmw(void __iomem *addr, u32 mask, u32 or)
> +{
> +	u32 val = msm_readl(addr);
> +
> +	val &= ~mask;
> +	msm_writel(val | or, addr);
> +}
> +
>  struct msm_vblank_work {
>  	struct work_struct work;
>  	int crtc_id;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index b9dd8f8f4887..655b3b0424a1 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -478,6 +478,7 @@ void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
>  		const char *dbgname);
>  void msm_writel(u32 data, void __iomem *addr);
>  u32 msm_readl(const void __iomem *addr);
> +void msm_rmw(void __iomem *addr, u32 mask, u32 or);
>  
>  struct msm_gpu_submitqueue;
>  int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 6c9e1fdc1a76..b2b419277953 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -246,10 +246,7 @@ static inline u32 gpu_read(struct msm_gpu *gpu, u32 reg)
>  
>  static inline void gpu_rmw(struct msm_gpu *gpu, u32 reg, u32 mask, u32 or)
>  {
> -	uint32_t val = gpu_read(gpu, reg);
> -
> -	val &= ~mask;
> -	gpu_write(gpu, reg, val | or);
> +	msm_rmw(gpu->mmio + (reg << 2), mask, or);
>  }
>  
>  static inline u64 gpu_read64(struct msm_gpu *gpu, u32 lo, u32 hi)
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

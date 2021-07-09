Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA443C2004
	for <lists+freedreno@lfdr.de>; Fri,  9 Jul 2021 09:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2507F6E9C4;
	Fri,  9 Jul 2021 07:28:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302856E9C4
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jul 2021 07:28:32 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4GLlBk1mNmz4x4yN;
 Fri,  9 Jul 2021 07:28:30 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="WIEBp5X3"
Date: Fri, 09 Jul 2021 07:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1625815705;
 bh=RkfvnmLdaWZqZxjDUvmzYCOv0xZV2QzxYSVXkQHzzbM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=WIEBp5X3N39INqaynv4SEqwjar9wa/XWQet0WZeAlFZ25c9ng3WZ/q0o2y/NV3exc
 NORKsapydxEGEGLq5saeDxHg5xAuxF/ic2EPr0prdJjWT1h6bW315BdRxKwEKxWTwx
 ZkM6uaw18g5BZZzw/HvNNDDvMUbCYLoI8SHtLOe0=
To: Rob Clark <robdclark@gmail.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Message-ID: <3pFCrTgsGtxAZ1a2xns0dgqCOz61HZr4foJlLOl1l3I@cp4-web-034.plabs.ch>
In-Reply-To: <20210707180113.840741-1-robdclark@gmail.com>
References: <20210707180113.840741-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix display fault handling
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 John Stultz <john.stultz@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On Wed, Jul 7 2021 at 21:57:05 +0400, Rob Clark <robdclark@gmail.com> 
wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> It turns out that when the display is enabled by the bootloader, we 
> can
> get some transient iommu faults from the display.  Which doesn't go 
> over
> too well when we install a fault handler that is gpu specific.  To 
> avoid
> this, defer installing the fault handler until we get around to 
> setting
> up per-process pgtables (which is adreno_smmu specific).  The arm-smmu
> fallback error reporting is sufficient for reporting display related
> faults (and in fact was all we had prior to 
> f8f934c180f629bb927a04fd90d)
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Fixes: 2a574cc05d38 ("drm/msm: Improve the a6xx page fault handler")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c 
> b/drivers/gpu/drm/msm/msm_iommu.c
> index eed2a762e9dd..bcaddbba564d 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -142,6 +142,9 @@ static const struct iommu_flush_ops null_tlb_ops 
> = {
>  	.tlb_add_page = msm_iommu_tlb_add_page,
>  };
> 
> +static int msm_fault_handler(struct iommu_domain *domain, struct 
> device *dev,
> +		unsigned long iova, int flags, void *arg);
> +
>  struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
>  {
>  	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
> @@ -157,6 +160,13 @@ struct msm_mmu 
> *msm_iommu_pagetable_create(struct msm_mmu *parent)
>  	if (!ttbr1_cfg)
>  		return ERR_PTR(-ENODEV);
> 
> +	/*
> +	 * Defer setting the fault handler until we have a valid adreno_smmu
> +	 * to avoid accidentially installing a GPU specific fault handler 
> for
> +	 * the display's iommu
> +	 */
> +	iommu_set_fault_handler(iommu->domain, msm_fault_handler, iommu);
> +
>  	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
>  	if (!pagetable)
>  		return ERR_PTR(-ENOMEM);
> @@ -300,7 +310,6 @@ struct msm_mmu *msm_iommu_new(struct device *dev, 
> struct iommu_domain *domain)
> 
>  	iommu->domain = domain;
>  	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
> -	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
> 
>  	atomic_set(&iommu->pagetables, 0);
> 
> --
> 2.31.1
> 

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>



_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

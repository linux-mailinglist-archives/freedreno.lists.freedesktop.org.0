Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C8C1B5F1C
	for <lists+freedreno@lfdr.de>; Thu, 23 Apr 2020 17:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1276E8D7;
	Thu, 23 Apr 2020 15:26:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93006E8D6
 for <freedreno@lists.freedesktop.org>; Thu, 23 Apr 2020 15:26:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587655574; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=9wQ2DyfHn0zQSPKWH0MRTyykuPGkgNXnO6TKfK9XPEc=;
 b=U8H1PRidACnRzdCp293EUATumday7GyZNzyn3WRY11XoMWgAFfKTXnSfOoB9g18796SqYm6+
 i3iQ9ULCDHZOg2zx85XhoIWM7GkiObEiWVyU8cEw94PffUhKuc3DMMM4+XMrXPpiHh0RTUYo
 hBFXUxWIyhE3D0Z0YAFjbAcmzMo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea1b387.7fe426464b58-smtp-out-n01;
 Thu, 23 Apr 2020 15:25:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 81425C433D2; Thu, 23 Apr 2020 15:25:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 04D96C433F2;
 Thu, 23 Apr 2020 15:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 04D96C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 23 Apr 2020 09:25:55 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Message-ID: <20200423152555.GA32401@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
References: <20200421234127.27965-1-jonathan@marek.ca>
 <20200421234127.27965-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421234127.27965-3-jonathan@marek.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH v2 2/9] drm/msm: add internal
 MSM_BO_MAP_PRIV flag
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 07:41:20PM -0400, Jonathan Marek wrote:
> This flag sets IOMMU_PRIV, which is required for some a6xx GMU objects.

The GMU doesn't _need_  privileged surfaces, but it sure is a good idea.
As a bonus with the APRIV bit on some a6xx targets we can set all of the
global buffers as privileged so people can't go out and overwrite the memstore
any more.

Reviewed-by: Jordan Crouse <jcrouse@codeauorora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 3 +++
>  drivers/gpu/drm/msm/msm_gem.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index d8f56a34c117..6277fde13df9 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -428,6 +428,9 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
>  	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
>  		prot |= IOMMU_WRITE;
>  
> +	if (msm_obj->flags & MSM_BO_MAP_PRIV)
> +		prot |= IOMMU_PRIV;
> +
>  	WARN_ON(!mutex_is_locked(&msm_obj->lock));
>  
>  	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 30584eaf8cc8..972490b14ba5 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -13,6 +13,7 @@
>  
>  /* Additional internal-use only BO flags: */
>  #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
> +#define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
>  
>  struct msm_gem_address_space {
>  	const char *name;
> -- 
> 2.26.1
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16653275AC0
	for <lists+freedreno@lfdr.de>; Wed, 23 Sep 2020 16:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6086E9C9;
	Wed, 23 Sep 2020 14:51:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D0C6E9BB
 for <freedreno@lists.freedesktop.org>; Wed, 23 Sep 2020 14:51:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600872712; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=vkxHpFKBJvKP4A5LtaVO3IzTyiPbLXjaRDFxfcx8I48=;
 b=pGMYoS+dIugTPmqwQkc22H4b62yIdRa7ZMM6OqD34dZqIVXBBEfrq3tedJxtG7XosGW5Mxbd
 r6PGf01GpPT96sn+nz+Lw5d15Y/e+nDAKxe8r2+xMd1f6nMMOIm65xIxsGkhRsGC6AHuvl00
 et7bRR4SsGGBhmoEoxszygAxq3I=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f6b6107429250c1dd8fde0e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Sep 2020 14:51:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 916C4C433FE; Wed, 23 Sep 2020 14:51:51 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 22AA7C433CB;
 Wed, 23 Sep 2020 14:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 22AA7C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Wed, 23 Sep 2020 08:51:47 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <20200923145146.GC31425@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Akhil P Oommen <akhilpo@codeaurora.org>,
 freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mka@chromium.org, jonathan@marek.ca, robdclark@gmail.com,
 dianders@chromium.org
References: <1600786527-7343-1-git-send-email-akhilpo@codeaurora.org>
 <1600786527-7343-2-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600786527-7343-2-git-send-email-akhilpo@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm: Leave inuse count intact on
 map failure
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
Cc: jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org, robdclark@gmail.com,
 mka@chromium.org, dri-devel@freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 08:25:27PM +0530, Akhil P Oommen wrote:
> Leave the inuse count intact on map failure to keep the accounting
> accurate.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 80a8a26..f914ddb 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -88,8 +88,10 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
>  		ret = aspace->mmu->funcs->map(aspace->mmu, vma->iova, sgt,
>  				size, prot);
>  
> -	if (ret)
> +	if (ret) {
>  		vma->mapped = false;
> +		vma->inuse--;
> +	}
>  
>  	return ret;
>  }
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

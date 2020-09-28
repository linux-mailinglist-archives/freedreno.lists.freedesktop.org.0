Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F74927B1BB
	for <lists+freedreno@lfdr.de>; Mon, 28 Sep 2020 18:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F0089DD8;
	Mon, 28 Sep 2020 16:21:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F7989DD8
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 16:21:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601310073; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=Sm53MN0Nsth9oBSfppoCnKROL+IxuKurKYR4irdjh7s=;
 b=iMocCOMrmQHBOGkqc4rBW7qV/HHjU7eilD+74usGmDRB1CCR8Yy3wu3vlRAXfIIEtRHzuC/Q
 LYPoV7LNtLqSAEdMMBu5DR0MVeh2RNvQMza0kwpUZElpyoJTKqBLFac4GbuyHz8r8ltApGYg
 mQmDALMi27+5daFJ7slgim5cAjs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f720d780f8c6dd7d232b0f5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 16:21:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AADCBC433F1; Mon, 28 Sep 2020 16:21:12 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 34D45C433CA;
 Mon, 28 Sep 2020 16:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 34D45C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 28 Sep 2020 10:21:08 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: kholk11@gmail.com
Message-ID: <20200928162107.GC29832@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: kholk11@gmail.com, robdclark@gmail.com, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, konradybcio@gmail.com,
 marijns95@gmail.com, martin.botka1@gmail.com,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200926125146.12859-1-kholk11@gmail.com>
 <20200926125146.12859-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200926125146.12859-2-kholk11@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH 1/7] drm/msm/a5xx: Remove overwriting
 A5XX_PC_DBG_ECO_CNTL register
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
Cc: freedreno@lists.freedesktop.org, marijns95@gmail.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konradybcio@gmail.com,
 linux-kernel@vger.kernel.org, martin.botka1@gmail.com, robdclark@gmail.com,
 daniel@ffwll.ch, phone-devel@vger.kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Sep 26, 2020 at 02:51:40PM +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> The PC_DBG_ECO_CNTL register on the Adreno A5xx family gets
> programmed to some different values on a per-model basis.
> At least, this is what we intend to do here;
> 
> Unfortunately, though, this register is being overwritten with a
> static magic number, right after applying the GPU-specific
> configuration (including the GPU-specific quirks) and that is
> effectively nullifying the efforts.
> 
> Let's remove the redundant and wrong write to the PC_DBG_ECO_CNTL
> register in order to retain the wanted configuration for the
> target GPU.

This was probably inherited from downstream which doesn't mind RMWing the same
register multiple times.


Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 91726da82ed6..6262603e6e2e 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -594,8 +594,6 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
>  		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
>  
> -	gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0xc0200100);
> -
>  	/* Enable USE_RETENTION_FLOPS */
>  	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
>  
> -- 
> 2.28.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

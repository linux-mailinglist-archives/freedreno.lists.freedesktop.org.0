Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105FA27B1CE
	for <lists+freedreno@lfdr.de>; Mon, 28 Sep 2020 18:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D5789DF7;
	Mon, 28 Sep 2020 16:26:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD1B89DF7
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 16:26:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601310362; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=oUdEYLO/LBcwhMGcfeLJRSq6/QgcQ4bl42FimYBDM60=;
 b=w92GyBA6Nncj2XItQL6s4BoDefavm+VyWiBCxB0IZp3tSR4b6UV0IiA+YsfnoaqA07UykP1r
 RFNmlgvFGOqjQd7CeiEyQpn34mX3bKnjlH/c1Qr+bNcT7/wF+iws/KF2ASlr7Q940i7T6wRe
 3FG1VmbOb2FSuUYBUHkYKszQpUs=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f720e99f38f205ebcc34a83 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 16:26:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DAA40C433CB; Mon, 28 Sep 2020 16:26:00 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 22B0FC433CA;
 Mon, 28 Sep 2020 16:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 22B0FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 28 Sep 2020 10:25:56 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: kholk11@gmail.com
Message-ID: <20200928162555.GF29832@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: kholk11@gmail.com, robdclark@gmail.com, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, konradybcio@gmail.com,
 marijns95@gmail.com, martin.botka1@gmail.com,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200926125146.12859-1-kholk11@gmail.com>
 <20200926125146.12859-5-kholk11@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200926125146.12859-5-kholk11@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/a5xx: Reset VBIF before PC only
 on A510 and A530
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

On Sat, Sep 26, 2020 at 02:51:43PM +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Resetting the VBIF before power collapse is done to avoid getting
> bogus FIFO entries during the suspend sequence or subsequent resume,
> but this is doable only on Adreno 510 and Adreno 530, as the other
> units will tendentially lock up.
> Especially on Adreno 508, the GPU will show lockups and very bad
> slownesses after processing the first frame.
> 
> Avoiding to execute the RBBM SW Reset before suspend will stop the
> lockup issue from happening on at least Adreno 508/509/512.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 9bcbf6cd5a28..00df5de3c8e3 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1306,10 +1306,12 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
>  
>  	/*
>  	 * Reset the VBIF before power collapse to avoid issue with FIFO
> -	 * entries
> +	 * entries on Adreno A510 and A530 (the others will tend to lock up)
>  	 */
> -	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
> -	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
> +	if (adreno_is_a510(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
> +		gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
> +		gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
> +	}
>  
>  	return msm_gpu_pm_suspend(gpu);
>  }
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

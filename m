Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 247BD2ADEAD
	for <lists+freedreno@lfdr.de>; Tue, 10 Nov 2020 19:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B7189BA5;
	Tue, 10 Nov 2020 18:46:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2CD89BA1
 for <freedreno@lists.freedesktop.org>; Tue, 10 Nov 2020 18:46:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605033991; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=YLcdxeCasqNEXg1KAsdy2Xe/sm4z0ubzkMfFT7hdJBs=;
 b=nl7Agx0NzewjofITqdtCdWIFwSrD054je+gK9ECu/pBnKlFgW4aMzdihWlYuoa+aiu2r1THF
 1bvUOUYnUZuQQ/iIgYs9oFxaxA/YGKlWihBWIBQ7u24OCtkHugJebtsUCbMJueEkdKXv3Fdd
 DloPxI56+d1gpQwmQaOIT2KZPL8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5faae006b8c6a84a5c6b4b2d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Nov 2020 18:46:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5FF1BC433C6; Tue, 10 Nov 2020 18:46:29 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B80D2C433C8;
 Tue, 10 Nov 2020 18:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B80D2C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 10 Nov 2020 11:46:24 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20201110184624.GB2661@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Eric Anholt <eric@anholt.net>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20201110184401.282982-1-robdclark@gmail.com>
 <20201110184401.282982-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110184401.282982-2-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/a5xx: Clear shadow on suspend
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 10:44:00AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Similar to the previous patch, clear shadow on suspend to avoid timeouts
> waiting for ringbuffer space.
> 
> Fixes: 8907afb476ac ("drm/msm: Allow a5xx to mark the RPTR shadow as privileged")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index b0005ccd81c6..8fa5c917d017 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1206,7 +1206,9 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
>  static int a5xx_pm_suspend(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
>  	u32 mask = 0xf;
> +	int i, ret;
>  
>  	/* A510 has 3 XIN ports in VBIF */
>  	if (adreno_is_a510(adreno_gpu))
> @@ -1226,7 +1228,15 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
>  	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
>  
> -	return msm_gpu_pm_suspend(gpu);
> +	ret = msm_gpu_pm_suspend(gpu);
> +	if (ret)
> +		return ret;
> +
> +	if (a5xx_gpu->has_whereami)
> +		for (i = 0; i < gpu->nr_rings; i++)
> +			a5xx_gpu->shadow[i] = 0;
> +
> +	return 0;
>  }
>  
>  static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
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

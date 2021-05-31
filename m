Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB8139632E
	for <lists+freedreno@lfdr.de>; Mon, 31 May 2021 17:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C4B6E946;
	Mon, 31 May 2021 15:06:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28286E945
 for <freedreno@lists.freedesktop.org>; Mon, 31 May 2021 15:06:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622473586; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FpwCQzbxxmTztD+IGG6UfeVWw9QiTo3NWz7pTi0L4w8=;
 b=fNR7SkuWebs9r92FvTTpmjW9JgCbsxp7BP5AC67SsRUYmBZOBMvR/pooPng6CHKsOTBnYqPd
 u/bmvtvSfPR7fFhBxi7A4kY1pXABajvm4/Y1pl5tpJmCj60rM8oPCjlf58pBhGbWl2/H/0Qj
 8WsXcgSb/iBrozApgxgIeamTIgs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60b4fb6be27c0cc77f1acd7c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 May 2021 15:06:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AD5F6C43145; Mon, 31 May 2021 15:06:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [117.210.184.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 62AFAC433D3;
 Mon, 31 May 2021 15:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62AFAC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20210513171431.18632-1-jonathan@marek.ca>
 <20210513171431.18632-8-jonathan@marek.ca>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <cf60548e-03ae-6a13-2449-9a981a7ab84e@codeaurora.org>
Date: Mon, 31 May 2021 20:36:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210513171431.18632-8-jonathan@marek.ca>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH v2 7/8] drm/msm/a6xx: update
 a6xx_ucode_check_version for a660
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 5/13/2021 10:44 PM, Jonathan Marek wrote:
> Accept all SQE firmware versions for A660.
> 
> Re-organize the function a bit and print an error message for unexpected
> GPU IDs instead of failing silently.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 36 +++++++++++++--------------
>   1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 3cc23057b11d..ec66a24fc37e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -697,6 +697,11 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>   	 * Targets up to a640 (a618, a630 and a640) need to check for a
>   	 * microcode version that is patched to support the whereami opcode or
>   	 * one that is new enough to include it by default.
> +	 *
> +	 * a650 tier targets don't need whereami but still need to be
> +	 * equal to or newer than 0.95 for other security fixes
> +	 *
> +	 * a660 targets have all the critical security fixes from the start
>   	 */
>   	if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
>   		adreno_is_a640(adreno_gpu)) {
> @@ -720,27 +725,20 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>   		DRM_DEV_ERROR(&gpu->pdev->dev,
>   			"a630 SQE ucode is too old. Have version %x need at least %x\n",
>   			buf[0] & 0xfff, 0x190);
> -	}  else {
> -		/*
> -		 * a650 tier targets don't need whereami but still need to be
> -		 * equal to or newer than 0.95 for other security fixes
> -		 */
> -		if (adreno_is_a650(adreno_gpu)) {
> -			if ((buf[0] & 0xfff) >= 0x095) {
> -				ret = true;
> -				goto out;
> -			}
> -
> -			DRM_DEV_ERROR(&gpu->pdev->dev,
> -				"a650 SQE ucode is too old. Have version %x need at least %x\n",
> -				buf[0] & 0xfff, 0x095);
> +	} else if (adreno_is_a650(adreno_gpu)) {
> +		if ((buf[0] & 0xfff) >= 0x095) {
> +			ret = true;
> +			goto out;
>   		}
>   
> -		/*
> -		 * When a660 is added those targets should return true here
> -		 * since those have all the critical security fixes built in
> -		 * from the start
> -		 */
> +		DRM_DEV_ERROR(&gpu->pdev->dev,
> +			"a650 SQE ucode is too old. Have version %x need at least %x\n",
> +			buf[0] & 0xfff, 0x095);
> +	} else if (adreno_is_a660(adreno_gpu)) {
> +		ret = true;
> +	} else {
> +		DRM_DEV_ERROR(&gpu->pdev->dev,
> +			"unknown GPU, add it to a6xx_ucode_check_version()!!\n");
>   	}
>   out:
>   	msm_gem_put_vaddr(obj);
> 

Can we squash this patch with the previous one?

-Akhil.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

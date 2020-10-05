Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA59283771
	for <lists+freedreno@lfdr.de>; Mon,  5 Oct 2020 16:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D996089CD5;
	Mon,  5 Oct 2020 14:15:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1580289CD5
 for <freedreno@lists.freedesktop.org>; Mon,  5 Oct 2020 14:15:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601907356; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=7+9sy5387KDfKiSHXKJcAV2tR//pM2tEdkjRQAzZ5Yw=;
 b=rXZH4zNAKVLtiQdAQjZA7Bhma1Rh9GkUrCFJnsX5r72/tcQFBQmncO/yf6nj9t83T03pclBZ
 Zh43zc5XzJ5kKw8fPih8hRAETHvSREZMLzKDXHSA+fdFgTr7b+foZPQhqAGnYEdPa9i4vWW/
 gdjxBWuzRfdei0IrfAjKjzOslFI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f7b2a9683370fa1c1fa90b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 14:15:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6D9E7C433CB; Mon,  5 Oct 2020 14:15:50 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C62D0C433C8;
 Mon,  5 Oct 2020 14:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C62D0C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 5 Oct 2020 08:15:44 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20201005141543.GA4204@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201004192152.3298573-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201004192152.3298573-3-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH 02/14] drm/msm: Drop chatty trace
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, Oct 04, 2020 at 12:21:34PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> It is somewhat redundant with the gpu tracepoints, and anyways not too
> useful to justify spamming the log when debug traces are enabled.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 55d16489d0f3..31fce3ac0cdc 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -535,7 +535,6 @@ static void recover_worker(struct work_struct *work)
>  
>  static void hangcheck_timer_reset(struct msm_gpu *gpu)
>  {
> -	DBG("%s", gpu->name);
>  	mod_timer(&gpu->hangcheck_timer,
>  			round_jiffies_up(jiffies + DRM_MSM_HANGCHECK_JIFFIES));
>  }
> -- 
> 2.26.2
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

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E461F421AB3
	for <lists+freedreno@lfdr.de>; Tue,  5 Oct 2021 01:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5600E6E991;
	Mon,  4 Oct 2021 23:33:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5C06EAB6
 for <freedreno@lists.freedesktop.org>; Mon,  4 Oct 2021 23:32:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633390377; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=N0Lm93LT7QNg1MNSBSoacIBhLBmQwpQUMR9ztlqn3eU=;
 b=LyYyIUcHboj/J8lHIdvSPdGV84aRcYwDzsTcnfd1WsCyG7H0BJEn4Slt3ZFQktnQyu3hKztc
 URFOzH6xovJNPI8VFvULDmBnivrhxQWVPLq+BR6HjqALI7gJ0vfTnN3V2yGcJl3asHlkCC3/
 E77VZvDmytbix0zqJaFLY6cv29c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 615b8f2147d64efb6d7b0467 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 23:32:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EE862C4360C; Mon,  4 Oct 2021 23:32:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 34CC4C4338F;
 Mon,  4 Oct 2021 23:32:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 04 Oct 2021 16:32:48 -0700
From: abhinavk@codeaurora.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd
 <swboyd@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Lee
 Jones <lee.jones@linaro.org>, Jeykumar Sankaran <jsanka@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>, Jordan Crouse
 <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <20211004134721.GD11689@kili>
References: <20211004134721.GD11689@kili>
Message-ID: <78c418eef8881553e223fdc39b1e6b84@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH] drm/msm/disp: fix endian bug in debugfs code
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-10-04 06:47, Dan Carpenter wrote:
> The "vbif->features" is type unsigned long but the debugfs file
> is treating it as a u32 type.  This will work in little endian
> systems, but the correct thing is to change the debugfs to use
> an unsigned long.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> You might wonder why this code has so many casts.  It's required 
> because
> this data is const.  Which is fine because the file is read only.
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> index 21d20373eb8b..e645a886e3c6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> @@ -305,8 +305,8 @@ void dpu_debugfs_vbif_init(struct dpu_kms
> *dpu_kms, struct dentry *debugfs_root)
> 
>  		debugfs_vbif = debugfs_create_dir(vbif_name, entry);
> 
> -		debugfs_create_u32("features", 0600, debugfs_vbif,
> -			(u32 *)&vbif->features);
> +		debugfs_create_ulong("features", 0600, debugfs_vbif,
> +				     (unsigned long *)&vbif->features);
> 
>  		debugfs_create_u32("xin_halt_timeout", 0400, debugfs_vbif,
>  			(u32 *)&vbif->xin_halt_timeout);

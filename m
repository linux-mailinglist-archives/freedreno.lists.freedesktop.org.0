Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB052C1737
	for <lists+freedreno@lfdr.de>; Mon, 23 Nov 2020 22:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5636E0DA;
	Mon, 23 Nov 2020 21:06:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F413B6E0DB
 for <freedreno@lists.freedesktop.org>; Mon, 23 Nov 2020 21:06:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606165612; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=pVDvnBZoRhuxsGugrA9S3QxKjdkQCI4rMRDzzBJfqdg=;
 b=F9GdK+rMihKSGxfC2/VsUU5rBNhe6p0MBYLt2tnr6YLfyNUCd1HRQjgGVo9aaVTjZnlXcsn6
 gIiwhR949FgE2B68MHsmHvUWDlFal66nXEM4g56QMqeITEywqUUtQjEWK/TxBHToAGBnThux
 wOWMrBnaRviAAgQutsKhtH1tzYE=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fbc246bd64ea0b7030e47c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:06:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E3BF3C43462; Mon, 23 Nov 2020 21:06:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A11C0C433C6;
 Mon, 23 Nov 2020 21:06:49 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 13:06:49 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-12-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-12-lee.jones@linaro.org>
Message-ID: <bd9e7b914116e49b60b082fe40daf78c@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 11/40] drm/msm/disp/dpu1/dpu_hw_blk: Add one
 missing and remove an extra param description
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2020-11-23 03:18, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c:28: warning: Function
> parameter or member 'hw_blk' not described in 'dpu_hw_blk_init'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c:120: warning: Excess
> function parameter 'free_blk' description in 'dpu_hw_blk_put'
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> index ca26666d2af91..819b26e660b9c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> @@ -19,6 +19,7 @@ static LIST_HEAD(dpu_hw_blk_list);
> 
>  /**
>   * dpu_hw_blk_init - initialize hw block object
> + * @hw_blk: pointer to hw block object
>   * @type: hw block type - enum dpu_hw_blk_type
>   * @id: instance id of the hw block
>   * @ops: Pointer to block operations
> @@ -114,7 +115,6 @@ struct dpu_hw_blk *dpu_hw_blk_get(struct
> dpu_hw_blk *hw_blk, u32 type, int id)
>  /**
>   * dpu_hw_blk_put - put hw_blk to free pool if decremented refcount is 
> zero
>   * @hw_blk: hw block to be freed
> - * @free_blk: function to be called when reference count goes to zero
>   */
>  void dpu_hw_blk_put(struct dpu_hw_blk *hw_blk)
>  {
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

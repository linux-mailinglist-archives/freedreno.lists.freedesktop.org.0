Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA942B6F5A
	for <lists+freedreno@lfdr.de>; Tue, 17 Nov 2020 20:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B365F6E067;
	Tue, 17 Nov 2020 19:52:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71BB89DD8
 for <freedreno@lists.freedesktop.org>; Tue, 17 Nov 2020 19:52:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605642775; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hnQE3V/VgsKShe0gpDn4RBB+Bf9jSoeX13bACRrVaWE=;
 b=QsXPHKJvy6bf3nRvpi+WVYtyQAPqZ/ehM/a4eQgGGoZIcQJV1197NN0aD9YdN9ejcNdTckV0
 rNKdLiM1OGNNA9Agv3Z2pSgsqI9NAtUbjfViE0O2m92GM9Xy25CRtgeU9Z1grQsaJp3o+vxb
 SdekwFrDdnjNbr67LSRL13Wotg4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fb42a178e090a8886c08ad8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Nov 2020 19:52:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 094CCC43462; Tue, 17 Nov 2020 19:52:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 12D24C43460;
 Tue, 17 Nov 2020 19:52:52 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 17 Nov 2020 11:52:52 -0800
From: abhinavk@codeaurora.org
To: Wei Li <liwei391@huawei.com>
In-Reply-To: <20201117023649.26657-1-liwei391@huawei.com>
References: <20201117023649.26657-1-liwei391@huawei.com>
Message-ID: <e1539aaff024566bc1e64eb7897ec6c7@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix error return code in
 msm_drm_init()
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
Cc: freedreno@lists.freedesktop.org, Rajesh Yadav <ryadav@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 guohanjun@huawei.com, Sean Paul <sean@poorly.run>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2020-11-16 18:36, Wei Li wrote:
> When it fail to create crtc_event kthread, it just jump to 
> err_msm_uninit,
> while the 'ret' is not updated. So assign the return code before that.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Li <liwei391@huawei.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
> b/drivers/gpu/drm/msm/msm_drv.c
> index 49685571dc0e..37a373c5ced3 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -506,6 +506,7 @@ static int msm_drm_init(struct device *dev, struct
> drm_driver *drv)
>  			"crtc_event:%d", priv->event_thread[i].crtc_id);
>  		if (IS_ERR(priv->event_thread[i].worker)) {
>  			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
> +			ret = PTR_ERR(priv->event_thread[i].worker);
>  			goto err_msm_uninit;
>  		}
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C63A26914E
	for <lists+freedreno@lfdr.de>; Mon, 14 Sep 2020 18:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F263C6E4AE;
	Mon, 14 Sep 2020 16:20:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A246E524
 for <freedreno@lists.freedesktop.org>; Mon, 14 Sep 2020 16:20:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600100421; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=F5bs4rBvHEZe+ElUCrFGBZzrwjt5Km+YdDRv7em3208=;
 b=Bx6E0ycE5UPtUR58MM0PgLKsEWJUcf4o2JFz/gjSxe9QnnDdwjbOMneFpX2zKU8t0h6fXJje
 NKZOugp4Sq1/1SMLukbUvhdhodEoR1QcAhIYNiVLffBk/j3MJcnupf1RYjsU+Gdw6uAaCvWU
 uS0W1QqDTuC7ITUQAHw0OGwNnwk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f5f9840ba408b30ce2ec24a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 16:20:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AE638C433FE; Mon, 14 Sep 2020 16:20:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E4875C433F0;
 Mon, 14 Sep 2020 16:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E4875C433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 14 Sep 2020 10:20:10 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Zhenzhong Duan <zhenzhong.duan@gmail.com>
Message-ID: <20200914162010.GB15060@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, smasetty@codeaurora.org,
 jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20200912102558.656-1-zhenzhong.duan@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200912102558.656-1-zhenzhong.duan@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: fix a potential overflow issue
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
Cc: freedreno@lists.freedesktop.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, daniel@ffwll.ch, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Sep 12, 2020 at 06:25:58PM +0800, Zhenzhong Duan wrote:
> It's allocating an array of a6xx_gpu_state_obj structure rathor than
> its pointers.
> 
> This patch fix it.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>

LGTM but should have a Fixes: tag for the stable trees

Fixes: d6852b4b2d01 ("drm/msm/a6xx: Track and manage a6xx state memory")
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index b12f5b4..e9ede19 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -875,7 +875,7 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
>  	int i;
>  
>  	a6xx_state->indexed_regs = state_kcalloc(a6xx_state, count,
> -		sizeof(a6xx_state->indexed_regs));
> +		sizeof(*a6xx_state->indexed_regs));
>  	if (!a6xx_state->indexed_regs)
>  		return;
>  
> -- 
> 1.8.3.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2A81A12E5
	for <lists+freedreno@lfdr.de>; Tue,  7 Apr 2020 19:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A685B6E8BC;
	Tue,  7 Apr 2020 17:45:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7656E6E8BC
 for <freedreno@lists.freedesktop.org>; Tue,  7 Apr 2020 17:45:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586281553; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nU06ifh6Brj3cGeXKmUySLRqf3d0w2DAOk1XWd7luPw=;
 b=FZpPrp2mJ4Qz7bTX+Iu+rEUy/IHc7rbsThtNN2n6uh/FCZkHCqOQcAX8YJzt4C4BquyFN4cU
 6UPN24o/JrkfMo04Ec1qKQrBEpSq+wgpPmaRU+4Jbu1CHWRqv4PZp8pUC0A3noJYp25ncxiN
 QfK4i4a8+5JGuWUc9czpthn0baU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8cbc4b.7f8cbb37b2d0-smtp-out-n04;
 Tue, 07 Apr 2020 17:45:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5747AC433D2; Tue,  7 Apr 2020 17:45:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B201CC433F2;
 Tue,  7 Apr 2020 17:45:45 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 07 Apr 2020 10:45:45 -0700
From: abhinavk@codeaurora.org
To: Roy Spliet <nouveau@spliet.org>
In-Reply-To: <20200407170737.66651-1-nouveau@spliet.org>
References: <20200407170737.66651-1-nouveau@spliet.org>
Message-ID: <2a5886971b510576343c7f4d9fb5cfe6@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp5: Fix mdp5_init error path for
 failed mdp5_kms allocation
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
Cc: robdclark@chromium.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2020-04-07 10:07, Roy Spliet wrote:
> When allocation for mdp5_kms fails, calling mdp5_destroy() leads to 
> undefined
> behaviour, likely a nullptr exception or use-after-free troubles.
> 
> Signed-off-by: Roy Spliet <nouveau@spliet.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 6650f478b226..02c2c7d48bae 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -943,7 +943,8 @@ static int mdp5_init(struct platform_device *pdev,
> struct drm_device *dev)
> 
>  	return 0;
>  fail:
> -	mdp5_destroy(pdev);
> +	if (mdp5_kms)
> +		mdp5_destroy(pdev);
>  	return ret;
>  }
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

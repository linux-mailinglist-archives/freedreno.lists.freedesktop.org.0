Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A5120F68
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2019 17:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7436E817;
	Mon, 16 Dec 2019 16:27:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E8A6E817
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2019 16:27:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576513672; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=HRpW6vrt6VMA9QrLQATEyazxuZywgNQlADjWWPvVjb4=;
 b=DfhY1MBNP+nrRw6mkIox1kOMBCYVzq0+ntJYmvyYxNrZjt0iwiTzlWskm1guC9rQOGxE7fKj
 4ogS3q0wowM9vkLi5lzF/wHb1aDKeqi5kusTWQMaou+eLpj6kN1lYX2/IIU4kRUWQZMmHAdh
 NoA8Fh+7TYVAMoCTTahqyQFkNAY=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df7b087.7f65a7e1d3b0-smtp-out-n02;
 Mon, 16 Dec 2019 16:27:51 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E6EA4C43383; Mon, 16 Dec 2019 16:27:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DE04CC433CB;
 Mon, 16 Dec 2019 16:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DE04CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 16 Dec 2019 09:27:48 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20191216162747.GB11074@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sharat Masetty <smasetty@codeaurora.org>,
 freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <1575385543-11290-1-git-send-email-smasetty@codeaurora.org>
 <0101016ecc4c2e38-cf760c85-09e7-4852-bc99-ff1ae45ab84e-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0101016ecc4c2e38-cf760c85-09e7-4852-bc99-ff1ae45ab84e-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Freedreno] [PATCH 4/5] drm: msm: a6xx: fix debug bus register
 configuration
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Dec 03, 2019 at 03:06:15PM +0000, Sharat Masetty wrote:
> Fix the cx debugbus related register configuration, to collect accurate
> bus data during gpu snapshot. This helps with complete snapshot dump
> and also complete proper GPU recovery.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

This guy should be flagged for stable.

> Change-Id: I4f0ae3eb2dd5d24a88d805277fad212dda2d735e
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 99b5a41..d6023ba 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -353,26 +353,26 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
>  		cxdbg = ioremap(res->start, resource_size(res));
>  
>  	if (cxdbg) {
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_CNTLT,
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLT,
>  			A6XX_DBGC_CFG_DBGBUS_CNTLT_SEGT(0xf));
>  
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_CNTLM,
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLM,
>  			A6XX_DBGC_CFG_DBGBUS_CNTLM_ENABLE(0xf));
>  
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_0, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_1, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_2, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_3, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_0, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_1, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_2, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_3, 0);
>  
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_0,
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_0,
>  			0x76543210);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_1,
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1,
>  			0xFEDCBA98);
>  
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_0, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_2, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_3, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_0, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_2, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_3, 0);
>  	}
>  
>  	nr_debugbus_blocks = ARRAY_SIZE(a6xx_debugbus_blocks) +
> -- 
> 1.9.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

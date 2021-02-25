Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD27324B34
	for <lists+freedreno@lfdr.de>; Thu, 25 Feb 2021 08:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D848F6EC4B;
	Thu, 25 Feb 2021 07:26:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-2.mailgun.net (m42-2.mailgun.net [69.72.42.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6A56EC4D
 for <freedreno@lists.freedesktop.org>; Thu, 25 Feb 2021 07:26:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614237982; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cUew4Av0FJC4vQyEP5MpOnxBX/HGR6/3GwBlUCObe0g=;
 b=ncf51Igj1Wo+YMVjt5QiO/3zUZVxO1zuHUtnXf5DkaVIf7geMZT9UWZ07iRGN0qmrtQUteMf
 QDoJBNswFbYwkO/JnAlYXjatI+kU91+ivFqhL4n3L7+PWHa1rbt2aCOiC6oVpB526Kim/3lQ
 lkZSDhG3KDDZK40BN9ojC07xP5E=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 603751127f306299bf11abe1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Feb 2021 07:26:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 57667C433C6; Thu, 25 Feb 2021 07:26:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D79BC433CA;
 Thu, 25 Feb 2021 07:26:08 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 24 Feb 2021 23:26:08 -0800
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20210224230528.1216677-1-dmitry.baryshkov@linaro.org>
References: <20210224230528.1216677-1-dmitry.baryshkov@linaro.org>
Message-ID: <ab841076b17c509f2009145697e8cb67@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi_pll_7nm: Fix variable usage for
 pll_lockdet_rate
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dmitry

Thanks for the patch.

On 2021-02-24 15:05, Dmitry Baryshkov wrote:
> The PLL_LOCKDET_RATE_1 was being programmed with a hardcoded value
> directly, but the same value was also being specified in the
> dsi_pll_regs struct pll_lockdet_rate variable: let's use it!
> 
> Based on 362cadf34b9f ("drm/msm/dsi_pll_10nm: Fix variable usage for
> pll_lockdet_rate")
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> index 0458eda15114..e29b3bfd63d1 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> @@ -325,7 +325,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll)
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1,
> reg->frac_div_start_low);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1,
> reg->frac_div_start_mid);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
> reg->frac_div_start_high);
> -	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
> +	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1,
> reg->pll_lockdet_rate);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 
> for CPHY */
>  	pll_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS,
> reg->pll_clock_inverters);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

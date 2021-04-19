Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 017B5364EAC
	for <lists+freedreno@lfdr.de>; Tue, 20 Apr 2021 01:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461346E4A6;
	Mon, 19 Apr 2021 23:34:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1296E0D5
 for <freedreno@lists.freedesktop.org>; Mon, 19 Apr 2021 23:33:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618875239; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZWzCdC+z5UyZhszG/8Haa1EIaXLOwOdaGyCo2LbFCaw=;
 b=RpTVOrEWiLFIt1e27aEXTdPRnZeMbAVwAlHDEbEJcatQZjU65cDAeQVyGbZqyW9KZwbT3ZGg
 p+mGly0jt9aT5J4w5QWKoNaXmpAJ6SF1ejnQIfQFZDBIs6AgVzAup72qFs6EUv1v6xBR3a9e
 GL/W+qYya50XBD3jNCXojwEj8Jg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 607e135387ce1fbb56594b7b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Apr 2021 23:33:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 60A47C433D3; Mon, 19 Apr 2021 23:33:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BD889C433F1;
 Mon, 19 Apr 2021 23:33:34 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 19 Apr 2021 16:33:34 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
References: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
Message-ID: <7ff8d6af018650a313842fa0470a5d5b@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: fix
 msm_dsi_phy_get_clk_provider return code
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-04-11 17:01, Dmitry Baryshkov wrote:
> msm_dsi_phy_get_clk_provider() always returns two provided clocks, so
> return 0 instead of returning incorrect -EINVAL error code.
> 
> Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into
> a generic code")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f0a2ddf96a4b..ff7f2ec42030 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -843,7 +843,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy 
> *phy,
>  	if (pixel_clk_provider)
>  		*pixel_clk_provider = 
> phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
> 
> -	return -EINVAL;
> +	return 0;
>  }
> 
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D624939090A
	for <lists+freedreno@lfdr.de>; Tue, 25 May 2021 20:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF476EAA6;
	Tue, 25 May 2021 18:35:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103586EAA6
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 18:34:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621967701; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WIyhPKKaXWb+9OY66v6kTHVLbjk02qsEX8PuE7ar4/0=;
 b=G7ZoJYhI3nGTs60t9RfhGJb611X2Tou1wsVibMatwUiHp2sH7mYV8G3fxebAYeTD8wgdKAgP
 67o64+MIeixnMGrugxWTw9D+Icw2AsKKwyZRqWyCELF6uFB4CrEIaXAVbkkrGFeHMpwjAshe
 jWyrMJH9TVqAoGcU6gjv2+W88Xo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60ad433f5f788b52a515b551 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 May 2021 18:34:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1D72CC4323A; Tue, 25 May 2021 18:34:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9216CC433D3;
 Tue, 25 May 2021 18:34:38 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 25 May 2021 11:34:38 -0700
From: abhinavk@codeaurora.org
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
In-Reply-To: <1621945327-10871-1-git-send-email-zhangshaokun@hisilicon.com>
References: <1621945327-10871-1-git-send-email-zhangshaokun@hisilicon.com>
Message-ID: <1a928a9f4fb4973b265a160cd1d6369a@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: remove the repeated declaration
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-05-25 05:22, Shaokun Zhang wrote:
> Function 'dp_catalog_audio_enable' is declared twice, remove the
> repeated declaration.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h
> b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 176a9020a520..f12468dcbb56 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -124,7 +124,6 @@ void dp_catalog_audio_get_header(struct dp_catalog
> *catalog);
>  void dp_catalog_audio_set_header(struct dp_catalog *catalog);
>  void dp_catalog_audio_config_acr(struct dp_catalog *catalog);
>  void dp_catalog_audio_enable(struct dp_catalog *catalog);
> -void dp_catalog_audio_enable(struct dp_catalog *catalog);
>  void dp_catalog_audio_config_sdp(struct dp_catalog *catalog);
>  void dp_catalog_audio_init(struct dp_catalog *catalog);
>  void dp_catalog_audio_sfe_level(struct dp_catalog *catalog);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

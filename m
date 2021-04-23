Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BD73695A6
	for <lists+freedreno@lfdr.de>; Fri, 23 Apr 2021 17:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E8D6E113;
	Fri, 23 Apr 2021 15:08:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338586E106
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 15:08:18 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id i12so18348420qke.3
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 08:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kMBt3oIwngeJeBnfmEyUsdAN7B1plm8CAX31M1jjWdw=;
 b=XOkKKQbXZMkWcDYshtTtl3Sh5yWiva3sTa0AFxXsmvrvXjZf/atJ/JoRYC3Xts8BlV
 x24uSpxfwlU+Iaiugh3ZBy6Em1Buzir/Ra1YhNj4PqxdGWvFFEglcbo0vRDdd+tlY+5t
 4jI98v069K+8dRH1yXwmoHbEyw74tXNy6N6ivCjatW08mku/mqGSVpniDXVEKNq/3LkK
 v+DhmSy9VbpjBKzTzcJXYZDhLzMSVASlrRfaIt0TQec3DTrCwa/jEmj3P3MFIHnQ9s3f
 ZIUQyYTom/Dc1nFC9c/dgHRF2oISmsLcG64q+2+6FowSxj17c6vHT5KADrUjwyt5SiJ8
 7/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kMBt3oIwngeJeBnfmEyUsdAN7B1plm8CAX31M1jjWdw=;
 b=NMfbePGJuD7EPsxo30qe8liQ4nbGFP/rUmnMWZpB+UOZ4EahBM8TUETsRhnaLPxhGV
 kCfY4LmnrsB5PEBS/Ik8fqx3BZMQnmodSd8+YeCILflwut1rS8pn30Uzeb9FwV18QxXG
 tsDqA99iJlPESv3Ooip97QvVfe58epxKCmKGyKjaAIvAoiCmRXDf5vt+r4DSQ747IWpF
 sIokZ3DdnjsxCDET5vQJq65nZSKJtS/zBl7VwhMKVzHut/VmPlfVZKVjOsEPXrPIs2Wm
 2r5kW6r90GmaTR8GKM7W+VlexkgCUuDG9SYvNsc8mJgeTFQmsQ4yV4bWsa59qFFsSz2N
 pj5w==
X-Gm-Message-State: AOAM530SfPcF/REUw6LQvhMp11OW0dzb97fo3CwclcWH8ZzRIa/jlvlv
 4nbmn1joqyRAUAKQjueFElDTb2hFb2nfPEV7tYw=
X-Google-Smtp-Source: ABdhPJyTywhnJyaB9YRYFW07GHm65WRhqKgMqmwDxOTsEt8/ukIP8gBQYati/quG/amJc+aBgYA/wA==
X-Received: by 2002:a37:68d4:: with SMTP id d203mr4474732qkc.189.1619190497287; 
 Fri, 23 Apr 2021 08:08:17 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id y6sm4488489qkd.106.2021.04.23.08.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 08:08:16 -0700 (PDT)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <589a5a1c-cb90-72ce-38df-4f497fd36f16@marek.ca>
Date: Fri, 23 Apr 2021 11:05:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Tested-by: Jonathan Marek <jonathan@marek.ca>

On 4/11/21 8:01 PM, Dmitry Baryshkov wrote:
> msm_dsi_phy_get_clk_provider() always returns two provided clocks, so
> return 0 instead of returning incorrect -EINVAL error code.
> 
> Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f0a2ddf96a4b..ff7f2ec42030 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -843,7 +843,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
>   	if (pixel_clk_provider)
>   		*pixel_clk_provider = phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
>   
> -	return -EINVAL;
> +	return 0;
>   }
>   
>   void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

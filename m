Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E354D3DA017
	for <lists+freedreno@lfdr.de>; Thu, 29 Jul 2021 11:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A78E6E853;
	Thu, 29 Jul 2021 09:10:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AFB6E853
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 09:10:24 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id z2so9737524lft.1
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 02:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j1oTdGaEQ77wKFt5yMUzZqXg44oVq6MHBdIKvRtKHso=;
 b=xiRwb6lr+yN2TvAWWqnnWrrLDB723jy82nWZmOQ8iowGgp/4xpqEERcNg7aNe5TMiu
 /KXTATfbuD5j1Pnh2+TbZ9CCZp9PqZ1qebUtJQK8wDsCEIJGEQpJzKE4QRNKY6utUDp+
 BEapaAqUXw0T9DqgL1mfwrMFNCtjgrduBVYu4KMH8cNbOfU19ti5pTFvRPbHaPSExcRi
 sDvrhiOGF3CsPKysGtGFELNvONsDuI9ZtUQNFJqBxo4dEFtvnLBCPZeL1bDsdrzaXI83
 tlLWKf3j89ECUP6m2GVoDiYRclqxVqrwepriFE/bcX8AsIAsQNCGRV4OhKlx2xjzuXKV
 QqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j1oTdGaEQ77wKFt5yMUzZqXg44oVq6MHBdIKvRtKHso=;
 b=GecT2gqQ+KBmo7rR3eNlt5qfBIDJoJxpxrofz27tMf9BV+n379AfStYF9XvfxxWJH/
 mzLcU+K79CV4dRwZRGrlZsHGJewyml794Ec4NfuDQXhV8IKuIMLag1ubr1n0ZNksXEKO
 5do7tFEftipcsgag+dS+6VLuN02FBDlcQZheJPGYvfMvFH4bDzcdZcJ4TU8S3t8Qeka8
 9WseMak5rBjnk8cUu2wozNuFdEB6co79odJrYMCcFOLI0ufx8XYSuU+Gy5rMLGs2/IUK
 lKOVBbxB6bll+qusH2YVSIwbMz9FRkN2gyxC+c0u9+ub/7q38O+Uyow20uR0VRIL7yhx
 tyOg==
X-Gm-Message-State: AOAM5334muDP7bBmYf2alfuq14wdbAkMPFLRZ9q6riA7JFgzAvzOkCQq
 Cc/nBaPZ6u00wfwAADSpC3gghw==
X-Google-Smtp-Source: ABdhPJwibZhgd98KMXz/38f1bi6OLY99Lu6tvHg+uIoC2n0wFaLTXoWHoZpl/kqoKRgpcmyUUWlhJw==
X-Received: by 2002:a05:6512:131d:: with SMTP id
 x29mr3220085lfu.655.1627549822611; 
 Thu, 29 Jul 2021 02:10:22 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v130sm243109lfa.284.2021.07.29.02.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 02:10:22 -0700 (PDT)
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20210728222057.52641-1-konrad.dybcio@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <f19a9368-1d51-9e1a-dfe8-04d6970e149f@linaro.org>
Date: Thu, 29 Jul 2021 12:10:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728222057.52641-1-konrad.dybcio@somainline.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Fix DSI and DSI PHY regulator
 config from SDM660
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Rob Clark <robdclark@gmail.com>,
 martin.botka@somainline.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/07/2021 01:20, Konrad Dybcio wrote:
> VDDA is not present and the specified load value is wrong. Fix it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c          | 1 -
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index f3f1c03c7db9..763f127e4621 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -154,7 +154,6 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
>   	.reg_cfg = {
>   		.num = 2,
>   		.regs = {
> -			{"vdd", 73400, 32 },	/* 0.9 V */
>   			{"vdda", 12560, 4 },	/* 1.2 V */
>   		},
>   	},
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index a34cf151c517..bb31230721bd 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1050,7 +1050,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
>   	.reg_cfg = {
>   		.num = 1,
>   		.regs = {
> -			{"vcca", 17000, 32},
> +			{"vcca", 73400, 32},
>   		},
>   	},
>   	.ops = {
> 


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

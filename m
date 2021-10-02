Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9911241FED0
	for <lists+freedreno@lfdr.de>; Sun,  3 Oct 2021 01:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F986E057;
	Sat,  2 Oct 2021 23:52:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B4B6E04B
 for <freedreno@lists.freedesktop.org>; Sat,  2 Oct 2021 23:52:07 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id y26so54694552lfa.11
 for <freedreno@lists.freedesktop.org>; Sat, 02 Oct 2021 16:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DWmaqaBK3VHPsKjTNJeXDdL5YO382kmrBlq18HElcSI=;
 b=FKhaKLPFJ6RQQamReLb4STcsqPATczVCwjxHPW3hG5nUKXijCucZTQyhtYt4MDYt0r
 4P1yZcIm+WF0dDL5q5ZK2yBsV2FU0kPSn228mtLdUIBD11MEaj561ldZmG8HV9soAP72
 2WarEPNFRKYS1pX89sFqu6+kVrjCTZiAeelh/ScMEJW5ETLrXUfySNd0B7egPn4bdu9l
 AVC0yl6gRffLhoirxUG4OHMjKWVRs6lLADFrD5AYnCpArhLrDyK0LRhAclr00MMH45aP
 PJOljZoVxbO0TD7umCgk88Zr/Ixh17TLdI402OgejXacBb1fZn1vcupG0auc7508hEML
 SUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DWmaqaBK3VHPsKjTNJeXDdL5YO382kmrBlq18HElcSI=;
 b=5Cw4fznt/I50sRfgeANcMTo37EFDHAXv8Eug0PKZH8p+JTGroB9VXY/3mcR4IhUsMz
 2YYUa2VxhIuJAc6hrk3FFBz5SmJSXi9aL9KI5oVbyL6497uepFkLgXY9gq8lVSkPPP2B
 U9lW9eTto1ki6q1vLM17tucEuezBcJsG2NpgYLPfojQfQ1TFwf/MKCVZWDH9EwSX9Wds
 culejnzBJwSOh9v0LyKoaBnlXw7l+Z5BbQr2Fpu4vmNnNRxWFwUSwuQ64Q1FKKclbcad
 LGz51nJpsoOVGCEmy6uhU/q3wrmZb5/dFIiMx0Ny2iHNwTHV92lPTyXTYXSkJFWcGNOm
 NMXg==
X-Gm-Message-State: AOAM530DA6qRSKnvYqPsWZ4jhXj90+0ISdID9IChHUFuhie7CWdzzAJA
 AfARnMibytTta1itlAZG0ZOjiQ==
X-Google-Smtp-Source: ABdhPJy9JFhgCqmgrcSVr3c9iyMWIHWO+E+81TAcESUFPm5L7GEZMkZnE/pGGkQ9LWj+daE80rvfEQ==
X-Received: by 2002:a2e:4a12:: with SMTP id x18mr6618398lja.309.1633218725415; 
 Sat, 02 Oct 2021 16:52:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d1sm1163650lfj.61.2021.10.02.16.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 16:52:05 -0700 (PDT)
To: Wang Qing <wangqing@vivo.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jcrouse@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Sharat Masetty
 <smasetty@codeaurora.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1604719151-28491-1-git-send-email-wangqing@vivo.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <4b7f494e-98f4-5e06-d025-72593ccb5301@linaro.org>
Date: Sun, 3 Oct 2021 02:52:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1604719151-28491-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [V2] drm: msm: adreno: use IS_ERR() instead of null
 pointer check
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/11/2020 06:19, Wang Qing wrote:
> a6xx_gmu_get_mmio() never return null in case of error, but ERR_PTR(), so
> we should use IS_ERR() instead of null pointer check and IS_ERR_OR_NULL().
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

As a second thought, ioremap's NULL is converted to ERR_PTR(-EINVAL), so 
the patch is correct.

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 491fee4..82420f7
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -492,7 +492,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
>   	uint32_t pdc_address_offset;
>   
> -	if (!pdcptr || !seqptr)
> +	if (IS_ERR(pdcptr) || IS_ERR(seqptr))
>   		goto err;
>   
>   	if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
> @@ -580,9 +580,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   	wmb();
>   
>   err:
> -	if (!IS_ERR_OR_NULL(pdcptr))
> +	if (!IS_ERR(pdcptr))
>   		iounmap(pdcptr);
> -	if (!IS_ERR_OR_NULL(seqptr))
> +	if (!IS_ERR(seqptr))
>   		iounmap(seqptr);
>   }
>   
> 


-- 
With best wishes
Dmitry

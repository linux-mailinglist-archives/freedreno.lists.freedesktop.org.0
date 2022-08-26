Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D22F65A24BE
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CA510E7EE;
	Fri, 26 Aug 2022 09:45:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C611710E7EE
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:45:32 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id bn9so1058601ljb.6
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=vHi6QtI//7TBnE8nBrdSJbUVsEE4d4QVsX/BRPswYrQ=;
 b=BWewzD58WZb2ASIS2HyX2JfaWcfca0rgAcn6J5TlNj5DoxINJROfyx552k1h2zzyF6
 RJt7AjD9mK9Mjbto3LkmLdGTyTxdEGUnaOGyFWxx3qTtT3CTEF1tWEBymb/A1x8rup7B
 aofXemKbyAlXn97Rye/g+JYpbD0PbO/XdO6JJPCxZsHQPmfjPOgp+mjuBndmcLptLMtM
 7reYj0YLImkiZfJ0IPFkzCb/pvKayV8A9xaF2OZ7MEj8F+F2CIXnX71mXwBYIEey/0Rf
 2EOzBNNSYAc2u//muJcPQXZWenW4T3yWfTnXXB46a4diIpmdFdaWsB4JMCN4UgxO+Kua
 +Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=vHi6QtI//7TBnE8nBrdSJbUVsEE4d4QVsX/BRPswYrQ=;
 b=Uu2XnGrJrUaxXTt+w1ada+4V9IIf7KgJo+SBqyBv6jtr1BWvOyJPwj2S/R4VehDQkJ
 BJhxEqNXCjdzGIL1hc4EmdKhj3h3fwrCDNBK7DbDyKEz8U5wARcmQmG9u++oFVo08UMv
 ZJHfMVreYZA8GDLClKHdnPlBZ81cxAOk+6SrBrz7lVUggU8GDdhplm8zZ93+vW5vC7kK
 8S5Lum9iOogiHvcVUFJxcqOszadaJJW+Bz+5QjhaaVZkO78usgw7Lctu/g8B1FfGMyjI
 wcYzufyi58M8MvQc0gX8axOBenc/turI+/lElEpdKJ+dFHr8PuisgmwokUcEBXKbbdmB
 K2MQ==
X-Gm-Message-State: ACgBeo0KatBzqoBAfq6l/TDuR6D5shDmysopcEDmzR0FmGG7mwGmTYf6
 TsiYYLO/vKIWHpFQuQPHevVdcg==
X-Google-Smtp-Source: AA6agR4/uKgMFOSDi0fVB/x6w+1OBJbUOI2cYP4ho460NcforDI8wUraY7L+Ql32mO1uqRKl9BMjEw==
X-Received: by 2002:a2e:9e50:0:b0:261:e3fd:cdc5 with SMTP id
 g16-20020a2e9e50000000b00261e3fdcdc5mr2120322ljk.56.1661507131161; 
 Fri, 26 Aug 2022 02:45:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 by6-20020a05651c1a0600b0026181f65600sm399237ljb.136.2022.08.26.02.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:45:30 -0700 (PDT)
Message-ID: <9396ac0b-e8a1-e82d-65db-8abc0ee75491@linaro.org>
Date: Fri, 26 Aug 2022 12:45:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Jilin Yuan <yuanjilin@cdjrlc.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220823115654.58725-1-yuanjilin@cdjrlc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220823115654.58725-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] msm/adreno: fix repeated words in comments
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/08/2022 14:56, Jilin Yuan wrote:
>   Delete the redundant word 'power'.
>   Delete the redundant word 'in'.
>   Delete the redundant word 'for'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Could you please:
- adjust the commit subject to follow the rest of commit messages,
- drop the extra whitespace at the beginning of the commit message,
- add a correct Fixes tag.

Thank you

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 9f76f5b15759..32ecb783c3c1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -352,7 +352,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>   	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << bit);
>   }
>   
> -/* Enable CPU control of SPTP power power collapse */
> +/* Enable CPU control of SPTP power collapse */
>   static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>   {
>   	int ret;
> @@ -374,7 +374,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>   	return 0;
>   }
>   
> -/* Disable CPU control of SPTP power power collapse */
> +/* Disable CPU control of SPTP power collapse */
>   static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
>   {
>   	u32 val;
> @@ -1277,7 +1277,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>   		}
>   
>   		/*
> -		 * Look for a level in in the secondary list that matches. If
> +		 * Look for a level in the secondary list that matches. If
>   		 * nothing fits, use the maximum non zero vote
>   		 */
>   
> @@ -1559,7 +1559,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   			goto err_memory;
>   	}
>   
> -	/* Allocate memory for for the HFI queues */
> +	/* Allocate memory for the HFI queues */
>   	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0, "hfi");
>   	if (ret)
>   		goto err_memory;

-- 
With best wishes
Dmitry


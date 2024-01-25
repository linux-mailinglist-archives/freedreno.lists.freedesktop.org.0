Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4321783CF28
	for <lists+freedreno@lfdr.de>; Thu, 25 Jan 2024 23:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EC410E646;
	Thu, 25 Jan 2024 22:08:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773B910E37B
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 22:08:13 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2cf205dc075so28183851fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 14:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706220431; x=1706825231; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QO88jOMuE3Qjg69JhvIkNpQbF05cgpQE5FedRs/dv08=;
 b=K+LmQ7boqeA0m1irayiiie0xV2G8eI5z9ZZEOS41BeHsaVyFZAHD3hUFv29cisw0d9
 pUarssVJYP7ZoeKTavJmBhqNpFFja7Qgac8jgyD/AOm++QTHmG5TWyXX33lfXlEjUwBx
 j1PCCyiXUkuuFVrT8BAGm91V7hI68DJZl+cWOXOvEs6IFosUlycRoJmDp/lBestxn6Sh
 xQeSrxbBDZ+2UB7vQidwiDXbfXUvBDVcH29l+J+z2SIZyr3iW3mzHb0NJIgIsardvGoY
 zH0brsY+0UrA8pswXzCNeX0OjcDMHnWnw7wCV6+K367AsutqT8apGxrZWZXBXy+eO+Ah
 VKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706220431; x=1706825231;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QO88jOMuE3Qjg69JhvIkNpQbF05cgpQE5FedRs/dv08=;
 b=RJsbVRF3J5I0OxcQNfKHxh81EwZI7NtrqR5e/yyYtmx3bFMWWABdmuldeTCguccQPP
 Lk6IUjJObFuZhn8NAm4gouuXS66Yntq2Oc1W9qkzWpewrG8hI9RreJpmz6OUfXcGoCtg
 DDTSCbfNt8FddD2UTxQwr0SbARhdohy7sWNzj39VuSzwMyyYjTn9ZVc644gtzqeJANW8
 umWGykIwWD3ZZpjGf2gG62W2ouSDTTAP2eBrs9SC768V3JZg7aUqQFShY4q4EkyNtyKS
 HBQCQHiyPdQ6P1/bvnGU2hMr9Lehuh9xwgMD38gDdjiGG6upvQbRvWH/btMdSXRtouRC
 WBGA==
X-Gm-Message-State: AOJu0YxZgvO7YceumENNOoh5vTxeysIABiTjCZmwmEKvSh0nrE6vse48
 IETUsshky7GK3zFrmajXd2YHdMXsvG+5nxZvwJLhdSogK2M8/VRtinL5qVX3foM=
X-Google-Smtp-Source: AGHT+IEZyBfBO7A1AQ1M7bdq/YefFJySAWknvbo43E7Zh8Enih8yYh5SYbqXwJlCkNVKTrHkhK/qOA==
X-Received: by 2002:ac2:5f6b:0:b0:510:f3c:f1 with SMTP id
 c11-20020ac25f6b000000b005100f3c00f1mr209243lfc.116.1706220431664; 
 Thu, 25 Jan 2024 14:07:11 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u17-20020ac248b1000000b005101e82ed80sm228054lfg.290.2024.01.25.14.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 14:07:11 -0800 (PST)
Message-ID: <c06c4a5d-6042-4d0a-a0ca-6321792f1061@linaro.org>
Date: Fri, 26 Jan 2024 00:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show
 major and minor val
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-11-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-11-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> Modify dp_catalog_hw_revision to make the major and minor version values
> known instead of outputting the entire hex value of the hardware version
> register in preparation of using it for VSC SDP programming.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 12 +++++++++---
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>   2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 5d84c089e520a..c025786170ba5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -24,6 +24,9 @@
>   #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
>   #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
>   
> +#define DP_HW_VERSION_MAJOR(reg)	FIELD_GET(GENMASK(31, 28), reg)
> +#define DP_HW_VERSION_MINOR(reg)	FIELD_GET(GENMASK(27, 16), reg)
> +
>   #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
>   
>   #define DP_INTERRUPT_STATUS1 \
> @@ -531,15 +534,18 @@ int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
>    *
>    * @dp_catalog: DP catalog structure
>    *
> - * Return: DP controller hw revision
> + * Return: void
>    *
>    */
> -u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
> +void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16 *major, u16 *minor)
>   {
>   	const struct dp_catalog_private *catalog = container_of(dp_catalog,
>   				struct dp_catalog_private, dp_catalog);
> +	u32 reg_dp_hw_version;
>   
> -	return dp_read_ahb(catalog, REG_DP_HW_VERSION);
> +	reg_dp_hw_version = dp_read_ahb(catalog, REG_DP_HW_VERSION);
> +	*major = DP_HW_VERSION_MAJOR(reg_dp_hw_version);
> +	*minor = DP_HW_VERSION_MINOR(reg_dp_hw_version);

After looking at the code, it might be easier to keep 
dp_catalog_hw_revision as is, add define for hw revision 1.2 and 
corepare to it directly.

>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 563903605b3a7..94c377ef90c35 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -170,7 +170,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>   				u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
>   int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog, u32 pattern);
> -u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
> +void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16 *major, u16 *minor);
>   void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
>   bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);

-- 
With best wishes
Dmitry


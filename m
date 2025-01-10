Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6609DA08967
	for <lists+freedreno@lfdr.de>; Fri, 10 Jan 2025 08:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D43D10EFFC;
	Fri, 10 Jan 2025 07:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j0vToTG2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D4110EFFC
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jan 2025 07:49:46 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-385e0d47720so122788f8f.0
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2025 23:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736495325; x=1737100125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=f3HgF2rjfLZjHLpI0+IwIRqlrnqNDQ6nm19mXOYOUjY=;
 b=j0vToTG2Go2ihPGOb1BSNKMW0UyQxoq+3v6ejZeeC/FsCuPTNEHxn/hiP8955UA2l5
 M0d2gG4FXtTLoBAKZEmI25roXbCyBkYGNNbI0gUogBSKGnOsnw670JbNOkwuyQyAdgHd
 ooIHXy4X8UQvr53965HOs64IJ4Zcz0az/POy7jSxYqCNMSuVXAEQpsgUYwmdYj56MAxj
 opQWctVHJRwW6b+Jb+xzrcWJRax4EE4Z8wywU+0emMG9YPjsaQIpTIm44qhldwxpbp8G
 tMSyRZiub3uOPA6S5GHRjfelxT3yVosft8OPPOT+7+tDpGKk2E5L08xCk+GBkdt65j8k
 K63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736495325; x=1737100125;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f3HgF2rjfLZjHLpI0+IwIRqlrnqNDQ6nm19mXOYOUjY=;
 b=YLubnc+iOz6RoZewagtJLUZIDAM+guQoVQGc0O+kVak7LXQNCODpcgkeG5ipCRME/w
 zOMENPSC2Qr2VWDALmlRx3AQL0sgTk3NWnwWd9FHopP2r5grNOpoSeGmpetdN1bdxInQ
 RKqoi3p0l2HvmnKWqBuu2SK/jnd94FRnTSA4FbpoRtg3kh/xDGY12fpBdczI9QAdOApB
 pojJbXdMxc0Loxfnp3CRKY1tqe8XcexqjGy5aYnDVUrFEmW1IGmkbnAWrLe/NutzgLTZ
 zA4BcMqXK1X6jCPyVqe2KZCu750rLbDpLF3oUj5gxArbcteTcl/hb87CyufUXFpUeA78
 TXWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtdNO8SBrfhQlYvqut5BGICbqQrW8teELgGgS6TkdPl5wnEG1PTNba4b2B9LHaC7Se6v0/eDLKEaQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPMfAUbP1RU8JhUxXJneCEQjEitYwQr+NUJJQZJYRXqQMRbcub
 Xb8VBXggoEheMv1u5V2gnBzfJC/XfKv9mKx5bbI0K1G6ONtH7hpSiKRIv3EFkS8=
X-Gm-Gg: ASbGnctnt8w33Pv9UUQRrJ0h+7CSjs9LTaGkh8teAHyy1djRCkLC54SK9fVIp+A8/8L
 vKjjnnTm1PzQYMHoz46oOUb+a/XpHf8lYtrv/G87h/WJWQ8BmWDdB0ahCwWg2Bf95m4QVRaLbB0
 q/FfllTRbRfjwOaR8C04V4oMeOcFWY/Fuyjyx+OBp1R2QfViqWmbLqnWdY4L/lZ61qRxo1RJcEL
 4ocek9Ean5HpelIlDQ1AVvoj7Auzj6yIH+K1u6pIeaV95kSiragmlNC3eSkcmzHG+z6h9DwvY5V
X-Google-Smtp-Source: AGHT+IEElU4Vuit1Ap+kSW5DGrn7fsVqX1i9PgpIc5fGkSurilI2rdOFlmRYwB9wM3nj28bc730/0Q==
X-Received: by 2002:a05:6000:1f88:b0:385:ee59:44f3 with SMTP id
 ffacd0b85a97d-38a872d2d94mr3354172f8f.3.1736495325172; 
 Thu, 09 Jan 2025 23:48:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38f176sm3870395f8f.63.2025.01.09.23.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 23:48:44 -0800 (PST)
Message-ID: <8ccf63bb-810a-47e2-bf93-4bf9317fe050@linaro.org>
Date: Fri, 10 Jan 2025 08:48:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/11] drm/msm/mdss: Add support for SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-10-b3f15faf4c97@linaro.org>
 <kn7gsm4nnp372t56ocbzkv6uw7o3ww2qel7jlcwvgxsugdk46w@d34hujbcswcw>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <kn7gsm4nnp372t56ocbzkv6uw7o3ww2qel7jlcwvgxsugdk46w@d34hujbcswcw>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/01/2025 23:39, Dmitry Baryshkov wrote:
> On Thu, Jan 09, 2025 at 02:08:37PM +0100, Krzysztof Kozlowski wrote:
>> Add support for the Qualcomm SM8750 platform.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/msm_mdss.c | 33 +++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/msm_mdss.h |  1 +
>>  2 files changed, 34 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>> index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3f00eb6de3a9d2bee7637c6f516efff78b7d872b 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -222,6 +222,24 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>>  	}
>>  }
>>  
>> +static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
>> +{
>> +	const struct msm_mdss_data *data = msm_mdss->mdss_data;
>> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
>> +		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
>> +
>> +	if (data->ubwc_bank_spread)
>> +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
>> +
>> +	if (data->macrotile_mode)
>> +		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
>> +
>> +	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
>> +
>> +	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
>> +	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> 
> Nit: this probably can be folded into the msm_mdss_setup_ubwc_dec_40(),
> but I would not require it.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

That was my initial try, but the resulting code was getting big with all
the if-then.

Best regards,
Krzysztof

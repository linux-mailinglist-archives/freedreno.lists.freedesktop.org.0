Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1A969B43C
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 21:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0555510F0CE;
	Fri, 17 Feb 2023 20:54:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0742F10F0C5
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 20:54:17 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id t8so2851162lft.11
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 12:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w4WIlW107+t+DszwrTyAc22lGzyIotvHYh3Xdegh8P4=;
 b=ijLbDznXSh8NzgQqTx231xT93GZkx4MeSRAeCsBUz44OLjpMEVla3bA3NYQPlNLlZp
 IQsDkMoFer3vwJxvfOBxV/ruqX0qpfnIZ0wGQNyWXNNMZ4UWqaOzRDa3SkHXAKwU9MMF
 bdvsq/G2lI6g1C51+IF8GLKFUS0yIJPX8oKvsMwM5p22utkwhC1jV4B9BaizWxCBEbQS
 Jhl0ACH/gko8v118lIIS/AH7nVRk6BMtERZ3NBQShAQ5HVyOyZiYhQbwK+eZwCUbuvdY
 rYt7r1dz1nDh9fj2G6a50W62RAUIUCOjqt90QzI1KcDp9BtBI4TDXRcm2j98yB7VGiHI
 hM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w4WIlW107+t+DszwrTyAc22lGzyIotvHYh3Xdegh8P4=;
 b=sPQH861WY0tBhy5TKdsi8lyphwTMKlDlRbtVuX4Xs7E7mHwDC6GErJfajWVE+An9/h
 Bx8d9VixmsgePUSt8YLUJcL74b661Dv7lSUNYEL4JNVCAWMD3F220ozPpv8Zk2eF1Qcp
 W4CRCeHcCTly+BNMfL2q/vLWLVRY4EB1W1sujkOc2miO5PO0Is0+hTwkRbenTO3w8zjb
 vZWVkz5YHq6tXG4n5coPVqs6IhhvaZPNRPY070cFYf1oe83m4dMwSX6PnBW6GSOLjpWp
 NXGSeFbA0HFaUEyqI1omULCdpZRWSHVcBNqd2DRiPLYfXWZbkKFqnb7L4k5QmZCNJEqp
 iLrA==
X-Gm-Message-State: AO0yUKVRrRV9x4vy2Y9L70iyaUBaVVOo2A5tlhX3OXkAYmgQ0toBa3CD
 FUkOKwAK+ITLVxnkWYD7+ktrBw==
X-Google-Smtp-Source: AK7set8gglBiYkWUbLE8SQ94BBjgD+VurWdIpC2JdjGiHA8slABEmoxIJMuENRApu8yYjKrVP71O3w==
X-Received: by 2002:ac2:4142:0:b0:4d5:7923:c4c0 with SMTP id
 c2-20020ac24142000000b004d57923c4c0mr132849lfi.27.1676667255203; 
 Fri, 17 Feb 2023 12:54:15 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a19700c000000b004d8729d4150sm771293lfc.145.2023.02.17.12.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 12:54:14 -0800 (PST)
Message-ID: <70f298cb-92a3-0bda-2192-51531a4b4f55@linaro.org>
Date: Fri, 17 Feb 2023 22:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-6-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-6-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 05/14] drm/msm/adreno: Disable
 has_cached_coherent for A610/A619_holi
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ricardo Ribalda <ribalda@chromium.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/02/2023 19:31, Konrad Dybcio wrote:
> These SKUs don't support the feature. Disable it to make the GPU stop
> crashing after almost each and every submission - the received data on
> the GPU end was simply incomplete in garbled, resulting in almost nothing
> being executed properly.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 36f062c7582f..82757f005a1a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -540,7 +540,13 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>   		config.rev.minor, config.rev.patchid);
>   
>   	priv->is_a2xx = config.rev.core == 2;
> -	priv->has_cached_coherent = config.rev.core >= 6;
> +
> +	if (config.rev.core >= 6) {
> +		/* Exclude A610 and A619_holi */
> +		if (!(adreno_cmp_rev(ADRENO_REV(6, 1, 0, ANY_ID), config.rev) ||
> +		      adreno_cmp_rev(ADRENO_REV(6, 1, 9, 1), config.rev)))
> +			priv->has_cached_coherent = true;
> +	}

I'd suggest something like:

if (config.rev.core >= 6 &&
     !(info.quirks & ADRENO_QUIRK_NO_CACHE_COHERENT))
         priv->has_cache_coherent = true;

Let's keep all the information and quirks in a single place.

>   
>   	gpu = info->init(drm);
>   	if (IS_ERR(gpu)) {

-- 
With best wishes
Dmitry


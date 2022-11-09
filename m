Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D379A622B75
	for <lists+freedreno@lfdr.de>; Wed,  9 Nov 2022 13:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0A710E5B5;
	Wed,  9 Nov 2022 12:23:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1023A10E5BB
 for <freedreno@lists.freedesktop.org>; Wed,  9 Nov 2022 12:23:37 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id c25so25489568ljr.8
 for <freedreno@lists.freedesktop.org>; Wed, 09 Nov 2022 04:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LBaghFCNLCn53Zo0ESykylrMeqC7VBs3SaG0Oah8iBU=;
 b=K4f2Tkz0IdNrCtCn+w15VBUcN0WUOBldpK7GtWpm9EJ3B6hz/HMTwR5xgLmvc1hFlb
 aqthXrfpzJahaCPc+JdQshbKg7YS+NdzLIoVejxPlg/RVwAEcXlIvy8gyYZqAvZ1rbys
 9zuSlthowI2MXjF8NTVx54Yl+m2rFOR299V04GeD1WGOJRnJcMrcacQ9GzfeLa+bN0Fk
 Zu0+f6ovEGQZEouwd9F2DQL0VqhJJFKZTXxc4CMc7IzqtM8rV5t3g08HmDqLwjzwAhSc
 vCwQxsygv/XO0GQi5nj9cW4ndHsxDpkxjsNbccxvwSV4C7CLPHQJkiMo2jH1HeSo9UAf
 gRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LBaghFCNLCn53Zo0ESykylrMeqC7VBs3SaG0Oah8iBU=;
 b=pwALAlDJ6tUd0QF5gP8PpK0ZnILKuNsp7H3I4ZmJIMKcpc2Zfr9O1WNnzk6HKAiKCM
 Qi2CSVor3xI8tHZby1FBcQf0xa6KyKEF1v2petj4N7muf4VYpOzngoGf09hqgB5b/t4K
 3UNKlk8//9JhmNFbrRyDipeZN5sqn9GVpwxwhDnL74AfpAYenzTzXjd0gfAczF2Lulut
 LgJ3vJwcpQFb79YxfG0Snzn975LbbTdQpYEyi4nKrCp+rG+OLqxqHboa2zXKbO+VYFYR
 eUUhqRSS8DDofXku6CR0uX22lvGk9zPVKyzpf7G8fKdL2ztJMNUNBheU6JY4zqAjUIqt
 iPkQ==
X-Gm-Message-State: ACrzQf3byEE/OyBAOwZHzls/UwQhsXnZ0loJeEHWPQKBMwvEcxE+sOUr
 JW+c/pX5aJmfQ60iYkMKRfQ05g==
X-Google-Smtp-Source: AMsMyM5Tb4oJvE2LEWjw2h4YUxtu3A8jk9pEJTwt1NJBdxpLQRsCwMnfYNsGyhbK0CJ1a0UvbBQsPg==
X-Received: by 2002:a05:651c:2009:b0:277:5992:b532 with SMTP id
 s9-20020a05651c200900b002775992b532mr16484963ljo.506.1667996615402; 
 Wed, 09 Nov 2022 04:23:35 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 s26-20020a2eb63a000000b0026dcf238c50sm2135233ljn.127.2022.11.09.04.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 04:23:35 -0800 (PST)
Message-ID: <3f054ff6-3868-d0c0-a8ad-66b87489714f@linaro.org>
Date: Wed, 9 Nov 2022 15:23:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
 <1667996206-4153-3-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1667996206-4153-3-git-send-email-quic_kalyant@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/4] drm/msm/disp/dpu1: helper function to
 determine if encoder is virtual
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/11/2022 15:16, Kalyan Thota wrote:
> Add a helper function to determine if an encoder is of type
> virtual.

Please use commit messages to describe why you are doing something, not 
what you are doing. In this case I can predict, why do you need this API 
without going to patch 4.

> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 +++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5d6ad1f..4c56a16 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2469,6 +2469,17 @@ bool dpu_encoder_is_external(struct drm_encoder *drm_enc)
>   	return dpu_enc->disp_info.is_external;
>   }
>   
> +bool dpu_encoder_is_virtual(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +
> +	if (!drm_enc)
> +		return false;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	return (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_VIRTUAL);
> +}
> +
>   struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   		int drm_enc_mode)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 43f0d8b..6ae3c62 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -136,6 +136,12 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
>   bool dpu_encoder_is_external(struct drm_encoder *drm_enc);
>   
>   /**
> + * dpu_encoder_is_virtual - find if the encoder is of type virtual.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +bool dpu_encoder_is_virtual(struct drm_encoder *drm_enc);
> +
> +/**
>    * dpu_encoder_init - initialize virtual encoder object
>    * @dev:        Pointer to drm device structure
>    * @disp_info:  Pointer to display information structure

-- 
With best wishes
Dmitry


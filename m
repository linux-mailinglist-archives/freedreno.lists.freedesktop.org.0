Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A12622B64
	for <lists+freedreno@lfdr.de>; Wed,  9 Nov 2022 13:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F9210E4D1;
	Wed,  9 Nov 2022 12:19:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3282210E4D1
 for <freedreno@lists.freedesktop.org>; Wed,  9 Nov 2022 12:19:07 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id k19so25495165lji.2
 for <freedreno@lists.freedesktop.org>; Wed, 09 Nov 2022 04:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ye8sH1zl6sSv9DGDAjB1eEzXhmWboI2vsCHxYwdnJz0=;
 b=ZybYS6nV5FlcTXdHMLqh4gUjeCEABntLlbBDQEVcOAR1CZiPzbrwizoLaTkmEBRDoB
 nlxOmUVmwDcNHB9sx27cVU8h2xk0UuRyv8dTsTHL9ZhMRfRnb9jKGr0RuovM/JgfmAZl
 lxUPM4QzTpDcZJfxMpf8n0omxEYk42BKMKNGGmQufJ1+vfgNulurWPIvCC68Cx18q6FC
 T/9FEZngmNYLRa7CRlwPJF260cUIr5/s/iQbWzhjlPFaNHvracynMpdkxg60nTsk4pTw
 UOc2Ls4pdJy6SmAR/FlX0w9/udujOo3QWnowkPJB/m+iwAFzn6yvCl4FfqCRAi/j0vPp
 gpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ye8sH1zl6sSv9DGDAjB1eEzXhmWboI2vsCHxYwdnJz0=;
 b=3vw/V4UpJOYKDgWhC0qKvYPmmsRsegybCoJ7jKqTRhmROt1w5i4uTxWv1bnVvXp9hC
 Lv1qOz66T3lPfZ9mxSCgSl7eggVPMNHJ4ISSLX7jQkR8Nx7Qvh3nXKp8PlipiC2Lz1Ho
 KCfzhPz6NvzqFt5AyrHQDUQxQlM2tnW1lM5vEmaUXJ/UPi65VLakm5bO4qS59HcSmdGQ
 b77+4pEz5ktqHAkTOcKlJUMJUbHLPWXzQsj2zbwYGR0HRUgvjaf3BWA77TtL9E5buYH6
 mQ9UXGwZAb2MThPP5Rfo4qYx7ELzfEbFklS5RwxPaI+UrtODqrSAvAWkCQmHKi00ooM8
 42mQ==
X-Gm-Message-State: ANoB5pkLk6DWLYc8a5oACjLa1lc+bx4yS3I67HjSofaG8vlTp2wawyYI
 K+llL+om08LelYsRoQkc26mrXg==
X-Google-Smtp-Source: AA0mqf6Qt3W69twHjBbljDgjSSNO7IveTjCXXa66ab4tN+ev2MwpKhm0I2pTcRY2KRSEbjJplOS3zQ==
X-Received: by 2002:a2e:544d:0:b0:278:ba60:d4f0 with SMTP id
 y13-20020a2e544d000000b00278ba60d4f0mr1986815ljd.351.1667996345347; 
 Wed, 09 Nov 2022 04:19:05 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a056512238f00b004979da67114sm2192382lfv.255.2022.11.09.04.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 04:19:04 -0800 (PST)
Message-ID: <414280e3-6954-6832-10fa-66cdcdbfac18@linaro.org>
Date: Wed, 9 Nov 2022 15:19:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/4] drm/msm/disp/dpu1: pin 1 crtc to 1
 encoder
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
> Pin each crtc with one encoder. This arrangement will
> disallow crtc switching between encoders and also will
> facilitate to advertise certain features on crtc based
> on encoder type.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 7a5fabc..552a89c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -798,19 +798,19 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   	max_crtc_count = min(max_crtc_count, primary_planes_idx);
>   
>   	/* Create one CRTC per encoder */
> +	encoder = list_first_entry(&(dev)->mode_config.encoder_list,
> +		struct drm_encoder, head);

Please use drm_for_each_encoder() here.

>   	for (i = 0; i < max_crtc_count; i++) {
>   		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
> -		if (IS_ERR(crtc)) {
> +		if (IS_ERR(crtc) || IS_ERR_OR_NULL(encoder)) {

Why? Not to mention that the OR_NULL part is quite frequently a mistake.

>   			ret = PTR_ERR(crtc);
>   			return ret;
>   		}
>   		priv->crtcs[priv->num_crtcs++] = crtc;
> +		encoder->possible_crtcs = 1 << drm_crtc_index(crtc);
> +		encoder = list_next_entry(encoder, head);
>   	}
>   
> -	/* All CRTCs are compatible with all encoders */
> -	drm_for_each_encoder(encoder, dev)
> -		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
> -
>   	return 0;
>   }
>   

-- 
With best wishes
Dmitry


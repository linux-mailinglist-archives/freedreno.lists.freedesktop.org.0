Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE36421A49
	for <lists+freedreno@lfdr.de>; Tue,  5 Oct 2021 00:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638AF6E23D;
	Mon,  4 Oct 2021 22:49:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325596E241
 for <freedreno@lists.freedesktop.org>; Mon,  4 Oct 2021 22:49:09 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id u18so78189966lfd.12
 for <freedreno@lists.freedesktop.org>; Mon, 04 Oct 2021 15:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8tGetNrXALTlS0gY47hdtBEGpeMB4ZyPkCRNhwkRLtc=;
 b=vabATdZ84U2C/CkW9T7Ar3+yZgL63YcHmEBJBib8OV+HYPjdjLp3UakcWr/vMcIh9h
 xM10nmP/VgA7vSlM/y2UA3zcaXQxprsPyPbV477XMdge8jLj7Fn2Dnbzef6BBtc+pGdD
 L47RD8GQtqi/uReHNxSWfGy6ivC7zFOty1oCLBa1a/1iIfVl32IBUJmYCg0ej1lbMszr
 J4DmoXfK+/rg1CF/eEMDQ6Qa50ie/rcHjrH31/BBHkchTOdy8GvM1YI3WyDTfMsiYVAd
 7UDQOM9QcddcojhQ/g0lVlom3NyL7f1EYxpWJFlPfmbSme2CHLhBxQBSjXP1cyq3nui9
 GutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8tGetNrXALTlS0gY47hdtBEGpeMB4ZyPkCRNhwkRLtc=;
 b=aQXLlLaH7dmK7WLSqoMhL4LriOgp1dtucq1Rw4XzZ0pVe9AMBJHyGuaS2kPnx70F1c
 qiiiOTzrIDHy1E/Wx9PZFBdMg6yZ4R/1k+PWpliG8bebIy5mUOiJ2yXtJiNny1DYEejO
 Lu4GARrH7p5HBjrop1oPF4McYNqpN9PAWPtec5ROJaNGoU79J/vMndsOv5nvzLDgRzz4
 kyx0IKaDQ+GEVQoOaankbHR5GD/lAIl0xe2fvHTeSVUW5l+9YIrW8HbuIcT1lAkcYhKl
 Xxuk1OoKYj9epGw6YGTsDblOgi4Gwvescyo2I9tgzGQ1osMsEkr97/HX9nweePbbe7k5
 VAEg==
X-Gm-Message-State: AOAM530gAVcPOjWFnMhcV0xl4AXpOcCz5g2vafgvfYuLpeFxVwXU85bp
 Np85uq67OP5bOWWFdxTeyWHh4w==
X-Google-Smtp-Source: ABdhPJy+286dU+0v9d3W1xDxI2x6RfznBbPFqXMzp+FrGqO9VLlpm/Vz968b85aCsYJVKtYmxpaUtg==
X-Received: by 2002:a05:6512:1581:: with SMTP id
 bp1mr846072lfb.552.1633387747442; 
 Mon, 04 Oct 2021 15:49:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b26sm1782221ljo.123.2021.10.04.15.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 15:49:07 -0700 (PDT)
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, jani.nikula@linux.intel.com,
 Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
References: <20211001151145.55916-1-sean@poorly.run>
 <20211001151145.55916-10-sean@poorly.run>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b87960ad-20ab-a51a-97ca-9ca081b67ccc@linaro.org>
Date: Tue, 5 Oct 2021 01:49:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001151145.55916-10-sean@poorly.run>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 09/14] drm/msm/dpu: Remove useless checks
 in dpu_encoder
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

On 01/10/2021 18:11, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> A couple more useless checks to remove in dpu_encoder.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-10-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-10-sean@poorly.run #v2

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Changes in v2:
> -None
> Changes in v3:
> -None
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0e9d3fa1544b..984f8a59cb73 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1153,10 +1153,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   	struct msm_drm_private *priv;
>   	struct drm_display_mode *cur_mode = NULL;
>   
> -	if (!drm_enc) {
> -		DPU_ERROR("invalid encoder\n");
> -		return;
> -	}
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   
>   	mutex_lock(&dpu_enc->enc_lock);
> @@ -1203,14 +1199,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   	struct msm_drm_private *priv;
>   	int i = 0;
>   
> -	if (!drm_enc) {
> -		DPU_ERROR("invalid encoder\n");
> -		return;
> -	} else if (!drm_enc->dev) {
> -		DPU_ERROR("invalid dev\n");
> -		return;
> -	}
> -
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   	DPU_DEBUG_ENC(dpu_enc, "\n");
>   
> 


-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0978B4B1BB4
	for <lists+freedreno@lfdr.de>; Fri, 11 Feb 2022 02:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C8710E99E;
	Fri, 11 Feb 2022 01:58:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4287610E99E
 for <freedreno@lists.freedesktop.org>; Fri, 11 Feb 2022 01:58:12 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m18so13757486lfq.4
 for <freedreno@lists.freedesktop.org>; Thu, 10 Feb 2022 17:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gamHH2XRTylhvnpesSgZb4MLgHOJXtNvgSBoVlaZkEI=;
 b=axTit6MZ8JevfejidD0uuSMhoc6TK0NFsQLJ0jrYJvdvFiGqCFO8wqcQiomHy1yhzh
 xTdbz8AvRF/U6lD92A0I2bWKuEKexGffBNam4Xsu8sh5OAlMVqgG0OY/YN9OjxYXJIra
 FYwOlLO8xVSyXZaYbLLN40HfOzX8/8L5nmZfKqsy+/2Q/aDxRNAgoGM1Vv8qdlRqp1VR
 IvhvnDGqBy6ytxSrGECCOX18B4KCVqLYEmh5o8zA10Ivj4xEA775Oyv4EQVfCEPn03Bf
 af5wDQcXoEI5STOF7rv1MF6gwZERigtsexXX2J2aOCFdHaKPktTsiD8S71NzmH9TgWym
 HYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gamHH2XRTylhvnpesSgZb4MLgHOJXtNvgSBoVlaZkEI=;
 b=p+7Ip380qIf+xrTcM1RBAi9oPntrhr4mVFUQTa7uKsev5g6e3BeX4qUufKkXT3ltOy
 e1sEXtnb4/aOuv0lTuePanaIYrE1Fm3T4Cr/PBCM+CLnBBp30EeTey8G9TxnR4btxnnL
 1IYAfffvz6r9rsM8MJWdf6UwMCdt/WyQ1+FYWvd3eiuhsmWV9Zs0oLGvHHmvmd96Gsi0
 6L7d1X5kzwYgXiUgLCt9pYD8gHb2/gDWgYm4vJAvsK6GtRCEH8h6aU7mzhRW5PSGyP6P
 mHR4VfGBKT18bHU1diTH8zspWj5EXkmqU4P4TdePm+G8pf5UJZfCtPT5kYJLFU5tMkIl
 cuFg==
X-Gm-Message-State: AOAM531+z/ZzeBoMCSJiZ+Bu86pDWkez2VGlsidvu3VJCx12qzTl4XmQ
 vZ1/uaLb9uUS2eBXniEUblr9sQ==
X-Google-Smtp-Source: ABdhPJyNVF6EHpX/FJ4wtTo5mfa3zXeG+RA9WaRc4cptEen5cejv2SgQ4zqhUXKN8rip2gX3CTeGqw==
X-Received: by 2002:a05:6512:158a:: with SMTP id
 bp10mr6949684lfb.407.1644544690570; 
 Thu, 10 Feb 2022 17:58:10 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id bt2sm1206999lfb.93.2022.02.10.17.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 17:58:10 -0800 (PST)
Message-ID: <16278118-e33b-44f6-e815-fdcab44641bd@linaro.org>
Date: Fri, 11 Feb 2022 04:58:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20220210114106.290669-1-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210114106.290669-1-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Remove set but unused
 variables
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Guenter Roeck <linux@roeck-us.net>, Mark Yacoub <markyacoub@google.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/02/2022 14:41, Vinod Koul wrote:
> We get warning:
> 
> In function ‘dpu_encoder_virt_enable’: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1145:33:
> warning: variable ‘priv’ set but not used [-Wunused-but-set-variable]
>   1145 |         struct msm_drm_private *priv;
> 
> In function ‘dpu_encoder_virt_disable’: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1182:33:
> warning: variable ‘priv’ set but not used [-Wunused-but-set-variable]
>   1182 |         struct msm_drm_private *priv;
> 
> Remove these unused but set variables
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db439f9..132844801e92 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1142,14 +1142,12 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	int ret = 0;
> -	struct msm_drm_private *priv;
>   	struct drm_display_mode *cur_mode = NULL;
>   
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   
>   	mutex_lock(&dpu_enc->enc_lock);
>   	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
> -	priv = drm_enc->dev->dev_private;
>   
>   	trace_dpu_enc_enable(DRMID(drm_enc), cur_mode->hdisplay,
>   			     cur_mode->vdisplay);
> @@ -1179,7 +1177,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> -	struct msm_drm_private *priv;
>   	int i = 0;
>   
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
> @@ -1188,8 +1185,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   	mutex_lock(&dpu_enc->enc_lock);
>   	dpu_enc->enabled = false;
>   
> -	priv = drm_enc->dev->dev_private;
> -
>   	trace_dpu_enc_disable(DRMID(drm_enc));
>   
>   	/* wait for idle */


-- 
With best wishes
Dmitry

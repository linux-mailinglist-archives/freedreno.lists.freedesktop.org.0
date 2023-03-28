Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FEE6CC0F7
	for <lists+freedreno@lfdr.de>; Tue, 28 Mar 2023 15:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A8110E7E4;
	Tue, 28 Mar 2023 13:32:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB8210E2EF
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 13:32:28 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h11so8874238lfu.8
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 06:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680010347;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g02I1W6mgzmeB+62dRygpCTPnE6RlAEOPRopZrV7ckA=;
 b=sf1yYrLlvBSGwzL1Un+i29aDzjasFLnSZhFW526cxcgMFgnfqOTSddOEBHgTScrpIa
 J+p0RpULbpctLyQKOO2qE0K6zcnhLMZCk74vvtTei5jaksAwAP2UA1j7rObotVXIxEq5
 e7BPkSVXwNz7wgvaSR8TdOTjzJ4kId9OPXn8NL2MBqhpN1rFTL2h15NjIPxwx674jFLB
 LkX5JDGsLIbvFmMCe1lnj3DxsAy6IamOSOXD/oA2a2hUQR6DtTDLrsXdaJIV/PKZcita
 UMCe0CgszasSZlrevI10jSWaiBYGJRatIKtDUoSdVBD7nPO/1HTUKEGnlrEvbFlDBdFH
 Xb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680010347;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g02I1W6mgzmeB+62dRygpCTPnE6RlAEOPRopZrV7ckA=;
 b=AKEcd7INwK5GfMt5qXrNXjhazbBrm6ko0hrarl5Yz09WsLX/Yp9Y3Z5HfhLtqOEAAm
 U4htg1cjQHl7Uq9jnmoeqnE4hYHBzqM29nM0orFx1DcUaPk5fZZlLcsGf3DLrkQpQ0ir
 W9Kvvtnl+hRwCBe+BN5pu6HDZ7qTvRmzDLl7hx5HsAcjq9Fj3ozwqz1SJ5lX+zOWaOSO
 I62/hrOibsZhY9lAEn1qvzRc0iz+ozy4tmFJ/J+GoqBD7KxVZfPN16wFXAVaISwZMt08
 hPJzns5+IflR2hdsy55oXwRGdmcE+3yoqp7Cv2YYNCsdgZ5UK9ZCy1/evoiOSCzVLDKQ
 cSnQ==
X-Gm-Message-State: AAQBX9eNkRg9mpAFRyQGDL9c/9o5SFEjPSNSAimTB5zU3DGBE8Gz/udj
 wWmkoHsJcDEzzT/HIbQSIXEANgV3hx/pRCRIkXY=
X-Google-Smtp-Source: AKy350YA6+0RXq22Tp/f/x252Y9jHRcmh25+pxyJTdeF2GZpGC2jRnFljCQzR5U24g0I1wztOHrRRA==
X-Received: by 2002:ac2:5dee:0:b0:4ea:f74f:c077 with SMTP id
 z14-20020ac25dee000000b004eaf74fc077mr4982273lfq.12.1680010347125; 
 Tue, 28 Mar 2023 06:32:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a056512048300b004cc5f44747dsm5103824lfq.220.2023.03.28.06.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 06:32:26 -0700 (PDT)
Message-ID: <9c498192-f82d-cea9-17cb-80cb81b67714@linaro.org>
Date: Tue, 28 Mar 2023 16:32:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
 <20230316161653.4106395-32-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230316161653.4106395-32-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v7 31/32] drm/msm/dpu: log the
 multirect_index in _dpu_crtc_blend_setup_pipe
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/03/2023 18:16, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Lets print the multirect_index as well in _dpu_crtc_blend_setup_pipe()
> as it will give the complete information of the sw_pipe as well.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

For the sake of completeness:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 90b406e409d3..508e5b950e52 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -426,12 +426,13 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>   				   format->base.pixel_format,
>   				   modifier);
>   
> -	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
> +	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
>   			 crtc->base.id,
>   			 stage,
>   			 plane->base.id,
>   			 sspp_idx - SSPP_NONE,
> -			 state->fb ? state->fb->base.id : -1);
> +			 state->fb ? state->fb->base.id : -1,
> +			 pipe->multirect_index);
>   
>   	stage_cfg->stage[stage][stage_idx] = sspp_idx;
>   	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;

-- 
With best wishes
Dmitry


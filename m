Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AD76FEA9E
	for <lists+freedreno@lfdr.de>; Thu, 11 May 2023 06:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B2B10E594;
	Thu, 11 May 2023 04:29:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D9D10E0EF
 for <freedreno@lists.freedesktop.org>; Thu, 11 May 2023 04:29:15 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f139de8cefso43801145e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 10 May 2023 21:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683779353; x=1686371353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dJ9MXtnOkyAVZSPiIueGuCw4XVJi6n0drxpzqQb3yGA=;
 b=hfFw4KhqPnzGb7/9iNT+mQvt1xSemQLUAuB3c4pzvXG3Kt7q25rPzDiLXby+De7xdN
 Fz97vlkzFl4YKmn9l2YiFwwavKSnxAZnMiAo58/wIBeX9PMZoGxujTf6u2xbX+uN3eMO
 c3Ee7s9TkR4KLzo40oXYIvquEd6TrqfR531MyG1wQydr8dQ+j4+YfPhwqsJSWnvebiuw
 Hg9yp56X+1RdhsONFuKtndCy7dsIUWacyOF2wwVudKLM1GmhBHR0jNqLmtESTjuxXrji
 FelWnZooEfboxYJaMu3gVWdqalpnApA9dJfCQ4YRUpO3GnoteoQTP7ZDrOHh2MI+tr4v
 M7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683779353; x=1686371353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dJ9MXtnOkyAVZSPiIueGuCw4XVJi6n0drxpzqQb3yGA=;
 b=OtQa7C0yC9w7Rdx+2kQpcZ/EECN8bl4xnx+Vswb2FB70mKbKEhHCVHoFRFxk8bKpY7
 U4D6KJqOPiYUlYCyzvZufFzK9Wa0OPP9KNZeQFQuFWohjJT4Fbut1/0Sn0vLSXPaA5v7
 bZzHesgpVydwJ6dQQqkNwxpAGy/4sG77Wp+jv7rVj88AcDG+uzfT9N6F6eO8agWmw9IM
 CWOb0BH5TvG5b45+L06zHYh/cW9igO6Hj0kYafDHJ9hDiViVOJz8bKryDsf/HDcchFVR
 71zGgbkSIcmkPdyjrVbLBdRT2H1qq1M+gtrbq7OuE6TOVCvg82rV6XZplUM8M9ghIR+P
 4vGA==
X-Gm-Message-State: AC+VfDzkYV5qe8LV68+WFFPQQOM2uti+RHnjEkeKZwwSnO7vsuueeccO
 f+gMv8NHJBxCj29M7p25IoLL0g==
X-Google-Smtp-Source: ACHHUZ4zi2SfJVRXQ/IZVAj25HEo64XGEYiTDFLfilGlyFboBiHXVQshtFq4MApzsvuQ+QZk4VrpMQ==
X-Received: by 2002:a05:651c:1316:b0:2a8:bb0a:2214 with SMTP id
 u22-20020a05651c131600b002a8bb0a2214mr2180194lja.12.1683779353464; 
 Wed, 10 May 2023 21:29:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a056512102400b004f24db9248dsm965718lfr.141.2023.05.10.21.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 21:29:13 -0700 (PDT)
Message-ID: <b4438422-f24b-7fc1-18cf-3cebdd777530@linaro.org>
Date: Thu, 11 May 2023 07:29:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
 <1683756453-22050-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683756453-22050-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 2/8] drm/msm/dpu: add DPU_PINGPONG_DSC
 feature bit for DPU < 7.0.0
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/05/2023 01:07, Kuogee Hsieh wrote:
> DPU < 7.0.0 requires the PINGPONG block to be involved during
> DSC setting up. Since DPU >= 7.0.0, enabling and starting the DSC
> encoder engine moved to INTF with the help of the flush mechanism.

Nit: was moved.

> Add a DPU_PINGPONG_DSC feature bit to restrict the availability of
> dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() on the
> PINGPONG block to DPU < 7.0.0 hardware, as the registers are not
> available [in the PINGPONG block] on DPU 7.0.0 and higher anymore.

this looks good

> Existing call-sites to these callbacks already skip calling into
> them if the function pointer is NULL.

This is more relevant for patch 3 commit message.

> Add DPU_PINGPONG_DSC feature
> bit to all chipset with DPU < 7.0.0.

This is incorrect, as we do not change the catalog in this patch.

> 
> changes in v6:
> -- split patches and rearrange to keep catalog related files at this patch
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 +++-
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 82b58c6..78e4bf6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -76,13 +76,13 @@
>   	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>   
>   #define PINGPONG_SDM845_MASK \
> -	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE))
> +	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
>   
>   #define PINGPONG_SDM845_TE2_MASK \
> -	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
> +	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2) | BIT(DPU_PINGPONG_DSC))
>   
>   #define PINGPONG_SM8150_MASK \
> -	(BIT(DPU_PINGPONG_DITHER))
> +	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>   
>   #define CTL_SC7280_MASK \
>   	(BIT(DPU_CTL_ACTIVE_CFG) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 6ee48f0..dc0a4da 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -144,7 +144,8 @@ enum {
>    * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
>    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> - * @DPU_PINGPONG_DITHER,    Dither blocks
> + * @DPU_PINGPONG_DITHER     Dither blocks
> + * @DPU_PINGPONG_DSC        PP ops functions required for DSC
>    * @DPU_PINGPONG_MAX
>    */
>   enum {
> @@ -153,6 +154,7 @@ enum {
>   	DPU_PINGPONG_SPLIT,
>   	DPU_PINGPONG_SLAVE,
>   	DPU_PINGPONG_DITHER,
> +	DPU_PINGPONG_DSC,
>   	DPU_PINGPONG_MAX
>   };
>   

-- 
With best wishes
Dmitry


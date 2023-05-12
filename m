Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEFC700E7D
	for <lists+freedreno@lfdr.de>; Fri, 12 May 2023 20:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D0410E239;
	Fri, 12 May 2023 18:17:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FAF10E239
 for <freedreno@lists.freedesktop.org>; Fri, 12 May 2023 18:17:24 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ac770a99e2so110862421fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 12 May 2023 11:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683915442; x=1686507442;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p8LjK4ZemVtaeznMyMIjTyfuWDgeRicQP0JV6f2MQjA=;
 b=ZsgX14HdZNUYY5EXlI9ncQqhjLmQvtPy2jmPMxVkmmJw8LNvnEO7iHtFtV1Bwmb1Yy
 6UDRDix+mPm03ryv0SACodMr8watklVxv9180YcYCWLZ7K/2KcDxSGhi0O2qU10fcTBn
 PfP4c79Ahhqan/sd47iWZqpvLzyLrF1QKzyyq24j7hcZwoI0zbopmDkwvGe08ug2XBrv
 +NtxgXtpIY3wQ5OBMqFsbBXJzTmO/xKU0Xn+hleDGxQwlYX9r7Aly+0BxgKk07lxWKOu
 dGE9aHk/w1j1oU+IJMcIUBuNE6WhPglt1HKUPfFTjIJcfHFiyYsx0jcWdjvMvldQ7qyC
 mXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683915442; x=1686507442;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p8LjK4ZemVtaeznMyMIjTyfuWDgeRicQP0JV6f2MQjA=;
 b=MO/JJAa30XQa8mRhle5SVXdi2g0FQIG3At05HAHeRKX7AYi5jiv0GmH7axcwIlk1v3
 1rqS3gt7yHQUDUDQ0M8NgTZYlakJav2ZZtPjpYh5lOj8UlM1ZYOHDbTlAa5ufioa6PKf
 49wEAFHwdt+T+npsHk/Tp8X9i0ui3y7i41eMvprhhY6LPV1Wutkot/hSCpVhR5+vQ9OW
 vkFZe4HgXLX5hywgFixc66uvYPBhtKsJ/7k6zxUAHNJOclInbZHKzwIrk6C2npNtGZJ9
 ZX+zHjL7sfT8soau/HT1AsfFIZ3bNAzjGhPTb86PLMwdsKWBV2LKo2uWPlwzpHmlUd8Y
 Ulqg==
X-Gm-Message-State: AC+VfDyO0+kDW+xOKH3L9QoyrwTPgTbk5SjJvTnwPgNm6O4Nz0b2PDBb
 53uF1634zArNyFCeJmcGLtXIFw==
X-Google-Smtp-Source: ACHHUZ56KzPHcvyVXISoCDT+BjPuF8ObSV6drs7BIb1OVrKaHr38w2ZoACWKPgKAHJ2TLDMqp0aFUg==
X-Received: by 2002:a2e:94c7:0:b0:2aa:41a1:cd6c with SMTP id
 r7-20020a2e94c7000000b002aa41a1cd6cmr4049471ljh.23.1683915441876; 
 Fri, 12 May 2023 11:17:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a2e9b0c000000b002ab397f1b0bsm2876929lji.3.2023.05.12.11.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 11:17:21 -0700 (PDT)
Message-ID: <bbdef42d-1458-9acc-9233-d9a63d92d7bc@linaro.org>
Date: Fri, 12 May 2023 21:17:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683914423-17612-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v8 2/8] drm/msm/dpu: add DPU_PINGPONG_DSC
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

On 12/05/2023 21:00, Kuogee Hsieh wrote:
> DPU < 7.0.0 requires the PINGPONG block to be involved during
> DSC setting up. Since DPU >= 7.0.0, enabling and starting the DSC
> encoder engine was moved to INTF with the help of the flush mechanism.
> Add a DPU_PINGPONG_DSC feature bit to restrict the availability of
> dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() on the
> PINGPONG block to DPU < 7.0.0 hardware, as the registers are not
> available [in the PINGPONG block] on DPU 7.0.0 and higher anymore.
> Add DPU_PINGPONG_DSC to PINGPONG_SDM845_MASK, PINGPONG_SDM845_TE2_MASK
> and PINGPONG_SM8150_MASK which is used for all DPU < 7.0 chipsets.
> 
> changes in v6:
> -- split patches and rearrange to keep catalog related files at this patch
> 
> changes in v7:
> -- rewording commit text as suggested at review comments
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Single nit below

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

Ideally this should be a separate commit. It is irrelevant to 
DPU_PINGPONG_DSC

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


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05631704300
	for <lists+freedreno@lfdr.de>; Tue, 16 May 2023 03:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C8910E2CE;
	Tue, 16 May 2023 01:39:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C491E10E2CE
 for <freedreno@lists.freedesktop.org>; Tue, 16 May 2023 01:39:05 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f137dbaa4fso16137756e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 15 May 2023 18:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684201143; x=1686793143;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EEd2VNamh1i6jf7PkiHXJC0cUQGs4JXzfDvZf2SFrsY=;
 b=fzN2hqaAGe1KyV8sUYflKtQl3IPGSaX0LiupKOi8VqGUk53LwWoZw2uOFBv1iBHiiY
 ygaxcokdSmP2NFtMaiiUN3/nlrpfgJi36uNoagsv8tFNb8zDo2lBhhV1RtvftwOPV9Xz
 p8drDmaNxSbx5xoVvNzds54Unq8mGx+Mm+G6gD/t/hbfW/Ws8HIMZuTJ2YLd/AxMjSW+
 KuE3mR/PJvUlC+1svaDlCJilolhc+nk38qlgTKEfZRASOp4R+hELK366WGREHqHwwN7h
 xoxURRgYiR882yxLt+3lYoIrB04GgQmZaNd/G1OteyrbMv3Yk+2i685LjP7WYRGPMc8G
 64DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684201143; x=1686793143;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EEd2VNamh1i6jf7PkiHXJC0cUQGs4JXzfDvZf2SFrsY=;
 b=dMDNSsG167yDqr9Obj2Zl1sYPva6g4Hv2/6BKsiMzQPsAvbyDfTUqaVz+bVJk9UQ7F
 G40HKZRgRNk+BGc/O31A8Rz0BhaMjONFe69AwX6cIG4w2bXWFWQJ4SWokDh4WYHmbWMB
 ecOy7HA4qcZpXl1/FAoeq4MWWBleOQa9ebhkVbdF9hAKl6zBjh3E5/vXRUQWEapTCDDv
 zS9I5Xqfo1k+QpYH4D1T+LLu/VbMbi/hQ2t9nUIybSARRcFNend6/waGuPdSe2xuVOf/
 p9B+rwtGMeiYuYuUcDTdV/qCPU4jKiTi2XvHmwlcvoWfpjd4TFFnhBpEEl77DT43ISNQ
 bAKg==
X-Gm-Message-State: AC+VfDxz3CjMeLEqt0vBmTOIV2QXRHFdCZsoobH7vwkQjs6Sg2AIQrvl
 nmaiygZHe1l5wQaegMezUsMFTQ==
X-Google-Smtp-Source: ACHHUZ6fpj4cg0RPG98p6BQpabeODsCHDUgNJuiOzcslPL8r/crEfJmYtontwB5v0f+wE7768UWM0Q==
X-Received: by 2002:a19:750b:0:b0:4f2:5007:bd7f with SMTP id
 y11-20020a19750b000000b004f25007bd7fmr6730952lfe.36.1684201143600; 
 Mon, 15 May 2023 18:39:03 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a056512007600b004ece331c830sm2797419lfo.206.2023.05.15.18.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 18:39:03 -0700 (PDT)
Message-ID: <2f24af7e-058a-5a70-f3ad-99ff4f0ed0a5@linaro.org>
Date: Tue, 16 May 2023 03:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: don't set
 IO_PGTABLE_QUIRK_ARM_OUTER_WBWA with coherent SMMU
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
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 10.04.2023 20:52, Dmitry Baryshkov wrote:
> If the Adreno SMMU is dma-coherent, allocation will fail unless we
> disable IO_PGTABLE_QUIRK_ARM_OUTER_WBWA. Skip setting this quirk for the
> coherent SMMUs (like we have on sm8350 platform).
> 
> Fixes: 54af0ceb7595 ("arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes")
> Reported-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: David Heidelberg <david@ixit.cz>
> ---
Also required for SM8450 (and others)

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org> # SM8450 HDK

Cc: <stable@vger.kernel.org>

Konrad
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2942d2548ce6..f74495dcbd96 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1793,7 +1793,8 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>  	 * This allows GPU to set the bus attributes required to use system
>  	 * cache on behalf of the iommu page table walker.
>  	 */
> -	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> +	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice) &&
> +	    !device_iommu_capable(&pdev->dev, IOMMU_CAP_CACHE_COHERENCY))
>  		quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
>  
>  	return adreno_iommu_create_address_space(gpu, pdev, quirks);

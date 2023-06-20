Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB611736965
	for <lists+freedreno@lfdr.de>; Tue, 20 Jun 2023 12:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B73210E2A6;
	Tue, 20 Jun 2023 10:35:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E0E10E2A6
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 10:35:55 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b479d53d48so28253041fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 03:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687257353; x=1689849353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/HIA2CPxgECjXLspDDsjBe6Xv7WQ50oq1xrRdt7Bp5U=;
 b=sVPvMzd8ZXN6fxiD2g18okClyC51hJfp0d54xnvst+U3AgVzvn0TK1b6PuQdEtFrTw
 Iv/vqOjmm6F4LhfhFF+BYgXbKQo0jIoR/LTmZ6WGl1994yjMbNJ+FfX1rviiepbOUZvU
 yJnIvN33VaiaP/zbYArV6ndtl9cax7PA+GMlxdF4c8WP7QNkO2XZpMqCYpVm+D+EmTlH
 5C0Mv6679SGVx2Z+gnNLt4ycjaEStf9uB0hEyuJ14jJrpmRd8zlaiZxxgcIdLUJOWP2L
 lv6Uuw4AD6mOhLftfE8Ha3PLlfbbLkL66+HCS+zv7SchnCIV27RjQKJt1MzNr/+MfZuW
 OCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687257353; x=1689849353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/HIA2CPxgECjXLspDDsjBe6Xv7WQ50oq1xrRdt7Bp5U=;
 b=Or7yeh6dPVj9afaQD5h6NwzarNhrC8+BiXCxGosCavxzwvx0+/wNgoD4E8cM+K/SBV
 Gyfe/LG34Bos8mgCWmBaa+mbfST7Yeir6W/Fi9gUYSYMBEIbwZC5HaBoyF3tn0lZmLFm
 zbLAU4xMPYsYGL2oUaD8QaOKfSu/AzXUNnMo6ffh79umta+tMw7ue9Q7cO8IjqP1oEC+
 hIJD/YudrnQfYhYSMqMuRgHBIQ7FuYQQlLIwQM2GnjzOX4k/mpV7ywzdex00eOEifXjU
 Ce9m9IAkFkAZhJ8gftWACVYA17hPFtfyNA9XN8Xv6ilqsB30sD0VNfQc4LQVeezuQxf+
 uX4g==
X-Gm-Message-State: AC+VfDxJooMLrvKcsAneD39dnCoYX3aIf3l1EWltyOSkEOGqCuMIZpBY
 xLOQL6gL5JloscaHLoOMbwm65w==
X-Google-Smtp-Source: ACHHUZ7Vk8cUEKNVc/DdXw9Q7qrbYezVTFnd3aciTZZxAlPCmlNI4FE1L+wYmVuHxswAOAO6vrO1sQ==
X-Received: by 2002:a2e:a175:0:b0:2b3:47b3:3c39 with SMTP id
 u21-20020a2ea175000000b002b347b33c39mr7252516ljl.23.1687257352911; 
 Tue, 20 Jun 2023 03:35:52 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 b22-20020a2e8496000000b002b1f8c10926sm347259ljh.138.2023.06.20.03.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:35:52 -0700 (PDT)
Message-ID: <06087f90-ba34-f044-707c-7f3557ec6198@linaro.org>
Date: Tue, 20 Jun 2023 12:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-2-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620000846.946925-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/8] drm/msm/dpu: drop enum
 dpu_core_perf_data_bus_id
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20.06.2023 02:08, Dmitry Baryshkov wrote:
> Drop the leftover of bus-client -> interconnect conversion, the enum
> dpu_core_perf_data_bus_id.
> 
> Fixes: cb88482e2570 ("drm/msm/dpu: clean up references of DPU custom bus scaling")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index e3795995e145..29bb8ee2bc26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -14,19 +14,6 @@
>  
>  #define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
>  
> -/**
> - * enum dpu_core_perf_data_bus_id - data bus identifier
> - * @DPU_CORE_PERF_DATA_BUS_ID_MNOC: DPU/MNOC data bus
> - * @DPU_CORE_PERF_DATA_BUS_ID_LLCC: MNOC/LLCC data bus
> - * @DPU_CORE_PERF_DATA_BUS_ID_EBI: LLCC/EBI data bus
> - */
> -enum dpu_core_perf_data_bus_id {
> -	DPU_CORE_PERF_DATA_BUS_ID_MNOC,
> -	DPU_CORE_PERF_DATA_BUS_ID_LLCC,
> -	DPU_CORE_PERF_DATA_BUS_ID_EBI,
> -	DPU_CORE_PERF_DATA_BUS_ID_MAX,
> -};
> -
>  /**
>   * struct dpu_core_perf_params - definition of performance parameters
>   * @max_per_pipe_ib: maximum instantaneous bandwidth request

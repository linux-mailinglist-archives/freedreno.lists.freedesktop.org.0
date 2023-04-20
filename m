Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3916E934C
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 13:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F16910E20B;
	Thu, 20 Apr 2023 11:47:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AA410E23F
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 11:47:24 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ec81245ae1so512903e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 04:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681991241; x=1684583241;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=utfMEwjRtQb+equBbrKCD4/CcQSjoaSGMcoZ72gCVUA=;
 b=Z95rycXDwUNq2/dzSTQKDDcUK4tqkWc+YMELEldeqvDixA2V+Z+xNp330XqyOOBrmk
 v/wW41zMrD+3p1GrFUD/y6BSpPX7F33bjHFF9DDNEY6I6UfxTuB8Id8FRZ8lVCRepr0q
 h3+qxLEQskhrORnHK96uzUwSp9JUDljd3yidp7xqu2Z9DUjr9vHCPg+BxNbc6QDjl3q4
 eHwSd9ZRs5828Cm0iQF02/L4ayxfHlQSNuzpU9C0XG0vWQk0SekdxyOLw7r7leKxXYfC
 I+PdjXUuijJBxwx7+nm/1hIZZttX8IA91cVufFVvPa3xoUiTv31/YKCscw8oaUPXrNuJ
 5s/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681991241; x=1684583241;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=utfMEwjRtQb+equBbrKCD4/CcQSjoaSGMcoZ72gCVUA=;
 b=ekTK1d+F4Jphmk6fKZ4lr26U0C2feWgIvFHgOtqWpl8BNnpyMqxF17gnLejaUtqyl8
 3CEEkiaym4tkESaobDumUu6s7ytZQjec9Rb8V02EZiSL/8++MjwTu/HU2CAXt2LpQyfi
 qDB1y3v22zkX/5epGx2aNyDpf+WLbg9cxUpJMXFwMUe9gaDQW+MX0WUSrHD8E/IJvuBe
 lHEu1HIVRq1NoDl1BXJwb7Zkw1OiM0XibGZlYLY40AE4kqRHPWkYASRHFngGDeUgNCzq
 W7uUch/JH5sQerGVuk/3TgMu+3l7bCqOED1GUnG1CRlQiekz29RFR/02g6JXUnrXaMhF
 GAig==
X-Gm-Message-State: AAQBX9ctspVcAI/jNb02uVDHoaWijsKeObxHqM373kdIBgjvWkLzn7ZK
 Z9N0Z5sUQBXMbHb0Ihox8jMWHw==
X-Google-Smtp-Source: AKy350YpTdCf86eHSVO6lbjuxm9lf1D6AX1RTL02jKTJiTegbNyrqK4LLlNSpQqowFLuQZw9kxbxbA==
X-Received: by 2002:a05:6512:145:b0:4d7:44c9:9f4c with SMTP id
 m5-20020a056512014500b004d744c99f4cmr415139lfo.4.1681991240676; 
 Thu, 20 Apr 2023 04:47:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a195210000000b004eed6175e3fsm191457lfb.143.2023.04.20.04.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 04:47:20 -0700 (PDT)
Message-ID: <786cda44-cd82-4353-d195-35a987a80b3d@linaro.org>
Date: Thu, 20 Apr 2023 14:47:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <20230420-topic-dpu_gc-v1-1-d9d1a5e40917@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230420-topic-dpu_gc-v1-1-d9d1a5e40917@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu1: Rename sm8150_dspp_blk to
 sdm845_dspp_blk
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/04/2023 04:14, Konrad Dybcio wrote:
> SDM845 was the first SoC to include both PCC v4 and GC v1.8.
> We don't currently support any other blocks but the common config
> for these two can be reused for a large amount of SoCs.
> 
> Rename it to indicate the origin of that combo.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
>   9 files changed, 27 insertions(+), 27 deletions(-)

Please follow this by enabling DSPP on sdm845. Otherwise it is strange 
to have sdm845_dspp_sblk, but not to have it enabled on sdm845 itself. 
If necessary, I can test it on RB3.

-- 
With best wishes
Dmitry


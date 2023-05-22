Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7491E70C1A2
	for <lists+freedreno@lfdr.de>; Mon, 22 May 2023 16:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6DA10E346;
	Mon, 22 May 2023 14:58:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9ADA10E346
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 14:58:45 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2af29b37bd7so36532361fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684767524; x=1687359524;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GB7XYhd2mlIH0fHMUAhimGnNPOH+S2GqRkVg6KqMpSs=;
 b=gPTggsTBERvcP+EXfapcNg3Im+HXfZaBAsfZou5V4jt90/bqnENtw1bbGYVIeHQyd0
 N6wQ4CN9n+IvlsUIFDXSqPAbwWfZ5KAUrtV7Q4eUdvFdpaUPrPzlQZm9rY2UHZ08vYVi
 EhCYxVKDHkgk3wft4zSgmjRkJBTST7DXgkSbzSmVS/L+VR9XbHPGLsfwL8ExFI2TKeyd
 jmthItPiRl4f5pxPwlu7d58UfmQAHPWbcubxJ2h1ptGdgBtsIe4L9PDhgo1wzb+tSsXk
 zBDdkdfYTAVJclEgmyFlDS0bdqNcP2pSv0TuGQnkDMG6yEAkut3jc/xVdEdC2hwIlR9I
 EWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684767524; x=1687359524;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GB7XYhd2mlIH0fHMUAhimGnNPOH+S2GqRkVg6KqMpSs=;
 b=QDYHam6X90ictM5kngtvJO9jiYoU9Q7AsZ5gCUxCrQWhWgyJzmSMhj4qSMvlz9Cl2C
 JtqwN9+MOwF1ht40XfOoe2PPWf8lqcs823jo/lFNuUVPo7wlxK9Q/s/hRgtbw0xk8QTZ
 xmZ9MOzE/sdYBXLsxI3IidKUuVnqLtNxrD4lo6MbzrVbWBYv8F6a28y3KEI0J3BnOdYv
 959eMphcYrqgABkLzDpRQwRz+FEWi3pl/CabHuy+v3NTWiMg5/Q3CdCJoBo/qBqFuzn9
 MufPpTUlmSCZORhDNH0kqstK+KcoYSpEuttHzAZDx8c5BhEbgeGwzKFthdPG7LH9qyth
 GAeA==
X-Gm-Message-State: AC+VfDwMwpCNNLWaPwdwKHwLqyOGAN/R/r/fCM2oejVLat6kd9P9Ugz0
 zGfgUJ+Puoqa1TZhf9FgCFD2rw==
X-Google-Smtp-Source: ACHHUZ4BDbUixCFCn6K/ZmSTVEPc3IlyEtxt5/2WqXNMuohCC/E7nqhpjiIN29qz4pge9WjbtitRVA==
X-Received: by 2002:ac2:489c:0:b0:4e8:5112:1ff2 with SMTP id
 x28-20020ac2489c000000b004e851121ff2mr3557967lfc.27.1684767523807; 
 Mon, 22 May 2023 07:58:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a19ac4b000000b004f3942e1fbesm1021727lfc.1.2023.05.22.07.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 07:58:43 -0700 (PDT)
Message-ID: <0be4bb6e-40dd-f4bd-3fd2-d62fa228d356@linaro.org>
Date: Mon, 22 May 2023 17:58:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: neil.armstrong@linaro.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
 <20230522004227.134501-4-dmitry.baryshkov@linaro.org>
 <80da4c26-ca3f-00c9-072c-087a1ff24c74@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <80da4c26-ca3f-00c9-072c-087a1ff24c74@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 3/6] drm/msm/dpu: split interrupt address
 arrays
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

On 22/05/2023 17:36, Neil Armstrong wrote:
> Hi,
> 
> On 22/05/2023 02:42, Dmitry Baryshkov wrote:
>> There is no point in having a single enum (and a single array) for both
>> DPU < 7.0 and DPU >= 7.0 interrupt registers. Instead define a single
>> enum and two IRQ address arrays.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 82 +++++++++++++------
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 28 ++++---
>>   3 files changed, 74 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 677048cc3b7d..72530ebb0ae6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -351,6 +351,7 @@ struct dpu_rotation_cfg {
>>    * @has_dim_layer      dim layer feature status
>>    * @has_idle_pc        indicate if idle power collapse feature is 
>> supported
>>    * @has_3d_merge       indicate if 3D merge is supported
>> + * @has_7xxx_intr      indicate that INTF/IRQs use addressing for DPU 
>> 7.0 and greater
>>    * @max_linewidth      max linewidth for sspp
>>    * @pixel_ram_size     size of latency hiding and de-tiling buffer 
>> in bytes
>>    * @max_hdeci_exp      max horizontal decimation supported (max is 
>> 2^value)
>> @@ -364,6 +365,7 @@ struct dpu_caps {
>>       bool has_dim_layer;
>>       bool has_idle_pc;
>>       bool has_3d_merge;
>> +    bool has_7xxx_intr;
> 
> looks good, but I can't find where has_7xxx_intr is set in the patchset
> 
> Neil

Indeed. It seems I missed a patch.

-- 
With best wishes
Dmitry


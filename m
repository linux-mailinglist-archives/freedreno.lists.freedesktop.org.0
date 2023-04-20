Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C46E877E
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 03:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D512710E9AF;
	Thu, 20 Apr 2023 01:36:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5726910E9AF
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 01:36:18 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id l15so1041794ljq.8
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 18:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681954576; x=1684546576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hT/95VjOVyKO2T89/0I5XEoyuSp1YYge4tfF3uB8zg0=;
 b=aQmh+2X+m1r5KN/IFBsO7Dh4brwJDxvSv03WBhSjp5FcgMBhIdC2TZAZofOewtHBaG
 rod4IkuKDY4gR6vWu09pf5B9gV3+HLlo7DVvXnXNInqNdMBhGGqSloP685b2BP2Q1ZP+
 JQDNmMFBzqUlVUx5Mbvn0+3yQDVmI6O6izzuK/RvkGKJNbDFKJ8GQ0OXspdBEVrzQ1Hu
 4ENw5p2v47DmlStJxwWB999K8MIQnzxB79wpsft/VOYKnWsXmbNcSYxd9vjlwznd+LeR
 4d8a7/7jKNcTMfPxN8QrCMZiWhP+qZcVYyu4C/pPmWRhdL4QKePzBcP6AxFY/ki42l6F
 dreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681954576; x=1684546576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hT/95VjOVyKO2T89/0I5XEoyuSp1YYge4tfF3uB8zg0=;
 b=K4yXpj2CrsszaS+2DIF7KEAV1kSaFnL44egHmOB3HzwTuVNJFHSWzsKoVdXYwvnocX
 SaxuReTalM4EI8BZhVL/apQyZNPzTxbONQVykVE5rQuH7uqvkY9cP+RMCnwWcGwjfgXB
 dR2G8nG/IrudHCBXVbeZjP6+bdfjZhqrK+u6NT+jXYvBEmOfSyJqR6WCC3stBRhdlZb2
 O6V0hw+7SR0RHuhdjqkwBJhF435eIaaeTHO/Po2X9W1XDuc2z1GCetl2vI5nkXlYRvfC
 mR5xJHNVfzi9q8h+yroLQ6esHX1NWAIHXdixDlLd4r8kISEm2VFkVUtVpU+cwKQKV4Q3
 GIYQ==
X-Gm-Message-State: AAQBX9d4SKokVxJ68D1YJas1pmz0hOwzLKzH1bxuV4d3/sm1tBCuA9ff
 7ZjnGIKYL09Cs/N6dG91QEbd7A==
X-Google-Smtp-Source: AKy350YiZKM6D3SyMMYJ7buEtOzY/rVkSbU/XM10s6fY0nV5WmwAeAeJO6Jk0/pLS6YLUe6bZ8ECFw==
X-Received: by 2002:a2e:9b17:0:b0:2a7:81fb:6e6f with SMTP id
 u23-20020a2e9b17000000b002a781fb6e6fmr2552660lji.10.1681954576436; 
 Wed, 19 Apr 2023 18:36:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a2e7c17000000b002a5f554d263sm35310ljc.46.2023.04.19.18.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 18:36:16 -0700 (PDT)
Message-ID: <2dff9d62-cffe-c66f-9e50-3ecd64e44d37@linaro.org>
Date: Thu, 20 Apr 2023 03:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <5b133c55-e4f5-bfd2-b542-a7d44313c038@linaro.org>
 <c0e0a55a-cc37-fe8a-8d8a-5fe257f99b9a@linaro.org>
 <3f3b3637-ed85-09a1-22b7-3ccd4bc929bb@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <3f3b3637-ed85-09a1-22b7-3ccd4bc929bb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 0/2] DPU1 GC1.8 wiring-up
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



On 20.04.2023 03:28, Abhinav Kumar wrote:
> 
> 
> On 4/19/2023 6:26 PM, Konrad Dybcio wrote:
>>
>>
>> On 20.04.2023 03:25, Dmitry Baryshkov wrote:
>>> On 20/04/2023 04:14, Konrad Dybcio wrote:
>>>> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
>>>> dspp sub-block in addition to PCCv4. The other block differ a bit
>>>> more, but none of them are supported upstream.
>>>>
>>>> This series adds configures the GCv1.8 on all the relevant SoCs.
>>>
>>> Does this mean that we will see gamma_lut support soon?
>> No promises, my plate is not even full, it's beyond overflowing! :P
>>
>> Konrad
> 
> So I think I wrote about this before during the catalog rework/fixes that the gc registers are not written to / programmed.
> 
> If thats not done, is there any benefit to this series?
Completeness and preparation for the code itself, if nothing else?

Konrad
> 
>>>
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>> Konrad Dybcio (2):
>>>>         drm/msm/dpu1: Rename sm8150_dspp_blk to sdm845_dspp_blk
>>>>         drm/msm/dpu1: Enable GCv1.8 on many SoCs
>>>>
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 16 ++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 16 ++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  4 ++--
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  4 ++--
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 16 ++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 16 ++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 16 ++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  4 +++-
>>>>    9 files changed, 55 insertions(+), 53 deletions(-)
>>>> ---
>>>> base-commit: 3cdbc01c40e34c57697f8934f2727a88551696be
>>>> change-id: 20230420-topic-dpu_gc-6901f75768db
>>>>
>>>> Best regards,
>>>

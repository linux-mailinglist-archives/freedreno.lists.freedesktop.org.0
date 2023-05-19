Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E9D709BCA
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 17:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6C010E068;
	Fri, 19 May 2023 15:57:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B6210E068
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 15:57:30 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f24cfb8539so3977983e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 08:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684511849; x=1687103849;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gyqJGcgiKlRGFOdUVMGd1+H8znReS5i9PU0Mw1LkroI=;
 b=wIv7zJGmZOzmR8bPv/3rOsRNQ5NQI5qHCHCpqeQfPmVVzT9QaeLPqTNpdKWrDSueSU
 GcaSSx+NiKOcJhy34LOnhDUo5Sj+DOhunfnTpmXxtZ4PG/VNIGX7mdejTbXR3NczGKHw
 wSRvyjBBA+COjx/vZl0Un+ig4VRGpkZpUSyozUIaGNNEF+BuSsTB/QH/xFaQKPa6Vq1c
 sNwQSzxYOZbffJ4POINlw9TadSHa3k7na/kw0DoseNKSVKiwfs48Hqn1KrPpPrweh2KH
 C8FlxXQLIF5RtTfmi5w7z7wI3eNOeEyqmHQvOARKX3vK6ZPvrT12Pg0+cl9z7pWtmJHs
 vOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684511849; x=1687103849;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gyqJGcgiKlRGFOdUVMGd1+H8znReS5i9PU0Mw1LkroI=;
 b=g+4Yl8cLzpeIZBaSaMMTRYiHGovSnMPfPSfgxb9r5HG9HXGLUqza7R07txI7aYFttd
 E4v1owYrxSoCi617dTSCjy9+UQBCovKphpmDJU3WK0MfpWmcYDMgxoq2+hdSpAS8x1j+
 OyJXIeB1POXX3dqA1674x+iEN8/3tcv4/pItCOWRRpWSp79uXh+R89LDhBXLS1SmeI/N
 2BKN1on5IgHNoNjKOzx0izAsZGQ5gvSiwkjGW2b+ruw58C2PlDKaOT9ILKG4dtwOHHSA
 0XbhwazsEW6JHywMCaFdDYvKx5S2ylbdxC/owz1ABfBy4d81i8h/CNBRkrbt7fq/HTag
 dcnw==
X-Gm-Message-State: AC+VfDxsa/A5GMejf4D/sXYo2Q4ZXReq4SdYlZXf7ftk8Wk72zKnkIaj
 wftJA2FjLW4u2lXt+lTR0j1Gqg==
X-Google-Smtp-Source: ACHHUZ4eg6P7EsJya8krxzoEIJiP35EV5No6NMvIL5TjaEGc7RVzlMqs+gNWmzGOwHC/GhboSL016g==
X-Received: by 2002:ac2:4423:0:b0:4f1:46ba:b089 with SMTP id
 w3-20020ac24423000000b004f146bab089mr918608lfl.27.1684511848284; 
 Fri, 19 May 2023 08:57:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i21-20020ac25235000000b004f3945751b2sm383780lfl.43.2023.05.19.08.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 08:57:27 -0700 (PDT)
Message-ID: <0cff7e2e-f2d8-58ca-1651-636143cb3ec2@linaro.org>
Date: Fri, 19 May 2023 18:57:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
References: <1684452816-27848-1-git-send-email-quic_khsieh@quicinc.com>
 <1684452816-27848-8-git-send-email-quic_khsieh@quicinc.com>
 <97ef8324-655c-a9fa-9722-9bd7054c25f4@linaro.org>
 <890cb047-83ac-989b-b3ed-919431305128@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <890cb047-83ac-989b-b3ed-919431305128@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v11 7/9] drm/msm/dpu: separate DSC flush
 update out of interface
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

On 19/05/2023 18:55, Kuogee Hsieh wrote:
> 
> On 5/18/2023 4:37 PM, Dmitry Baryshkov wrote:
>> On 19/05/2023 02:33, Kuogee Hsieh wrote:
>>> Currently DSC flushing happens during interface configuration at
>>> dpu_hw_ctl_intf_cfg_v1(). Separate DSC flush away from
>>> dpu_hw_ctl_intf_cfg_v1() by adding 
>>> dpu_hw_ctl_update_pending_flush_dsc_v1()
>>> to handle both per-DSC engine and DSC flush bits at same time to make it
>>> consistent with the location of flush programming of other DPU 
>>> sub-blocks.
>>>
>>> Changes in v10:
>>> -- rewording commit text
>>> -- pass ctl directly instead of dpu_enc to dsc_pipe_cfg()
>>> -- ctx->pending_dsc_flush_mask = 0;
>>>
>>> Changes in v11:
>>> -- add Fixes tag
>>> -- capitalize MERGE_3D, DSPP and DSC at struct dpu_hw_ctl_ops{}
>>>
>>> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
>>
>> NAK. The fix should be in a separate patch. This has been written 
>> several times during the review.
> 
> yes, i know that. but i just intended to keep this patch at same order 
> as before.
> 
> are you want me to move this patch to the first?

Split BIT(DSC_IDX) to a separate patch. It should be the first patch in 
the series.

Keep the rest of the changes in this patch. Keep the patch in the 
current order.

> 
> 
>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 23 
>>> +++++++++++++++++------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 13 +++++++++++++
>>>   3 files changed, 38 insertions(+), 8 deletions(-)
>>>
>>

-- 
With best wishes
Dmitry


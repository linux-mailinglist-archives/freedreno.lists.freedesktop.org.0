Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A91708A65
	for <lists+freedreno@lfdr.de>; Thu, 18 May 2023 23:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8CB10E583;
	Thu, 18 May 2023 21:26:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633C210E558
 for <freedreno@lists.freedesktop.org>; Thu, 18 May 2023 21:26:37 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4eed764a10cso3019548e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 18 May 2023 14:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684445195; x=1687037195;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t5y+SJ44ed16wCOTDLmLDzgIx2JaLtLRHFSw4/rCRS4=;
 b=Rdrjl1adp6g2FuL8l3mXU/M/JnPyPv9h9UaqAjcAT1BpEzKeS0JctH+d6BAHqfZpb3
 lWJwAi1iEO16Dc5hIQyQ1dbfTkXyuiiuhpm8wn9le/4dqMpDvTfIpxJmevoMFfnfDrko
 OHVjR2lwXz8eWHefFKwcSyJ8hOz8LOnbXxGtKeUll7PNYNQpV6zfpUelppZpZyNp8+kS
 2d1PePsx8usr+8+inEeziFPWpHOrqNKc7l8pNiRDdkLXxyv1DyqJvl14Zju3a2QeP9iZ
 5iBZFURpGWEHMEu9VseRhgFs5hmgpm3I2EC2MEcwRgeWXaRrULBYzhw6WQkP2pa2tYB7
 SdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684445195; x=1687037195;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t5y+SJ44ed16wCOTDLmLDzgIx2JaLtLRHFSw4/rCRS4=;
 b=DQlnzCtJy8mRw5Cj1ARnH5kk/aXmYX0oT6DWh2pmNtctAUCqKDkWZn6awy02qgPzhU
 n9opW5RBV++y3L/QP2Q8zpf/Vanvvhddtk3eSQFg9iORWQy0mB0ePT+l8S5FLlEvy4z4
 YWlFDo4RXl5390UA6IJstNr/m4xJv7+IrjhwV19SinpJcVro7y307OCRmdYu4VlD8js/
 MwORWpDGDuaia3Fy+3ZCg0YEftHJCUXEDmixXHPick7FgklrvKtKYctZXIj0S0T97Jpp
 FnKyNjuhaJnluKYAB5EpWqPkMWCxVDFlFPXgEx2XLaC6gZOBx7gRrOWbahbo/lLhziMD
 jpDg==
X-Gm-Message-State: AC+VfDyBny2fraDRGnaBzezjYrufRnpmZ6E+mDExkIh2SLqEN2GHNlYW
 LKzWOlZNj8lrRpWU9acJ/xSX5Q==
X-Google-Smtp-Source: ACHHUZ7B1k1e6l4HEpUzye5ClfUpHuPl41iqsuHkLeVuwMzkdRBYUqoCzs/IgEyza1JzSDw/IQR0HQ==
X-Received: by 2002:ac2:4c39:0:b0:4db:964:51b5 with SMTP id
 u25-20020ac24c39000000b004db096451b5mr74987lfq.41.1684445195029; 
 Thu, 18 May 2023 14:26:35 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b20-20020ac247f4000000b004eaeb0a984csm369403lfp.88.2023.05.18.14.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 May 2023 14:26:34 -0700 (PDT)
Message-ID: <2c688487-a5b1-155c-f73a-69358d03e478@linaro.org>
Date: Fri, 19 May 2023 00:26:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230428223646.23595-1-quic_abhinavk@quicinc.com>
 <20230428223646.23595-4-quic_abhinavk@quicinc.com>
 <kap4lpzbv5qihf2k7fdznmx72hrhpx4acjgcng45kxnshxo6ge@gzke6ruy3x6u>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <kap4lpzbv5qihf2k7fdznmx72hrhpx4acjgcng45kxnshxo6ge@gzke6ruy3x6u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 4/4] drm/msm/dpu: drop DSPP_MSM8998_MASK
 from hw catalog
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 quic_jesszhan@quicinc.com, David Airlie <airlied@gmail.com>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/05/2023 22:41, Marijn Suijten wrote:
> On 2023-04-28 15:36:46, Abhinav Kumar wrote:
>> Since GC and IGC masks have now been dropped DSPP_MSM8998_MASK
>> is same as DSPP_SC7180_MASK. Since DSPP_SC7180_MASK is used more
> 
> is *the* same

And, I think, a comma is missing before DSPP_MSM8998_MASK.

Note: since the English language is not native for most of the 
developers, I usually don't nitpick on these issues provided we can 
understand the message without too much trouble (and the mistake doesn't 
stand out aloud, begging for it to be fixed).

I will fix missing articles when applying, if I don't forget.

> 
>> than DSPP_MSM8998_MASK, lets drop the latter.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 --
>>   2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> index bdcd554fc8a8..a4679f72a262 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> @@ -127,9 +127,9 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
>>   };
>>   
>>   static const struct dpu_dspp_cfg msm8998_dspp[] = {
>> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
>> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>>   		 &msm8998_dspp_sblk),
>> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
>> +	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
>>   		 &msm8998_dspp_sblk),
>>   };
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 791a6fc8bdbf..efd466f6122b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -91,8 +91,6 @@
>>   
>>   #define MERGE_3D_SM8150_MASK (0)
>>   
>> -#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC)
>> -
>>   #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
> 
> Should we add preliminary parenthesis around this?
> 
> - Marijn
> 
>>   
>>   #define INTF_SDM845_MASK (0)
>> -- 
>> 2.40.1
>>

-- 
With best wishes
Dmitry


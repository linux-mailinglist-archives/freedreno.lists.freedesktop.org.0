Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 312D77682C9
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 02:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3953B10E12F;
	Sun, 30 Jul 2023 00:22:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4501010E12F
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 00:22:50 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5221b90f763so4686436a12.0
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 17:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690676568; x=1691281368;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wlP3J0xhxo2b0PW6U+/tsrSrf7Y3FjtKuZpG8pbYeww=;
 b=uic88FpzzINXJKI7Ia3HTP/JLba205iSm8WzxPBhdOw7D0a8f0WriSvg5cHcOPHkbk
 a+upm06QPkq9q6ka5LnHg82FyNIcpfOaOUGNLJck25cYp+GQ7OU0k8LExDMw/hy35Wnj
 hddOZN/WUTIVrNo/h089maMVtG0OW7KEAvWvWQbGEPuLDEyjTZ/y4OWedNfr7Lnqf3MI
 CLBxwVgpfuEuPCc85RmJypqObaH88HBnr7lkmHNnD5Un3oFUHAG4l9L8yKacaa1dhjFb
 tem6QnX4DwWGiPZMtJvEMjbvHE09gVqwf7v7nUAqjwroI+JIjuXQUuuALJEOxi5B1oYg
 H8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690676568; x=1691281368;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wlP3J0xhxo2b0PW6U+/tsrSrf7Y3FjtKuZpG8pbYeww=;
 b=FGox577dKE109PznhdgbUtM5cDFpkmcgRdQdVZ9s3+/GHJ5IDnVz6+uOLoCTCSu3zq
 KyeGa5eoxEoUm38eBn62i8CVD8TVKwDyGR6c6Ic7+JuhHAywVzBJx2nBRfXjSXEGdlLo
 2OiAI2BAbYW1UfZKODEvw5Lfupe2x/CcOESdvRStmDvk/I7V9E9MuYz3QxjgJmZm150B
 QFoMPjk1PzHPJ6qSj4U1rTQ81aAx19pDPCLLy3nlWAZTgXSXN2IMbdNzHjyk+TaZo2JJ
 R4wTaE2fr3qeZXXcQ/xitVktSHCb7eGW9mYLkyrlYZ/+O808Ykmzh/3nGwx4CJR96uNX
 PQcw==
X-Gm-Message-State: ABy/qLaZa9fGSnLbwFx8XtcEyuvSjsWgjjjPPzQaTA1h4ChiZ/P6pDeA
 0mCyxnkzrGwpGtR3rN9BsOTgdA==
X-Google-Smtp-Source: APBJJlGY6jIiRs0coVTmmdIlq5hbzqGv4/GB9BgC6o2z45sTgVIIbc9TzAZrmpNo+Z6F4PY/+Yg0fA==
X-Received: by 2002:aa7:dac6:0:b0:522:7d21:9ed3 with SMTP id
 x6-20020aa7dac6000000b005227d219ed3mr5255993eds.19.1690676568699; 
 Sat, 29 Jul 2023 17:22:48 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x4-20020aa7d6c4000000b0051e2cde9e3esm3475894edr.75.2023.07.29.17.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jul 2023 17:22:48 -0700 (PDT)
Message-ID: <726501f5-7c69-6321-38eb-1b57676cf389@linaro.org>
Date: Sun, 30 Jul 2023 03:22:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-5-dmitry.baryshkov@linaro.org>
 <lck7thivac7ztu6e7b4hakjtpoobydcanjdffn6vvppmc4yzcc@46gcp2pwxedq>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <lck7thivac7ztu6e7b4hakjtpoobydcanjdffn6vvppmc4yzcc@46gcp2pwxedq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/dpu: enable INTF TE operations
 only when supported by HW
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27/07/2023 23:12, Marijn Suijten wrote:
> On 2023-07-27 19:21:01, Dmitry Baryshkov wrote:
>> The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
>> only INTF_1 and INTF_2 actually support tearing control. Rather than
>> trying to fix the DPU_INTF_TE, check for the presense of the
> 
> I would more exactly expand "fix" to "Rather than specifying that
> feature bit on DSI INTF_1 and INTF_2 exclusively..."
> 
>> corresponding interrupt line.
> 
> ... which the catalog will only provide on DPU >= 5.0.

I'm going to rephrase this in a slightly different way to follow the irq 
presence -> major & type change.

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 7ca772791a73..8abdf9553f3b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -557,7 +557,7 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>>   	c->ops.setup_misr = dpu_hw_intf_setup_misr;
>>   	c->ops.collect_misr = dpu_hw_intf_collect_misr;
>>   
>> -	if (cfg->features & BIT(DPU_INTF_TE)) {
>> +	if (cfg->intr_tear_rd_ptr) {
>>   		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
>>   		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
>>   		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry


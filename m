Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14435767920
	for <lists+freedreno@lfdr.de>; Sat, 29 Jul 2023 01:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC07110E79F;
	Fri, 28 Jul 2023 23:46:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DAC10E7A5
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 23:46:51 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52164adea19so3329053a12.1
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 16:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690588010; x=1691192810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lz9kYtiZPQWUEvSrRUt8Bwnt8DSLq3LSMib0FexMztk=;
 b=gQNsMagMwNTXP/3B3tpD6enIE8S7Ne55yezjQMlh/M03QcEBct+qczveZpKnN40TGG
 MyPZo2CfisrrsjUmMIbuX+p4qGptYK3jS29Oh8Ga4P+CebI4xCh5S1olPtpJT1ZKJrc3
 WNrCuFU0Z1tP4m2frzGViw/LJuxB7PCeV58YOr6X1xO3zHKoPNljVS/62rET8qYZSo/i
 XvLr1Tr+FsDGdmKImv2kjNsB4mE0cWm8p5elJy6d7zY+sn+oWHANtSJkOvxIo95nacEN
 TRINLeO6OiIb8D5jl9uNzCLniE5Em9f66c+qvxkZex00OwSPfRov8FxKRipB3Z1qA8uI
 lifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690588010; x=1691192810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lz9kYtiZPQWUEvSrRUt8Bwnt8DSLq3LSMib0FexMztk=;
 b=RyTYaQsuPOVPpwsjtGZmlwRSsQEIlVtwy5P6G0/Lsl4UdFJqhPTLbKsoWtKEoCFwGT
 tKgTPhK/x/lVaG49OMycfupW+oJyISCUBh7iWFjXNCPz+SqbzObH7I4h4DVZj4TpHTWt
 uzmWygAuhwkYvK1zzEAyHLRnnywqWAI9AZiBU/JwjyFqNbeMcd3qew7BB4w+h3cQd2GE
 7KiajOtQOlz6tjvJygGfPbZbkF0/n+ydi8UsiDacjSjJm6PJi8jrkwqwisCWgbUXvMWT
 2PinqoqmyIeWre8a0rO0RexMh6xB2zw/KQPznt6J/+40bEBWWt67GfT4KRuht8fjSfs9
 J3rA==
X-Gm-Message-State: ABy/qLbFT0t2/8wQHNbyQEm/FkxTu4lesJV6WUIGfxpV7F4yj47wIb8k
 0//+NgAfDySNbdSjxMW2sebaXg==
X-Google-Smtp-Source: APBJJlHdWbCNHoB6EB/GbRVQSPH3ZKb+71koAxi7jZd03gfnzduMFPFV7MKHYkFwsxKOIWuyd+5y+Q==
X-Received: by 2002:aa7:c152:0:b0:522:3a37:a45f with SMTP id
 r18-20020aa7c152000000b005223a37a45fmr2669462edp.21.1690588010267; 
 Fri, 28 Jul 2023 16:46:50 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n21-20020aa7d055000000b0051e26c7a154sm2280500edo.18.2023.07.28.16.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 16:46:49 -0700 (PDT)
Message-ID: <84a16e2c-0f82-fb5f-56e3-09902487ee33@linaro.org>
Date: Sat, 29 Jul 2023 02:46:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
 <hfbtvuvsha4gwlkxz4slcj6zyshuzcrq2sa3j24ymoqwo6wmib@46idblfyif7m>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <hfbtvuvsha4gwlkxz4slcj6zyshuzcrq2sa3j24ymoqwo6wmib@46idblfyif7m>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE
 operations only when supported by HW
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

On 27/07/2023 23:05, Marijn Suijten wrote:
> On 2023-07-27 19:20:58, Dmitry Baryshkov wrote:
>> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
>> Rather than checking for the flag, check for the presense of the
>> corresponding interrupt line.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> index 9298c166b213..912a3bdf8ad4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> @@ -296,7 +296,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
>>   	c->idx = cfg->id;
>>   	c->caps = cfg;
> 
> In hindsight, maybe there's one patch missing from this series.  You
> inlined _setup_intf_ops() later, but there's no patch inlining
> _setup_pingpong_ops() which looks to be required for applying this
> patch.

Yes, I missed it somehow.

> 
> - Marijn
> 
>>   
>> -	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
>> +	if (cfg->intr_rdptr) {
>>   		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
>>   		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
>>   		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry


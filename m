Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5305066E3C9
	for <lists+freedreno@lfdr.de>; Tue, 17 Jan 2023 17:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F16A10E1B3;
	Tue, 17 Jan 2023 16:40:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6277610E1B3
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 16:40:14 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y19so12301252edc.2
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 08:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T1bbrLy++qcWOt6lSo1aW2xXQtthkN26YgghLI/c6PY=;
 b=YZWptJC2T2Lt68fnk5iaS35Tt5NiBfTpWDPvoZ6YNp63K3/OpJqlWyZT9j6KW7jL+Y
 R2u99ksNtXzgJJfcKEb8tk3Q8XTu5JPV0ZoB94hofer3jjhOTHZ0EQ7Y4zl+fVQBhgbf
 xoOe2dgoLRZqgJXMrHtynQZnr5g5DUqAbnBZ6C5nVp8CrRvqEB/uaaQ+Yy3Xiq+BPQ7p
 uzJvop6v4S2b68/OrliCjG4bx0NwzotqRxAXtx0gq5sUPvGmuj/JcowQw1cRn8O8Ohvl
 cnRY58wyvX5NuCJe9A8wnxrZ+nWebym9vLkLEHPjNihs+RJJJZtYNngEeNbuCcaNCHMt
 mjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T1bbrLy++qcWOt6lSo1aW2xXQtthkN26YgghLI/c6PY=;
 b=ag47fSeghZdpg3kkZCdofgAjm7fro+QayBAOzUYJUtweswV1dCreLJGsN8IKXPzUII
 Eo6nbdXnGNsAjioAv8ssObw0lk1uCAIXQInvWdPoi47z7Gch00zmuLW+zR/b9mrM+Pkg
 HG4uRK7+dcNA8+K8z2XK+4AdKn1sZD07JGWYiogVLWeR004niAMLLg8AV3ulNdCIheL2
 NMKedGSUgfr1cnk23P/qVllrd6DUYxpOd4MajP1uouEHiU+TeuF7OQkxETHvi5MIUgkZ
 1YGN9JyEvWn2FRAMyAhGgODayozDxE36GdjKnizeBJMgUroXJteddgFbpyQ/JccFmCgL
 vBMQ==
X-Gm-Message-State: AFqh2ko01xKuXMlywNW0loxyDaow1JXAWdiVOvVQxgmXwODUcsyp3KJq
 T5u1q7RIgl41544101nOpwUGFQ==
X-Google-Smtp-Source: AMrXdXvx8GfSw4jqnYWyRNx+AEyQ5TPSGpqwX8eUMCgA3tmTmVxZPkFx+gDCWDdS4uOV+AcLTLvMPw==
X-Received: by 2002:a05:6402:2b92:b0:45a:7d2:9b35 with SMTP id
 fj18-20020a0564022b9200b0045a07d29b35mr3870633edb.0.1673973612880; 
 Tue, 17 Jan 2023 08:40:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 dk1-20020a0564021d8100b0049be07c9ff5sm5820820edb.4.2023.01.17.08.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:40:12 -0800 (PST)
Message-ID: <84849b99-93ab-bc10-39ff-ac46328ede47@linaro.org>
Date: Tue, 17 Jan 2023 18:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
 <1673972488-30140-2-git-send-email-quic_kalyant@quicinc.com>
 <0a845c24-b1a5-a961-103f-0d8840a8f17d@linaro.org>
In-Reply-To: <0a845c24-b1a5-a961-103f-0d8840a8f17d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/disp/dpu1: allow reservation
 even if dspps are not available.
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/01/2023 18:35, Dmitry Baryshkov wrote:
> On 17/01/2023 18:21, Kalyan Thota wrote:
>> if any topology requests for dspps and catalogue doesn't have the
>> allocation, avoid failing the reservation.
>>
>> This can pave way to build logic allowing composer fallbacks
>> for all the color features that are handled in dspp.
>>
>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index 73b3442..c8899ae 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -343,7 +343,13 @@ static bool 
>> _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>>           return true;
>>       idx = lm_cfg->dspp - DSPP_0;
>> -    if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
>> +
>> +    if (idx < 0) {
> 
> The change doesn't correspond to commit message.
> 
>> +        DPU_DEBUG("lm doesn't have dspp, ignoring the request %d\n", 
>> lm_cfg->dspp);
>> +        return true;
>> +    }
>> +
>> +    if (idx >= ARRAY_SIZE(rm->dspp_blks)) {
>>           DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
>>           return false;
>>       }
> 
> If you'd like to remove duplicate for the (idx >= ARRAY_SIZE) check, I'd 
> suggest dropping the second one
> 

I've misread the patch. However I don't see, why would one request 
DSPP_NONE while specifying topology->num_dspp. I think that you are 
trying to put additional logic into a function that should just check 
for the available resources.

-- 
With best wishes
Dmitry


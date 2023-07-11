Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B37674E44A
	for <lists+freedreno@lfdr.de>; Tue, 11 Jul 2023 04:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E693710E29A;
	Tue, 11 Jul 2023 02:34:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB5E10E1C6
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 02:34:14 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so7635264e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 10 Jul 2023 19:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689042852; x=1691634852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dIxtCFBPEeOEWz1SJom8ZygG3Y0AOhRCbY7bAJ+qiuQ=;
 b=xgdVhhvdX/yyxvlj3Bos9cHJuzXF0kdw6Mqur096mSEEqyTPx0jE0i8ENIM2pJjRo4
 S5ux6foxwzMn8GFLGv5DHs5zHezuFwTjk/v8mUHiaFHLO+/nIHk1pOXpBXkJPA653nsu
 z1Au2FMPE1Y/Y6cjfMOz0D6JKOgUahBHcVUAkZ0N6aqHHCjB5PYuQYbeA6Y1tCq2TlV5
 LZAtq1G6W3nh5V4fr/dwIai4qtfI9W3YdhRJydyheDu4Dnqn1AyaeDtfR6YEM6IzKPFu
 owMKVeBdRijOs9eMyS0dxo0RUzi+RR7XKPmtvwAhAj1shTXj6ULiFkkcqqVGvcsL8sng
 QwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689042852; x=1691634852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dIxtCFBPEeOEWz1SJom8ZygG3Y0AOhRCbY7bAJ+qiuQ=;
 b=aYTLu2qh6xXMB+u5MVRObEyamMQPjFUBswY7sQQJacoonmNKJ+iuMvd9YnRmDT4wyp
 3QEkqM/MlfcwVUrR4NE9z/6cEG8Kca3kfW0fiHdqUFS/JEfBMHuqrDK5vD9ZFYziORkk
 4huwL0Zpnp0KBKjrWX3EZscHUSvewYxJ9sbrjDWNGA6qbRvts9+dGsZuSzz6T9lD3O/i
 ewM821y+uuVBvo9RKZJL9MDfcFmHt5IjyxEvBgsS7oiVnNQIUL3EEY4i/Ul4Sh0ZTvzF
 7o8bbBHLLUu74d6bqNhzVV7+rHA1woN3abHtqFh/3Rlv1f7AtCTddNcIT6WzY1mKiE0g
 dN1Q==
X-Gm-Message-State: ABy/qLbAzBG+ermZgqJ3A/hlWS07NKI7BsFyJn0LR8S3uJPTSk63JeFk
 NCda2Pmiwm9kh22LgzyoCarfIg==
X-Google-Smtp-Source: APBJJlEptrQrqyHjC6cqmVnpsJGqLlJMEYX1DkC5u6EJbqyQ3k0GlRsXAivEGq9K8CZ/3eC6lMUxrg==
X-Received: by 2002:ac2:5b9a:0:b0:4fb:78a0:dd32 with SMTP id
 o26-20020ac25b9a000000b004fb78a0dd32mr11363966lfn.60.1689042851984; 
 Mon, 10 Jul 2023 19:34:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a197409000000b004fbae67c51fsm121275lfe.294.2023.07.10.19.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 19:34:11 -0700 (PDT)
Message-ID: <a25b58b4-9b94-928b-cdde-eccd56f1e444@linaro.org>
Date: Tue, 11 Jul 2023 05:34:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
 <20230707193942.3806526-5-dmitry.baryshkov@linaro.org>
 <729de13d-6fb7-ff1c-8660-4710d914258b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <729de13d-6fb7-ff1c-8660-4710d914258b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 04/11] drm/msm/dpu: drop separate
 dpu_core_perf_tune overrides
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
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/07/2023 05:31, Abhinav Kumar wrote:
> 
> 
> On 7/7/2023 12:39 PM, Dmitry Baryshkov wrote:
>> The values in struct dpu_core_perf_tune are fixed per the core perf
>> mode. Drop the 'tune' values and substitute them with known values when
>> performing perf management.
>>
>> Note: min_bus_vote was not used at all, so it is just silently dropped.
>>
> 
> Interesting ..... should bring this back properly. Will take it up.

Ack, thanks.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 ++++++++-----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  4 ---
>>   2 files changed, 12 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> index 05d340aa18c5..348550ac7e51 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> @@ -235,7 +235,7 @@ static int _dpu_core_perf_crtc_update_bus(struct 
>> dpu_kms *kms,
>>   {
>>       struct dpu_core_perf_params perf = { 0 };
>>       int i, ret = 0;
>> -    u64 avg_bw;
>> +    u32 avg_bw;
> 
> avg_bw seems unused in this patch, so unrelated change?
> 
>>       if (!kms->num_paths)
>>           return 0;
>> @@ -291,10 +291,16 @@ void dpu_core_perf_crtc_release_bw(struct 
>> drm_crtc *crtc)
>>   static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>>   {
>> -    u64 clk_rate = kms->perf.perf_tune.min_core_clk;
>> +    u64 clk_rate;
>>       struct drm_crtc *crtc;
>>       struct dpu_crtc_state *dpu_cstate;
>> +    if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
>> +        return kms->perf.fix_core_clk_rate;
>> +
>> +    if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
>> +        return kms->perf.max_core_clk_rate;
>> +
>>       drm_for_each_crtc(crtc, kms->dev) {
>>           if (crtc->enabled) {
>>               dpu_cstate = to_dpu_crtc_state(crtc->state);
>> @@ -305,11 +311,6 @@ static u64 
>> _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>>           }
>>       }
>> -    if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
>> -        clk_rate = kms->perf.fix_core_clk_rate;
>> -
>> -    DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
>> -
> 
> Why dont you move both FIXED and MINIMUM handling below instead of above.
> 
> So that they will just override the clk_rate and you can keep this 
> useful log here and it matches where the function is.

I can keep the log in the next version. The logic was quite simple: 
there is no need to loop over CRTCs if we know that we are overriding 
the value.

> 
> This chunk looks better that way.
> 
> <skipping the rest as it LGTM>

-- 
With best wishes
Dmitry


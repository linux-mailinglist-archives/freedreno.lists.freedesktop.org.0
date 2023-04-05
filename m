Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA56E6D7155
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 02:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CC310E7FF;
	Wed,  5 Apr 2023 00:33:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8FD10E803
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 00:33:48 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bi9so44505693lfb.12
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 17:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680654826;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w63JRY8tbcBhqvTZv7o6qB1aZCRvTTAvd6xKqzxt8kc=;
 b=o+ucd5r9cGIEgqGw59Rpb7Ge4TrucQaen+CoIWrWoUAVVU95cCUtCssjP/jFKlXY6Y
 qkjTFzpyCCUwM+jfNmVlI5qd4YnGCTmI+f2r3rPfGDmDQwX7VApS5w/vVJC4QUflq+gz
 SK1759j4ZeQXrS2qYgkpSJ03JXqlKmACVT7+xvZH3THQDpV6r971+itS+ufKZ8c9lS3N
 +WmhtDwxipYpapRDXO0uz519nQueSJn9aNveF9mpjbo7hT+qxxLQixI6Dj3mU27mVoVH
 fL91cWqZ5TonUUtnkupCikNRueNoaPEIDbNhA07Oa16TrgO4h7gQLqfEc6tOSVp9cm7z
 mgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680654826;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w63JRY8tbcBhqvTZv7o6qB1aZCRvTTAvd6xKqzxt8kc=;
 b=fogOcYKqi1fnvCs4pbYIMaxVNop8WK/g8KG9IzP5qcEaHcZggP20vABfp7zgaQzQIA
 W366fSMJ/uVWvcNy/30NVxHk2rmyNur+x3ycU6vche17q9Zd2sGoV3Xr6IWspGyrUpqs
 3w8honw/vMVcuuRLDR6P4OXSVuNV5JaN5pZAQRXxTyAF+n1oBZq2YSk0RDNajQw0sW9E
 mdyiUCfv88xGsUSGBzCFpZjC5ANx4xa/TgmfF7l9sLVQxAcbjBdhe/QQoFFRQJ5nEESO
 76ZXr98XWmR1RBVE9Bzuo0cWXJ0SimMeeJuVl2se00zC6Si+7VaKWsc7LrWCGBLDA7GM
 pvaw==
X-Gm-Message-State: AAQBX9cXI1U1SanD74Xl3lhsMYCHs0vXemJ3joUF0uAmO4DcMRkAaB6F
 S3vUR/Bj2oo1L6bZ46Qcmfo/iQ==
X-Google-Smtp-Source: AKy350ZnKLDX5DKSAjAjahYtlmQeRhgeyCrOnVe0cRNLRQrNkzzQh+O2/0RySYfE+ZTT290uhkHgPQ==
X-Received: by 2002:ac2:494e:0:b0:4e9:85e5:23ff with SMTP id
 o14-20020ac2494e000000b004e985e523ffmr1105691lfi.40.1680654826246; 
 Tue, 04 Apr 2023 17:33:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004db3e445f1fsm2579191lfp.97.2023.04.04.17.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 17:33:45 -0700 (PDT)
Message-ID: <6948fe29-af08-9164-4cec-a6564dbb1e1a@linaro.org>
Date: Wed, 5 Apr 2023 03:33:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-2-dmitry.baryshkov@linaro.org>
 <aa3175ec-e381-7211-3bf1-ca8bb9ef696b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <aa3175ec-e381-7211-3bf1-ca8bb9ef696b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v4 01/42] drm/msm/dpu: use CTL_SC7280_MASK
 for sm8450's ctl_0
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

On 05/04/2023 01:12, Abhinav Kumar wrote:
> 
> 
> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>> On sm8450 platform the CTL_0 doesn't differ from the rest of CTL blocks,
>> so switch it to CTL_SC7280_MASK too.
>>
>> Some background: original commit 100d7ef6995d ("drm/msm/dpu: add support
>> for SM8450") had all (relevant at that time) bit spelled individually.
>> Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
>> despite being a mismerge, correctly changed all other CTL entries to use
>> CTL_SC7280_MASK, except CTL_0.
>>
> 
> I think having it spelled individually is better. If we start using one 
> chipset's mask for another, we are again going down the same path of 
> this becoming one confused file.
> 
> So, even though I agree that 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to 
> hw catalog") corrected the mask to re-use sc7280, with the individual 
> catalog file, its better to have it separate and spelled individually.
> 
> This change is not heading in the direction of the rest of the series.

I didn't create duplicates of all the defines. This is done well in the 
style of patch37. I'm not going to add all per-SoC feature masks.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 6840b22a4159..83f8f83e2b29 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -975,7 +975,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>>       {
>>       .name = "ctl_0", .id = CTL_0,
>>       .base = 0x15000, .len = 0x204,
>> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) 
>> | BIT(DPU_CTL_FETCH_ACTIVE),
>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>       .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>       },
>>       {

-- 
With best wishes
Dmitry


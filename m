Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD1A6D53FE
	for <lists+freedreno@lfdr.de>; Mon,  3 Apr 2023 23:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F4C10E5A3;
	Mon,  3 Apr 2023 21:51:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB7E10E5A3
 for <freedreno@lists.freedesktop.org>; Mon,  3 Apr 2023 21:51:49 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y15so39874996lfa.7
 for <freedreno@lists.freedesktop.org>; Mon, 03 Apr 2023 14:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680558706;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QAn3IYlOVbwdf9vccvrZTl9PGSts07M6o3L5tbW2IYw=;
 b=EJuHvE4TN+k3zN6uz4Qg88ZqRIsWb/rxql/N4cTTVolRP2/QBWqiqLRotJCcGP1OhD
 xwhV1eZiIrrS5lHvcJ5kBYJPzBUHcPerrSPoS8B4NyjjTWjCTbRB9Jk4FFuKM+ubxlaU
 pZTT2N4pYvF1ldto/7Zim1G8rW2B9Pdns1AOo9TUSNra13TlWV0kgH4TtXQ/WpXM7eer
 +fVbo/I3VKaSTincypCSGmjT4DpmvDP0Uq7ulbyQy3WIXpTpkhX+3A7IE4drRviNmO7Q
 q9WcM0qYh4OZhTV9yTAdQNM9Yf034O0dE1VzHT0yywq5ydvconWe83tfB5ZRLT7PAXWp
 i9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680558706;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QAn3IYlOVbwdf9vccvrZTl9PGSts07M6o3L5tbW2IYw=;
 b=mD3VJ9/Q0SGFC6yLUcq7tRTzbceNdIpmAPG9vbuvQVn4Rtk9jCdRCkH7SsPIX38JB0
 KSHMEUHSrdUouyY61uvkrEpjIYpBGRHkDQxcxJVs7cY1pfozd80l3Ts0gtqj2fJLMt/A
 z4ueT9an3sK8936iIUTErJd6ku8wiCWoggDE2E/kTYTnGAXcQE0kEDm6x85LnYP2TDHU
 VlVUNPq/IQ5pDrzozQ+f2HZf5mY9u2egDmxwtP7T8uwMt3v+Ng4J1ZUewW9+pJfw1W4A
 MmF+2N+OJEZw8YBgByP7CFN7x8GcYNgyQRQhrtdSIEzYNEClG/nGLUeIZipki+gzX2Rw
 mM8A==
X-Gm-Message-State: AAQBX9c6bvMVLtlqMuOBbJHY1/8Hrm+pHLP9LaGBmrus9k1TfgTM0bfO
 zjZbYTSvv65sIl9TEws72KfcSw==
X-Google-Smtp-Source: AKy350ZRg63U/8c+Dq+gGAsWL6R5uamWQXb9R+624dO3ciJu4N5K9jfil4sKGvNmq3/ovCRKhnXQCw==
X-Received: by 2002:ac2:50c2:0:b0:4a9:39f4:579a with SMTP id
 h2-20020ac250c2000000b004a939f4579amr29130lfm.66.1680558705928; 
 Mon, 03 Apr 2023 14:51:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a19c211000000b004ceb053c3ebsm1958732lfc.179.2023.04.03.14.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 14:51:45 -0700 (PDT)
Message-ID: <c8dc2528-a4a7-573d-5d61-59a639125124@linaro.org>
Date: Tue, 4 Apr 2023 00:51:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-4-3c13ced536b2@quicinc.com>
 <b3a9fecd-0677-482b-7066-03465d5f0dd0@linaro.org>
 <b20b78ff-067d-769a-2266-94662d224843@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b20b78ff-067d-769a-2266-94662d224843@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH RFC v2 4/6] drm/msm/dpu: Fix
 slice_last_group_size calculation
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/04/2023 00:45, Jessica Zhang wrote:
> 
> 
> On 4/2/2023 4:27 AM, Dmitry Baryshkov wrote:
>> On 31/03/2023 21:49, Jessica Zhang wrote:
>>> Correct the math for slice_last_group_size so that it matches the
>>> calculations downstream.
>>>
>>> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>>> index b952f7d2b7f5..9312a8d7fbd9 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>>> @@ -56,7 +56,11 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc 
>>> *hw_dsc,
>>>       if (is_cmd_mode)
>>>           initial_lines += 1;
>>> -    slice_last_group_size = 3 - (dsc->slice_width % 3);
>>> +    slice_last_group_size = dsc->slice_width % 3;
>>> +
>>> +    if (slice_last_group_size == 0)
>>> +        slice_last_group_size = 3;
>>
>> Hmm. As I went on checking this against techpack:
>>
>> mod = dsc->slice_width % 3
>>
>> mod | techpack | old | your_patch
>> 0   | 2        | 3   | 3
>> 1   | 0        | 2   | 1
>> 2   | 1        | 1   | 2
>>
>> So, obviously neither old nor new code match the calculations of the 
>> techpack. If we assume that sde_dsc_helper code is correct (which I 
>> have no reasons to doubt), then the proper code should be:
>>
>> slice_last_group_size = (dsc->slice_width + 2) % 3;
>>
>> Could you please doublecheck and adjust.
> 
> Hi Dmitry,
> 
> The calculation should match the techpack calculation (I kept the `data 
> |= ((slice_last_group_size - 1) << 18);` a few lines down).

And the techpack doesn't have -1.

I think the following code piece would be more convenient as it is simpler:

slice_last_group_size = (dsc->slice_width + 2) % 3;
[...]
data |= slice_last_group_size << 18;

If you agree, could you please switch to it?

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>> +
>>>       data = (initial_lines << 20);
>>>       data |= ((slice_last_group_size - 1) << 18);
>>>       /* bpp is 6.4 format, 4 LSBs bits are for fractional part */
>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry


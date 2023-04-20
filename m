Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED0B6E9B31
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 20:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D7810E25C;
	Thu, 20 Apr 2023 18:01:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E3D10E137
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 18:01:07 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ec8143400aso747492e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 11:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682013665; x=1684605665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z71ifX+3bePpNj6BLLcg5VtBqXd9L7O317uWqrrJ0jY=;
 b=pE+i+7GJa5mGP7pN8Pn/lkXCkEzxDPET5cjPLpsKLHlB5SOlbsMB/KdJ2IzfMqoct1
 3KFZxKRhEhli0IYmucY4Q8zCh/1a/6DGntfRe0LET2s7QWjth1Bg+NpqtMDBXiBXOnUe
 cauvCYkY2ogSQL2IHhC9whcnIKmRbPeONT+b8S5FJQeKeQjd5iOsJh3fiGp9foZR+bF3
 /bGTiMol8JDDNJXT72B3BAWUB+2dy+aq7u7rwLeE8IaZc9W/hZgrUfVPL2/j9saUDW4I
 UDEdX1GkW7RTjlNqhKgklK0LleQ6PaOFO5FN8bL2flD4helzqVcRGVySbsIFdWn8PJ7a
 8HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682013665; x=1684605665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z71ifX+3bePpNj6BLLcg5VtBqXd9L7O317uWqrrJ0jY=;
 b=Sbi2mujyG9Zx+qMmctvugZn6Jc3B5Jw8+zyzC774WAjCJLC4+RvmAKyHL4Th5br6WW
 ig0hpRF0eQ3mqiTXBinEV5LqeNlEmaiibFlAPwPwaBjWEMXSWv1k5UBk0sNVaLdtQkCq
 pux03rZieCG7B0bg9gtAFIwtv8gIabXNuuSF72FltWGeipQ1gsS334Tfc2ElC/eK+YKZ
 reKTxpbwehbdI+2H0wwklpdyXvDxWkbC+/8ob3gAdy4G4c8eq4SO5wFOpliI/UR1fnvp
 fIBoGiskXRdTv9ROcq647izxeS04lgrvHz7FoiXAzQPrfuANqMSU/yFShD5pbTIIGzbh
 DBmA==
X-Gm-Message-State: AAQBX9fyYm+W8wCFN3TRHsnobUvxnaNiqmY3NJxHfzdJGbZpf3nACVeN
 StPU7my8vvVwIJDB8POkEFPn1w==
X-Google-Smtp-Source: AKy350YhBge2kn5asPvQjIsoowiT2dTTKXXJSITeKrLIxWF5Sj2L/FGZ7oX9ry4+1WWCmJi5XWCL3w==
X-Received: by 2002:a05:6512:145:b0:4ed:c6d5:bdc with SMTP id
 m5-20020a056512014500b004edc6d50bdcmr738154lfo.24.1682013665093; 
 Thu, 20 Apr 2023 11:01:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q2-20020ac25a02000000b004b4cbc942a3sm290839lfn.127.2023.04.20.11.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 11:01:04 -0700 (PDT)
Message-ID: <6a335df7-ff0b-098a-feec-45714159df04@linaro.org>
Date: Thu, 20 Apr 2023 21:01:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <5b133c55-e4f5-bfd2-b542-a7d44313c038@linaro.org>
 <c0e0a55a-cc37-fe8a-8d8a-5fe257f99b9a@linaro.org>
 <3f3b3637-ed85-09a1-22b7-3ccd4bc929bb@quicinc.com>
 <2dff9d62-cffe-c66f-9e50-3ecd64e44d37@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2dff9d62-cffe-c66f-9e50-3ecd64e44d37@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 20/04/2023 04:36, Konrad Dybcio wrote:
> 
> 
> On 20.04.2023 03:28, Abhinav Kumar wrote:
>>
>>
>> On 4/19/2023 6:26 PM, Konrad Dybcio wrote:
>>>
>>>
>>> On 20.04.2023 03:25, Dmitry Baryshkov wrote:
>>>> On 20/04/2023 04:14, Konrad Dybcio wrote:
>>>>> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
>>>>> dspp sub-block in addition to PCCv4. The other block differ a bit
>>>>> more, but none of them are supported upstream.
>>>>>
>>>>> This series adds configures the GCv1.8 on all the relevant SoCs.
>>>>
>>>> Does this mean that we will see gamma_lut support soon?
>>> No promises, my plate is not even full, it's beyond overflowing! :P
>>>
>>> Konrad
>>
>> So I think I wrote about this before during the catalog rework/fixes that the gc registers are not written to / programmed.
>>
>> If thats not done, is there any benefit to this series?
> Completeness and preparation for the code itself, if nothing else?

The usual problem is that if something is not put to use, it quickly 
rots or becomes misused for newer platforms. We have seen this with the 
some of DPU features.

In case of GC (and the freshly defined DPU_DSPP_IGC, but not used) we 
have three options:
- drop the unused GC from msm8998_sblk.
- keep things as is, single unused GC entry
- fill all the sblk with the correct information in hope that it stays 
correct

Each of these options has its own drawbacks. I have slight bias towards 
the last option, to have the information in place (as long as it is 
accurate).

-- 
With best wishes
Dmitry


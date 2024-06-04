Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A808FB9E1
	for <lists+freedreno@lfdr.de>; Tue,  4 Jun 2024 19:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF32D10E57E;
	Tue,  4 Jun 2024 17:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lzusEUjK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA8710E582
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 17:06:14 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-57a4ce82f30so4094078a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 10:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717520773; x=1718125573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4aUMBd6S6vH1Fq76iwhEyjBkvlh36Pc3VvYRxup98QU=;
 b=lzusEUjKpFjhBjF86KAdBJC8AbWFD7O+kCzfJgJV8C98K8apSX/35dpUhbYwsBPOEU
 fttm+kEo+/9imy5w0nBMowGKhx7LliANI6zufOnOvatXv8y9DZow0qe3rccTz/j0NMFg
 fVr9f/zuw30xc+Dx6q39xKCVLub+fTlW5ESscRfeJQK1JN4dkbsqanz/dDxTAA88G+TF
 6ngVgB9Jk9RRQhLPLFazrf2TkhLV6s1aaQigtFFxJDtKkXvxXN/lggQ+3xiIuwJqh2ln
 jcGn+263cjAXZkANKvPD+bxcVQGr05GLW7SF+TR3pSthWN3lAzZoSUuAOG9n+vccEQY4
 g/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717520773; x=1718125573;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4aUMBd6S6vH1Fq76iwhEyjBkvlh36Pc3VvYRxup98QU=;
 b=gUfdCEZ00qGA2Q8UQTY7xhzVKs1WHdJLl8TUeiiNto6YQiHfQ60086gZlg2AldzxFg
 t4tl1uNTQzl/pQHwjyqnbTc49PkQwLtsaHMe87RhBVEvSq0YWqYzeg+GXvmvBVEPEtP1
 yUOVq0UKYVdszgyDG1W0Zbe5hk1FdrJhsqed30d9cZWwEW0G/6iGzZAntxKvtmwS3+DG
 yHu65OXHi3YR/ZxdZTRIE1jwztetePcdb81nPej5+TOXAeBelV9MRtRK+IdkFxrrZan3
 0rKLA/XOERZIXASLL73WWrjvpYL+pv5auhdTioEdApsXtmoacwy3C80k/1CQwr+NgAr/
 1p4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVROxD6Dv9Ro/7M2dJiQWSfW6cfBKndL1WqDcQOX65e/i3iBr6/Fhby/vLvRu3PTqWEZ+zDMXuoWpryddqFFloGGod1cA9FTnpB+Dx0xGQj
X-Gm-Message-State: AOJu0Yze9aWN3tm1pFpz5bvQuNMUSG5LyD/svEPy/qca8dSIR1mJFtFb
 luh1b3sgGhEvh9jRGLmqtBaOb2iGPhGVV3ZLv4Ua4Y7V9MiZfsLZ4FVzqmsvloI=
X-Google-Smtp-Source: AGHT+IHT8X9AMfx+BZpwbKKAI0BGP41IwtZlUxVZrzOm9sWMjqE5bRIO+v8abCGhYG5qwitWIODsOA==
X-Received: by 2002:a17:907:770c:b0:a67:7649:3c3c with SMTP id
 a640c23a62f3a-a69a000e966mr10970966b.56.1717520772786; 
 Tue, 04 Jun 2024 10:06:12 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8?
 ([2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a69127f2901sm291675066b.48.2024.06.04.10.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 10:06:12 -0700 (PDT)
Message-ID: <37b0404d-bba5-4a77-ad86-62c6dd308d37@linaro.org>
Date: Tue, 4 Jun 2024 19:06:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Add support for Adreno 505 GPU
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniil Titov <daniilt971@gmail.com>
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
 <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
 <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
 <CAGsSOWV9SRK1VUJiQfavEM1hL0PapxUBG6CNeD+Q=0qPT5ZnSA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAGsSOWV9SRK1VUJiQfavEM1hL0PapxUBG6CNeD+Q=0qPT5ZnSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 6/4/24 18:45, Barnabás Czémán wrote:
> On Tue, Jun 4, 2024 at 2:27 PM Barnabás Czémán <trabarni@gmail.com> wrote:
>>
>> On Tue, Jun 4, 2024 at 1:55 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>>
>>>
>>> On 6/4/24 02:20, Barnabás Czémán wrote:
>>>> From: Daniil Titov <daniilt971@gmail.com>
>>>>
>>>> This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz),
>>>> SDM439 (650 MHz).
>>>>
>>>> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
>>>> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
>>>> ---
>>>
>>> This all looks very good, just a nit
>>>
>>> [...]
>>>
>>>> +             /*
>>>> +              * Increase inactive period to 250 to avoid bouncing
>>>> +              * the GDSC which appears to make it grumpy
>>>> +              */
>>>> +             .inactive_period = 250,
>>>
>>> Are you sure this is actually necessary?
>> Every A5XX GPU is using the same value, but i have never tried with
>> DRM_MSM_INACTIVE_PERIOD.
> This was the original patch
> https://lore.kernel.org/all/20180507224750.9383-1-jcrouse@codeaurora.org/
> where the inactive period was increased for a530. I cannot test
> suspend on msm8937 yet.

The suspend here refers to device suspend, not system suspend. Adreno
goes into device suspend every time you stop using it, i.e. after the
rendering is done and there's no more work to do.

I suppose a good test scenario here would be to keep running and closing
kmscube in a rapid fashion and checking if the GPU starts crashing for
unknown reasons (the dmesg would denote that)

> I can check on msm8953 with a506 maybe if a506 works fine with
> DRM_MSM_INACTIVE_PERIOD
> then a505 would be fine with it also.

The more testing the merrier :)

Konrad

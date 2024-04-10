Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D4989F109
	for <lists+freedreno@lfdr.de>; Wed, 10 Apr 2024 13:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7774D10E4CB;
	Wed, 10 Apr 2024 11:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sURwW7Xg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7001132EA
 for <freedreno@lists.freedesktop.org>; Wed, 10 Apr 2024 11:42:34 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-516d16db927so6953344e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 10 Apr 2024 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712749352; x=1713354152; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KUA83gpzkWVU1iShuYOjIgJTVa9hCldc/8ck/dDALYc=;
 b=sURwW7Xg/fnN769wLZwZrW9ulrdA9HIBWHUUxwlCTzn/+l5vQ06xsVaEqKICeLNaql
 tXb1pZ4TzAx3PZOo6BABPc+3jSNW1XQB2ZIFovUVAPIFS/xLxffGTArv36aqBS4B/Ieg
 LlvY047/beq5FIeHnU1VyuoSp1mrZIsDy9W90xKav48q/z4uZbQcBU9+m8qjHKeHaXO0
 Oa0RfJdIaRXpPQJgicF0XC51bZVb90q8NHbMBjM/haWU2yFWispUngU/QaVnjBXGooW5
 JdRBDeO0JUxg6gDavBJqJShpWp7JzJYxJGLLyQEH5u2A6ETT50N5C89t3KLWIUalemo8
 c1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712749352; x=1713354152;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KUA83gpzkWVU1iShuYOjIgJTVa9hCldc/8ck/dDALYc=;
 b=wJnipiBlA+AmA5bd9sTcZqRsO9Z9hCtYSJWQOS9RyDUPI1NIWZQ02Ox8agm649/T3Y
 slkWzwrp4nreNCiW20Tq9/cfwnJoK8w/5N9zWOm/ucIjdQ5wtYV6Bn9KHpZKJ24IWv4k
 vEMg5vMxY20+vlLHA9dp5jH3Y13Cd6q2tKfJ0usd40J3X2gYf1qPr/Fbyy+Aq0rUqxX4
 dH2nIMTkIBxwGovav3LPBzhxAcZoc50BOp4hIKRPoKTkE09pgDZUafOOBFVFA+3/kiQ1
 /x0dKB5Kq85cNjDB7whuX5hqKcP4mMJRwJEMjl6UI22Tz3t8p65tTQP0JnqxRKvi0c4/
 raVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfQiX3ljs6VNppk8usE4mFE/nrN3a2fDO9MbQfuNmujj5plO3tW5HFWm2sIg+n9f5e1t94OoJfZQsfccUrTET5m2a6V4ole1rIUtVNhYPS
X-Gm-Message-State: AOJu0YzcEFOshtClwxX7diFVlNvpvogc0DfbYTNWvsq/G7b2qizob5zp
 REGqmyIC3oYnF1LCyyl/S5EnJVuE4Osg+Fg2CKgCnomi6+QxODwHdta9L1TUWtE=
X-Google-Smtp-Source: AGHT+IH0+JJIgaOrT6Rtm4Iaj3kAzRyP1f2o2KvzIHaHdG7P6BeuIaEO3YdnIAP8OVrErSr8qWw4XQ==
X-Received: by 2002:a05:6512:e85:b0:516:ea55:324d with SMTP id
 bi5-20020a0565120e8500b00516ea55324dmr1833879lfb.31.1712749352436; 
 Wed, 10 Apr 2024 04:42:32 -0700 (PDT)
Received: from [172.30.204.89] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 s24-20020a197718000000b00516c600cfcasm1853162lfc.106.2024.04.10.04.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 04:42:32 -0700 (PDT)
Message-ID: <730d6b9e-d6b4-41fd-bef3-b1fa6e914a35@linaro.org>
Date: Wed, 10 Apr 2024 13:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/msm/adreno: Implement SMEM-based speed bin
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-4-ce2b864251b1@linaro.org>
 <scvwfj44z3wpp7phvesfwjuv5awtlkwby2vvrpaq4i5fircrt3@i3ebya4iymf3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <scvwfj44z3wpp7phvesfwjuv5awtlkwby2vvrpaq4i5fircrt3@i3ebya4iymf3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 4/6/24 05:23, Dmitry Baryshkov wrote:
> On Fri, Apr 05, 2024 at 10:41:32AM +0200, Konrad Dybcio wrote:
>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>> abstracted through SMEM, instead of being directly available in a fuse.
>>
>> Add support for SMEM-based speed binning, which includes getting
>> "feature code" and "product code" from said source and parsing them
>> to form something that lets us match OPPs against.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>> -	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
>> +	u32 fcode, pcode;
>> +	int ret;
>> +
>> +	/* Try reading the speedbin via a nvmem cell first */
>> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
>> +	if (!ret && ret != -EINVAL)
> 
> This is always false.

Right, a better condition would be (!ret || ret != EINVAL)..


> 
>> +		return ret;
>> +
>> +	ret = qcom_smem_get_feature_code(&fcode);
>> +	if (ret) {
>> +		dev_err(dev, "Couldn't get feature code from SMEM!\n");
>> +		return ret;
> 
> This brings in QCOM_SMEM dependency (which is not mentioned in the
> Kconfig). Please keep iMX5 hardware in mind, so the dependency should be
> optional. Respective functions should be stubbed in the header.

OK, I had this in mind early on, but forgot to actually impl it.

> 
>> +	}
>> +
>> +	ret = qcom_smem_get_product_code(&pcode);
>> +	if (ret) {
>> +		dev_err(dev, "Couldn't get product code from SMEM!\n");
>> +		return ret;
>> +	}
>> +
>> +	/* Don't consider fcode for external feature codes */
>> +	if (fcode <= SOCINFO_FC_EXT_RESERVE)
>> +		fcode = SOCINFO_FC_UNKNOWN;
>> +
>> +	*speedbin = FIELD_PREP(ADRENO_SKU_ID_PCODE, pcode) |
>> +		    FIELD_PREP(ADRENO_SKU_ID_FCODE, fcode);
> 
> What about just asking the qcom_smem for the 'gpu_bin' and hiding gory
> details there? It almost feels that handling raw PCODE / FCODE here is
> too low-level and a subject to change depending on the socinfo format.

No, the FCODE & PCODE can be interpreted differently across consumers.

> 
>> +
>> +	return ret;
>>   }
>>   
>>   int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>> @@ -1098,9 +1129,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>   			devm_pm_opp_set_clkname(dev, "core");
>>   	}
>>   
>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>>   		speedbin = 0xffff;
>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> 
> the &= 0xffff should probably go to the adreno_read_speedbin / nvmem
> case. WDYT?

Ok, I can keep it, though realistically if this ever does anything
useful, it likely means the dt is wrong

Konrad

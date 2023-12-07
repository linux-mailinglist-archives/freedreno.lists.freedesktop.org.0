Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624088091DD
	for <lists+freedreno@lfdr.de>; Thu,  7 Dec 2023 20:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3042A10E0C8;
	Thu,  7 Dec 2023 19:48:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C557610E96E
 for <freedreno@lists.freedesktop.org>; Thu,  7 Dec 2023 19:48:40 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50c0f13ea11so1349002e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 07 Dec 2023 11:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701978519; x=1702583319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UhvAcona8JE9mqSkyUEEifprTp821EbSPpKf2QS4sas=;
 b=RkSVH8RHoy/RPUs8ovJswGR3NYQVQ5gH15wQBJMjiVHN6sXG5rn3xfByFELQIFu9Es
 kWdPsKW6Fsvs1oJEYnZ50kgbPnR3dLBBq5L/KZTWzxWwz8mWnUG03Q70eXqHkygUo8lO
 aUbqB4yfwL445fjRqDQds7SD4T8ZCOlCW+sZrV8l1PwVkwN/ecyDEfQwZ/6ez/KaZXIJ
 YwzdvssacCtSIFU6QB6kEzgKE2TGlyyfVQFeR8lKzCsLdYIgFIGZT3YFZmW6DzyeCNFW
 q5szJUJ628wjnodx6ro4+ibz59vCu3O/z8LCz+/xKjJdxzukCgw9hfQdJw5b5HDkXcwc
 Byxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701978519; x=1702583319;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UhvAcona8JE9mqSkyUEEifprTp821EbSPpKf2QS4sas=;
 b=N8rfxXMJ7KfVBVOKrvg0e8vcVC5RtV2wWaXKxSbxirb36TBlVC8sBd/2UGDSp6WIZ3
 9Y7RkSL8jQqQeiphrHZ3Cdt4+4lvsd/hdtRR116q9SYH1moeqnNrKCIzl0YEvoRMoPmj
 2zy3//EsuhvZOrbNDM1Y07izmcvDCTiM/6hPvbUrKh5LyO/dR/LaWIp8De7KXdh7+MVb
 YfUXRhjwyK7d9NoU26yfoojNItHiB1CIDflvW5AF8Da7SHo+YyAUog0wO6CJ2M0XXigJ
 zPrPfaZvefKBXmUTGfKjQWCEEF1mnuKwqKd2Y1JebdTcsV8CeEQHjIBHFUXb5Hi9XD7O
 RAhw==
X-Gm-Message-State: AOJu0YwrEXMOemDfz155WJO2+Xd5gvTCCCqptS6F8iy3LHnNKIu6BpPu
 r4NGxiOUQsH0Dl3IbmIoMHEx7A==
X-Google-Smtp-Source: AGHT+IFljctdvuyZS7CVZkeukvmHRNSLUGo+jsvHFsItAp5VfL6Nc6kSd4dOhvsJ3yfP3i4ct2webg==
X-Received: by 2002:a05:6512:4cf:b0:50b:ee7f:a0be with SMTP id
 w15-20020a05651204cf00b0050bee7fa0bemr1615515lfq.5.1701978519021; 
 Thu, 07 Dec 2023 11:48:39 -0800 (PST)
Received: from [172.30.205.181] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 i38-20020a0565123e2600b0050bf789f501sm29324lfv.11.2023.12.07.11.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 11:48:38 -0800 (PST)
Message-ID: <d830f067-7037-4303-aad7-82b9a1cc660e@linaro.org>
Date: Thu, 7 Dec 2023 20:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/msm/adreno: Add support for SM7150 SoC machine
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Danila Tikhonov <danila@jiaxyga.com>
References: <20230926174243.161422-1-danila@jiaxyga.com>
 <20230926174243.161422-2-danila@jiaxyga.com>
 <42a1d0ab-4e8d-461d-bb2c-977a793e52b2@linaro.org>
 <1695755445.902336096@f165.i.mail.ru>
 <84e63b82-4fef-416b-8dbe-3838ad788824@linaro.org>
 <c684d0a7-3336-48e3-9d2b-5c92f9132550@linaro.org>
 <f76637f9-8242-4258-932e-b879145a5cfd@linaro.org>
 <99ffd03f-b888-4222-939b-603c10f2307b@jiaxyga.com>
 <n3y5vfgznufdzdkyv6ygtohkepat5ayrpklearjw6jin57ussu@6uds6wtgaeaq>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <n3y5vfgznufdzdkyv6ygtohkepat5ayrpklearjw6jin57ussu@6uds6wtgaeaq>
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
Cc: freedreno@lists.freedesktop.org, airlied@gmail.com, andersson@kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 marijn.suijten@somainline.org, sean@poorly.run, johan+linaro@kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 12/7/23 20:46, Akhil P Oommen wrote:
> On Thu, Nov 23, 2023 at 12:03:56AM +0300, Danila Tikhonov wrote:
>>
>> sc7180/sm7125 (atoll) expects speedbins from atoll.dtsi:
>> And has a parameter: /delete-property/ qcom,gpu-speed-bin;
>> 107 for 504Mhz max freq, pwrlevel 4
>> 130 for 610Mhz max freq, pwrlevel 3
>> 159 for 750Mhz max freq, pwrlevel 5
>> 169 for 800Mhz max freq, pwrlevel 2
>> 174 for 825Mhz max freq, pwrlevel 1 (Downstream says 172, but thats probably
>> typo)
> A bit confused. where do you see 172 in downstream code? It is 174 in the downstream
> code when I checked.
>> For rest of the speed bins, speed-bin value is calulated as
>> FMAX/4.8MHz + 2 round up to zero decimal places.
>>
>> sm7150 (sdmmagpie) expects speedbins from sdmmagpie-gpu.dtsi:
>> 128 for 610Mhz max freq, pwrlevel 3
>> 146 for 700Mhz max freq, pwrlevel 2
>> 167 for 800Mhz max freq, pwrlevel 4
>> 172 for 504Mhz max freq, pwrlevel 1
>> For rest of the speed bins, speed-bin value is calulated as
>> FMAX/4.8 MHz round up to zero decimal places.
>>
>> Creating a new entry does not make much sense.
>> I can suggest expanding the standard entry:
>>
>> .speedbins = ADRENO_SPEEDBINS(
>>      { 0, 0 },
>>      /* sc7180/sm7125 */
>>      { 107, 3 },
>>      { 130, 4 },
>>      { 159, 5 },
>>      { 168, 1 }, has already
>>      { 174, 2 }, has already
>>      /* sm7150 */
>>      { 128, 1 },
>>      { 146, 2 },
>>      { 167, 3 },
>>      { 172, 4 }, ),
>>
> 
> A difference I see between atoll and sdmmagpie is that the former
> doesn't support 180Mhz. If you want to do the same, then you need to use
> a new bit in the supported-hw bitfield instead of reusing an existing one.
> Generally it is better to stick to exactly what downstream does.
OK I take my doubts back, let's go with adding a new one.

Konrad

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98E671FD2D
	for <lists+freedreno@lfdr.de>; Fri,  2 Jun 2023 11:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCEA10E639;
	Fri,  2 Jun 2023 09:10:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CEC10E639
 for <freedreno@lists.freedesktop.org>; Fri,  2 Jun 2023 09:10:16 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f4b0a0b557so2396812e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 02 Jun 2023 02:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685697014; x=1688289014;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PhUweK3MrTmGnE3rIz5Y4GwtiIWH03ocYNQvN700a+k=;
 b=dBFV/LvpLULuahatBG7pkyT25KZbjPW4rwC4qWew/loLA+yaCVla5gHKtotpLn/t41
 UJV/HVDkrCz3i9kIL1473ialF11BmJwV5J8B+HSLRcKNg9zFaCMWvfT1fZA82DuDcyiu
 R24I3hcInTr7jnmZwNqmlYXGY9gOektdVFUvc5yYEXkYYYgsh9qKeVaNQxMmoXTBoNtL
 egsbOHkKVvMGemwEqp4BkE1QEgT3WEj/wZCW/LFlMnVmwFSwk4bt9QoBaRnarM+Iv+4Q
 udYinK32K6rDeAeSZTreVW0qp/UNjxConNTa9n6qsAZ+EeubIghCRDq5O4T1qh1dzqT+
 dI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685697014; x=1688289014;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PhUweK3MrTmGnE3rIz5Y4GwtiIWH03ocYNQvN700a+k=;
 b=kbROo9Pr1W+hHvpO22MPSySgiS2u44a52/eFRChBE2KhVFdJkRjPy2moYLlOVPPZAD
 IqZ6rGq5LaLSbuqPPrjefeLkhF4J0M4ganP+PNotk84/7Z6ggPm/IJHR6LeNNyhXZ/R6
 AMBhpzg4iasKN9ri90zEvEAfdCydLKdq/Hz1TiNnX/V1MUgmNdFLYgwml0Y9n7WSIcNO
 bVhJSB5whBm9Mui8i4YZiLMHF1g7NEgJiot0puLCPdz38mRGQ2N5fJ/blSdSeOoqCQtR
 rK8iz+ATysgCA9f7OGxHPMX+o4r9Q2wtvymm3Aq5oKAv88KG3TU8tWIBI65oZ1MBg3uO
 qOZQ==
X-Gm-Message-State: AC+VfDzpWE7Wras0kiq44o6upoQNgszizAyIQNA3w5AIAP0G3N4XJwkT
 GZl/tXB30iqXSsmWns0eJE3kCQ==
X-Google-Smtp-Source: ACHHUZ4uOxiawkp4T5MNwtGac+PuGeNfQjMldLdTtBkDICVqI7WZjCVAG7q+W2hXqCW9Oy4aOa23NQ==
X-Received: by 2002:ac2:4294:0:b0:4f0:1124:8b2a with SMTP id
 m20-20020ac24294000000b004f011248b2amr1221204lfh.46.1685697014575; 
 Fri, 02 Jun 2023 02:10:14 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm97399lfl.259.2023.06.02.02.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 02:10:14 -0700 (PDT)
Message-ID: <2879254a-cd62-9f97-2c64-aa5151b19d82@linaro.org>
Date: Fri, 2 Jun 2023 11:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230531030945.4109453-1-quic_bjorande@quicinc.com>
 <20230531030945.4109453-2-quic_bjorande@quicinc.com>
 <57ffc7d9-c767-df36-d91f-8949993b1cdf@linaro.org>
 <z6usdzbvqxt6q7siff6qucyywafb6k4yh6qdpignqatowjb4c6@z3az35e3abs3>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <z6usdzbvqxt6q7siff6qucyywafb6k4yh6qdpignqatowjb4c6@z3az35e3abs3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 1/3] drm/msm/adreno: Add Adreno A690
 support
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
 mani@kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, johan@kernel.org,
 Rob Clark <robdclark@gmail.com>, Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 1.06.2023 20:30, Akhil P Oommen wrote:
> On Wed, May 31, 2023 at 10:30:09PM +0200, Konrad Dybcio wrote:
>>
>>
>>
>> On 31.05.2023 05:09, Bjorn Andersson wrote:
>>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>
>>> Introduce support for the Adreno A690, found in Qualcomm SC8280XP.
>>>
>>> Tested-by: Steev Klimaszewski <steev@kali.org>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>> ---
>> Couple of additional nits that you may or may not incorporate:
>>
>> [...]
>>
>>> +	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
>> It would be cool if we could stop adding uppercase hex outside preprocessor
>> defines..
>>
>>
>> [...]
>>> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x01fff),
>>> +	A6XX_PROTECT_NORDWR(0x11c00, 0x00000), /*note: infiite range */
>> typo
>>
>>
>>
>> -- Questions to Rob that don't really concern this patch --
>>
>>> +static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>> Rob, I'll be looking into reworking these into dynamic tables.. would you
>> be okay with two more additions (A730, A740) on top of this before I do that?
>> The number of these funcs has risen quite a bit and we're abusing the fact
>> that so far there's a 1-1 mapping of SoC-Adreno (at the current state of
>> mainline, not in general)..
> 
> +1. But please leave a618 and 7c3 as it is.
OK I'll note that

Konrad
> 
> -Akhil
> 
>>
>>> +{
>>> +	/*
>>> +	 * Send a single "off" entry just to get things running
>>> +	 * TODO: bus scaling
>>> +	 */
>> Also something I'll be looking into in the near future..
>>
>>> @@ -531,6 +562,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>>  		adreno_7c3_build_bw_table(&msg);
>>>  	else if (adreno_is_a660(adreno_gpu))
>>>  		a660_build_bw_table(&msg);
>>> +	else if (adreno_is_a690(adreno_gpu))
>>> +		a690_build_bw_table(&msg);
>>>  	else
>>>  		a6xx_build_bw_table(&msg);
>> I think changing the is_adreno_... to switch statements with a gpu_model
>> var would make it easier to read.. Should I also rework that?
>>
>> Konrad
>>
>>>  
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>> index 8cff86e9d35c..e5a865024e94 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>> @@ -355,6 +355,20 @@ static const struct adreno_info gpulist[] = {
>>>  		.init = a6xx_gpu_init,
>>>  		.zapfw = "a640_zap.mdt",
>>>  		.hwcg = a640_hwcg,
>>> +	}, {
>>> +		.rev = ADRENO_REV(6, 9, 0, ANY_ID),
>>> +		.revn = 690,
>>> +		.name = "A690",
>>> +		.fw = {
>>> +			[ADRENO_FW_SQE] = "a660_sqe.fw",
>>> +			[ADRENO_FW_GMU] = "a690_gmu.bin",
>>> +		},
>>> +		.gmem = SZ_4M,
>>> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>> +		.init = a6xx_gpu_init,
>>> +		.zapfw = "a690_zap.mdt",
>>> +		.hwcg = a690_hwcg,
>>> +		.address_space_size = SZ_16G,
>>>  	},
>>>  };
>>>  
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> index f62612a5c70f..ac9c429ca07b 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> @@ -55,7 +55,7 @@ struct adreno_reglist {
>>>  	u32 value;
>>>  };
>>>  
>>> -extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
>>> +extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[], a690_hwcg[];
>>>  
>>>  struct adreno_info {
>>>  	struct adreno_rev rev;
>>> @@ -272,6 +272,11 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
>>>  	return gpu->revn == 660;
>>>  }
>>>  
>>> +static inline int adreno_is_a690(struct adreno_gpu *gpu)
>>> +{
>>> +	return gpu->revn == 690;
>>> +};
>>> +
>>>  /* check for a615, a616, a618, a619 or any derivatives */
>>>  static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
>>>  {
>>> @@ -280,13 +285,13 @@ static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
>>>  
>>>  static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
>>>  {
>>> -	return adreno_is_a660(gpu) || adreno_is_7c3(gpu);
>>> +	return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
>>>  }
>>>  
>>>  /* check for a650, a660, or any derivatives */
>>>  static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>>>  {
>>> -	return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
>>> +	return gpu->revn == 650 || gpu->revn == 620  || adreno_is_a660_family(gpu);
>>>  }
>>>  
>>>  u64 adreno_private_address_space_size(struct msm_gpu *gpu);

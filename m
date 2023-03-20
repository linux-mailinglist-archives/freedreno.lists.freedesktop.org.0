Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08CC6C208D
	for <lists+freedreno@lfdr.de>; Mon, 20 Mar 2023 19:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF7310E2F7;
	Mon, 20 Mar 2023 18:57:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE8510E2F9
 for <freedreno@lists.freedesktop.org>; Mon, 20 Mar 2023 18:57:30 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id e11so4568943lji.8
 for <freedreno@lists.freedesktop.org>; Mon, 20 Mar 2023 11:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679338648;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nleApilvt4seuieCelgHsaSTIO0I4XS6e296xQJeqbo=;
 b=Y8T/D4KhCrvWiGcvNzFU2A5tr+4RZs+9or1m4CE1Nxy1hZr5pQmIYn5xyuHLJ5bLqc
 p32Qe6uirnsXTT5nGZUDw86rqs5aJe9CHypXDJ26QEXC9iO9TiWKxRpLh/MXIBcltLlM
 ltRpwNUiyhlYFlHHMRXpc4cqEoPVSybrNoFM7U45foCbuMEIFjX0rVW6NDKy844hmu+N
 kZgMS4sJwZY0ZcqZ4aHpid8TrChnCmVzgMQx7IYcFVxRyaXMGnVASr0ZaRuKIs62ungt
 pUpkBJqVpDHiYCZ/A7PlT32jznHKkPdlPDM7m5OYRiERQZpHmyiDNVp0r/YEsuoXURVW
 T7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679338648;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nleApilvt4seuieCelgHsaSTIO0I4XS6e296xQJeqbo=;
 b=7F3rSrY+WA41s392oRQaR3OuaKNDqgRg1dvwQQDKekE6Ei1hDd5bagcQN6QZowyedC
 sxHbsqUVk/KVbDzF7OXqqD/VIlg8WSf4n3SvMLJ4dA9uDucX/n+nf19QwusJSmhQP34b
 vCXoe0RNokx2bULMgZAjVikGGFLU2UF4WnNVQ/x//xrj8M6hdoVZZO0RvcfYAj1dRB5z
 05v+ALGRGfI6otOI+JxbUuKXf/QO240drkA7tU6bK3lfuqXwrUY2P01mRorr7ncfKVcK
 aSnqQpSAN5zmTqWLe7HFpQTkl7H5EgbfzsqMrhniP//PomWtVz6HdDIfsd+z2K3ar2Tm
 aMUw==
X-Gm-Message-State: AO0yUKU5cdU5P7PUo0/iEKb0on4kMFSwCRij3klewg+tI1TDL0FlAm3O
 XUg+V/ly7OApsUQD9BgK5RKzFg==
X-Google-Smtp-Source: AK7set/yKyX3y77Kji7SlQfpq9YqoLL0zl8SS/79CJ7SJxvJND8O9+7pw8lP/fsaa7amAV7qB1hcUw==
X-Received: by 2002:a2e:8e84:0:b0:299:6e0e:3a2a with SMTP id
 z4-20020a2e8e84000000b002996e0e3a2amr59003ljk.49.1679338648422; 
 Mon, 20 Mar 2023 11:57:28 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a2eb050000000b0029aa0b6b41asm1724672ljl.115.2023.03.20.11.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 11:57:28 -0700 (PDT)
Message-ID: <5a9e6cdb-f640-f070-6722-18e61c9f1136@linaro.org>
Date: Mon, 20 Mar 2023 19:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230320185416.938842-1-robdclark@gmail.com>
 <434caf75-eed1-ac35-f43c-da8c66cb99bc@somainline.org>
In-Reply-To: <434caf75-eed1-ac35-f43c-da8c66cb99bc@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/a6xx: Some reg64 conversion
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 20.03.2023 19:56, Konrad Dybcio wrote:
> 
> 
> On 20.03.2023 19:54, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> The next generated header update will drop the _LO/_HI suffix, now that
>> the userspace tooling properly understands 64b vs 32b regs (and the _LO/
>> _HI workarounds are getting cleaned up).  So convert to using the 64b
>> reg helpers in prep.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 +++------
>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 89049094a242..f26e258c6021 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1053,12 +1053,9 @@ static int hw_init(struct msm_gpu *gpu)
>>  	gpu_write(gpu, REG_A6XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xffffffff);
>>  
>>  	/* Disable L2 bypass in the UCHE */
>> -	gpu_write(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX_LO, 0xffffffc0);
>> -	gpu_write(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX_HI, 0x0001ffff);
>> -	gpu_write(gpu, REG_A6XX_UCHE_TRAP_BASE_LO, 0xfffff000);
>> -	gpu_write(gpu, REG_A6XX_UCHE_TRAP_BASE_HI, 0x0001ffff);
>> -	gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_LO, 0xfffff000);
>> -	gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_HI, 0x0001ffff);
>> +	gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX_LO, 0x0001ffffffffffc0llu);
>> +	gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE_LO, 0x0001fffffffff000llu);
>> +	gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_LO, 0x1fffffffff000llu);
> Any reason the last write dropped the leading zeroes?
> 
> Otherwise,
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Bah, thunderfox sent it from the wrong email. It still stands.

Konrad
> 
> Konrad
>>  
>>  	if (!adreno_is_a650_family(adreno_gpu)) {
>>  		/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */

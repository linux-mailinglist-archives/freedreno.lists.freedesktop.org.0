Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3997F733D44
	for <lists+freedreno@lfdr.de>; Sat, 17 Jun 2023 02:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A3110E6AE;
	Sat, 17 Jun 2023 00:44:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E695110E6AE
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jun 2023 00:44:02 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b45bc83f26so15747641fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jun 2023 17:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686962641; x=1689554641;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9mU9/r2NP5pdyOYwI4LQnZTUP7KdrI2cN021yOGtwio=;
 b=o3hkf4LmU9suujKu2ERmn6Gh1FpoCEhilDqUtyCUr9uFhBcl7CEtu9FlHhBfl6c9xZ
 Fl9kN2K80JY7VpuHcpAnOmrmMD2BZuaCVMUfrNLYQb3zsVbtFDfLV/X4GDksMlFpcjub
 OEhM91WO/H4xixVW4NXx1DPRWE6fEbNE/WjR1Y9Hw5GbWoGEg+c5Bfpk715gjvBTTqic
 7A+qYqjDAK+/5OR/qSY6H+uVqqWZgLOKVeZ9TEG5mY08vLLeaGjr2zJPQnvt8BFA3zJf
 e8/VUrcJKxuuRc15A5difpTpVfe+83IwPSsY+4BPe6thRD6HlQd7V4Bi92/ilt2vbymt
 ZsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686962641; x=1689554641;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9mU9/r2NP5pdyOYwI4LQnZTUP7KdrI2cN021yOGtwio=;
 b=O66MuWQcZKorrbXJOw8AyMvadWpcFNIZLjLq8NUwIhQ15rSfC50TBRL+ZFxCG2lqUo
 in8ecR9+Cf8ikIQ3ANJI/cxPhUSmvuvjHLtAGEYwQ5i2MJ60GjZU9Z34aZh05+GWsZZh
 DhTWc0yzORXB3/yM4Thd65BCLzWrFtlHK3AQGII7A993O865p0BR9UqXeQMKDVIWXtC3
 /DNyWLnf7GRoburvUDNvr7uaXMcRT1D+pAS46c3dFChUVdppvWWo0jY5iez3QHjZLYj7
 AqXUembDCRAY6H+JcMm8tKfwpvjhDbMqvKUMIJI5R+Yz0Vsi961RQEHgYbfAWrx9+HM4
 FR6g==
X-Gm-Message-State: AC+VfDxRuYMFhSknkiQiezTVB8RJ85/x2uMMj59oIisBYXz8uoWgIlSn
 PShqPFfKXbhNoVet5LxwxYI9wQ==
X-Google-Smtp-Source: ACHHUZ4/NJzvy9Ymi1RNhlhOYdBvrKxBA5Ui0VN9jETqQpt1BUY1v2MlEH0NcxHdO2ACnkRNIFfmnw==
X-Received: by 2002:a05:6512:3125:b0:4f8:5864:3cb5 with SMTP id
 p5-20020a056512312500b004f858643cb5mr2067503lfd.13.1686962640709; 
 Fri, 16 Jun 2023 17:44:00 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f85cf6416asm147300lfm.118.2023.06.16.17.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 17:44:00 -0700 (PDT)
Message-ID: <6c91dfd9-50b1-7196-9191-c7dbf1ec4ed2@linaro.org>
Date: Sat, 17 Jun 2023 03:43:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Juerg Haefliger <juerg.haefliger@canonical.com>
References: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
 <yl7qxypdzlzwmmp3b43vz5xo6jxey4zcpdxurcvfzujxrawz36@lneajulwoy4k>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <yl7qxypdzlzwmmp3b43vz5xo6jxey4zcpdxurcvfzujxrawz36@lneajulwoy4k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: Update MODULE_FIRMWARE
 macros
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, ribalda@chromium.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, robdclark@gmail.com,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, joel@joelfernandes.org,
 airlied@gmail.com, johan+linaro@kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/06/2023 18:55, Akhil P Oommen wrote:
> On Fri, Jun 16, 2023 at 02:28:15PM +0200, Juerg Haefliger wrote:
>>
>> Add missing MODULE_FIRMWARE macros and remove some for firmwares that
>> the driver no longer references.
>>
>> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 23 ++++++++++++++++++----
>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 8cff86e9d35c..9f70d7c1a72a 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -364,17 +364,32 @@ MODULE_FIRMWARE("qcom/a330_pm4.fw");
>>   MODULE_FIRMWARE("qcom/a330_pfp.fw");
>>   MODULE_FIRMWARE("qcom/a420_pm4.fw");
>>   MODULE_FIRMWARE("qcom/a420_pfp.fw");
>> +MODULE_FIRMWARE("qcom/a506_zap.mdt");
>> +MODULE_FIRMWARE("qcom/a508_zap.mdt");
>> +MODULE_FIRMWARE("qcom/a512_zap.mdt");
>>   MODULE_FIRMWARE("qcom/a530_pm4.fw");
>>   MODULE_FIRMWARE("qcom/a530_pfp.fw");
>>   MODULE_FIRMWARE("qcom/a530v3_gpmu.fw2");
>>   MODULE_FIRMWARE("qcom/a530_zap.mdt");
>> -MODULE_FIRMWARE("qcom/a530_zap.b00");
>> -MODULE_FIRMWARE("qcom/a530_zap.b01");
>> -MODULE_FIRMWARE("qcom/a530_zap.b02");
> Why are these not required when "qcom/a530_zap.mdt" is present?
> 
> mdt & b0* binaries are different partitions of the same secure
> firmware. Even though we specify only the .mdt file here, the PIL driver
> will load the *.b0* file automatically. OTOH, "*.mbn" is a standalone
> unified binary format.
> 
> If the requirement is to ensure that all necessary firmwares are part of
> your distribution, you should include the *.b0* files too here.

I'd say, we should drop all zap files from this list. Linux-firmware 
does not provide files with such names. The zap file name depends on the 
SoC and the platform name.

Juerg, could you please split the patch into two parts:
- pfp/pm4/sqe firmware names (which can be merged pretty quickly, as 
there is no controversy) and zap files changes (after we finish 
discussion in this thread).

> 
> -Akhil
> 
>> +MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
>> +MODULE_FIRMWARE("qcom/a540_zap.mdt");
>> +MODULE_FIRMWARE("qcom/a615_zap.mdt");
>>   MODULE_FIRMWARE("qcom/a619_gmu.bin");
>>   MODULE_FIRMWARE("qcom/a630_sqe.fw");
>>   MODULE_FIRMWARE("qcom/a630_gmu.bin");
>> -MODULE_FIRMWARE("qcom/a630_zap.mbn");
>> +MODULE_FIRMWARE("qcom/a630_zap.mdt");
>> +MODULE_FIRMWARE("qcom/a640_gmu.bin");
>> +MODULE_FIRMWARE("qcom/a640_zap.mdt");
>> +MODULE_FIRMWARE("qcom/a650_gmu.bin");
>> +MODULE_FIRMWARE("qcom/a650_sqe.fw");
>> +MODULE_FIRMWARE("qcom/a650_zap.mdt");
>> +MODULE_FIRMWARE("qcom/a660_gmu.bin");
>> +MODULE_FIRMWARE("qcom/a660_sqe.fw");
>> +MODULE_FIRMWARE("qcom/a660_zap.mdt");
>> +MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
>> +MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
>> +MODULE_FIRMWARE("qcom/yamato_pfp.fw");
>> +MODULE_FIRMWARE("qcom/yamato_pm4.fw");
>>   
>>   static inline bool _rev_match(uint8_t entry, uint8_t id)
>>   {
>> -- 
>> 2.37.2
>>

-- 
With best wishes
Dmitry


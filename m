Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D8489DE47
	for <lists+freedreno@lfdr.de>; Tue,  9 Apr 2024 17:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807B410FC40;
	Tue,  9 Apr 2024 15:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h7J4ZET2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB0410F780
 for <freedreno@lists.freedesktop.org>; Tue,  9 Apr 2024 15:13:21 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-516d68d7a8bso3814374e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 09 Apr 2024 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712675599; x=1713280399; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Y8LMcLnVJ7kXsKs8XUXqanjMzUM/+eZalvbhRQqwe4=;
 b=h7J4ZET2xz/PP7HPUz41y0x8kXokkMOGn97Zs4Un9PKJe70HChhvF6ml9OshDtV94/
 R8POWp9TF8wM8Wx/9ZPEOjt/n0Dn7canDzDy1wLxK3LyMHH7+soS2egrQ0cYF0JlID7F
 2sCMHVqJr7fB0FAvoQmC5jOGIn/QHWJV4sAEnlXjjNYlTZibwwGevtDU6ht8Cp2Y7Rnz
 80m4WC2DBmmYa+NIbcInG33KBU3lT0RTLVQtiB9k3ODjalBFrROa2WnSgNTBqHz/Wsfd
 e+NGTOUmyJMgcFSGVnGxgYziOupVUKDfPLFAMDMUK6ZIhRvdm0cnG4kFFUThstIT8/wz
 yAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712675599; x=1713280399;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Y8LMcLnVJ7kXsKs8XUXqanjMzUM/+eZalvbhRQqwe4=;
 b=lnz0aPT6InAGBjQqGJumW5Ybu26olnlZ07yuSwWxjBvz5FgyBac3pVmdoQdP4z/U6J
 cIrCLqen8/J6u+WRR91pMbHUdhjyPBPVmK+LDA1lfWpqYAYsdZeJQSDiIrhaf506Jo9j
 G5Uzzr1wnutGkd1Aa15DJwHs0VahWKbZd0KHy1aq7jmbZ/vSbiGKNqRYDEUlkDE838BI
 wK56eAVIJiRN7qAQVh/60UzvgcCrrFU3uJElYhnDW2gQFW6opRjGw4uoLMNkomWDz+Ns
 ACx4UQ7xVJAIhv7mfH2eFi1Sym1MGB8Foo8cA1Pigo7i9PmgWILYmYI9buHb1x8cc8dK
 +BrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3GcrdYSdDFnjb8JeuOQ3lACIGF5cx41BdsqnXWa85RWI4LJWbq4HP+wgBKX82hIIciPYo+UyEL1jxis61MH/udk38XC/bYWqU3/hmCE39
X-Gm-Message-State: AOJu0Yzmccd63haBjHA82p4FqyUW1xqWsO5ug2MQjv/IFxg8ZUVN5wCj
 t83RwwdHEjj85VNrCTBf/2FYeaNwGN69IvPs4lOnlWWaUhwcAINL+TTgHc5MRIE=
X-Google-Smtp-Source: AGHT+IFlaw2LMhoJukUATahy8181y2HaVjByLfM38iyBHMbY2UF2znz52B2OFJre+KGvD+E2b0w0ew==
X-Received: by 2002:a19:3812:0:b0:513:d1d9:9eda with SMTP id
 f18-20020a193812000000b00513d1d99edamr982073lfa.27.1712675599395; 
 Tue, 09 Apr 2024 08:13:19 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 10-20020ac25f0a000000b00516cea36d5bsm1603418lfq.21.2024.04.09.08.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 08:13:18 -0700 (PDT)
Message-ID: <0955cabc-fc4e-4790-a82c-7f6f807fe36b@linaro.org>
Date: Tue, 9 Apr 2024 17:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/adreno: Add speedbin data for SM8550 / A740
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
 <20240405-topic-smem_speedbin-v1-5-ce2b864251b1@linaro.org>
 <nek4paofg3hturvjwpa2bnsvmicwmvwixzr6e6iuqstemgrqyo@cagcrnzjsne2>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <nek4paofg3hturvjwpa2bnsvmicwmvwixzr6e6iuqstemgrqyo@cagcrnzjsne2>
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



On 4/6/24 05:25, Dmitry Baryshkov wrote:
> On Fri, Apr 05, 2024 at 10:41:33AM +0200, Konrad Dybcio wrote:
>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 901ef767e491..c976a485aef2 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -570,6 +570,20 @@ static const struct adreno_info gpulist[] = {
>>   		.zapfw = "a740_zap.mdt",
>>   		.hwcg = a740_hwcg,
>>   		.address_space_size = SZ_16G,
>> +		.speedbins = ADRENO_SPEEDBINS(
> 
> I think this deserves either a comment or some info in the commit
> message.

"this" = ?

Konrad

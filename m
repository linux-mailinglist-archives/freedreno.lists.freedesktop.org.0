Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980226FA6D5
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 12:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C311510E1F8;
	Mon,  8 May 2023 10:24:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE4C10E1F8
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 10:24:40 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f14f266b72so2584905e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 May 2023 03:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683541479; x=1686133479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a5b1axjYU7Z/HNBec4s202rAT9q9NaOrWGm5FGLB+aw=;
 b=k59HEF9KgCyRMJijY/SXi9N5BvmCqLx8yvuPRnMUFWGKgZotfMQN/DOwvVfSGCYF6S
 szXjAmKkkgfE1PXwZPhFEOADyX+f+B8MayikFS6sAJ33PG8PP4H6IcvIOwpTtxwJjziW
 UyBhX1qWMQLaA6CtAgsiXAMl6KLgTQm+WQWFrLVi5QxbnQMk2eTlgQsU8TReNNvUUWfv
 R8efMG2+yLahW79xSbl4Yh2MV1asVHQr1fm9CLUMjiLPsMawkKDYwnB+2KgyOBD6SWYq
 rrMAbGT5CB37GRHYEGbJHD16LeyjN0vPwbbyBA6t8G2HXcM+GeHUEKmxBik/hsoNFLAQ
 8M1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683541479; x=1686133479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a5b1axjYU7Z/HNBec4s202rAT9q9NaOrWGm5FGLB+aw=;
 b=DnxoxdW1xiujsDGA8mPJivuPIpfyDgH2zy+NT1xgR75U8Y5Vy12NsfQhfZHGUHRSJ6
 5HmL8uvYPM3eOX6Gc0hd+mzsK+UEjwKKOrWcYz66FlzTyxphIjm/cPFGXq35YvOOhxiR
 2V85RVr4d8PZ5l6uaItlxtzAWypJhC30VU6NjhJXK7Hsfy3SAaE5yHWg96sr3vd4Desn
 z2o6WdNh+OF6OdzhdyDmy4zThOuaS8A7axEScsfVa9mbOwe0haLvLQIIAadDjOtzJ3Uq
 vw1pQrui9XLq5MWGU1Pc9xapX7g3l5Od0oFakZMO1f8oXYbyGW1O8MAiYLUamcNP6apR
 zy6w==
X-Gm-Message-State: AC+VfDxVpHeJ+WhIYfnJlK6fswbgrWndpgXROAslVul88foVqDjTagJ3
 XzWEWbJPKRsK/nY/iPeu2wzHew==
X-Google-Smtp-Source: ACHHUZ6QzaiyYn3670VJ6ShRWtlutGRBQcW/dmwm/vOzt1VCah6EWHn7rTSuj+AKFTcnAmhna1lsfQ==
X-Received: by 2002:ac2:4831:0:b0:4ef:fed9:8eed with SMTP id
 17-20020ac24831000000b004effed98eedmr2554217lft.30.1683541478740; 
 Mon, 08 May 2023 03:24:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b3-20020ac25623000000b004edd490cf77sm1248895lff.275.2023.05.08.03.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:24:38 -0700 (PDT)
Message-ID: <c8144b21-d672-318e-2761-5d1daf384c30@linaro.org>
Date: Mon, 8 May 2023 13:24:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-2-dmitry.baryshkov@linaro.org>
 <8cdecc51-2a42-4b82-9eb3-2ab77860c5d4@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8cdecc51-2a42-4b82-9eb3-2ab77860c5d4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/4] ARM: dts: qcom: msm8974: add ocmem
 clock to GPU
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/05/2023 11:30, Konrad Dybcio wrote:
> 
> 
> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>> To get GPU working with the OCMEM, the oxili_ocmemgx_clk clock should be
>> enabled. Pass it to the GPU to get it to work on apq8074/msm8974 boards.
>>
>> Fixes: fe079442db63 ("ARM: dts: qcom: msm8974: add gpu support")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Uhh.. this clock should be managed by RPM with:
> 
> type = MEM
> id = 2
> 
> just like it's defined for 8994 today.
> 
> Could you try adding it in rpmcc and confirming?

There is an RPM_SMD_OCMEMGX_CLK clk already, it is a bus clock for the 
ocmemnoc.

> 
> Konrad
>>   arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
>> index 834ad95515b1..fb661c1bd3d5 100644
>> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
>> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
>> @@ -2104,8 +2104,9 @@ gpu: adreno@fdb00000 {
>>   
>>   			clocks = <&mmcc OXILI_GFX3D_CLK>,
>>   				 <&mmcc OXILICX_AHB_CLK>,
>> +				 <&mmcc OXILI_OCMEMGX_CLK>,
>>   				 <&mmcc OXILICX_AXI_CLK>;
>> -			clock-names = "core", "iface", "mem_iface";
>> +			clock-names = "core", "iface", "mem", "mem_iface";
>>   
>>   			sram = <&gmu_sram>;
>>   			power-domains = <&mmcc OXILICX_GDSC>;

-- 
With best wishes
Dmitry


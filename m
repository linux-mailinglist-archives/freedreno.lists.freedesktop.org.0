Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D214C68BB4A
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 12:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AA510E372;
	Mon,  6 Feb 2023 11:22:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D4E10E372
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 11:22:46 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x9so3247317eds.12
 for <freedreno@lists.freedesktop.org>; Mon, 06 Feb 2023 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XhsHQwvlEXsEH00VOxDhufQtl5xrtldVJBiemzWzN+Q=;
 b=PZ5eKoCgkHF43ZjOLchNOVMPGXcEm1LoxFaEdmziJtSEbnWbxsA4Us1UFQBE9f2maD
 kGNl5gyND1zK/qSIYtRwp1FRmzE6CJzR7MYHhY2JFaFzJiJxeU60SWGeIauvtfymvG56
 WNdb4RzHaIObXKGgVZc55fD4bGbU1+LQMtOEgL1YYtFPRHj4ntGevL+Q1P16xiuSezfy
 E+ilwt+i9XC+1t9HbFldGu7WrYF8folXKzfTd4aXwGLLIAj3LhTh2+AoibrSn9kNopp7
 hWl5NOetShpMpI9Hl+QpHVgDog1HGXgihm8c+Kma2oMtEjHAN5AziixcyRy3z6sZDqOQ
 WZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XhsHQwvlEXsEH00VOxDhufQtl5xrtldVJBiemzWzN+Q=;
 b=Pqvzng+DOAyOHzWw8HVnS9xWV1agpybEVFY4GpgPZgqzbZF5EsgOWK3tOcRXep+E8n
 hx4s7UKtrWjPDlXppdilBhpjbDTAhHO0QeA/5pValJrlb4WLak5QCSZOdXVjUDQELUFv
 uHvsM/IpxpB9i+2ka3giC14iDKZkBMZpfbhKq1VGLIVUuxz7jCawgpRJu4WrVOgksNEb
 8EUkYRiPoySk26KcD8R6Ik37wCqgjOWPN0GtON0OHhh5UPewj47Jd1dOnlW7GlhGDTwx
 /qBWd+wjmaAj5NKoQRADus8SOD+OUJHe0uAqDRCepzWy0JiOGG4o12gGqSKuGD89VlvQ
 PZYw==
X-Gm-Message-State: AO0yUKUj9c4pbZE5cdKrCoJ0Ewsv+viEebpI7FeT6dFuKoWQWp/UyN6p
 S0T+rGz7R6TIQ26rUd1BLS27dQ==
X-Google-Smtp-Source: AK7set/QXSx+xlzok3YT7LqHrvr9vnMxGjCoMErm9FyPlcBL/qsLFJOUBOfKnsozCi4EQfJOICO62g==
X-Received: by 2002:a50:bb27:0:b0:4aa:a172:6612 with SMTP id
 y36-20020a50bb27000000b004aaa1726612mr8607839ede.33.1675682564633; 
 Mon, 06 Feb 2023 03:22:44 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a056402350c00b0049e210884dasm4924504edd.15.2023.02.06.03.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:22:44 -0800 (PST)
Message-ID: <a5635503-2d03-3996-a60f-f6255e407ca1@linaro.org>
Date: Mon, 6 Feb 2023 13:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Taniya Das <quic_tdas@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-3-dmitry.baryshkov@linaro.org>
 <f563f3e9-2c50-4509-a44d-9406bc725a95@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f563f3e9-2c50-4509-a44d-9406bc725a95@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/8] arm64: dts: qcom: sm8350: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/02/2023 12:44, Konrad Dybcio wrote:
> 
> 
> On 6.02.2023 01:27, Dmitry Baryshkov wrote:
>> Add another power saving state used on SM8350.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   include/dt-bindings/power/qcom-rpmpd.h | 1 +
> Wrong patch?

And this patch is correct. sm8350 GPU OPP table uses this value (but as 
doesn't reference the rpmh's opp states, we don't have to add one there).

> 
> Konrad
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
>> index 4a30d10e6b7d..1bf8e87ecd7e 100644
>> --- a/include/dt-bindings/power/qcom-rpmpd.h
>> +++ b/include/dt-bindings/power/qcom-rpmpd.h
>> @@ -211,6 +211,7 @@
>>   #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
>> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
>>   #define RPMH_REGULATOR_LEVEL_SVS	128
>>   #define RPMH_REGULATOR_LEVEL_SVS_L0	144
>>   #define RPMH_REGULATOR_LEVEL_SVS_L1	192

-- 
With best wishes
Dmitry


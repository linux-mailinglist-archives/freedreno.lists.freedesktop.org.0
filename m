Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5157572DAD2
	for <lists+freedreno@lfdr.de>; Tue, 13 Jun 2023 09:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216C210E33C;
	Tue, 13 Jun 2023 07:29:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F92F10E33C
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jun 2023 07:29:41 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30fb7be435dso1701735f8f.1
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jun 2023 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686641379; x=1689233379;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SWcv2KbrVkYfhLRQFgFKlaFWH34hYYx6W1r/9LcWNfU=;
 b=QmKKD4LMjD9i+Quf/rolLMOd4eqr0DS/nQA2gx5UzbHAwy89+M7DsAeiYF0aB8nPWq
 Rz2TpEEEyooJBlrmYwbifewPMFmSXCo1O/czW4AYUG3V3OzM2ZA7Io2ACgcsdVRk2hhW
 jWK7bV5zeLMRIazLGvBouWMWMfeFilvhdE0gps+G6UzAGlk7PqR+Sv68stYcDXwbIjJS
 BMGnVuYB+TJTj8inkXdSpxLbVJCN5Cg59hKLUQKgLBY8Fe1Dco9OLTB31a+vAoyPWGMh
 8eFoOWK6HXaCc8F7JxR5xkTbVeUMfSrG6pp4JlEUOW7yXfEPtkqHamfCWJ7YfU3ME5RN
 LlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686641379; x=1689233379;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SWcv2KbrVkYfhLRQFgFKlaFWH34hYYx6W1r/9LcWNfU=;
 b=Z2KgP+ZKQTWapVtWLPW6pRa7i9ZaRguB3tcO1BRWhkTBV8VFj2CuM3kT6gBMi/6TFE
 Lb36mgOK6CwKOU9iP8Uo22Xh+BhA0mLFoGCGzo2r2vLRwSRyVJHEzqi/Uq2sHqibD1iL
 2tth1/MyMoFsBSEr//BI8gKDzn90VduiM/P5ZEqE2b6YiE9MLbsifJg1iiiRt+2g5COF
 wrmQ6qrmqe3UIyF5ky8wjZY3FH1FgNxS7d+ITPlSf3FOsU5XbECzwv5XSTKEbLrl40sz
 6GDflLdBRxEbAQchzDtiw/wpp7PVOWMVxkIdMFZk/GjyY6lm6Aq5MrnXA9FX87+oCGmH
 WFiQ==
X-Gm-Message-State: AC+VfDyGN7lgBPpKU8A1d7GjntwJ6x0NQrAvSi3dieTpyf3oyJ/hV8uR
 Y0IxFjSny4N/DguJpWOwiZ3U9g==
X-Google-Smtp-Source: ACHHUZ4llERySH8FvtsxtkPBf3YLvy/r2xMKHTUzrkPF382Oj3Rb5ZncCciA46/buotoosZubkrCGg==
X-Received: by 2002:adf:e3c5:0:b0:30f:bbd6:1efe with SMTP id
 k5-20020adfe3c5000000b0030fbbd61efemr4099802wrm.57.1686641379388; 
 Tue, 13 Jun 2023 00:29:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:48b:b939:c60e:e1ba?
 ([2a01:e0a:982:cbb0:48b:b939:c60e:e1ba])
 by smtp.gmail.com with ESMTPSA id
 h14-20020adff4ce000000b0030c40e2cf42sm14367826wrp.116.2023.06.13.00.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 00:29:38 -0700 (PDT)
Message-ID: <1b3e86a7-352c-de2f-aaa0-51fe878b8462@linaro.org>
Date: Tue, 13 Jun 2023 09:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230601-topic-sm8550-upstream-dp-v3-0-5f9ffdcb8369@linaro.org>
 <20230601-topic-sm8550-upstream-dp-v3-1-5f9ffdcb8369@linaro.org>
 <ce7c4402-b58e-b5df-c864-9f1a959132d0@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <ce7c4402-b58e-b5df-c864-9f1a959132d0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 1/2] arm64: dts: qcom: sm8550: fix
 low_svs RPMhPD labels
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/06/2023 18:50, Konrad Dybcio wrote:
> 
> 
> On 12.06.2023 17:26, Neil Armstrong wrote:
>> "low" was written "lov", fix this.
>>
>> Fixes: 99d33ee61cb0 ("arm64: dts: qcom: sm8550: Add missing RPMhPD OPP levels")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> https://lore.kernel.org/linux-arm-msm/1d3c05f5-c1bd-6844-1788-8df0b863a02e@linaro.org/
> 
> somebody forgot to run `b4 trailers -u` :P

Damn, resending a v4 now :-)

Thanks,
Neil

> 
> Konrad
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 75cd374943eb..972df1ef86ee 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3649,15 +3649,15 @@ rpmhpd_opp_min_svs: opp-48 {
>>   						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
>>   					};
>>   
>> -					rpmhpd_opp_lov_svs_d2: opp-52 {
>> +					rpmhpd_opp_low_svs_d2: opp-52 {
>>   						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>>   					};
>>   
>> -					rpmhpd_opp_lov_svs_d1: opp-56 {
>> +					rpmhpd_opp_low_svs_d1: opp-56 {
>>   						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>>   					};
>>   
>> -					rpmhpd_opp_lov_svs_d0: opp-60 {
>> +					rpmhpd_opp_low_svs_d0: opp-60 {
>>   						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>>   					};
>>   
>>


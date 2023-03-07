Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB236ADD0C
	for <lists+freedreno@lfdr.de>; Tue,  7 Mar 2023 12:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1807C10E471;
	Tue,  7 Mar 2023 11:14:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF0110E428
 for <freedreno@lists.freedesktop.org>; Tue,  7 Mar 2023 11:14:55 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id g18so12777826ljl.3
 for <freedreno@lists.freedesktop.org>; Tue, 07 Mar 2023 03:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678187693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yT7vGhUXWJk9HYJN6I+M8kwXMyH9EI24q/vmlgWv3m8=;
 b=CR/0+YSacYaMRbzWtuZLaj7mlcFerMdCQTGypTHtRsDDH/7zP+jryAMCIGgtkZj1nB
 cp7IWqzXNdM6M0RUuwFnjx7g5YHlc6Bg6zv898iLDdEVsw837xpoJufcrRzh2KRdJoW0
 lhx+4qSdJ6+YDj8o2nMSp+dhubOcpK4u9izJvnZ1nEcqm7DY9rnMRqxQUzGrPdobjKCP
 zWWDFDIdU/6ma2QAo137K5aeIYiLvPZU2SyvRK5CeuIEWnnU41t67WruJXecCVyXSbXw
 d081WmAqY29Ia63TpYuTJ1TkoswHKWmnk3oVq4/+AnAojdz7L0jDHV31Hxtthf4HCP7T
 5CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678187693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yT7vGhUXWJk9HYJN6I+M8kwXMyH9EI24q/vmlgWv3m8=;
 b=zvQygG74XZD6OobnblM0yge4jRggLFmttnpOgop3Cp3hvSsCB3QrZhT81SloimMCdR
 Q2OEtjmOf+JR7f742bRozudVwpyY63BR7WYJ5RZRvTeCUEeCX4M9q6jxudVIBUID5IMx
 GSIxwu8KimRlFhDg4FyhvvMNekaVLk9UbLOklBuzl6UoZp28ixd+3BpdkFKHEcxAt4HF
 Y/tMSJ63wvU5bCGeQgO9vwVoiOohqUHfkyswr/+MhChtVEwyNP1zUAur/Zt2fxdxMNJi
 nfGyaKwQ0Y7ajNGJo9u1Gx08dNbO5fHMICv2ok+C9PjWwluYVkrl8H+3lbkdAn4YLM0P
 ex3g==
X-Gm-Message-State: AO0yUKW+bf9WG0WfRT02z1G9C4fLqnU1YQNwsor3F+muioPDR1cQK1Pl
 6ePJQ7X2dCOdOZy1qgX3SLLmeg==
X-Google-Smtp-Source: AK7set/Wz0Rx9XUBw7YxwDmwy1KllOxzRErdeKK9Kj5JqFHHN2PNAGXEpEi5nSFHpUfQzppg5PLKFA==
X-Received: by 2002:a2e:710b:0:b0:295:a969:d225 with SMTP id
 m11-20020a2e710b000000b00295a969d225mr3924432ljc.1.1678187693642; 
 Tue, 07 Mar 2023 03:14:53 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 198-20020a2e05cf000000b00295a02569ebsm2167222ljf.124.2023.03.07.03.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 03:14:53 -0800 (PST)
Message-ID: <22970751-8bc0-9cbd-eec1-cbc92f0b4ea7@linaro.org>
Date: Tue, 7 Mar 2023 12:14:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
 <20230213121012.1768296-9-konrad.dybcio@linaro.org>
 <bcb5c17f-da78-9d68-66eb-b620ee583602@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <bcb5c17f-da78-9d68-66eb-b620ee583602@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 8/9] dt-bindings: display/msm:
 dsi-controller-main: Add SM6115
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 7.03.2023 10:17, Krzysztof Kozlowski wrote:
> On 13/02/2023 13:10, Konrad Dybcio wrote:
>> Add a compatible for the DSI on SM6115.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index 2494817c1bd6..f195530ae964 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -25,6 +25,7 @@ properties:
>>                - qcom,sc7280-dsi-ctrl
>>                - qcom,sdm660-dsi-ctrl
>>                - qcom,sdm845-dsi-ctrl
>> +              - qcom,sm6115-dsi-ctrl
> 
> This looks incomplete. You also need to add it to MDSS binding.
https://lore.kernel.org/linux-arm-msm/145066db-5723-6baa-237d-7c2b8fd476d9@linaro.org/

Does this.. but I guess I'll resend this as one series, as it only
makes sense.

Konrad
> 
> Best regards,
> Krzysztof
> 

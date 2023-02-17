Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C9369AA80
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 12:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3626210EF87;
	Fri, 17 Feb 2023 11:36:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B162C10EF87
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 11:35:58 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id dn12so10865074edb.5
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 03:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2gfzQNE//Aw16MMqvtyQfrzfyKuHmI2QnVNvYOB30K8=;
 b=Ks+DrvObHAy8xBoileh20VTLy9/tujYL5yZ32b2r4cA/Wz7wyIWKpyAdEBJdAdTElq
 30zz7uJvyeWphLMa7fakX2E0YuLJsgbkHAb59+DeZypbsM1ePFibx0crC7TtSZ0PzTbc
 uwyloIk6kXATLe+RxqexrEj4nQxdmXFt8iNduSuJ+z01z5CFtph9gjIxwCrAOz1cPqjI
 J7KeRpkAKRQdgeyuNJ+InQ40qS7LqSNaB/ejLsOiUcOFS4V/oiJk9uWbAOFo3+8uYT9K
 YNh0wd2wAHwjLI3jlqM6gsAbjXJMZAES0xC78C0oJjaICE38JHBKF49XiPplkuDFbULl
 k7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2gfzQNE//Aw16MMqvtyQfrzfyKuHmI2QnVNvYOB30K8=;
 b=VVSOj22bXtBd5lEns2Fyn8LDQ/UAMKk4M/xSHVGuJb3r4aeZ0kJGk5qev+zLExTydw
 MeMiWR3/iVTWi5XP3lNTaxtJu9hwvIEe5/LBqPHgo9ChlGazExqSG2OH9+InvzP0L+fa
 N3azHTw3bz32UJQ4PPT9swqIg60qjTqUfb+2VM3m3AkHXgIOl9aTUkrJ46/dGwp0h828
 ThwlYwZWyxheVrbP7OAvBtfRVhYuBVafKXU66ouPvO1LdBHZc2w3E4CH5Oq7IvuynCEx
 RH9DpFUS8gFL5WH9krRHWxj3X+Se2Iz9vhIHQcyJyARdpQ1FITPbwCFBl1pBEbnsdQM2
 NjCQ==
X-Gm-Message-State: AO0yUKV+tG1af7dw2JP485BHFshgSLWmTp8/gw8D09IYVvLTYStldBr3
 mvSwtY04bUi6Ew6yN4r93NJhdw==
X-Google-Smtp-Source: AK7set/4gwWb+v2vMog72T1d8PFebKKhautfOWYnzVlOkHVf1+Fofuclt6aH2IIjB0OwptFOhuFXlg==
X-Received: by 2002:a17:906:e253:b0:8a9:e031:c4ae with SMTP id
 gq19-20020a170906e25300b008a9e031c4aemr9890960ejb.2.1676633757121; 
 Fri, 17 Feb 2023 03:35:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 ke20-20020a17090798f400b008b13f6d4fe4sm2005543ejc.81.2023.02.17.03.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 03:35:56 -0800 (PST)
Message-ID: <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
Date: Fri, 17 Feb 2023 12:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated QCM2290 compatible
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/02/2023 12:32, Konrad Dybcio wrote:
> 
> 
> On 17.02.2023 12:30, Krzysztof Kozlowski wrote:
>> On 17/02/2023 12:13, Konrad Dybcio wrote:
>>> SM6115 previously erroneously added just "qcom,dsi-ctrl-6g-qcm2290",
>>> without the generic fallback. Fix the deprecated binding to reflect
>>> that.
>>>
>>> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>> Depends on (and should have been a part of):
>>>
>>> https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
>>>
>>> v1 -> v2:
>>> New patch
>>>
>>>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>> index 41cdb631d305..ee19d780dea8 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>> @@ -37,7 +37,6 @@ properties:
>>>        - items:
>>
>> If this way stays, drop the items as it is just an enum.
>>
>>>            - enum:
>>>                - qcom,dsi-ctrl-6g-qcm2290
>>> -          - const: qcom,mdss-dsi-ctrl
>>
>> Wasn't then intention to deprecate both - qcm2290 and mdss - when used
>> alone?
> "qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl"
> 
> was never used. The only upstream usage of the 2290 compat
> is in sm6115.dtsi:
> 
> compatible = "qcom,dsi-ctrl-6g-qcm2290";
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sm6115.dtsi?h=next-20230217#n1221

I meant, that original commit wanted to deprecate:
compatible="qcom,dsi-ctrl-6g-qcm2290";
compatible="qcom,mdss-dsi-ctrl";

Best regards,
Krzysztof


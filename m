Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2226B9069
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 11:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFAC10E76D;
	Tue, 14 Mar 2023 10:44:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CE210E76D
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 10:44:33 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n2so19347057lfb.12
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 03:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678790671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CufXOi5c6WNCFc2hn9WjIYddQXgO4QrrUY1LyXBd3X8=;
 b=W56mMayMPeN2W9jPfcdDtVhOQuRfeApv6Ko8Of8fiDNwRm+gYduoghDxuSMmCPEv7Y
 QHnEtHcMkPIOn6/+RaeXQmeSh3GZJbzVbIbLHPSWiKN8ZfCQhY21sa71xxdtr/VUWvh0
 7Y7pV9nuW+tLel3NvtvqdprIGffvByw0pYaIazoyqEP8xHMjRYf/S6UaXD/rhxq57Gan
 Jh4RaRCq6BZE8FqZ5uV8QG3JVW00I7r4Pyds3rnf0HLhW7sXbajOrFxpPqtjT+ZXxg0K
 1MqdYeCOzm1VObwiIH/NnojnF/0YlaEK/u15nhjyawJKRK3OH91xU8qtEpBMLeIkr/4B
 la1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678790671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CufXOi5c6WNCFc2hn9WjIYddQXgO4QrrUY1LyXBd3X8=;
 b=KDV6hkJ6k4sAFX0R7mjd5SDPbedn7wSuuKZC+x1njJp3za4JU445Kz7kuD5kE1zYxm
 vQQnp6Vzwzphz/O3yB4ZG1iNbhc+FckZ8RfF3NyFZP5ZIaYx+qlQ0s82mgeB+fZgWSuB
 m5UuZLkU/0M8W9oChRYe952w1BH+XM+j8M85d2tgXIqGiBjkCEqozeVYmYOId4UmhN5g
 c9/4z6QjaGouj2TaPdqh9ThLirc/Jck1SpiB+GDAkfgE4PO6rvZpSqBOnuDMcsfJbQtT
 84bkU7sidYfaqijC2/kycAm//htTZF2hH3MlXIqkTfo3cPcqVhA3CCE+0oDVAl4iGaix
 3uqg==
X-Gm-Message-State: AO0yUKU1nhsYJxeJwYD/uz5n0x2/HbLOAdALX9+hMga7zRld2WQJbkFw
 GgSD2m7xIgxe2YcFeZLtfJwWAw==
X-Google-Smtp-Source: AK7set+nMsNuL1g/hWyGWiP+PNe3XYuVxVqLi7qVVRwksPTVN6qKnSykp82XjB1fUFB8Wj9TpeVKBw==
X-Received: by 2002:ac2:5a0f:0:b0:4e1:36a:eda5 with SMTP id
 q15-20020ac25a0f000000b004e1036aeda5mr738730lfn.30.1678790671265; 
 Tue, 14 Mar 2023 03:44:31 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 i2-20020ac25222000000b004ddaea30ba6sm348369lfl.235.2023.03.14.03.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 03:44:30 -0700 (PDT)
Message-ID: <a8a3f655-13de-46ce-5af9-177cb5e003c8@linaro.org>
Date: Tue, 14 Mar 2023 11:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
 <20230307-topic-dsi_qcm-v3-8-8bd7e1add38a@linaro.org>
 <20230314001527.lrd65j42esfomcje@SoMainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230314001527.lrd65j42esfomcje@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 08/10] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated compatible
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
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 14.03.2023 01:15, Marijn Suijten wrote:
> On 2023-03-07 14:01:46, Konrad Dybcio wrote:
>> The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
>> alone. This however didn't quite work out and the property became
>> undocumented instead of deprecated. Fix that.
>>
>> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Yes.  From the previous binding (prior to that patch) either
> qcom,mdss-dsi-ctrl _or_ qcom,dsi-ctrl-6g-qcm2290 was allowed, not a pair
> of both.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index 2494817c1bd6..94f4cdf88c95 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -34,7 +34,7 @@ properties:
>>        - items:
>>            - enum:
>>                - qcom,dsi-ctrl-6g-qcm2290
> 
> No comment that it was simply renamed?
That was mostly handled by Bryan's series.

Konrad
> 
>> -          - const: qcom,mdss-dsi-ctrl
>> +              - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
>>          deprecated: true
>>  
>>    reg:
>>
>> -- 
>> 2.39.2
>>

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DF269B4AA
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 22:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9980510F0D2;
	Fri, 17 Feb 2023 21:24:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AC610E494
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 21:24:37 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 e4-20020a05600c4e4400b003dc4050c94aso1845217wmq.4
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 13:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i99jD1tlOm2J+DaW0h6qwAWv/L8x6GC6XmOgvZVvFkg=;
 b=P4w7/wTCAaJZbUMoUy6T0Bm9u/G07nwRjiDAqAfkDP+ELzlrstGe6/FfGCOYa+sQsl
 A/D1An0YMCwegS9JEhZMHfVmFJV41dAjQR0EnBSLeK8GlxXvkTAhMfzeCWPOlwXFkWus
 GcsuN8w8+h4YcA24+hXZ8TFUVnxkwGQf368nonUkNkJxOV9BrCiKQ54YaCd0MHekT9L2
 0YRig4wE3PbTHXqs8ZN99+LL1s5LEKULExv1buN5YUOGohp7pGb2vz13ieTPpMpVr0VD
 ATdPI3c7WZs0EyDxZJRu/EKqIc9W0wyHxr+L2m9MMXU+nN2rVFlvAD4YsFmEUdNhskAf
 jYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i99jD1tlOm2J+DaW0h6qwAWv/L8x6GC6XmOgvZVvFkg=;
 b=gxOy6nD5AFs0tSLEiaJy1mOLDOjjGVRfyFQAX62zJLvxHOZxL7IxEU+GFOsl/6lp77
 bxKaAl3EVQF9pTJkJruZxpaykj7FfQjMs0XyXz83Ws+7dy2Y7mHc9GwClXsTiZ6TkKOI
 XuDw9Cz03/TQSHGE6h1aLyhiJowo6Sni+n0tBWa4w4cWDCofr/QvOrLHVdpixe4XTzVJ
 Oar4igvDWu+U3sBTH9rbx/psUKEcFIQcJYCos1OdXerHoaXZQWPnaID7e7niWI85EUmj
 hXi5oKuCa3bizpYYYnwM6RSsU7uSxISmq+uzwLDzwBOCi7ZC8jrSPNU5RXsACF8NpAg2
 cW6w==
X-Gm-Message-State: AO0yUKUQO3rb9VTHvqsAJ5uloDuaJwV2wBp0o2WcFNq0Lz27Nurc43gd
 tp8OKXdSjXB6rF2qPwzS5Hy7Bw==
X-Google-Smtp-Source: AK7set+Xc51wFSpAOQt9chC3jAJ9CBbqWhtN3Jab8NU4rTVA1dGR+XeDIG7qIaGN1P/mLOMJ4aQRYw==
X-Received: by 2002:a05:600c:908:b0:3e2:5c3:bcfc with SMTP id
 m8-20020a05600c090800b003e205c3bcfcmr1283074wmp.18.1676669075673; 
 Fri, 17 Feb 2023 13:24:35 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c294c00b003dc42d48defsm6015281wmd.6.2023.02.17.13.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:24:35 -0800 (PST)
Message-ID: <4faf391d-f606-2da2-86ce-02b9c97fdbb5@linaro.org>
Date: Fri, 17 Feb 2023 21:24:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
 <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
 <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
 <76de00dc-f128-e609-7f0c-b53161036b97@linaro.org>
 <0b3e8c81-b0fb-651b-8688-872f03c68d8f@nexus-software.ie>
 <0989eef7-cd0e-324c-eef9-aa8500197b91@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0989eef7-cd0e-324c-eef9-aa8500197b91@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/02/2023 21:23, Konrad Dybcio wrote:
> 
> 
> On 17.02.2023 22:20, Bryan O'Donoghue wrote:
>> On 17/02/2023 21:16, Konrad Dybcio wrote:
>>> Correct, but QCM2290 is not supported upstream yet.
>>>
>>> SM6115 (a different SoC) however is, but it used the qcm2290 compatible
>>> as it was a convenient hack to get the DSI host ID recognized based on
>>> the (identical-to-qcm2290) base register without additional driver changes.
>>> We're now trying to untangle that mess..
>>
>> Gand so what we want documented is:
>>
>> compatible = "qcom,qcs2290-dsi-ctrl", qcom,mdss-dsi-ctrl";
> qcm* yes, this became documented with your original cleanup
> 
>> compatible = "qcom,sm6115-dsi-ctrl", qcom,mdss-dsi-ctrl";
> and yes this became documented (well, in the DSI binding) in
> my other patch series and is finished being documented in this one
> 
>>
>> with the old compatible = "qcom,dsi-ctrl-6g-qcm2290"; clanger continuing to be deprecated.
> correct, we still have to note it but keep it deprecated
> 
> Konrad
>>
>> ---
>> bod

Cool.

That maps to my understanding & the intention of the deprecation.

---
bod

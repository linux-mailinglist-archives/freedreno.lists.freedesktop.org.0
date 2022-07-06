Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E09A4568E83
	for <lists+freedreno@lfdr.de>; Wed,  6 Jul 2022 18:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4328A10F485;
	Wed,  6 Jul 2022 16:00:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0378110F475
 for <freedreno@lists.freedesktop.org>; Wed,  6 Jul 2022 16:00:54 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id bx13so19030985ljb.1
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=U8rkOvI4p9+BPX+Awl+ZBNeJpDUbE3jKRXFd02XLl9s=;
 b=Gq2vSAicTLPXzab1pttXrJC5zZ6FpdH+r3B9tveGB0+2H6hK931G9jRnFcMAtp+U9y
 hkwL5jlCY8YimDM35zQWRWiP6QasBmvZR9FkUGIQ+kxBCAyGOMuZkWLfjG+URDocEHpD
 Fh0k0c2B7rRXIPOVPx+eMNF/EYQaat4TyXZy9FuL6+1+bA5+bYPC68DWg5fVkrvZKlM0
 dmIr0S0A030/Dz36jJR4xsyZfUA1yk3dlwSTFMeMs2QvFTWSEvZwyBNq1JooErY03zqE
 d/6ZTjv2dLgozsnK/wHIXh5mMgmaK0bWdVJHowonAyYV+M59S+ZI20SftIaIHy4Z9rnT
 ofnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U8rkOvI4p9+BPX+Awl+ZBNeJpDUbE3jKRXFd02XLl9s=;
 b=yoJk0T4UsFemY/Yk6qII0wPbOHNkh24JPbaUy1lKw98gP7ULk9TuNIXQhpw8uiih/C
 YBT4aysSQC+0jK3eubUyRqYrZtwKJ0X2plZN17Hscyn2fhqZiZqTc4CiQ0Z+8vWY+07a
 aJwPwgpSbafjJzb2onjvd8UcEc8yyd84F13QyvFLKDwz+B7D7FcaTsAyXLP/98DyXWPC
 69uwWxhKyOMQ+mufrq3jrAG1Lmozh9pZTZsb70PjWk4dNIrfYsbG6KgZEkTvBgLrkCxH
 YHPHsNcp+nFvCiCeXb3D4xaZbFnCPrCUs5C0Bfn6gm6jS5dGNW807mjRoWMuhaAevOyN
 5VeA==
X-Gm-Message-State: AJIora8sbF4ztGiG19hQ96WHBE3fK7kG8kSnRYLfiW1C+jOanZSMG3rg
 AXkA40FnUJVDtzDJfOCjQWTQZg==
X-Google-Smtp-Source: AGRyM1vpn8hj+Aqr5ZxW5Sc7HgmJdtfMX2GM6CMbwVZxH0ZeY5XeFjAPcAFyOLRDHVLosvRWVbGbLg==
X-Received: by 2002:a2e:5c1:0:b0:25d:46f3:ba5 with SMTP id
 184-20020a2e05c1000000b0025d46f30ba5mr2380610ljf.156.1657123253106; 
 Wed, 06 Jul 2022 09:00:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 j24-20020ac253b8000000b004796a17246esm4197957lfh.252.2022.07.06.09.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 09:00:51 -0700 (PDT)
Message-ID: <c6c06a9e-8b06-cb15-ae81-07053bbf80a7@linaro.org>
Date: Wed, 6 Jul 2022 19:00:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-3-dmitry.baryshkov@linaro.org>
 <088c1863-ad44-61b6-8757-bc3097369335@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <088c1863-ad44-61b6-8757-bc3097369335@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/4] dt-bindings: display/msm/gpu: document
 using the amd, imageon adreno too
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/07/2022 18:50, Krzysztof Kozlowski wrote:
> On 06/07/2022 16:52, Dmitry Baryshkov wrote:
>> The DT binding desribes using amd,imageon only for Imageon 2xx GPUs. We
>> have been using amd,imageon with newer (Adreno) GPUs to describe the
>> headless setup, when the platform does not (yet) have the display DT
> 
> Does not have "yet"? So later it will have and you drop a compatible?

Yes. For example see the arch/arm64/boot/dts/qcom/8150.dtsi, which 
currently has only GPU node. Once we add MDSS/DPU/DSI/etc. nodes, we are 
going to drop the compat string.

> 
>> nodes (and no display support). Document this trick in the schema.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> index 346aabdccf7b..e006da95462c 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> @@ -16,9 +16,13 @@ properties:
>>         - description: |
>>             The driver is parsing the compat string for Adreno to
>>             figure out the gpu-id and patch level.
>> +          Optional amd,imageon compatibility string enables using Adreno
>> +          without the display node.
>>           items:
>>             - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
>>             - const: qcom,adreno
>> +          - const: amd,imageon
>> +        minItems: 2
> 
> This is too unspecific. You allow any device to be and not to be
> compatible with amd,imageon.

Yes, this is expected (kind of). Would you have any 
alternatives/suggestions?

> 
>>         - description: |
>>             The driver is parsing the compat string for Imageon to
>>             figure out the gpu-id and patch level.
>> @@ -148,6 +152,8 @@ allOf:
>>                   description: GPU 3D engine clock
>>                 - const: rbbmtimer
>>                   description: GPU RBBM Timer for Adreno 5xx series
>> +              - const: rbcpr
>> +                description: GPU RB CPR clock
>>             minItems: 2
>>             maxItems: 7
> 
> Do 8 items work with maxItems:7?

You would have guessed, yes, they do.

-- 
With best wishes
Dmitry

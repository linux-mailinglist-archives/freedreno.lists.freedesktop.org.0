Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2576C568EEA
	for <lists+freedreno@lfdr.de>; Wed,  6 Jul 2022 18:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B328810FC4F;
	Wed,  6 Jul 2022 16:19:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425D910E7DE
 for <freedreno@lists.freedesktop.org>; Wed,  6 Jul 2022 16:19:55 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f39so26796143lfv.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GcIvyPH2KizUihUSW8jy8Ob4N/0YG6AMAP1rAGpU7Ok=;
 b=xmMh6xC5pu7s4zzweT/syE2N332r0cw69GyAjGEnu4TghuS1S3W2P6TnWCwS9kVC5u
 zWprhnM1rt69W8pUeIyaBFhE3scZNFREnqx+6kMg6rhkzS2oQAFr2JxihXDSKRevPsUX
 Xi5yw7pk5BQR0R8GK+8cjgmNPvxRfAlfhYXGyeHq9d6N8WVHYMQiLtF5WRtwYIcLG91q
 zutq0jAIFD9uD1O19nPUaKge+9pgA4E785ssWXp/2eJVNp5gsR4D0kzfZBRSL34BAkIl
 mQsWBdKOVaV+SP2BZFaBbTS6A7IsUjWzvpaHrOAAa8fx/gNIOF3rbQYjBZ7vseLEghXE
 q53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GcIvyPH2KizUihUSW8jy8Ob4N/0YG6AMAP1rAGpU7Ok=;
 b=0ATRdSRtIJxl3WLqIOT+UzyQiUi0AzkRZUzlyYV53jCoMibe8PhTZ+0kCi+bpff5WY
 zzzkHU7tHju7xEu5ID1XHmrIpG4ETXN+ta5AQzsbNEzP7BKj4vn/CtebGyRFFD8UdKiL
 boCk63FPsdMLdzq35ds4aaLA/PYtwRQzou4R6ZMLIWyTv5Fkx5h8CGK5i2nYkFbXenZD
 54A8GVN35+pDGwc1fdmx/E4KwUKBMCxpWEhJu8nm2vorDPfV6RFq232LzBKH3Vpm+xBA
 CmyRAEdIYpho+SLKZvn2fxNexl43KWhxvi+fj88xN7PYIvvxzwtVFxIk39Q1gTrEgYGc
 KGpw==
X-Gm-Message-State: AJIora8wTqA30Cy/ARWrg82ljYs3G6WE0E7k21KAfqind1VqF2M0tcHL
 C0zFc+8lbqqBKBFmBUFnFQ8PfQ==
X-Google-Smtp-Source: AGRyM1uj08Bgxjs0oo+U3pkd7e1TXBRKeScKxQEEM9E2gGyL0OVQWDueFmb58f+hNAm0OSgiBPsbBQ==
X-Received: by 2002:a05:6512:3f0f:b0:47f:6f89:326 with SMTP id
 y15-20020a0565123f0f00b0047f6f890326mr25036446lfa.124.1657124393536; 
 Wed, 06 Jul 2022 09:19:53 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b0047f9aefa838sm6356219lfg.109.2022.07.06.09.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 09:19:53 -0700 (PDT)
Message-ID: <6c89ee27-43d1-b926-b061-c9f6c1085f24@linaro.org>
Date: Wed, 6 Jul 2022 18:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-3-dmitry.baryshkov@linaro.org>
 <088c1863-ad44-61b6-8757-bc3097369335@linaro.org>
 <c6c06a9e-8b06-cb15-ae81-07053bbf80a7@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c6c06a9e-8b06-cb15-ae81-07053bbf80a7@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 06/07/2022 18:00, Dmitry Baryshkov wrote:
> On 06/07/2022 18:50, Krzysztof Kozlowski wrote:
>> On 06/07/2022 16:52, Dmitry Baryshkov wrote:
>>> The DT binding desribes using amd,imageon only for Imageon 2xx GPUs. We
>>> have been using amd,imageon with newer (Adreno) GPUs to describe the
>>> headless setup, when the platform does not (yet) have the display DT
>>
>> Does not have "yet"? So later it will have and you drop a compatible?
> 
> Yes. For example see the arch/arm64/boot/dts/qcom/8150.dtsi, which 
> currently has only GPU node. Once we add MDSS/DPU/DSI/etc. nodes, we are 
> going to drop the compat string.
> 
>>
>>> nodes (and no display support). Document this trick in the schema.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>>> index 346aabdccf7b..e006da95462c 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>>> @@ -16,9 +16,13 @@ properties:
>>>         - description: |
>>>             The driver is parsing the compat string for Adreno to
>>>             figure out the gpu-id and patch level.
>>> +          Optional amd,imageon compatibility string enables using Adreno
>>> +          without the display node.
>>>           items:
>>>             - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
>>>             - const: qcom,adreno
>>> +          - const: amd,imageon
>>> +        minItems: 2
>>
>> This is too unspecific. You allow any device to be and not to be
>> compatible with amd,imageon.
> 
> Yes, this is expected (kind of). Would you have any 
> alternatives/suggestions?

Using compatible for this kind of breaks the entire idea behind
compatibles, because the device does not stop being compatible with
amd,imageon. Either it is or it is not. I would understand that drop the
compatible per boards which physically do not have display, physically
are headless. But the comment in sm8250:
"make sure to remove it when display node is added"
is just confusing.

The typical solution would be to just check the properties of the device
and choose different mode if display is missing (via port graph or some
other way how the gpu is actually linked to the display).


Best regards,
Krzysztof

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC7AB3F4F5
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 08:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F0F10E595;
	Tue,  2 Sep 2025 06:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iYhRqvlp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351C710E595
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 06:04:59 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3d6af847306so215837f8f.2
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 23:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756793098; x=1757397898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2b3JuSsnshEbB2H24ad5BMEkyTFrlBTid3O0T6ibdMc=;
 b=iYhRqvlpsKF16xJj+1fKo8RDQOt4dRTL0aVEjV2o0OjKVfBbmOEug6Rk+RYACJObIX
 5SF1ytQp9tSH/HgBMYVWu5hC+SIujP2iSE6KpiQujXX0kmOTFIwVNiQxy9045mO6Wyma
 zgUuQ/9I1KKJfd190qB/ndgKvLzedJ5UhIqxHfU9pyTAwOEM/cXd2tRgEN2+PdHUdY55
 1OK0cJutlrwbwzo7ypJ+G9KF3OQ11Fqq3Da6fJY3zx+5s4YflUR2QhJxW7lCj59vwhZg
 vGF8V0ekEczUxIbqWQCOsnEi442US9iaABzEmKpFOTif56ddigrd5P5SYhMyM8Bw5uCX
 zekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756793098; x=1757397898;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2b3JuSsnshEbB2H24ad5BMEkyTFrlBTid3O0T6ibdMc=;
 b=CSKjLsILB5edbLfk3rIwPgB68pIIX2CsgHlvypyV6uA/M6a1qtnsIClcc6OLccTyOI
 DTZhLPP4O9F2AHRVV/1gAMWCglAbUmZHH1GIS/BE78/IbTkAz8erfNDE9Q7nQBLvfMCD
 0BDqiaIWufHSkO33wOaiXMxAudDa/M+cFddjTuhkviS4mYpmqtdUp+mFeXZ531+pAzXp
 nmfDBaWLrm7XfW3zSFfK6BZaywrhx30KU4MTCDPFopReBIInhUVUcf3AIcAiHML5U7fR
 sNuFUp4/+i9bDVsfv9J9iGFzPHMBV0YKrH/Q81O40z/SkpRRgWYjU/H7wy5GlpUaZArg
 Lziw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOpoiB9IdVNPYo+7VQropBTFTRhPamvbFPpj66rUjs+YC8xeajHzCng3SaEENqnokIQe7eegTWWgw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLDj3UXm3xcU/yeDAi+7omQxM7AYfBQ0f+OcZzG1VL/3qAsnKC
 1eBhII5o43s/InG8SKWLcly65exCJnFhvWGj6IfoQU7W6kjVu58yqXOOoDileSBNzJc=
X-Gm-Gg: ASbGncu690emxCenECl2Zm5XoNQa0PFxvUz5zsNyf1QR+IQUeTnNGDW3K2Wp/N451xA
 f1Hs0XPVLqhHfvnpVd8gIGXGppbMao4ZsUhPBoJXLja/7wJU0vRfCkMmzs39JAWAh6YXAS8v3KO
 RANL22+nUljLaDhW9KCU8MUqTbO00gA2yO4ElMn3yY2Navab8oDLoIkxEKvpiH/7llug3HYSX4P
 Adds8fRf1OkOSTxSwkwi+k20G2nysv8SqOtwecstGwgQHFVy/XPMLKJTsRoWeNwGpceo+fl1M0c
 6p6Vaphp5Kyv9w/ZE3AC8rbfFoMhDVK0IGdYo/biguxwRD/g/3LJLCvJEAYesXXO5mJw5K9mIvv
 PpnvsskH+P58V3dejx/HFCeSjuvAUSTqTmL17pqMl0Gc=
X-Google-Smtp-Source: AGHT+IGzQvNWUwBdb294u3aSfKMN/4Lhuayvos0l/gCcNz8KPqZ1Si6aA9RC3fHNpONP2IXnMVzHIA==
X-Received: by 2002:a05:6000:2307:b0:3c9:774f:6484 with SMTP id
 ffacd0b85a97d-3d0fa72c0d8mr4993112f8f.5.1756793097550; 
 Mon, 01 Sep 2025 23:04:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d1007c0dc8sm16442802f8f.53.2025.09.01.23.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 23:04:56 -0700 (PDT)
Message-ID: <24999a53-ea5a-4823-a84f-2ca0ca184bb4@linaro.org>
Date: Tue, 2 Sep 2025 08:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] dt-bindings: display/msm: dp-controller: fix
 fallback for SM6350
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-2-2b268a43917b@oss.qualcomm.com>
 <20250901-arboreal-gay-wolf-bcaaec@kuoka>
 <qy6c2gundpbz5ixqpt2hefzfb56wcrzcaclqwg2opof4zc7lep@dpc3nv6usurk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <qy6c2gundpbz5ixqpt2hefzfb56wcrzcaclqwg2opof4zc7lep@dpc3nv6usurk>
Content-Type: text/plain; charset=UTF-8
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

On 02/09/2025 06:03, Dmitry Baryshkov wrote:
> On Mon, Sep 01, 2025 at 05:45:49AM +0200, Krzysztof Kozlowski wrote:
>> On Fri, Aug 29, 2025 at 01:48:15AM +0300, Dmitry Baryshkov wrote:
>>> The SM6350 doesn't have MST support, as such it is not compatible with
>>> the SM8350 platform. Add new entry for SM6350 with fallback to SC7180
>>> (which belongs to the same generation and also doesn't have MST
>>> support).
>>>
>>> Fixes: 39086151593a ("dt-bindings: display: msm: dp-controller: document SM6350 compatible")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  .../devicetree/bindings/display/msm/dp-controller.yaml     | 14 +++++++++++++-
>>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index aed3bafa67e3c24d2a876acd29660378b367603a..0f814aa6f51406fdbdd7386027f88dfbacb24392 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -31,13 +31,25 @@ properties:
>>>            - qcom,sm8650-dp
>>>        - items:
>>>            - enum:
>>> -              - qcom,sar2130p-dp
>>>                - qcom,sm6350-dp
>>> +          - const: qcom,sc7180-dp
>>> +
>>> +      # deprecated entry for compatibility with old DT
>>> +      - items:
>>> +          - enum:
>>> +              - qcom,sm6350-dp
>>> +          - const: qcom,sm8350-dp
>>> +        deprecated: true
>>
>> If it is only about bindings then there is little benefit in keeping
>> this, just drop this case.  However you cannot drop it from DTS, so this
>> is a bit pointless.
> 
> Our plan is:
> - land updated DT bindings, describing MST clocks on MST-enabled
>   platforms,
> - land updated DTS, adding MST clocks where applicable,

This part breaks all out-of-tree users of DTS.

> - land driver changes, keeping legacy support for non-MST DTs on
>   MST-enabled SoCs
> 
>>
>> Lack of MST support is not informative enough to claim it is not
>> compatible with 8350. For example if it was working fine via fallback,
>> then that statement is simply not correct.
>>
>> And it HAD to work fine, because there is nothing binding to
>> qcom,sm6350-dp.
> 
> It is working fine since currently we don't have MST support on the
> driver side (nor do we describe MST clocks in DT). It's true that the
> driver will have to handle non-MST DT for SM8350. However I definitely
> don't want to describe both cases in the bindings. SM6350 is not going
> to be compatible with the MST-enabled SM8350 schema.

The question is rather: is SM6350 going to be compatible (working) with
MST-enabled drivers.

Best regards,
Krzysztof

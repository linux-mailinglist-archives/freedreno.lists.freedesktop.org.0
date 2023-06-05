Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49136722D28
	for <lists+freedreno@lfdr.de>; Mon,  5 Jun 2023 19:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098CB10E1CB;
	Mon,  5 Jun 2023 17:01:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C20510E1CB
 for <freedreno@lists.freedesktop.org>; Mon,  5 Jun 2023 17:01:26 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f50470d77cso6344984e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 05 Jun 2023 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685984484; x=1688576484;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lRDMBVk4vz1Ythlxetf7Gr54/89mc98k3y6FPQIUZHg=;
 b=LLPUjN7ht3lheGOgE29J26cFxSTOEEskEKkrW/KvuK18WSoArlVLQlMPeQkKlxArFC
 am/kJz3hndT2PEsVFERJQr2CUl1g3mAXUhho7+Yt3WmQbWtErunZaeKFvUUE4ohHifn1
 Xz4w7SzBTPY/FG0UOd/vLmMsZ/nU/ftO8Ajop6k7aS2TtLMydhCYV+7AmxNdjx9INH2g
 qkWYOe+PEyHylGVPhKT/agDeqsVrLW4sV4M+gYnLCm/BOdLvuM8rB40q8UM5cSzQoeo1
 5T+Pc3D1lHn7Twb18+mXZxWZ/C1QdN9DZtqfIiix+JwQDxxlORwgzEGAkJsChgplviIK
 Z5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685984484; x=1688576484;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lRDMBVk4vz1Ythlxetf7Gr54/89mc98k3y6FPQIUZHg=;
 b=g/Gc9JXdMQiTj3O6ZhJE9XIaSrbpwQN+ve43e40MTdQNjdC/9wZVsO59pddEQBhDyk
 8hDR0wEsO0tgxDBz38XQ7jApgQ/ywOBPOijC+vJ84+4vWJ9W8cUtksQ76KGdnvhcNA6v
 cd6GLooA7691nrswqhY9xM0g3pJYQWAQfP1p6DCjt0qZciFQ0WX9jNc8wsvEgdnXU//E
 MZheOmC0Q+x0R66wYkV/95hPyVJTfCyuIt0ODMOPKI5c3WhGVzr2ST1GZ2pSBp8jiQrk
 Rba0Yh/w09P46FaV/KkRS46HfgXJN0WafK4KUhBO8/IZSpaPbJDobaK84cA4yhCa1THr
 ZCOg==
X-Gm-Message-State: AC+VfDxxxURleR8Tco976000dCapFK/XG2fON5NMvfI7fK5/Pmb3KifX
 oGg/E06FgY7VERouxm8SFIIaMg==
X-Google-Smtp-Source: ACHHUZ4BWd4RPSnyw8163lZCr4pIJB0FfrOTLxiCGnSFr7EaUQX8/0srT7bEgU+FJp5yBMlxzY96uw==
X-Received: by 2002:ac2:54a9:0:b0:4f4:dd51:aecd with SMTP id
 w9-20020ac254a9000000b004f4dd51aecdmr5265334lfk.54.1685984484053; 
 Mon, 05 Jun 2023 10:01:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj96.neoplus.adsl.tpnet.pl. [83.9.29.96])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a056512014800b004eff32d6a21sm1189005lfo.121.2023.06.05.10.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 10:01:23 -0700 (PDT)
Message-ID: <ea8d1808-b04c-332f-834a-c3f237e0b931@linaro.org>
Date: Mon, 5 Jun 2023 19:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v5-5-998b4d2f7dd1@linaro.org>
 <e9da7236-5915-b9df-59dc-c2baa960f52b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e9da7236-5915-b9df-59dc-c2baa960f52b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 05/12] dt-bindings: display/msm: Add
 SM6375 MDSS
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 4.06.2023 20:04, Krzysztof Kozlowski wrote:
> On 23/05/2023 09:46, Konrad Dybcio wrote:
>> Document the SM6375 MDSS.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
>>  1 file changed, 216 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
>> new file mode 100644
>> index 000000000000..3aa4f0470c95
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
>> @@ -0,0 +1,216 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,sm6375-mdss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SM6375 Display MDSS
>> +
>> +maintainers:
>> +  - Konrad Dybcio <konrad.dybcio@linaro.org>
>> +
>> +description:
>> +  SM6375 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
>> +  like DPU display controller, DSI and DP interfaces etc.
>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,sm6375-mdss
>> +
> 
> Same as 6350 - drop items.
Ack

> 
> Similar concern about interconnects, although we don't have header file
> for them, so I assume we will fill it up later.
Yep, they'll come later and other SoCs may need a bump up for a third icc
path soon..

Konrad
> 
> Best regards,
> Krzysztof
> 

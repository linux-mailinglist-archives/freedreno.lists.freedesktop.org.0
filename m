Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6516673B1A0
	for <lists+freedreno@lfdr.de>; Fri, 23 Jun 2023 09:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F45C10E62A;
	Fri, 23 Jun 2023 07:29:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0541910E62C
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 07:29:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3128fcd58f3so372873f8f.1
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 00:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687505343; x=1690097343;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=74Pt8y9BLYayYvuaPPOjFJX++4vBERPSGc1K1bOgfPc=;
 b=Y4LcbyKKH4D6Sc646yqtnsdFR8fsUfhWH/1ZHEzwtdsJ2yk8zc1Id8XVlOltQkHnRw
 QOEMIZF8lARJZ6DwtHrkXJUM5ppaxzuno9eMOajvNiVVRauJQjgfI5z77h+YaaWHm0Pb
 LIT/8+VGo1gkux9Gm0eWNJy5t2FQLi4gwjAy+/ASpPay5cTlS+kJA/Is381aaoo+z1TY
 Bbq4uJmoUVRTHpOROfa+YIir1CtWiCJQBPgcqnIhQ42xSvYK2+2KRJtNbVv+Aq6b7+c/
 7MqkFZv+o4R2+ucZPy/9fmXkuqzADq6kWRKTrQ5dkRxIZZPM8eJLdvaj6Ooo80jPhybu
 VN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687505343; x=1690097343;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=74Pt8y9BLYayYvuaPPOjFJX++4vBERPSGc1K1bOgfPc=;
 b=Rwr15LIBxb0qc/cjoLWZorhrHYoCJAs12HgEz8Fk7FMtKMFZKV2LMZ6veN7+CySyEh
 7DmEZoghr+iZIgO+wGnpyAITH7XDWedCwLYTAfVZnlDUAna0H988OUoSvoWn3An0JaF8
 rg3m9O6hgeDGZCd4ydkujjz6cqAAjZRqehH25I9wi/vxlYtFOBi9ocv0bCmWEG81Jpix
 hnVzd7hgpyijjPT/LjPXhfERDjq/lxKbPnYEajc3fG59XZaVNkn9ulcgZ2j3ISiIy0gG
 G4y/nzEosTQsO7WSaWwapQAEaEVIqdpahOZqlG7Q4ibryCtKsU4d3gxi/vUwELX4niyo
 wkQw==
X-Gm-Message-State: AC+VfDxiJs8tsmgHygpzGo4X1mf8TP+IxFAp/4gLAMlv4hZj1lDdL0F2
 H6jD1UY77Kykn/NzRHuUULfbfA==
X-Google-Smtp-Source: ACHHUZ5R9hJ3wXhPhvbJVcGIHlACR3cX0dSORBCPRA3xKj+G+lmLhEIxWe2HnM4i26WPrqPkabi7bA==
X-Received: by 2002:adf:f6c8:0:b0:311:d7d:e831 with SMTP id
 y8-20020adff6c8000000b003110d7de831mr15478208wrp.48.1687505343048; 
 Fri, 23 Jun 2023 00:29:03 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adfcc89000000b003113f0ba414sm8822488wrj.65.2023.06.23.00.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 00:29:02 -0700 (PDT)
Message-ID: <b4b1552d-67ab-3ab4-641a-1e190ed4a707@linaro.org>
Date: Fri, 23 Jun 2023 09:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
 <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-1-8bf386b373eb@linaro.org>
 <xlr3rmz7wy5o3ka6cxo2tzl3hqbnk4vkm7jsgjdhyimiyyqnfr@pjjwjg37675s>
Organization: Linaro Developer Services
In-Reply-To: <xlr3rmz7wy5o3ka6cxo2tzl3hqbnk4vkm7jsgjdhyimiyyqnfr@pjjwjg37675s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/3] dt-bindings: display: msm: sm8350-mdss:
 document displayport controller subnode
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/06/2023 09:27, Marijn Suijten wrote:
> On 2023-06-21 11:26:25, Neil Armstrong wrote:
>> Document the optional document displayport controller subnode
> 
> document the optional *document*?  Same in the other patches IIRC.

oops, will re-spin with this fixed

thanks!

> 
> - Marijn
> 
>> of the SM8350 MDSS.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
>> index 79a226e4cc6a..f2cbeb435f1b 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
>> @@ -52,6 +52,12 @@ patternProperties:
>>         compatible:
>>           const: qcom,sm8350-dpu
>>   
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        const: qcom,sm8350-dp
>> +
>>     "^dsi@[0-9a-f]+$":
>>       type: object
>>       properties:
>>
>> -- 
>> 2.34.1
>>


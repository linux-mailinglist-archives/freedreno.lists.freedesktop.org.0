Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B997549B5
	for <lists+freedreno@lfdr.de>; Sat, 15 Jul 2023 17:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD00810E162;
	Sat, 15 Jul 2023 15:15:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86F910E15E
 for <freedreno@lists.freedesktop.org>; Sat, 15 Jul 2023 15:15:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso3627016e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 15 Jul 2023 08:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689434128; x=1692026128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z8KNCC9I1F9kjTDVRYpGot4ReKfbTH+5U1hLH87sHgA=;
 b=vCxGnQa+LCkNlnmfK8Qayb3iyzeW6pXHZtCyqghxe0qwfiW0sg7vZD+Y/Fx4VYqf5x
 HTkinc+fYyy9fGenLz3NiNjSsk179AtdxHYo/RcPhrGHmQ0zXVMzCJnDQwZvXlqwF97t
 B8xKRBoqTy+HctJFjfeDoRTYHoYUkewKSMSCYlhDVZtn/Km9YbKY876XJfEkh4oWJyIA
 rNBOgvnyQLi3vW688bGwup4XsSU6lWN/m0nrtNUCGkejbS8mWh2wRFidLhosGWvgO2F/
 77vsViNzk/ltUO6bTIr924fSQHhzPinkCGkXHM480FIjTf5HdJ8nqqRyqWyNQzkQBtdH
 E6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689434128; x=1692026128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z8KNCC9I1F9kjTDVRYpGot4ReKfbTH+5U1hLH87sHgA=;
 b=Ty5CWRetsbkYZtjvDX4qwCf/Pg8B6o6e/HY1I5KJiYpGeW3dqlboV7shZb8QwZweNa
 ibICuLlEgP6z5IwJIqozMp92owsqIO5gpCBzCSN++wDLwZuzt7NMi1G2SvJBExSnAQas
 fV82Ya7xdq6Cdx+kACzZiSiqGdg41nHdcBNx8IlwI3oBBjMwsm/Yyyi7wdSfzZnT+5yb
 SGwX5mV/BeMlpUTC9L6iMZX1NnmWnjtzrIqJm8v0mbU46yEMMbYkk6WiSBQFh0NRLvTq
 ft/hvLbYgqkS4E7AC2yY8Hc/ziQrrXjD9dXcHs0LISEhnzbmH0zIZbmWjEIYVPUrBmWM
 G/Nw==
X-Gm-Message-State: ABy/qLaE9OKsNhile2cIPkuh3B+uYOfAmxnjoNolgdL9Ct6VZ9LQN80f
 hNFJL1PUmUXzZrL0Fv9i0tVspw==
X-Google-Smtp-Source: APBJJlFhO1YTRc+DLVe6cqQkOVN5T/FwqJCpdLG+LekoBoSwlnhcoF6SYn52wV2EdmMKlSj1yauTYw==
X-Received: by 2002:a05:6512:3d86:b0:4fb:a5b9:98ef with SMTP id
 k6-20020a0565123d8600b004fba5b998efmr2453295lfv.26.1689434128601; 
 Sat, 15 Jul 2023 08:15:28 -0700 (PDT)
Received: from [192.168.1.101] (abxi167.neoplus.adsl.tpnet.pl. [83.9.2.167])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a056512096400b004f13cd61ebbsm1941406lft.175.2023.07.15.08.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jul 2023 08:15:28 -0700 (PDT)
Message-ID: <9c0d6ed8-ebac-87a3-ba10-0c9a1d8eb6da@linaro.org>
Date: Sat, 15 Jul 2023 17:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
 <20230628-topic-a7xx_drmmsm-v1-2-a7f4496e0c12@linaro.org>
 <9256aa76-ded3-3fad-4564-e3451cf74065@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <9256aa76-ded3-3fad-4564-e3451cf74065@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 02/14] dt-bindings: display/msm/gmu: Allow
 passing QMP handle
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 4.07.2023 10:29, Krzysztof Kozlowski wrote:
> On 28/06/2023 22:35, Konrad Dybcio wrote:
>> When booting the GMU, the QMP mailbox should be pinged about some tunables
>> (e.g. adaptive clock distribution state). To achieve that, a reference to
>> it is necessary. Allow it and require it with A730.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> index 20ddb89a4500..9e6c4e0ab071 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> @@ -64,6 +64,10 @@ properties:
>>    iommus:
>>      maxItems: 1
>>  
>> +  qcom,qmp:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Phandle to the QMP mailbox
> 
> mailbox would suggest you should use mailbox properties.
That won't be a very strong argument at all, but the Linux mailbox
framework did not at all fit the JSON-like nature of this mbox and it
ended up being its own thing..

> Instead maybe
> "Always On Subsystem (AOSS)" or just use existing description. I assume
> it's exactly the same.
I don't think I quite get what you mean.

Konrad
> 
> 
> Best regards,
> Krzysztof
> 

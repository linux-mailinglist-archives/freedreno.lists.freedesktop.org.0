Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247B718F67
	for <lists+freedreno@lfdr.de>; Thu,  1 Jun 2023 02:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE2710E0E5;
	Thu,  1 Jun 2023 00:12:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810AD10E0E5
 for <freedreno@lists.freedesktop.org>; Thu,  1 Jun 2023 00:12:14 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2af28303127so3106291fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 31 May 2023 17:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685578332; x=1688170332;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/7T1vQLhafRXv2sTtT7nV+m/Jovj7sxrilRtgeaU+FY=;
 b=ImVXrIDOKR8zrCch+QSZ6Jdduw466FAzE1+3vOJR4GPxEj8KLqobn1tKQ2jMUzEoGW
 EB708puCAnsql2Kwg8U8rPklHjGTr7cWjfmTKKdS9VaSbq1UrV0eZvPaxSL+XSR1i9En
 axPiAghZQ/x1AW+RUx6Io6Im4caKAshF/pFSjoWdWXTixjFr2XdkMtX6ZQHbq4koO1mf
 rdo/eBATkHqqYoWgBp0P2bqATkvvstpBVTCXmEl2hH6JarSvYlIKyUKCEKu/4+Mevh7h
 CeHt0dhUusYeRa9y4EYv//+/NUzleot8wtZZqD5r/shy4hzp2Yye1T35F9ewFlpLccQf
 +JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685578332; x=1688170332;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/7T1vQLhafRXv2sTtT7nV+m/Jovj7sxrilRtgeaU+FY=;
 b=CcKudaW9tGZ14EVY73iMtxHTNgNNiukrNC6AqjixwGV/XGJYiHvLnRP2PYyY2nDn/F
 ZNWcHUOB//TfU3CQOtRYj0TK45TXPl8W4lhw8M66jgRi3RX7Xc7zl7xiAKfIyHkhRPH3
 kpQpAAVY1C1ZhmFQMCjuP9eujMfELG2XR7B4RUu5oMmycCJ52ndWrt0YVPEgW4/7Csa1
 2LRFcwgxdsXE1IzW/MvkIwu2PH+7M6sZfix3Goo9otje9dY6joh+Zf2EZTB4Nwv+kSHo
 0GqLWg7JZEg3QQZIHpGxS/Cj8zrdR+i5bG4NqffK9lb9Ue3xiNBrTQ7xB7X+Cju38PhO
 sM/g==
X-Gm-Message-State: AC+VfDyUGNXuC0OE157FNtwhYTCN7ktmPm4BC1ih6/vLrjTdijGfugsA
 PIL5bygWGKj0ahryEhaByxn76A==
X-Google-Smtp-Source: ACHHUZ4qG8Zz/GUwecKRtqQDhgDCfm8yOjOJrKw62X98fssdfeGlFoUfi4LWrBhB3CJRUM46N+eWtw==
X-Received: by 2002:a2e:a305:0:b0:2af:228a:8670 with SMTP id
 l5-20020a2ea305000000b002af228a8670mr3529179lje.2.1685578332280; 
 Wed, 31 May 2023 17:12:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a05651c104d00b002add1f4a92asm3532537ljm.113.2023.05.31.17.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 17:12:11 -0700 (PDT)
Message-ID: <247f6b45-a730-4259-9576-a0b63af24d34@linaro.org>
Date: Thu, 1 Jun 2023 03:12:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v5-4-998b4d2f7dd1@linaro.org>
 <168483089214.140382.17835176497108911988.robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <168483089214.140382.17835176497108911988.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 04/12] dt-bindings: display/msm: Add
 SM6350 MDSS
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, iommu@lists.linux.dev,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/05/2023 11:34, Rob Herring wrote:
> 
> On Tue, 23 May 2023 09:46:15 +0200, Konrad Dybcio wrote:
>> Document the SM6350 MDSS.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 214 +++++++++++++++++++++
>>   1 file changed, 214 insertions(+)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.example.dtb: dsi@ae94000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['qcom,sm6350-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
> 	'qcom,sm6350-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl']
> 	'qcom,sm6350-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.example.dtb: dsi@ae94000: Unevaluated properties are not allowed ('compatible' was unexpected)
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

It looks as if the patches 1 & 2 were not applied when testing this 
patch. I can not reproduce this issue locally. Could you please 
doublecheck it?

> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230411-topic-straitlagoon_mdss-v5-4-998b4d2f7dd1@linaro.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

-- 
With best wishes
Dmitry


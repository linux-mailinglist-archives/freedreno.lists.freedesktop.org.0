Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8F6C6B53
	for <lists+freedreno@lfdr.de>; Thu, 23 Mar 2023 15:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD4510E0F1;
	Thu, 23 Mar 2023 14:44:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4926010E0F1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 14:44:26 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id l37so728872wms.2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679582665;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0Ek4wZhl4Mg0GrDMidRpjCLxiT+Jj8TNIew80B1+dS8=;
 b=t3Vp7RyFM8QV+VOhJkauXK9ZBmgTbo+zXmbbdNc5YTzFZhULmKx7ULUx2hi9UKIvj4
 yIAo+gNJ6mUmL6zRsgWruEYkTL1nqJr4XVGp9j53f1R59pcJo9BvjgV6ZGPCOWExngg3
 9lwyhlQ7PfizNhOXlnvJ2BjCjfCnW+3z+rA2W9HGw5O1aPBlgxrSE/lr6RkeFNqBSoPK
 gJ3bS3SEKIW41PNmlixE4c62EWhsHJcY3ftPuqZ/F3JOmp8dUDVFskJH15Bv/IRWLTtI
 VmGC96o6jb8k6ouaD0vV0GREdN870JpBDWppohe72sFOYfxOkxkoAarzmhvWz0vtwhhG
 l4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679582665;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Ek4wZhl4Mg0GrDMidRpjCLxiT+Jj8TNIew80B1+dS8=;
 b=FpH+0dlVBueAcUjPSDbz/vft51S1fZoX/JuMboA8eJAZwjcfmOqKkUepT3nEzBJqeT
 ExAaxjSBr7lSBM/C+Df7R5LSthOG++012t7QTcHSTaoZaXTlwSTzMdU57Jkkf+38z+Ik
 7xFWNgyg8I3VynSDcT0UO3XfxYPp7PZuidV75tVu4ovNKfkSc3bFv9apQ6BH7ZbRCfvs
 Vo0hsw7fZylb8Bmb8+khoOlbJZUvwbZ/6uvbEsBcI6cnOiwPmaja5G75OaASKHVK1FtM
 FBsQU40DFUcavNe70WMpaYEYYx1Nwj0ZE41OdYz0N8jIzU+uWCMxilkplOg4ZrzHRsGU
 N86g==
X-Gm-Message-State: AO0yUKURspjZNB0hj3uvsjCEMB3L/lASIn/FIvQl7QSvGgMupI/lH5C+
 YTWO+r/4D59xPxT1nFZaxjqfCA==
X-Google-Smtp-Source: AK7set/LnBgJwUokuNj+rBAbXxBzVAIv6jLo1Im7boQzr5ZnmQ5GFZnXrwDgWbSR8lrMohjRlVuXtQ==
X-Received: by 2002:a05:600c:2c48:b0:3eb:39e0:3530 with SMTP id
 r8-20020a05600c2c4800b003eb39e03530mr2306311wmg.41.1679582664667; 
 Thu, 23 Mar 2023 07:44:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899?
 ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a7bc852000000b003ed2c0a0f37sm2045208wml.35.2023.03.23.07.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 07:44:23 -0700 (PDT)
Message-ID: <381cad84-da61-5a55-73eb-869294aa1d1c@linaro.org>
Date: Thu, 23 Mar 2023 15:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-1-3ead1e418fe4@linaro.org>
 <167957963042.3095255.5445133387110199668.robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <167957963042.3095255.5445133387110199668.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/8] dt-bindings: display: msm: sm8450-mdss:
 Fix DSI compatible
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
Cc: Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Bart Van Assche <bvanassche@acm.org>,
 linux-scsi@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Avri Altman <avri.altman@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/03/2023 14:58, Rob Herring wrote:
> 
> On Thu, 23 Mar 2023 11:25:16 +0100, Neil Armstrong wrote:
>> The DSI compatible changed between patchset revisions, but that wasn't
>> reflected in the bindings. Fix it.
>>
>> 0eda3c6cb1c5 ("dt-bindings: display/msm: add support for the display on SM8450")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: display-subsystem@ae00000: phy@ae94400:compatible:0: 'qcom,sm8450-dsi-phy-5nm' was expected
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: display-subsystem@ae00000: phy@ae96400:compatible:0: 'qcom,sm8450-dsi-phy-5nm' was expected
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: /example-0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,dsi-phy-5nm-8450']
> Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: /example-0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,dsi-phy-5nm-8450']


Indeed I forgot to fix the bindings example....

Thx,
Neil

> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-1-3ead1e418fe4@linaro.org
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


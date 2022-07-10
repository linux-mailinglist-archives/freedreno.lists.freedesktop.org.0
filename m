Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9EE56D042
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 19:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B5B14BCDD;
	Sun, 10 Jul 2022 17:00:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E61214BCDB
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 17:00:43 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id a9so5244725lfk.11
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z+025bwtj1+XxqfJAYSywQz3zfNZwf8KlNReu6sIH04=;
 b=r3SWgrDqeFIihjpgWX1tGqhS9nvKTMAMwhpH+U4sAOXaUvV9tjewn2dLBHPTMq+GTs
 Ff2uJT7icSDEVCN/UYDLjVOMYKdU/iezSVoQtEmn8xcy3U0YiSIeA9ug+I1y7L6ZUzPT
 QEl3dFzenx2BBNwis/oW7FiSmEhelbQZjnk61dx6cm28RBjI5yZc5brc9zFaArLGqP83
 5atpqkhw3etHGTVclLy7WhUWAdOdsubJwxjzNT7WchU0tzoHl79G7MSVYYcNuMYQLLNY
 flT7yNC4yKbSM1ZQd31FxPechG9moAl22MNKSMzPsbdgAoh7uVFXUIh08H2sqRK1CGJl
 SXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z+025bwtj1+XxqfJAYSywQz3zfNZwf8KlNReu6sIH04=;
 b=0H8ux83GhwZgr1F1nfeHOI5MRkYKzTipI7unMo3RSYC16zg7G07QpKcdtxmpZTjXOa
 vlfAK/HYyetPoHjSI0LJZMo3X5IAQg6n1/D2Sz6MVQHTeEhavhtpzieMYm94JoRJqcm6
 Ay/PAzCasVrQHQbeghP7ThO4PhkmDn+4jFE++qSZ+P/Z7myLp+cbg0KFGRS1YlEoPDO8
 Y5MUqwyKGOqRALxKqlHjcT1DZ49YyV76it90Div0fDBg2HD1VktTXSv4JS+0zb5N+8b+
 GiYvqjIeqVahM0qTHruaprcTZLZxDGSQOc/TWc8fq0EEDRNPRzA7+Xro3l0urbOO354t
 M8CA==
X-Gm-Message-State: AJIora/JUTAgmFWUxzvIucsY6hc973VjXZoHe381C6gaRHcvRJCl5aF3
 jXKBVGb6jyP+y21zDmL1zHj08A==
X-Google-Smtp-Source: AGRyM1sjRnBSq/F0i1b5lkm7tuWeJt24tjr1ryEGRO6bsTBrwKL2G8G8JFM5hXn6oM8WNvELa38Rbw==
X-Received: by 2002:a05:6512:1096:b0:489:cbad:de4f with SMTP id
 j22-20020a056512109600b00489cbadde4fmr5557082lfg.164.1657472441640; 
 Sun, 10 Jul 2022 10:00:41 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.65.244])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a19a416000000b0047968606114sm1005525lfc.111.2022.07.10.10.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jul 2022 10:00:41 -0700 (PDT)
Message-ID: <20269855-766d-4954-b6aa-bcff6d67c967@linaro.org>
Date: Sun, 10 Jul 2022 20:00:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
 <1657472056.252419.1602129.nullmailer@robh.at.kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657472056.252419.1602129.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 04/11] dt-bindings: display/msm: split
 qcom, mdss bindings
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/07/2022 19:54, Rob Herring wrote:
> On Sun, 10 Jul 2022 12:00:33 +0300, Dmitry Baryshkov wrote:
>> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
>> yaml file. Changes to the existing (txt) schema:
>>   - Added optional "vbif_nrt_phys" region used by msm8996
>>   - Made "bus" and "vsync" clocks optional (they are not used by some
>>     platforms)
>>   - Added (optional) "core" clock added recently to the mdss driver
>>   - Added optional resets property referencing MDSS reset
>>   - Defined child nodes pointing to corresponding reference schema.
>>   - Dropped the "lut" clock. It was added to the schema by mistake (it is
>>     a part of mdp4 schema, not the mdss).
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
>>   .../devicetree/bindings/display/msm/mdss.yaml | 161 ++++++++++++++++++
>>   2 files changed, 162 insertions(+), 29 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/display/msm/mdss.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/phy/qcom,hdmi-phy-qmp.yaml

The tree is based on linux-next (well, msm-next, which is a part of 
linux-next).


-- 
With best wishes
Dmitry

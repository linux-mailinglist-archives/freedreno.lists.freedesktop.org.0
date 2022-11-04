Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F526196F9
	for <lists+freedreno@lfdr.de>; Fri,  4 Nov 2022 14:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1008A10E748;
	Fri,  4 Nov 2022 13:05:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F128810E750
 for <freedreno@lists.freedesktop.org>; Fri,  4 Nov 2022 13:05:37 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id x21so6237893ljg.10
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 06:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SYrK27Y7dZ1jhUa6GS6pzCvsdezIl8UwJaQy+2V3EMQ=;
 b=Gqjzr0nWeEsl84UdwGD14ZyF+MWwWNgbhRuKA1o+VlLjsGL2p2mhN4Pmj2DY39fh4H
 TsGCV0TDsCcbg9oIsAT7NOgzTXDHOkWmcQ0ztE2ntWcNqKsllVu2FPvY6j28MwRgtZXg
 r6mPXrV0w1jhu8iTgroSeW22J3wRieD+lrA1aLKQLFjrVxoW4r6FEfXXn5gPsGP+e75p
 zr/+fFXf11+WJCwYgbVQK+qZH9QBSfe9JfEwdO51g20A5U7hwramohWc3NeI+DzFQZZW
 MuINkovvZYfas45U09iUWmasvBS6Ot3UvMft8610aGA+79ji49dLey+wo+FOPZZA9/Mu
 kgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SYrK27Y7dZ1jhUa6GS6pzCvsdezIl8UwJaQy+2V3EMQ=;
 b=QaBmeLoEJu1gEK+FvoZy6RbWD4jkLDAj6s3yWBS1JwFioCcNiklsq5Njej7/NnEyaL
 quuu/cQ7IuaBZCGyk2waf1wJ6FQXxjZKdQlUOd58SRmXoosXgbACJa/ZtW5oG6IIhT4p
 j/PEQlA52+ityrZR482ZRrxdXKkVhTetIghaGDZrhvpOpGC32rRmANqJ+2apPcgrgQFP
 Q8iSIFOpiGFYes5paqHQ7f6BbwNvgu1OikE6Nc06GOua5walpQoqLLBuusyBnsXEJXOa
 uvcJ1/lsQA+eEUdpkk5mNfDskjq64a8vuZcqHtEbo9F2uVh7mx2zqQH5j54ek/0iUk27
 sPfg==
X-Gm-Message-State: ACrzQf2oa8gGUpYkFLgdn5pQC9Cyy+1ePHYFQ/+1UEVQY1HKqhfK7qjC
 LcS2P1eY8WX4Aj2c8rrzfSxV9A==
X-Google-Smtp-Source: AMsMyM6g8cHyYxtEdvEFeoTBLMKnwcd++/thOcg1sqK+QLMPo1SmzwiLU8ccKO49yJIQC+bzFEHnjw==
X-Received: by 2002:a2e:a37a:0:b0:277:2e8a:bc82 with SMTP id
 i26-20020a2ea37a000000b002772e8abc82mr14137188ljn.391.1667567136167; 
 Fri, 04 Nov 2022 06:05:36 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a195010000000b004b097f2c73dsm451328lfb.253.2022.11.04.06.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 06:05:35 -0700 (PDT)
Message-ID: <09ed16e1-4af2-8fce-dab4-f6c0f09e688c@linaro.org>
Date: Fri, 4 Nov 2022 16:05:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-GB
To: Rob Herring <robh+dt@kernel.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
 <CAL_Jsq+_p36jCUTE+9V+eAyxF9ETcgk4gBDN7-+mgJVd7-ZYzg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAL_Jsq+_p36jCUTE+9V+eAyxF9ETcgk4gBDN7-+mgJVd7-ZYzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v9 00/12] dt-bindings: display/msm: rework
 MDSS and DPU bindings
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/11/2022 15:21, Rob Herring wrote:
> On Mon, Oct 24, 2022 at 11:42 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
>> devices). Cleanup DPU schema files, so that they do not contain schema
>> for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
>> afterwards. Add schema for the MDSS and DPU on sm8250 platform.
>>
>> Soft dependency on [1] to define qcom,dsi-phy-14nm-2290 binding used in
>> examples
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20220924121900.222711-1-dmitry.baryshkov@linaro.org/
>>
>> Changes since v8:
>>   - Dropped DSI/DSI-PHY examples from the first patch. Proper example
>>     generate a pile of warnings because of DSI schema deficiencies. I'll
>>     add these examples back, once DSI schema is fixed.
>>
>> Changes since v7:
>>   - Expanded examples to include MDSS child nodes (Krzysztof)
>>
>> Changes since v6:
>>   - Removed extra newlines (Krzysztof)
>>   - Added $ref to dpu-common.yaml#/ports/port@foo to enforce schema
>>     for the port nodes (Rob)
>>   - Removed unused allOf's (Rob)
>>   - Fixed repeated interconnects descriptions (Rob)
>>   - Fixed dpu-common.yaml and mdss-common.yaml descriptions (Rob)
>>   - Fixed intentation of examples (Krzysztof)
>>   - Renamed MDSS and DPU schema to follow compat names (Rob)
>>
>> Changes since v5:
>>   - Dropped the core clock from mdss.yaml. It will be handled in a
>>     separate patchset together with adding the clock itself.
>>   - Fixed a typo in two commit subjects (mdm -> msm).
>>
>> Changes since v4:
>>   - Created separate mdss-common.yaml
>>   - Rather than squashing everything into mdss.yaml, create individual
>>     schema files for MDSS devices.
>>
>> Changes since v3:
>>   - Changed mdss->(dpu, dsi, etc.) relationship into the tight binding
>>     depending on the mdss compatible string.
>>   - Added sm8250 dpu schema and added qcom,sm8250-mdss to mdss.yaml
>>
>> Changes since v2:
>>   - Added a patch to allow opp-table under the dpu* nodes.
>>   - Removed the c&p issue which allowed the @0 nodes under the MDSS
>>     device node.
>>
>> Changes since v1:
>>   - Renamed DPU device nodes from mdp@ to display-controller@
>>   - Described removal of mistakenly mentioned "lut" clock
>>   - Switched mdss.yaml to use $ref instead of fixing compatible strings
>>   - Dropped mdp-opp-table description (renamed by Krzysztof in his
>>     patchset)
>>   - Reworked DPU's ports definitions. Dropped description of individual
>>     ports, left only /ports $ref and description in dpu-common.yaml.
>>
>> Dmitry Baryshkov (12):
>>    dt-bindings: display/msm: split qcom,mdss bindings
>>    dt-bindings: display/msm: add gcc-bus clock to dpu-smd845
>>    dt-bindings: display/msm: add interconnects property to
>>      qcom,mdss-smd845
>>    dt-bindings: display/msm: move common DPU properties to
>>      dpu-common.yaml
>>    dt-bindings: display/msm: move common MDSS properties to
>>      mdss-common.yaml
>>    dt-bindings: display/msm: split dpu-sc7180 into DPU and MDSS parts
>>    dt-bindings: display/msm: split dpu-sc7280 into DPU and MDSS parts
>>    dt-bindings: display/msm: split dpu-sdm845 into DPU and MDSS parts
>>    dt-bindings: display/msm: split dpu-msm8998 into DPU and MDSS parts
>>    dt-bindings: display/msm: split dpu-qcm2290 into DPU and MDSS parts
>>    dt-bindings: display/msm: add missing device nodes to mdss-* schemas
>>    dt-bindings: display/msm: add support for the display on SM8250
> 
> This is now warning in linux-next:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.example.dtb:
> dsi@ae94000: 'opp-table' does not match any of the regexes:
> 'pinctrl-[0-9]+'
>          From schema:
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.example.dtb:
> dsi@ae94000: 'opp-table' does not match any of the regexes:
> 'pinctrl-[0-9]+'
>          From schema:
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

These two will be fixed by 
https://patchwork.freedesktop.org/patch/509664/?series=108883&rev=2, 
I'll merge it in asap, so that it appears in next linux-next.

> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.example.dtb:
> dsi@5e94000: compatible: 'oneOf' conditional failed, one must be
> fixed:
>          'qcom,dsi-ctrl-6g-qcm2290' does not match

Ack, I'll take an immediate look on fixing this.

> '^qcom,(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+-.*$'
>          'qcom,dsi-ctrl-6g-qcm2290' does not match
> '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'
>          'qcom,dsi-ctrl-6g-qcm2290' does not match
> '^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
>          'qcom,dsi-ctrl-6g-qcm2290' does not match
> '^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
>          'qcom,dsi-ctrl-6g-qcm2290' does not match
> '^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
>          'qcom,dsi-ctrl-6g-qcm2290' does not match
> '^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
>          'qcom,dsi-ctrl-6g-qcm2290' does not match
> '^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
>          'qcom,dsi-ctrl-6g-qcm2290' does not match
> '^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
>          'qcom,dsi-ctrl-6g-qcm2290' is not one of ['qcom,gpucc-sdm630',
> 'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ipq8064',
> 'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016',
> 'qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy',
> 'qcom,vqmmc-ipq4019-regulator']
>          'qcom,dsi-ctrl-6g-qcm2290' is not one of ['qcom,ipq806x-gmac',
> 'qcom,ipq806x-nand', 'qcom,ipq806x-sata-phy',
> 'qcom,ipq806x-usb-phy-ss', 'qcom,ipq806x-usb-phy-hs']
>          From schema:
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.example.dtb:
> dsi@ae94000: 'opp-table' does not match any of the regexes:
> 'pinctrl-[0-9]+'
>          From schema:
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

-- 
With best wishes
Dmitry


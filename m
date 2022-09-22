Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1238D5E622C
	for <lists+freedreno@lfdr.de>; Thu, 22 Sep 2022 14:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6F410E325;
	Thu, 22 Sep 2022 12:19:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F0810E325
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 12:19:25 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id x29so10777379ljq.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 05:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=i/CqszIZh8P8j8dT9+oh4Z05nb+Y/d9c5WZtIgCuPK4=;
 b=eWNWfK3AFvDG834Zr5HLamysLgoxgnhiVcHys2gwwAw3rDhz/igUHQje6QxB0TFrTB
 sVfARPMH7lzuZONx2KjOz0uo1uxfiT8zRHkQU3c4V1+eF7vS94ip90V8hdtm3pJtBz9H
 lwikVgkBVSNf+u4kTMEh/t8zpFUk8fSHyOFzIDJVIqBi07ZleWJnFiwk+huYJzu9DsVf
 b++ZPMq57UblLG1WXxO3r64OhshLCHIKslLAdjHxM7dOdU0zkZoyz7IqDzg719homNhv
 lKnAQJvQKjJFiXyoLfGFBPvmn7SRYLLq9S0QQTV6qkcpNJlHqHZtc99OpsLGbUeGRJ3C
 1Wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=i/CqszIZh8P8j8dT9+oh4Z05nb+Y/d9c5WZtIgCuPK4=;
 b=Rm2pf+bRt+0cDlZrXJshUpdiNE/LRoDFP+rYzI3NH9bWdROJXRhxWwpYneMFpRZ6Eo
 Y9zr5V+edAMpB7LfNGAZ9F5ej2mAYu7P56V/ML7PPW7LKp6Cl9Rje6ftj2O3Ga/0sieY
 GL2lV4DYZvUjDMu3wCzmk5tHhhGt1YC37xAwZ+95F8AYF4ji67wTV9cj4F660RALYxfH
 BjZbHPq5hYUaxsrnnOLnDsSk9RCQB9dSzkcivkc2b8W0nLQ/R1PG2tw16BZr9Xxmlvz5
 BXTihxw6oVQJcph+SoplEuN1+PUgUSIol9qQq8yf5MGjP9ROzEIjgA4jWVhrhrAdC+xk
 0OKA==
X-Gm-Message-State: ACrzQf3k6JoLM2TmQIPlAfoxi59uOKpXB+jfMQ8WUQ0nu/ta0q37Ln/4
 o6RIjaFTTcuS+YEJBPex854q0g==
X-Google-Smtp-Source: AMsMyM41dt9zEaCoTFYzG8+Ztkoxoj8ww69k27iIEzfmtLlQGjVlrZWR99FqsS2XlQV9tAm5X4ZXTQ==
X-Received: by 2002:a05:651c:201e:b0:26b:e78e:c2e8 with SMTP id
 s30-20020a05651c201e00b0026be78ec2e8mr1021216ljo.431.1663849163830; 
 Thu, 22 Sep 2022 05:19:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 x3-20020a19e003000000b004979dc8038esm911628lfg.201.2022.09.22.05.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 05:19:23 -0700 (PDT)
Message-ID: <c582130c-9a12-10c7-833b-542e48f6bf70@linaro.org>
Date: Thu, 22 Sep 2022 14:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-7-dmitry.baryshkov@linaro.org>
 <94bc039f-065e-ebfa-e09b-7fdb5f4be89b@linaro.org>
 <CAA8EJppqxMvn+bpHQ-49nBw6esdgRyft4aPj2410bq2tbL=94w@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJppqxMvn+bpHQ-49nBw6esdgRyft4aPj2410bq2tbL=94w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v7 06/12] dt-bindings: display/msm: split
 dpu-sc7180 into DPU and MDSS parts
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/09/2022 12:30, Dmitry Baryshkov wrote:
>>> +    display-subsystem@ae00000 {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        compatible = "qcom,sc7180-mdss";
>>> +        reg = <0xae00000 0x1000>;
>>> +        reg-names = "mdss";
>>> +        power-domains = <&dispcc MDSS_GDSC>;
>>> +        clocks = <&gcc GCC_DISP_AHB_CLK>,
>>> +                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>>> +                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
>>> +        clock-names = "iface", "ahb", "core";
>>> +
>>> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>>> +        interrupt-controller;
>>> +        #interrupt-cells = <1>;
>>> +
>>> +        interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
>>> +        interconnect-names = "mdp0-mem";
>>> +
>>> +        iommus = <&apps_smmu 0x800 0x2>;
>>> +        ranges;
>>
>> This should come with full example, so with display-controller child
>> (unless Rob asked not to?)
> 
> I'm not sure here. We have an example of a display-controller in a
> separate schema file. Why would you like to duplicate it?

To validate the child node (display-controller) in the context of this
schema. The child node is essential, so I would also say that example is
incomplete.

Best regards,
Krzysztof


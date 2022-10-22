Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347EA608307
	for <lists+freedreno@lfdr.de>; Sat, 22 Oct 2022 03:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFB710E691;
	Sat, 22 Oct 2022 01:00:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58E010E691
 for <freedreno@lists.freedesktop.org>; Sat, 22 Oct 2022 00:59:54 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id d13so3116953qko.5
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 17:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zLWMEaldl7mwAfibkMQ7f9QF8cCYwWsptPAXuW24IaM=;
 b=GQWsjBoGJUcqsoAAKfGshd5eISh/AnwduwW5D8aypRX7KEwXJ3w0D6o0OgT+l0RRXr
 GAAgtG5CUkJGI8fPQTQJiXbSO5cvaYoHOB+pshLdvXMezLl4y2enQTFHnGTAywwHljKj
 OjDsBu1AxLK1MUqf77CFy0sXBrlK8oRg11+QpsDkXshX+NBYr8M8Rodc3RNeeQexSBKN
 SPKAwpNgsl9Z0k9aaWLtpH/1H88dGThafvAGPC76HOpA6F7wQnazqxMti59Z2E1W+uDB
 0pl8XwQj8qtiHEu5mTxYuuyUgok5l4D1JvlxVzuXlkjIhSLp4pa2Tuq2XCwK+/n/+Spi
 eG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zLWMEaldl7mwAfibkMQ7f9QF8cCYwWsptPAXuW24IaM=;
 b=Mf3UswbA5RDXfBuehX/hCURUZErDP+rR1OxTD2sxsFMdTx+36IkV9ZkY1RcvtO6vJE
 cCZkDC9nRYcut3d6H/DSfVkfcFbqIEuLvnnSUbHEy1DiBePs7Ql38hobFVYaINkoXOkn
 hAWgSENuemJ8+h6S0hcL1HaaBhpsD/kW5nDtESWtTd1Z1ZfRtxOg3wQ5su+12c9Fibbx
 1ahqfkSvmBGCkU60/vl4jU6fuwZdpenZmolCndS3M4LS4G450B0pWTe4zQztMjMyc6l5
 J6pwQ999WA19kzhYa1Hf6NaKWJKu3sIR3DlrkrBDlM9J8lH0oi168IUazCTt5O/PTt5e
 cAgw==
X-Gm-Message-State: ACrzQf3D9owHvZVGIZmC74I4pWDU1Sf+FJcTacDcd/p5YwBSW5fga6Em
 icqgneG/h6Ba2wXv4hk/WUGRtQ==
X-Google-Smtp-Source: AMsMyM5ePAEqT1CxZUNaI9lUZ9Iw9tWpO3mKZVYrsZfLArowIXhAP+1rILHZiBcFibxg3mzf8FbaaA==
X-Received: by 2002:a37:b86:0:b0:6ea:3ec9:7994 with SMTP id
 128-20020a370b86000000b006ea3ec97994mr15758286qkl.199.1666400393864; 
 Fri, 21 Oct 2022 17:59:53 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net.
 [72.83.177.149]) by smtp.gmail.com with ESMTPSA id
 l20-20020a05620a28d400b006b8e8c657ccsm10801547qkp.117.2022.10.21.17.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 17:59:53 -0700 (PDT)
Message-ID: <a36ca97e-5e64-54a8-a571-e9b7f6da76e5@linaro.org>
Date: Fri, 21 Oct 2022 20:59:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark <robdclark@gmail.com>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
 <20221021165534.2334329-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021165534.2334329-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 1/9] dt-bindings: arm-smmu: Add missing
 Qualcomm SMMU compatibles
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/10/2022 12:55, Dmitry Baryshkov wrote:
> Add missing compatibles used for Adreno SMMU on sc7280 and sm8450
> platforms and for the Qualcomm v2 SMMU used on SDM630 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 9066e6df1ba1..34ee33a62ba5 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,msm8996-smmu-v2
>                - qcom,msm8998-smmu-v2
> +              - qcom,sdm630-smmu-v2

So qcom,adreno-smmu is not compatible with Adreno? See below.

>            - const: qcom,smmu-v2
>  
>        - description: Qcom SoCs implementing "arm,mmu-500"
> @@ -48,10 +49,20 @@ properties:
>                - qcom,sm8350-smmu-500
>                - qcom,sm8450-smmu-500
>            - const: arm,mmu-500
> +
> +      - description: Qcom Adreno GPUs implementing "arm,smmu-500"
> +        items:
> +          - enum:
> +              - qcom,sc7280-smmu-500
> +              - qcom,sm8250-smmu-500
> +          - const: qcom,adreno-smmu
> +          - const: arm,mmu-500
>        - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
>          items:
>            - enum:
> +              - qcom,msm8996-smmu-v2
>                - qcom,sc7180-smmu-v2
> +              - qcom,sdm630-smmu-v2

This does not look correct. The same compatible should not be present in
two different setups.

If qcom,msm8996-smmu-v2 is compatible with qcom,adreno-smmu, then your
first hunk is not correct.

>                - qcom,sdm845-smmu-v2
>            - const: qcom,adreno-smmu
>            - const: qcom,smmu-v2

Best regards,
Krzysztof


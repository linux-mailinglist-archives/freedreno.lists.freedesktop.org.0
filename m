Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD646F9790
	for <lists+freedreno@lfdr.de>; Sun,  7 May 2023 10:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2EB10E135;
	Sun,  7 May 2023 08:19:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8816C10E135
 for <freedreno@lists.freedesktop.org>; Sun,  7 May 2023 08:19:19 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bc25f0c7dso6528944a12.3
 for <freedreno@lists.freedesktop.org>; Sun, 07 May 2023 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683447557; x=1686039557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AmspFl/qcrUH5DUFKPFejz2sbTyU5nmTsYvZW5M2EaQ=;
 b=IIB3tnM8iSk7+xLeoUFp6dbaAhKrnsZxTyDQTCE+XEzeYtpSAVNL36PF4++K0wmSzJ
 GnIqJJzw0bnxIsDHk6hT+NlyQGf+sapJGylBIUXJUdJO0DZeH1s2iEDBKBHQTsUyCokg
 N+sc6dFjeilgxW3KC/FAVa58V4ILCKQC8AFKshQ6h5whWceVlAc7iEVS+Mq7Fo00hlU5
 qtu9n7bmmKhfln8OB5myFlbUcUdLLyLt2HMJzIpMWegQfLBN+A70yeqwTAZGcKknoFvO
 TnUZdEUkELul9W/Pl8KtMmsFBMfV7KPK4Nka+HFDtJH4Y3aH+23vASb/huPAJKEqgeOD
 UpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683447557; x=1686039557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AmspFl/qcrUH5DUFKPFejz2sbTyU5nmTsYvZW5M2EaQ=;
 b=DaChe9LrB+i/xslzPBR6odfsBSuzpLMiUv27CJJ/XShJf01qgPgWhoMIOnUK8oA88n
 sPj4kzLs7r3ZC9vhILwM/WgXiDSZBavtxXi4JTGdjcoM5MSWWC3PIws4SWJI/pGk6RiL
 KiV5sFz/Nk+sLYbBBAnJLUP4X7zowYexo4aQ/WCFyGIG2mAqYAnZJMuKa6LU3CD2j4/d
 yt0PxCWsSuFqY1JQnvYH9bZa7DWsgHGJldGUlK80B97TOXbHCg2Z3icnjAHWN/h87pFo
 47rI2h4etdRx3tzU8ESqt2/390itBMeY7EFSnUbq9obcun13K1oRlNYJld+fYSuD8ClI
 HQeA==
X-Gm-Message-State: AC+VfDwjfpJnGlRQaiBouW1YCSF+xFmqt3LCxXtwIqwAkXKu08gPQZ3P
 BNobynPjqFNhOwlWRKFFEbVDbA==
X-Google-Smtp-Source: ACHHUZ7VKQzOW+S0ssTzMGK+ru9aMnpaJYX1bc4BHHGSsy+EFj9PX/kcenbTWjQXmlp0f8u2kphtKw==
X-Received: by 2002:a17:907:c1e:b0:94a:4107:3975 with SMTP id
 ga30-20020a1709070c1e00b0094a41073975mr5824210ejc.76.1683447557500; 
 Sun, 07 May 2023 01:19:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:183b:950f:b4d5:135a?
 ([2a02:810d:15c0:828:183b:950f:b4d5:135a])
 by smtp.gmail.com with ESMTPSA id
 oy10-20020a170907104a00b00965f76318b1sm2590673ejb.201.2023.05.07.01.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 May 2023 01:19:16 -0700 (PDT)
Message-ID: <80b46fcb-d6d0-1998-c273-5401fa924c7d@linaro.org>
Date: Sun, 7 May 2023 10:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
 <20230411-topic-straitlagoon_mdss-v3-4-9837d6b3516d@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-4-9837d6b3516d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 04/12] dt-bindings: display/msm: Add
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/05/2023 23:40, Konrad Dybcio wrote:
> Document the SM6350 MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 214 +++++++++++++++++++++
>  1 file changed, 214 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
> new file mode 100644
> index 000000000000..6674040d2172
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
> @@ -0,0 +1,214 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm6350-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM6350 Display MDSS
> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +
> +description:
> +  SM6350 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
> +  like DPU display controller, DSI and DP interfaces etc.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:

Drop items

> +      - const: qcom,sm6350-mdss
> +

The Rob's bot warning can be ignored - it seems patch #1 was not applied.


Best regards,
Krzysztof


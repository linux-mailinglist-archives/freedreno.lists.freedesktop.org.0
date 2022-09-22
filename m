Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8105E5BC9
	for <lists+freedreno@lfdr.de>; Thu, 22 Sep 2022 09:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9E510E309;
	Thu, 22 Sep 2022 07:04:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5807C10E309
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 07:04:31 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f9so13141132lfr.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 00:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=6AOWL8X+6363yl6dlkzkEYMc1TNcmq2VygjKTCBzm64=;
 b=bKHOfDZXtMpt20Subxu34+Lu5GEWthnW5vWbQiZd2mWo9MuEdinnZCTL41VaMH+5YA
 j+BtZuHj0f5UCku2oXQvitvnGdhstHYYf7FYqqlV3wD6KLqi8Lwf2dLw+xybPogs0F65
 GsEFETmLMZXbLODHYV4TJb1CE7rEfJWP9Yer/P6SGzJ5pGsfzFq7jj39IEN+lz1YIqRu
 SNSNgDFmS4rtv+nl/90YeII1yFQRFV2hBU+bUWEoyc1JX0zC0KhbALg3RdphN0RA23pv
 ZI0dzd1PSwXsESE4gN235sETE/HdTh00uW/Uhbvz2PujcXaFucIbGQLo2JT0iNfTrfXM
 GICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6AOWL8X+6363yl6dlkzkEYMc1TNcmq2VygjKTCBzm64=;
 b=j/efSovLS9X/vPEHwe0ww6a7KPJ7GhsDnTVMa/OH4Hgx3e1Dkzx2Sq02vBeHaX3gOB
 Q9HSsAQLR1kEKO63JsNilRa0XNJjHLwYXT3/9HORWBmE7Td60J00dY0DpQif5g4iCJHs
 vFAaAqfEJejGnvKSNrESEw3j3URHyj2nUjC/LhwLhbxctZEAgCUV4E5HTYyWIDQheK3q
 HU6WE7rjC8UF6EmAGi0au2TBRZ5m4DEffcmUaOU9U0nudSBYG7SAAdNqLZ1oSKEKPJTL
 aNjIMwGzNHp1UzxH2X4mrE0G7Z+gVnq/+TvGQb1FK5xTLTEWejeWGeI9ybEjcqwlgL/2
 riNg==
X-Gm-Message-State: ACrzQf1HPghRkXkKk61/a2V4Q0QJOd+DvH7xViHHPkeeQUUjuSrVkX0G
 YpBhz7AhQkAKiS7S5aO6237llQ==
X-Google-Smtp-Source: AMsMyM7ywOFavyrwCMGphDto/G9dJRxjhNMo43envFpFsgAU1P4TxjX58T9WeF7u2TcHGBNlDv1A5g==
X-Received: by 2002:a05:6512:2304:b0:49b:24a:f0cf with SMTP id
 o4-20020a056512230400b0049b024af0cfmr709077lfu.373.1663830269640; 
 Thu, 22 Sep 2022 00:04:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 f7-20020a056512360700b004994117b0fdsm782114lfs.281.2022.09.22.00.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:04:29 -0700 (PDT)
Message-ID: <02b60bf8-70ac-eb7b-33d7-1c9b7a6f0a54@linaro.org>
Date: Thu, 22 Sep 2022 09:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v7 05/12] dt-bindings: display/msm: move
 common MDSS properties to mdss-common.yaml
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
> 
> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
> will be added later, once msm8998 gains interconnect support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

(...)

> -  "#interrupt-cells":
> -    const: 1
> -
>    iommus:
> -    items:
> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
> -
> -  ranges: true
> +    maxItems: 2
>  
>    interconnects:
> -    items:
> -      - description: Interconnect path from mdp0 port to the data bus
> -      - description: Interconnect path from mdp1 port to the data bus
> +    maxItems: 2

I think this is not equivalent now, because you have in total minItems:1
and maxItems:2, while in past minItems was 2.

The same might apply to iommus. clocks look good.

Best regards,
Krzysztof


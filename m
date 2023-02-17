Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C748369AA71
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 12:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E3110EF83;
	Fri, 17 Feb 2023 11:32:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C952410EF81
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 11:32:24 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y29so1012371lfj.12
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 03:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xGMpYHsIeYJDIJGefg+6ErVmQQfHtNGslmwfKU0O4yI=;
 b=OvsZ7iovA4L6oucKG0b9h02NIVhPzkSAPETFU8v1m/z6VtZgecZFuPmTkEZNGjIPqO
 UjoWZ+ykHvNt8ppV6hXRCz0aiIUH+HqmT1bEYUeKQhfL1mt1ER3hhfvoRfD5xMvWQia1
 HUzSLNEp/TrSrSuCrH7uznPaDgkiXzZNkeJRp+AmH4MkhVAXY7U1rRSuRXbmv6BuODCh
 WLAAZKuGLjK/8DZ4IedVBHSo8B6Q4sXFfwc5UFGpEDIEZjTvLsuFsmDcXGEnDLXhw00U
 LkX4p1r+ZnaaFFV4hAPbehmyp3LMmJ8x2FdkMXsH4BQ38cp/net6qL7oB5ZdVgJ8BP//
 QW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xGMpYHsIeYJDIJGefg+6ErVmQQfHtNGslmwfKU0O4yI=;
 b=B4W4yHRHnInaRjKd7o4KnoiVSRn3ex6AWW8Afk7vjljh1yqG+K7SsD+6ALCcdjbIKq
 LY39UT0IpChpOzEs21Mwz4CVNIc/WkRGJzsVkaJDbwKB0h3DWXEwVlOjPB7FCku59JKg
 8L8DPDaHCklpqL5k3OgJxVjVsYwLGpP8QmuzuDo7WTB08oYDtFrHbdGsYhjuKitr8EAd
 oJ/xwwRxchAg1sSbO7g4c1XC7QSPe8gO1m/TDDrx2lI9s3D5rdZSnMB0V1eaMDoT9CkE
 o2sXdVGBdGOAgkBAWhJH4AjmCKASYhhrTDCZoCuWNO52gSX2TNuZAh46IkJtzDmW+V9Q
 rxng==
X-Gm-Message-State: AO0yUKVIyg9Dkq/I0OjQk9Mta7WdvnDIgB4Z0JBS8d0FcfR0GXZBCZLn
 PsO3br3Otom+yixkCOu2s0y0RA==
X-Google-Smtp-Source: AK7set9R6HGSn4FUFt0xxRI8wa1ODUDTPvkHwALZ1Cga62wXb4eVDRWoWs4V4aiV88nkdhF7UYiKEA==
X-Received: by 2002:a05:6512:3b88:b0:4cc:a107:4227 with SMTP id
 g8-20020a0565123b8800b004cca1074227mr1429190lfv.22.1676633543025; 
 Fri, 17 Feb 2023 03:32:23 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a19f611000000b004cc82b70809sm653491lfe.150.2023.02.17.03.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 03:32:22 -0800 (PST)
Message-ID: <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
Date: Fri, 17 Feb 2023 12:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated QCM2290 compatible
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 17.02.2023 12:30, Krzysztof Kozlowski wrote:
> On 17/02/2023 12:13, Konrad Dybcio wrote:
>> SM6115 previously erroneously added just "qcom,dsi-ctrl-6g-qcm2290",
>> without the generic fallback. Fix the deprecated binding to reflect
>> that.
>>
>> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> Depends on (and should have been a part of):
>>
>> https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
>>
>> v1 -> v2:
>> New patch
>>
>>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index 41cdb631d305..ee19d780dea8 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -37,7 +37,6 @@ properties:
>>        - items:
> 
> If this way stays, drop the items as it is just an enum.
> 
>>            - enum:
>>                - qcom,dsi-ctrl-6g-qcm2290
>> -          - const: qcom,mdss-dsi-ctrl
> 
> Wasn't then intention to deprecate both - qcm2290 and mdss - when used
> alone?
"qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl"

was never used. The only upstream usage of the 2290 compat
is in sm6115.dtsi:

compatible = "qcom,dsi-ctrl-6g-qcm2290";
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sm6115.dtsi?h=next-20230217#n1221

Konrad
> 
> 
> Best regards,
> Krzysztof
> 

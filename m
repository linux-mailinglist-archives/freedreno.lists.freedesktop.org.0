Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D1C58EEBA
	for <lists+freedreno@lfdr.de>; Wed, 10 Aug 2022 16:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61789F64D;
	Wed, 10 Aug 2022 14:48:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2F1A85F5
 for <freedreno@lists.freedesktop.org>; Wed, 10 Aug 2022 14:47:56 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id by6so7938824ljb.11
 for <freedreno@lists.freedesktop.org>; Wed, 10 Aug 2022 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=xAWbyrjApOISWNxRGXk8EYQy587Toi36q77R+G3hDzc=;
 b=eEDtTm8qxAkipar2MHl4PYLASIA8YnYRV2ynvJSiM4Cct5aihxVp5/IQCKXhqdp+H+
 crJH4GADLjpldQYcCFk4KHWZ0PCBK8UjwPs1PNt91XEnTqv273JxLSijKMf+R8APDndc
 eyxHSrbVogq5Bm81JJEY8hbY5PRrJW4WrfXx/yylwBNsp4FAJOvQObHs42d41jY2MG7A
 9iItnkHxxYqp1fz/CgS1Dz1WcMXDVR2q/0WMytQV2SqsaIyi8MdP8giUEa0MUAGMWP5u
 RG22sj9kqJaGPxZIAA69HQXNPliPxltu159ZYkwkBWTBAD4xhDRpJirL7ews7lJznrUy
 5rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=xAWbyrjApOISWNxRGXk8EYQy587Toi36q77R+G3hDzc=;
 b=zVoaYFHRj49CfLTWHq0q58aPH0fnjc44YobGxvR1VhOzZWA6xHlX0Rud9qnN+Pzcb4
 59SKR2JanfmTD45UpMveZ5u/P/ZeNp0D2e7a4OdnpTzsDTe6vJf34F1QQvV4DJ/jBCJN
 vOnFLbhAT/Xlis4D/q3piSxMBPhrFnNgAoLAg5tc2fpnLg5GX/2GgV4DkpBH4Xbs5/ZL
 aRC/F49u8UFrt2CKKqvP5pUD/vuo7jfcCU8dXF7NAL0hHMKdKYudi5i51+I3p3n47d3T
 s+xUTNpq6ZxMPlBDWaEN7oN55Q1NgzVkC0/HlPgfObWs56lCRH7GyIblwVBt+HiVDFOP
 EUqw==
X-Gm-Message-State: ACgBeo2znx9ja5qFLTFM6J6kRloGOUjbRXkE1JMM1OORD7dDmq9hMbLf
 xzWh/vxE1avMr0dpc6Ct0LqoPw==
X-Google-Smtp-Source: AA6agR5+VKezNQWlbJ5jGG0wOWbGdljEwN+NvnLLR8ppNZnwuZNWvZOlx4TkI6EEuuwMpFiWwy3z/g==
X-Received: by 2002:a2e:b0c9:0:b0:25e:71e3:8441 with SMTP id
 g9-20020a2eb0c9000000b0025e71e38441mr9604841ljl.156.1660142874467; 
 Wed, 10 Aug 2022 07:47:54 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a2ea4cc000000b0025d743eb0c5sm429749ljm.112.2022.08.10.07.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 07:47:53 -0700 (PDT)
Message-ID: <c5cc8752-d7e2-b870-6887-c025137ed8a1@linaro.org>
Date: Wed, 10 Aug 2022 17:47:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
 <20220810035013.3582848-2-bjorn.andersson@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220810035013.3582848-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/7] dt-bindings: msm/dp: Add SDM845 and
 SC8280XP compatibles
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/08/2022 06:50, Bjorn Andersson wrote:
> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
> Qualcomm SDM845 and SC8280XP platforms.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 94bc6e1b6451..90f9302d1731 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -16,11 +16,14 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,sdm845-dp
>        - qcom,sc7180-dp

Alphabetical order, please.

The DTS warnings from the bot look unrelated to this patch.



Best regards,
Krzysztof

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EC5660397
	for <lists+freedreno@lfdr.de>; Fri,  6 Jan 2023 16:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE2910E875;
	Fri,  6 Jan 2023 15:42:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C5D10E87C
 for <freedreno@lists.freedesktop.org>; Fri,  6 Jan 2023 15:42:17 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y25so2454262lfa.9
 for <freedreno@lists.freedesktop.org>; Fri, 06 Jan 2023 07:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S8DsZ4xDi7WGGGxSEqK1CF2GfXaRjgknBXXbDJzfuIc=;
 b=ItGYGwkXvY1/pRaKVx9JjcCPiEdo3rOFFI5QTSZ6uwD392GsRfAZPt7KVNfViDE5sE
 5ecejYwh58e+71+mMOzy/i0GF5b4LKxkflRM4KmoUp7GO3gESVJOSQCSBx7DVR+PDo+a
 w/tufrmMOvygcvBLD8rJEyNnebstsCOkGq58Z2WKPNiiE55efO3SXwnLTApy6WiyLbLU
 JoEsCKHan+YYWRQ0hdohVHLWlP+GEiKFVAJzUPNNJJtD6zWs56i4YxmJK74vX1u2r+u+
 u1HG0GT2ggvxHApkpiPippaW1/88xjjfj/syaMnnsQOnWvZArAVTjxW7eGEvkrxiyWYO
 kzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8DsZ4xDi7WGGGxSEqK1CF2GfXaRjgknBXXbDJzfuIc=;
 b=HYX0lRijcmVZSKzwOdzP5Pg/E26ii7E2thbVjomxfqFwksyDiEyXhBbdyG12nmKoDm
 gh9TlSzxNA23OXXuHfkS8GPfe0OdvbNHMYS7jV3tJEJf3gGNFcyfBC0KdzuAP51NmXkW
 BRr5uhyn2hD+fPyfrgDbYm6IO95utBHHPabvyMQCRMSUx1uGpDMvG26jrWXvPM0fR/Tg
 xhso0XovUKJqRrhGLDrvbCu4+mZxw6JaxRyh7YLXwzxrQa87Eg9iFfUy042e3fSivw5S
 MWVqfO8qxpJPIXfU4GmocGUsSLnHHX0m83bdgZ48M37YyEjDBXNQw2NqNxdOSK0vCPww
 iYAA==
X-Gm-Message-State: AFqh2krzACpRgE6BqrI3GkEyJywqwjAIG6A4q1CRer33WjJmJpm3Rc00
 HmsTIZjPDTBAZ9VgQlIUk6oDXg==
X-Google-Smtp-Source: AMrXdXt8ZYswXAWp2K4iWM76QSXCXc1N6nCQi4oAWyZRzrTPjidUFRKcUo2QORTmpEDbAASVsaojgQ==
X-Received: by 2002:a05:6512:c14:b0:4b5:abe3:c63d with SMTP id
 z20-20020a0565120c1400b004b5abe3c63dmr19055796lfu.42.1673019736162; 
 Fri, 06 Jan 2023 07:42:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a05651203ae00b004b4b5da5f80sm187271lfp.219.2023.01.06.07.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 07:42:15 -0800 (PST)
Message-ID: <c0051467-e8c3-1897-fcf5-b9140a7039bd@linaro.org>
Date: Fri, 6 Jan 2023 17:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
 <20221207012231.112059-4-dmitry.baryshkov@linaro.org>
 <ccbb47e4-d780-0b1d-814e-27e86b6c369c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ccbb47e4-d780-0b1d-814e-27e86b6c369c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 03/11] dt-bindings: display/msm: add
 sm8350 and sm8450 DSI PHYs
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/01/2023 17:39, Krzysztof Kozlowski wrote:
> On 07/12/2022 02:22, Dmitry Baryshkov wrote:
>> SM8350 and SM8450 platforms use the same driver and same bindings as the
>> existing 7nm DSI PHYs. Add corresponding compatibility strings.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> index c851770bbdf2..bffd161fedfd 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> @@ -15,6 +15,8 @@ allOf:
>>   properties:
>>     compatible:
>>       enum:
>> +      - qcom,dsi-phy-5nm-8350
>> +      - qcom,dsi-phy-5nm-8450
> 
> If this patch was not merged (so far nothing in next), can we make it
> proper SoC compatible?

Ack. Bjorn has merged the dtsi bits, but I'll send a fixup.

> 
> qcom,sm8450-dsi-phy-5nm
> 
> The SC7280 already uses such pattern.
> 
>>         - qcom,dsi-phy-7nm
>>         - qcom,dsi-phy-7nm-8150
>>         - qcom,sc7280-dsi-phy-7nm
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry


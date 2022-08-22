Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B074559C7AD
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 20:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AA0113505;
	Mon, 22 Aug 2022 18:58:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447A991537
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 18:57:47 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id x10so11502455ljq.4
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 11:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=PKpchvUqRtUWsP9nxTTzrZHGbNMFxGhFv9cu7yF3NDk=;
 b=cxXulSdw7Cw0GjAfGRSFFZ6IKO29G4hpnfruPRhudEkW8RZD3TGtcyKVQZdzgFCuDP
 lXUOs2Av7eBl8sRi7fTQ+K2e10iD9xw5n3hdaxGrCqCW2nOv4Ild1+NAEs70uttS4vFi
 OwmFA7lcwkE9C4RXjJTiuYYeUN+k4leujPLWhP2Gza1SIieWcXdzEp13+jwb3LRBHZWf
 +mbqHeI5sU4asrkZdGPMA9vSJ64k5qlzJatn2mfwDq2rVlpt/ky7+Xnesil9cBu2ioVV
 f6CnRFW15xKo5qWoooXS0i60qBn/imgsA9FXYL4pyjRT7gfMaF17IWtY76wlDJJGAyeG
 fKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=PKpchvUqRtUWsP9nxTTzrZHGbNMFxGhFv9cu7yF3NDk=;
 b=6Z9d8aeT8uvMPd3S243ak8pjoUyOOqrp7QQxVXFHrupF7D9fmq+wvl/QgpPKzVBDk1
 HQ+rDDR72Y6eMLgTVtwPS06dQvcLKO3IYjUdqzzmI04uyfNI2dgcd2ZW2Zi2NFdpSCz3
 hFFW/OzLb6+HGj3sbvItwzEuLMXHjc1RrrvtkSF++98T3IYLFmFkNp9jQ8V8Wc027vPD
 bSwjtjDrdZxC+eP3J2HWh/N4i5CWbl7+CL+B2VY+jr20Fxy2OADhhkXSnLwToKhqse6d
 MDFtJbZ1NknYawQVHPI+3WsVEBevak6YjNtWRjb2cZLpk7odzsUEMYx5Y9zcjNnjIQIF
 gGCQ==
X-Gm-Message-State: ACgBeo0+K1EnEZbrSLCqkkm8zDi2HO1xr2iCJJU2uH6eiAwiEinx8o9Y
 vbRpz4Dg8/g+6AtyUjMp1I371w==
X-Google-Smtp-Source: AA6agR7kkHoz/rYO+7VF0jeAcDX6Z8QWqV+1tmT5zpZZsnZNVXs+R+ybeWNb1Vfk5ZzJh3a/pgcS3g==
X-Received: by 2002:a2e:9d0a:0:b0:261:85c6:efa8 with SMTP id
 t10-20020a2e9d0a000000b0026185c6efa8mr6605218lji.477.1661194665588; 
 Mon, 22 Aug 2022 11:57:45 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056512358900b00492cd4bd376sm1627741lfr.239.2022.08.22.11.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 11:57:45 -0700 (PDT)
Message-ID: <201ec2be-f8a0-066a-f7b3-2d6ac58fe674@linaro.org>
Date: Mon, 22 Aug 2022 21:57:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
 <677d6387-6225-29c2-3190-8f443222019f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <677d6387-6225-29c2-3190-8f443222019f@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/07/2022 14:37, Krzysztof Kozlowski wrote:
> On 10/07/2022 11:00, Dmitry Baryshkov wrote:
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - interrupt-controller
>> +  - "#interrupt-cells"
>> +  - power-domains
>> +  - clocks
>> +  - clock-names
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - ranges
>> +
>> +patternProperties:
>> +  "^mdp@(0|[1-9a-f][0-9a-f]*)$":
> 
> You used some unusual pattern. It's just "[0-9a-f]+" - the device
> schema's job is not to validate patterns in unit addresses.
> 
> Another question - why do you allow "@0" alone?

I think this was c&p from the other file. Dropped the @0 alternative.

> 
>> +    type: object
>> +    # TODO: add reference once the mdp5 is converted
>> +
>> +  "^dsi@(0|[1-9a-f][0-9a-f]*)$":
>> +    $ref: dsi-controller-main.yaml#
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B9974FB8D
	for <lists+freedreno@lfdr.de>; Wed, 12 Jul 2023 00:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3808C10E453;
	Tue, 11 Jul 2023 22:59:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8866310E453
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 22:59:45 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fba86f069bso10157706e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 15:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689116383; x=1691708383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mm75wKDIUdBS2VUhTp5I1uDUXxinpRPW1TwuOx6R0IA=;
 b=Z3DiMVPpiR8mgFyfsuUM2RofZOJe9rGu2QrLkoQyhPCQ8V3dJMZOXKNZWQArcwRgZC
 MaKrSnfd2+lmvITy2/2C5QYob0P32ai+Bsbbq5STO8qrdGrzD3q/K2PI7xKMsesYUMhx
 ma0CgGx9j94sS1UQ9hN/yTiIaI8m1akeU8Jo0UDlgEmVB9himedBmpx76coGRvnk7ZMN
 RwjHQYaa4vLT1w3l2k7QTwSgsS0i2Qdi/RWAeoPmqOVWjrJZ/iy+MVzK/71XnLaeAsvl
 EfsVRWA1XXPC4VPDBaIm0gwSk6xz71tfbSDq8+lwZqRQUwmzJ67TQyEhbtOr6pCk+Shv
 hA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689116383; x=1691708383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mm75wKDIUdBS2VUhTp5I1uDUXxinpRPW1TwuOx6R0IA=;
 b=CT+8UcaU2NVFIz2BeLlIBrdKzqKUImsYVCXwzc0Uajr9CtV/9MzPJiZ76CbFhPbUDJ
 ujQ+mfLLsxT5FZicEp54enedqebAxedhtfg0cp4CYSEI9LPabkoT3VIxy83BuV0h6JNh
 uBIlectk1H274brnOR56ASW7ish0Q9iyW9t6VmNFf65HGlkOMViLS+SQgRl9mkrFHOOg
 86SdgIr64qRJRSKxwFwGOnQNK+UakXI50vSk+HFBwx9tD5wqMB+p9wMwNtvwd1X3MF8F
 RpWqDE23Kh+rJm8TYAgFyIOZ4k40N3A+L3ySKgmIoXVElTJirs3aDTQlk0TKmu9f19oL
 vDqA==
X-Gm-Message-State: ABy/qLYm+zYdmcwOXnYyly4jas5flD40JCm8QQ+cs8tFw3GwGijViJ/w
 /d/d1Z9LUcNPpvfqXY+neZCRLw==
X-Google-Smtp-Source: APBJJlEEEvO0W4GtZ+OwmpjQRUVrpuxICL5bSKnNmDkUAeQW0aAAQeejJ5OHrYQJWNGXjY/QfkSXEw==
X-Received: by 2002:a05:6512:3b4:b0:4fb:82d8:994d with SMTP id
 v20-20020a05651203b400b004fb82d8994dmr12377798lfp.42.1689116383347; 
 Tue, 11 Jul 2023 15:59:43 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
 by smtp.gmail.com with ESMTPSA id
 d10-20020ac244ca000000b004fbb424c362sm473909lfm.150.2023.07.11.15.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 15:59:42 -0700 (PDT)
Message-ID: <766ade98-f3c7-89a3-d3e0-63c8d01a8498@linaro.org>
Date: Wed, 12 Jul 2023 00:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
 <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
 <6968f4a5-fc5d-e166-3262-dc83762eeec1@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <6968f4a5-fc5d-e166-3262-dc83762eeec1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add
 onboard USB-C redriver
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

On 12.07.2023 00:39, Dmitry Baryshkov wrote:
> On 12/07/2023 00:36, Konrad Dybcio wrote:
>> On 9.07.2023 06:19, Dmitry Baryshkov wrote:
>>> Add the nb7vpq904m, onboard USB-C redriver / retimer.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> [...]
>>
>>> +            port@1 {
>>> +                reg = <1>;
>>> +
>>> +                redriver_phy_con_ss: endpoint {
>>> +                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>>> +                    data-lanes = <0 1 2 3>;
>> That's USB+DP lines combined, or how does it work? I'm confused :/
> 
> 4 generic purpose SS lanes, which can be purposed for USB or for DP.
Okay, so my gut did better than my brain.

Other than that, I'm reading the bindings and it looks like ports 0 and
1 may possibly be swapped?

Konrad
> 
>>
>> Konrad
>>> +                };
>>> +            };
>>> +
>>> +            port@2 {
>>> +                reg = <2>;
>>> +
>>> +                redriver_usb_con_sbu: endpoint {
>>> +                    remote-endpoint = <&pm8150b_typec_sbu_out>;
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>>   };
>>>     &mdss {
>>> @@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
>>>   };
>>>     &usb_1_qmpphy_typec_mux_in {
>>> -    remote-endpoint = <&pm8150b_typec_mux_out>;
>>> +    remote-endpoint = <&redriver_phy_con_ss>;
>>>   };
>>>     &usb_2 {
>>> @@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
>>>               port@1 {
>>>                   reg = <1>;
>>>                   pm8150b_typec_mux_out: endpoint {
>>> -                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>>> +                    remote-endpoint = <&redriver_usb_con_ss>;
>>> +                };
>>> +            };
>>> +
>>> +            port@2 {
>>> +                reg = <2>;
>>> +
>>> +                pm8150b_typec_sbu_out: endpoint {
>>> +                    remote-endpoint = <&redriver_usb_con_sbu>;
>>>                   };
>>>               };
>>>           };
> 

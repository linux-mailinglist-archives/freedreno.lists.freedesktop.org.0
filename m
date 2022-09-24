Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3CA5E8ACB
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258E810E5A8;
	Sat, 24 Sep 2022 09:29:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85D410E59E
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:29:45 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id h3so2473876lja.1
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=DZGAIB6lOdSfIICauQbfT5Gio7LJSO7BYlR0b7U8DS8=;
 b=pNvfAYYPA0xFYXDIi5y4/92pkWfgTeRTqoJ+Nce4yxlfZbl5qnT8BcKAwvo8ZUMMQa
 Tsgsd1dU4t6pIJ04hWvXqPPi3frAY6pxcRUIEJAnws3MS2tiqAylhibn51MicUYjfTBK
 //Q21qbi38NHXgeZX4DaQEgNlNfgHpE7Jdqq6Ub0I5dVUNUismaSRIrc1uiK63dHOyfL
 K0je9eCCGpMWZMgKU8fC8LsaM+JmhjzVRX/dt+UtMyFQDRAsoj0REM+1WlDosfC0DtDe
 IsX7WrqEnmi6TTVg+f4x7VZdewwNqN2QUIAH/QKxjWisVIhw/Gn7dzFBXpucMiSw+aRd
 ii2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=DZGAIB6lOdSfIICauQbfT5Gio7LJSO7BYlR0b7U8DS8=;
 b=sEfE0vvHETzYCuP9IMS3OO9/nQrkgwuWv2kVsTfCVlhcuP7NrFil4X1RU4WStbcPBz
 nNvVRoJ5Ikc6nL636kFclFViQ4A6wibC8vI6BJOmURiCIKtllHajaNR/T9T6W8DKj1X7
 Lim8NIbHsBQu9iNzHEhFgZsQe+sxLGdhCRioi8iHEdY0LCb73839gBX/ZY5JN+aTIUPK
 F/HnDUpONcskMPpOdLOBsfoPIMwIt4kwXk8//Fj4zheNtmawtL3ZUxf89tt2xeDbAYpJ
 vqOQiN7XRxn3NLTNPdF6PEa9NEFe+gJuLk54jXOogTFLDeqTi7gmb1HL+puYi2LkzJUI
 DdxQ==
X-Gm-Message-State: ACrzQf38T3WUA+D+qBzqrkrJ/XGOHnmQAG6f9WIdM5XOwxlLCIAqr/ro
 fAU/GOYw/WRf/CvYJPRRS6evUQ==
X-Google-Smtp-Source: AMsMyM5SWQN3EwIq8in2Z15Fx8LgxNJnzmtrpYJprInmv+ZrHJMt6KkxewCGTsrGVOf/otXbQLbwUw==
X-Received: by 2002:a2e:a5cb:0:b0:26c:4311:91cf with SMTP id
 n11-20020a2ea5cb000000b0026c431191cfmr4168268ljp.491.1664011784324; 
 Sat, 24 Sep 2022 02:29:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05651205c900b004979ec19387sm1826256lfo.305.2022.09.24.02.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:29:43 -0700 (PDT)
Message-ID: <5ea1e309-6ea8-f6c1-dc53-471d858ff60d@linaro.org>
Date: Sat, 24 Sep 2022 11:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <fd91077b-e4ff-0187-8424-0b83b96588ef@linaro.org>
 <361ad59f-288f-beae-25c7-7acd42c2db94@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <361ad59f-288f-beae-25c7-7acd42c2db94@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
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

On 24/09/2022 11:20, Dmitry Baryshkov wrote:
> On 24/09/2022 12:11, Krzysztof Kozlowski wrote:
>> On 24/09/2022 11:00, Dmitry Baryshkov wrote:
>>> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
>>> them with generic phy@ names.
>>>
>>> Dmitry Baryshkov (9):
>>>    ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
>>
>> dsi-phy is similar to other generic names (usb-phy, ethernet-phy) [1] so
>> it could stay. Is there particular need for this, like coming from DT
>> schema?
> 
> No, there is no requirement from the DT schema. However:
> 1) The resent qcom DT files already use just phy@ for most of PHY nodes
> 2) The recommended list mentions usb-phy/ethernet-phy, but not 
> <anything>-phy, so I'd think that those two are mostly for backwards 
> compatibility.
> 3) I liked the example of sc7280 which switched all MDSS PHYs to just 
> phy@ (this includes DSI PHY, eDP PHY and, by extension, the HDMI PHY).

Good explanation. If there is going to be resent/submit, please add it
to cover letter. :)

Best regards,
Krzysztof


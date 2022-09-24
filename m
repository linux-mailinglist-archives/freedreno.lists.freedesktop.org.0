Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 116895E8AAA
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E246410E568;
	Sat, 24 Sep 2022 09:20:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB6A10E568
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:20:27 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id h3so2458311lja.1
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=KwKiygJRfTorofnL1eRmybhvU/B8TBgGDBZcE2Kd2qI=;
 b=rVtcuLxH7HhgdMgin0oYUFOPi4fFSBqECan7mc8HIU8xVY9Q8yofftMMtz1YdSH1fX
 F8eVq2kMp/1bwCkxb4eTYhMhjuHDw3dMRU26qXt6wkN8XhyuWH1xpFvgEQ2IIR7eZ5qp
 RYWKXyizjvNVnmJv7fog2Lx+gsaYOm1xZd3Vf9drqOsOCnhIK1xdPLAh3ELwaz2hQT8O
 YeR8nQ7C2J66R73/6XxDBPpYXcVRzWqvnnCwlfMUMMpegytmM1co6EkZJH6hwcyMtzX1
 D+G4ezZqiaZWdZ37WlC3rNUlMxTJHR1jWbzQ/9CpEKBhRcfSieOImW5xPJwbfnr0xvL9
 vBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=KwKiygJRfTorofnL1eRmybhvU/B8TBgGDBZcE2Kd2qI=;
 b=CPnxMEY708dHpoekqgq/PaiZpH1JCG+34/JQGTXu5iA6n1L8HMtcEqdINN7GM3m1DX
 P7M8AbxFrHTSeJ/84fpDjdvjnJvG3kO6Y1Dv2Os/2E6y5YxLHj33nQCaMAb+YZYUe76s
 d3unHNO136VrRVcXO6nK0VcNV1gVAbtb3qrBkNiCCsJ7xnKicl6CwtRsyBGxBZy3BmqW
 b9nhJUb4MuzU8wFubD7Scrw8tEUiQ6uuxMT3o0QIVIi3x0Lro2iuLlwKukzs3OW+geCW
 inmGmELYeng+Kew67Z7C73p02i3iNBhvw0p8gXc/89Mcrus2KmJ+RXe2us+qPm4lhl0e
 LG8w==
X-Gm-Message-State: ACrzQf0OiYzFNpEwuS4FCBIxV1gSrOtWKkEBM4Kk3T7hI5E9x8gnPMOZ
 vBXyLAZk4S2Vq/yHjibqGk3hiQ==
X-Google-Smtp-Source: AMsMyM4/jReK06gsjawmyIkRqro894CFuOhxayzhoLBmB32YizFJ+oaebPLlgl3+/QZNSY+lTXvwFg==
X-Received: by 2002:a2e:a785:0:b0:26c:4e8c:5e79 with SMTP id
 c5-20020a2ea785000000b0026c4e8c5e79mr4502641ljf.396.1664011226089; 
 Sat, 24 Sep 2022 02:20:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a2ea612000000b0026c4113c150sm1725592ljp.111.2022.09.24.02.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:20:25 -0700 (PDT)
Message-ID: <361ad59f-288f-beae-25c7-7acd42c2db94@linaro.org>
Date: Sat, 24 Sep 2022 12:20:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <fd91077b-e4ff-0187-8424-0b83b96588ef@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <fd91077b-e4ff-0187-8424-0b83b96588ef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 24/09/2022 12:11, Krzysztof Kozlowski wrote:
> On 24/09/2022 11:00, Dmitry Baryshkov wrote:
>> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
>> them with generic phy@ names.
>>
>> Dmitry Baryshkov (9):
>>    ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
> 
> dsi-phy is similar to other generic names (usb-phy, ethernet-phy) [1] so
> it could stay. Is there particular need for this, like coming from DT
> schema?

No, there is no requirement from the DT schema. However:
1) The resent qcom DT files already use just phy@ for most of PHY nodes
2) The recommended list mentions usb-phy/ethernet-phy, but not 
<anything>-phy, so I'd think that those two are mostly for backwards 
compatibility.
3) I liked the example of sc7280 which switched all MDSS PHYs to just 
phy@ (this includes DSI PHY, eDP PHY and, by extension, the HDMI PHY).

> 
> [1]
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry


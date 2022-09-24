Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF7B5E8CA5
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 14:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5C710E23E;
	Sat, 24 Sep 2022 12:38:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E09410E614
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 12:38:23 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j16so4177351lfg.1
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 05:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=UOPfolxOIZ12CQXsf68Fo4WzsyOri0BWmpnt6BnO0Ow=;
 b=cX7t//F3kSLyor1gvEfsfeHBhBowAS4uSSLVqTm6qEPoB5XWUliaOcRhIRFfO8aUz7
 DdNoalQzEU0xu5QZ2rGZenhYadJDWtwBu28UPuw65635czBeAEBihIQvXpNSw7lxv4+3
 lIM9B8mJhd1Zp5ZG8HiAprDuGYLzm2F5EL/B1H2e+I01M2TcWI/gPp3mVD0yNRYnLxPB
 KxyYQVvtapmR80WiG6YnO2c9nA4zmYLPUnAKGkm2ikj57KRQb75Sw2xRSscpJ5cx8qK0
 matFHjmnUrD8SDqBraMiIwnPIH0/incZ2QuYumeK9C20HhLieXry4iNGV7YlLg0R3JbU
 atMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UOPfolxOIZ12CQXsf68Fo4WzsyOri0BWmpnt6BnO0Ow=;
 b=jSnU2rO8p2nKV/L8+sMZgue2lv9dj5B3sfpYAuMileC37ATeit3ju1y44mVCAHNyAM
 Pxa+DIimKtobhZZklzPVJhpXP+s+DxUdhTxiGEVsLNIX3ldfnk260d32dP+ppXpl23A+
 zTq4gOsGe1PZ0i4D3pWE1tVjm1DkFm2POwywfKD7v68kI/8b4oxi9i/jQ+8W6gcHY/ig
 F5b3tl8mCn3c6/NKjKugvLZfRW7yRTJdBFcmYDiLyNXwoJui09dnZCnPGXUpnO3MIRWZ
 i/OwYdCJXBVbibg7/5a4jvd803iS4KClO6woxJEofH0Ydt4mDw8gn8tNMOXKpwWa/zuo
 tJ2g==
X-Gm-Message-State: ACrzQf1QJH6ma4kvjt0pKvSyjkCyuYY+VWv0MDJEE0jrOqx3RwIP5eh5
 bgadG/ccLFSx9Atux2JbPtLBaA==
X-Google-Smtp-Source: AMsMyM5l1YVddhO3ezSgzoWafIh6OyvozrYGj4Ma6FMICHHIgqvDYN6Ft2bN3dHhYEQ7lhx435RL2w==
X-Received: by 2002:ac2:4e07:0:b0:49c:6212:c459 with SMTP id
 e7-20020ac24e07000000b0049c6212c459mr5466448lfr.614.1664023101989; 
 Sat, 24 Sep 2022 05:38:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05651220c600b0049771081b10sm1890477lfr.31.2022.09.24.05.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 05:38:21 -0700 (PDT)
Message-ID: <64f7c603-173a-93a3-8878-60dd2a8974f9@linaro.org>
Date: Sat, 24 Sep 2022 15:38:20 +0300
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
 <361ad59f-288f-beae-25c7-7acd42c2db94@linaro.org>
 <5ea1e309-6ea8-f6c1-dc53-471d858ff60d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5ea1e309-6ea8-f6c1-dc53-471d858ff60d@linaro.org>
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

On 24/09/2022 12:29, Krzysztof Kozlowski wrote:
> On 24/09/2022 11:20, Dmitry Baryshkov wrote:
>> On 24/09/2022 12:11, Krzysztof Kozlowski wrote:
>>> On 24/09/2022 11:00, Dmitry Baryshkov wrote:
>>>> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
>>>> them with generic phy@ names.
>>>>
>>>> Dmitry Baryshkov (9):
>>>>     ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
>>>
>>> dsi-phy is similar to other generic names (usb-phy, ethernet-phy) [1] so
>>> it could stay. Is there particular need for this, like coming from DT
>>> schema?
>>
>> No, there is no requirement from the DT schema. However:
>> 1) The resent qcom DT files already use just phy@ for most of PHY nodes
>> 2) The recommended list mentions usb-phy/ethernet-phy, but not
>> <anything>-phy, so I'd think that those two are mostly for backwards
>> compatibility.
>> 3) I liked the example of sc7280 which switched all MDSS PHYs to just
>> phy@ (this includes DSI PHY, eDP PHY and, by extension, the HDMI PHY).
> 
> Good explanation. If there is going to be resent/submit, please add it
> to cover letter. :)

I hope, there will be no v2. For now I have included this explanation 
into the HDMI PHY counterpart.

-- 
With best wishes
Dmitry


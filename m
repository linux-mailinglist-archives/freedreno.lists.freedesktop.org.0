Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA55E6746
	for <lists+freedreno@lfdr.de>; Thu, 22 Sep 2022 17:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DB110E3D1;
	Thu, 22 Sep 2022 15:37:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4178010E3D1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 15:37:43 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id j16so15356025lfg.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=zdGItr5ICc4vlhS3KGwufw/Y8w2UR5ZVlts6EctynGI=;
 b=cYwW6ohqGr+JtPJ/CQ4fzXi+ot92VVnYo0FHuXQI76jbm8+6lgnVm/+IBi5NLIuAJp
 kxZ2IXhyaFXUtcVSx6vOBG5nCGulreB7JY3l7+kgMlntGfGGUYdxNf4zhJGDvLfzBNZj
 yffbR7QxgOGesk1up0TsxpFaSg3SIHIQsGmWH+obHSl6VIRewS62cXjxHRfTYSWhTT4I
 c14V4UraiU52gm+7TgaCeOQU0hsbgoWEfgHezZ/Ug6+jjqd4WNg/HZoY1Cuc1HX1s6tB
 95/xM/6e58bs5qpZu/Eg8t3clreVhFcU9ISgFZVBQNhwZ7Ejl6uMNpLQPjEyZ7ENEv0p
 bljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zdGItr5ICc4vlhS3KGwufw/Y8w2UR5ZVlts6EctynGI=;
 b=xefFhSXt0ONH5o2xPu5djYaWtGwfapACBaOJRkG610S2KbmQP6rzmQlMPLk6TCKkLK
 hgecnuzW1AspxaPt1nPB8RyiGNIhiPYHOflG4djGy/M78UjjdUfWhvR5ThgDVGrmEBtr
 1B7maH9NF8zbueC2IJTBdxme1O8OyfBnLkabSPCzrmdTBraI8pwU3FYB2Gsijxfhen+L
 L+C2tXP7nPhLDQ+ONolynmQBCrvOzzSGUkXzrosa5XClbq0ctSJT0mLRpmxXrYXLRIdN
 sA/OklX1LITjNIZyHjR4gj0QmqF3s4j9BD1VD+oj/DrSob68KNag4iPMKqMqwZ8EG4Ju
 W19Q==
X-Gm-Message-State: ACrzQf1HHvCGCOTcSQszPjz868YCmpCNgRB+fYx34kEYf5K2QgJEx8bP
 hhc8M/j2Xtd2J8yiOxM3+c7wig==
X-Google-Smtp-Source: AMsMyM7h9wDWsyUiqMcRTiNhG8QJKDH4ATtOFz8lkYELII3NUCIdQoLWizMQQQXkal5Hd6Zg8Y51zg==
X-Received: by 2002:a05:6512:2251:b0:496:c3b9:c18d with SMTP id
 i17-20020a056512225100b00496c3b9c18dmr1389520lfu.403.1663861061448; 
 Thu, 22 Sep 2022 08:37:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056512118400b0049f907b9ba9sm982317lfr.226.2022.09.22.08.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 08:37:40 -0700 (PDT)
Message-ID: <acd9ff20-a07b-05ab-6f4b-34e3e8b1cae8@linaro.org>
Date: Thu, 22 Sep 2022 17:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
 <20220916200028.25009-2-quic_bjorande@quicinc.com>
 <1641e41c-08c7-859b-644a-28d966fb00f3@linaro.org>
 <20220919211832.6b3buqxrnfp6yjjg@builder.lan>
 <6b242b44-b657-c7a6-63ca-465c7031376f@linaro.org>
 <20220922001429.zqfap3clprvlo6jo@builder.lan>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220922001429.zqfap3clprvlo6jo@builder.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/7] dt-bindings: msm/dp: Add SDM845 and
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/09/2022 02:14, Bjorn Andersson wrote:
> On Tue, Sep 20, 2022 at 09:09:13AM +0200, Krzysztof Kozlowski wrote:
>> On 19/09/2022 23:18, Bjorn Andersson wrote:
>>> On Sat, Sep 17, 2022 at 06:03:27PM +0100, Krzysztof Kozlowski wrote:
>>>> On 16/09/2022 21:00, Bjorn Andersson wrote:
>>>>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>>
>>>>> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
>>>>> Qualcomm SDM845 and SC8280XP platforms.
>>>>>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>>>
>>>> No need for quicinc SoB (unless you also take ownership).
>>>>
>>>
>>> It's my understanding that both needs to be there. Bjorn @ Linaro
>>> authored the patch and the author must certify its origin, but as the
>>> submitter I must certify its origin.
>>
>> It's the same person. There are no two Bjorns (unless there are :) ), so
>> you certify with old email. SoB chain is coming from people, not email
>> addresses.
>>
> 
> IANAL, but I don't think it's the same person. I can't use my old
> signature to certify the origin in a contribution today and I can't
> claim authorship of something Linaro did.

Fine with me.

> 
>> And it is not only my understanding of SoB chain.
>> https://lore.kernel.org/all/YuKcBO5JatwRYQJ3@kroah.com/
>>
> 
> Again, IANAL, but I think the situation is different given AMD and
> Xilinx relationship.

Hm, I am not sure how it is different. We might know or we might know
the change of ownership. Maybe the change of owner came with copyrights,
maybe not (someone else bought them). I don't know, there can be many
cases here. I interpret Greg's point there as in SoB statement - the
person, not email address, certifies.

Anyway, this is not a blocker for the patch.


Best regards,
Krzysztof


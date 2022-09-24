Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B26225E8A8C
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3010110E568;
	Sat, 24 Sep 2022 09:11:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115C710E57A
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:11:40 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id z20so2431126ljq.3
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=AJ8TUjAWCXpFYS5hKa8RQdvrp2UP+wXPk43AFleVbuI=;
 b=HfFq1UkhQyJ4W74vYLzpC9NDAJc396eNp1+8eT00urQuY/SKGKI7U+uX5Z7gI9zIkX
 VMNpuSFNtebDsYOYQ9LWP4qqBIOmCTxtgdhGOdV0wiSp1D9KJ0hQXSkmgvmjME4rkk91
 dVJiJ9Ek7NoPbJUo3OWoxjfJDZNpNO+zGfrQHsAzLaXZjx/h2I0/gf5CsP6NLWkI+6/N
 I6oO9KPjFPPG+tpsZALhgS8MR1wi7x3JfzK8EbYo4pfL/9kanHpGIDKxSIks+JpiBMGT
 HJDXyZbeLEggwcY0fOlUSGaTZOa7spZPQg0dtKW/CbGkG8vLwgh+PFl8IUXJEa8/FEY3
 P10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=AJ8TUjAWCXpFYS5hKa8RQdvrp2UP+wXPk43AFleVbuI=;
 b=2vrzn6K66BzR3ygKLJfiq1+Pw4xLuqlqzU15kef7tSLU7tN1l0sqXeEdEFLi+v6mKV
 s6fSmiUBLC7TZX1yJ/DiSi1KBaOT2C+mPK2WqG5onEmOgvdarRzm5dD6QBBXs6VPdOUJ
 kErgpvUIWMSX1T3bDdqEH3AfhzBu21fB5w8IEdd0Z+RqMz62IiT41H9Z4pEJFU41D62A
 LSvPTllR7qbkCDwsoww0rdmcn31+SbQdo97C6dnqVuEwIcvGivC2f5Fqu15gmmdXZjq0
 M79nbKlQ5ejzm7Bu5RY0VciEbQROOXrxrgsu0rxC3oEzztHnuFGdWce7PAamkzCb/XRl
 GK7A==
X-Gm-Message-State: ACrzQf1BPcoN1lhvPQJL10zIgICWJ/6Hc1lkIzenvWJnTe5edK4ZN9Jf
 pEkbjK7chFBw8gxd/O9m6vSfvg==
X-Google-Smtp-Source: AMsMyM5HqWVwoHJfzOQRUlbcgtGM7KM3kBVB75s425FqDMdtgtYhO6sqhorIL1lG+Nh4QZ+Nx0QMYA==
X-Received: by 2002:a2e:9791:0:b0:26c:5956:30dc with SMTP id
 y17-20020a2e9791000000b0026c595630dcmr4283719lji.373.1664010698225; 
 Sat, 24 Sep 2022 02:11:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 g11-20020ac24d8b000000b00497a61453a9sm1827234lfe.243.2022.09.24.02.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:11:37 -0700 (PDT)
Message-ID: <fd91077b-e4ff-0187-8424-0b83b96588ef@linaro.org>
Date: Sat, 24 Sep 2022 11:11:36 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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

On 24/09/2022 11:00, Dmitry Baryshkov wrote:
> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
> them with generic phy@ names.
> 
> Dmitry Baryshkov (9):
>   ARM: dts: qcom-apq8064: change DSI PHY node name to generic one

dsi-phy is similar to other generic names (usb-phy, ethernet-phy) [1] so
it could stay. Is there particular need for this, like coming from DT
schema?

[1]
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof


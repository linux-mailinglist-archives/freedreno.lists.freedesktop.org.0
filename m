Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7294E9CFB
	for <lists+freedreno@lfdr.de>; Mon, 28 Mar 2022 19:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FA510E059;
	Mon, 28 Mar 2022 17:04:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A3A10E24A
 for <freedreno@lists.freedesktop.org>; Mon, 28 Mar 2022 17:04:29 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bq8so16058570ejb.10
 for <freedreno@lists.freedesktop.org>; Mon, 28 Mar 2022 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6yQeqxmAC2aKz5WWofRTiroUa0cIPCXtz1ZK19EhWKo=;
 b=daxWCLSzVHGVhchsUZ6+YMjYVs1b6Fsm+tcDdFellj+t2WgqgjOdKLAWci/CZA5kTt
 YpUbcI/aiNTyqKr5AatPYmITMGtorqn7ES0eJ6ftJukevTX7gjRktmyM2KYU+jPIuMOo
 lRr1gySh1tvjJkDAfaSn+RFfZxDEI0XgwVFKQ3Jd0UwbgXJ421CA6h4nu98pFsDLh3iS
 Uplm1/6F6IsS2NZY2tmoLWY6NxpGAtzxX7vCCefkJ0eCtUEmzhGnTDDG9HvdC85/RgeI
 UmWlJrwlG+6aq9Gb59jmhagnkKLRvqeRsGPRkeNA/rmK3hTybLGNWQPHfY5ejaZOnwWR
 nyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6yQeqxmAC2aKz5WWofRTiroUa0cIPCXtz1ZK19EhWKo=;
 b=aZyo2ZH9baMeN6NXZ0nq54rE4uW8v2rXLaoSJ52SaKfnMUOfn6dVLK2izsgxxBLUaS
 BWmGcRFgNSXuq+XxWbAejOOfXejgwUOyleKN81tGK/iMePNl4QqfVMb7kSyqxsG+bXPk
 fuGASfW1mQME36taVkW7MedU9hhoLbhakXAXm6dM6j4s4e3g+I0XYBBez4a8QA1d5HSf
 dTpMQH72/rokKjDX+MOem2dcMMSSnh+fa1vNUlu5cQOlpa3RQ71jYVrldZnjdDIF+Vu4
 8oADzQo94DbTWB3Z0rLWe6z5vzka9WR4Jdziil1bNiE1WUfzVHHWnnYUn74D3DsqDEV1
 uUog==
X-Gm-Message-State: AOAM532vVR5QUDutupSoEfozKrOcstaoMpx1ye9GvdWfDX3fUP4VbVk/
 Tvl32LU9t6AVM2rv0+/Gz6evFA==
X-Google-Smtp-Source: ABdhPJxOIHwbCP7io7cxTbL5Y9HAi1K2LbIG9adPMWYOr5vMxk3eG/GDERE2ELL/JaPwcEKHwv7GGQ==
X-Received: by 2002:a17:907:7704:b0:6cf:48ac:b4a8 with SMTP id
 kw4-20020a170907770400b006cf48acb4a8mr29021497ejc.305.1648487067801; 
 Mon, 28 Mar 2022 10:04:27 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 20-20020a17090601d400b006caff964e30sm6108433ejj.19.2022.03.28.10.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 10:04:27 -0700 (PDT)
Message-ID: <41fe6179-5628-6393-01c1-918baccec176@linaro.org>
Date: Mon, 28 Mar 2022 19:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
 <CAA8EJprWoxWwk5EWEfWdLquPR+2=u6V0-v1-+wHMHOk8HiEyNw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJprWoxWwk5EWEfWdLquPR+2=u6V0-v1-+wHMHOk8HiEyNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: display: msm: dsi: remove
 address/size cells
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28/03/2022 18:43, Dmitry Baryshkov wrote:
> On Mon, 28 Mar 2022 at 18:30, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> The DSI node is not a bus and the children do not have unit addresses.
>>
>> Reported-by: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> NAK.
> DSI panels are children of the DSI device tree node with the reg = <0>; address.
> This is the convention used by other platforms too (see e.g.
> arch/arm64/boot/dts/freescale/imx8mq-evk.dts).
> 
> With the DSI split link it is possible to attach two panels to a
> single DSI host, so addresses are necessary.

Yes, I noticed it slightly after I sent the patch. :(


Best regards,
Krzysztof

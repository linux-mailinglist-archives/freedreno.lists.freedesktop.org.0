Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0143D4E9D44
	for <lists+freedreno@lfdr.de>; Mon, 28 Mar 2022 19:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839ED10E723;
	Mon, 28 Mar 2022 17:18:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FD310E726
 for <freedreno@lists.freedesktop.org>; Mon, 28 Mar 2022 17:17:59 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x34so17707364ede.8
 for <freedreno@lists.freedesktop.org>; Mon, 28 Mar 2022 10:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PfGu1Gh5gOnyIlm1iZqOR1KzskMRiaHDBmIl7z2QE6I=;
 b=SS9lD2FartjqbmLvIybnxYK7DZu2mOa4V8OjcueWGmfHX7+9gyvVzz2YR231SARBlh
 tT/ACANSvNw+nR+IArymugrc8NoiWptCklXZ6AkM6tRyOphTeapK5odP+9gFQxn3t22w
 gAhBqmMnVOXhdFhDQUCdui2mBW14iFjrpkxvrNeHgfbovOK8gOXjiyO1/AWWkaTIliTK
 8hKLoAcIz//0MU+sOaNl9OcMObocqWkl2gPQ4FsyanmuyZ66sVR/Vwt0NHE44kAgNzZh
 InZ9rwqlN1jlO9QjKlNSOJqxAtwdSAdd8q4xXpJxalSzV5tY1vCYhkUJpMImvs4AO/ey
 lS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PfGu1Gh5gOnyIlm1iZqOR1KzskMRiaHDBmIl7z2QE6I=;
 b=52ZJGaSZNzAIuo6EE6yziUTS5ZChh3Rg6tum7zbHbe8pV3oWt0DePEKUSqPXhKlSTH
 oqxbG382S1WFdcIeHwMVr9iFIbAq+0rdsu6IG5R4lweXrSkn20eNx/PpVaL9am29hDRJ
 eClmcG2yjcpcmLPlNC2aJMddbpxHviuP5rI7bpbLHYNdwM1ATpHCWmUbIxePBunQWVBm
 fcwxFeTZvFgvFYNomZ0wjx81fX5A9nTH+hijr54Ja/IwXwVPSCtKIROA/pdjZsl/cdJs
 ZeniMfCjYIuxjqXV2YYy5hM5mlbFuHZykEfyGajWcVdNH43XKA9lpTRHQGkj889XAiFT
 0PgQ==
X-Gm-Message-State: AOAM533cJiIYpo2gyylM19OINt7/LZSR9mD+aHVFqXxduVquTxIm3Gjm
 rL8dnZ3BDFl5MPI3RAUesnlpmQ==
X-Google-Smtp-Source: ABdhPJyigBX1uqqXExWRAhFYFbuaenjSC8MKFfgbyUoYMWd4PQLdsdqvigzxFhceIqW/RQzj5hlXtw==
X-Received: by 2002:a05:6402:60e:b0:419:d2e:bcea with SMTP id
 n14-20020a056402060e00b004190d2ebceamr17695197edv.326.1648487877473; 
 Mon, 28 Mar 2022 10:17:57 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 f3-20020a056402004300b004162aa024c0sm7190332edu.76.2022.03.28.10.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 10:17:57 -0700 (PDT)
Message-ID: <12b0056b-8032-452b-f325-6f36037b5a80@linaro.org>
Date: Mon, 28 Mar 2022 19:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
 <CAA8EJprWoxWwk5EWEfWdLquPR+2=u6V0-v1-+wHMHOk8HiEyNw@mail.gmail.com>
 <YkHtY9absUjmqmW7@matsya>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YkHtY9absUjmqmW7@matsya>
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
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28/03/2022 19:16, Vinod Koul wrote:
> On 28-03-22, 19:43, Dmitry Baryshkov wrote:
>> On Mon, 28 Mar 2022 at 18:30, Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>> The DSI node is not a bus and the children do not have unit addresses.
>>>
>>> Reported-by: Vinod Koul <vkoul@kernel.org>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> NAK.
>> DSI panels are children of the DSI device tree node with the reg = <0>; address.
>> This is the convention used by other platforms too (see e.g.
>> arch/arm64/boot/dts/freescale/imx8mq-evk.dts).
> 
> So we should add reg = 0, i will update my dtsi fix
> 

To "ports" node? No. The reg=0 is for children of the bus, so the
panels. How to combine both without warnings - ports and panel@0 - I
don't know yet...

Best regards,
Krzysztof

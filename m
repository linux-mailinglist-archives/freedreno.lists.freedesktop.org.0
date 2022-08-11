Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D2658F904
	for <lists+freedreno@lfdr.de>; Thu, 11 Aug 2022 10:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B55994ADA;
	Thu, 11 Aug 2022 08:27:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A859BF9E
 for <freedreno@lists.freedesktop.org>; Thu, 11 Aug 2022 08:26:56 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id l10so13988649lje.7
 for <freedreno@lists.freedesktop.org>; Thu, 11 Aug 2022 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=aFp18g3W0LGsukVneJEK/1E3oiiot3UTXvd9sFAT8nw=;
 b=FqWcBq881TMTPntLfTmspF/MO4q8vssSHi7sEwMMId7K8gaHZO7iDS19GycjfK/9eX
 cFkAyPoL+ZxgFs9dY8+KnKf6KghP2eQzh3/5e6CQ/yNuLXuxNR9SPKZrpjiyncVvDb3O
 XXeumafKovUw/dYZQxYK5tO0Uaaw87e+2IHMLlXkYC2LEPH0U3H7RPvoAztqsE04Q7FO
 Mf+k14XGfUr4CH3epxKAHe8GlAmmds9FGDbUI0nJLOb1IsNlO9dOjdxiEQQeUqdAQup0
 8VNiPpAsjtTUvBYLnnqxgnUTB3eLW0jqoT030lVtBRxB3+Ebqa1AV3PA1it84KPPmRUC
 l0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=aFp18g3W0LGsukVneJEK/1E3oiiot3UTXvd9sFAT8nw=;
 b=Qg2qlLt8MMX9bDqusDLI4IWH7fgwb/UOrRUfArnawPcQpeqdb+Jtzqer6LQxqMsVX7
 DXcsiUVCReV51l1TzUnod1MiudTFPdW/bQssppQDicWWHt4zutByuyWEe5b9qeJcdyER
 zgbaKwq+STJNoqKRuySEgUc2PJaHJvEEkOlt/nX8GbEIWhnoIunHHGo7Rk1TeyrxT48U
 dbW4G8FND0xrd1gslWaMR4LHqn9HM+kxwkzb8C1VJHBkdLUrV5yl9EU0K6YjjZNhjYsH
 BBwmcDfE2ulCISzHePplsi7lTjnXBsi+NZQSxKR/MqdDtLVT4upI0RQtjprWi2oVAlnA
 XfdA==
X-Gm-Message-State: ACgBeo1Gpwe9qCU7EmqT/SWV+ZLRwzYe/ujOdXAbt8898yzi4LlED9Cv
 0TFRqd0GOE7rI8tCNoFY8qCY0w==
X-Google-Smtp-Source: AA6agR7WKZFo0Gd0CrwW+kQqeYyEuLnmEdTMd3As+yvfv/ebcpxDY62N1UnBLOwwuNPgfwQgBjnxwg==
X-Received: by 2002:a05:651c:154b:b0:25e:c73d:a786 with SMTP id
 y11-20020a05651c154b00b0025ec73da786mr7507173ljp.397.1660206414645; 
 Thu, 11 Aug 2022 01:26:54 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05651c204500b0025e08d58e75sm720412ljo.133.2022.08.11.01.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 01:26:54 -0700 (PDT)
Message-ID: <1cbb9946-2171-46ee-be6d-84b914ecc47f@linaro.org>
Date: Thu, 11 Aug 2022 11:26:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
 <20220811040121.3775613-2-bjorn.andersson@linaro.org>
 <db9b74f9-1f65-5b88-1c81-0a3fd6dcf9a6@linaro.org>
 <74afb676-4a85-7a8e-f7ea-20d8a0967d7d@linaro.org>
In-Reply-To: <74afb676-4a85-7a8e-f7ea-20d8a0967d7d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/3] dt-bindings: display/msm: Add binding
 for SC8280XP MDSS
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/08/2022 11:04, Krzysztof Kozlowski wrote:
>>
>> additionalProperties:false on this level
>>
>> which will point to missing properties (e.g. opp-table)
> 
> I'll fix existing bindings which have similar issue.

Hm, I think Dmitry is already working on this:
https://lore.kernel.org/all/20220710090040.35193-5-dmitry.baryshkov@linaro.org/
so your patches should be on top of his.


Best regards,
Krzysztof

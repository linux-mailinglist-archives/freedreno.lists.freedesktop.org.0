Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E503663D8D7
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 16:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F22410E479;
	Wed, 30 Nov 2022 15:08:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A570D10E47C
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 15:08:41 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b3so27429682lfv.2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 07:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZYfIBfYi65QOjaw7VkDUPxWFzywCv79WV4n65fszNVU=;
 b=sf/2hz/IrnallWjP9XknwUUDXHJblaEo/mri/HkWsjmzY9Yr4/WWEU6udOKIk2LbZZ
 JYwehJjD9anBF7rMx5ggMRESEhnAU7X2nRSjF6BcWt2zEUDeL5phkf8NSSYzLII7qZ9b
 R4YLwjPB0m5mcLxIKnjx6oRUv2hy3px/Y9pLx9DlOn5t80oaawpjVqY+oIMDOUHOOclk
 i9taTM84hKpMbFvznl+qh70JXN5Q7SimgyquECB8clAnQOGGG01Wai8vVh3FJ9uoFTrN
 eF8qwk18aAp2/ItmdGq2cTnOkPj0Ev8bo54XnWwwmiLR7yWHY5S47LGlNrqYyJ2FQp1o
 MfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZYfIBfYi65QOjaw7VkDUPxWFzywCv79WV4n65fszNVU=;
 b=olZjEV67DCEHR4vbxkhtN/x/8tf/Y+QfkzlhtCFKQIGYU72LW1qPRNGL9ydlBMB1NN
 PMq6yaOYA6+gGYkX9A0ccvybJVzbZsJyD9rH9ecNLLXu6I9cdrLvLgTrbsh7XwWbWVBw
 k1qLN8EUrB4g/AW4FodDxUPMm2B09SpXHSas6qnJlbDIhIH+R52xqrfNIeOtn1mNwpwO
 cfF4GE04u3pe7G9Atz06ezvVgm+e9OiIzDnKaLSrENMvi4GZvHhXzBAciWp0pwyMJGR8
 HRid2DComdgIeQtmPr5Ooo6PwTyYk7ndV6qx9p7my/eDY3NBnMfJZz1e0cBbwzIdTdlx
 ZmtQ==
X-Gm-Message-State: ANoB5pmXpU3Dc14Qn30dnnjO1enk+oTgMlf0Dn0T3CIcp+fXpbNZKB2i
 gUH6wCtH6SZTepRNECH+P+FF/w==
X-Google-Smtp-Source: AA0mqf5Wdcn8iJZuhr5JDcQFbL8gXEwhGIZrCy6wdy3H+GPIx6fF1A2ejA8+AJRekiQCwjCpDmUgIA==
X-Received: by 2002:a05:6512:211:b0:4b4:ea76:8017 with SMTP id
 a17-20020a056512021100b004b4ea768017mr11854189lfo.560.1669820919397; 
 Wed, 30 Nov 2022 07:08:39 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a19914f000000b004b4b9beb0eesm292896lfj.50.2022.11.30.07.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 07:08:38 -0800 (PST)
Message-ID: <dcd1ae97-e04b-1021-37d5-749d263cdabe@linaro.org>
Date: Wed, 30 Nov 2022 16:08:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-3-a39.skl@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129204616.47006-3-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 02/12] dt-bindings: thermal: tsens: Add
 SM6115 compatible
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Andy Gross <agross@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/11/2022 21:46, Adam Skladowski wrote:
> Document compatible for tsens on Qualcomm SM6115 platform
> according to downstream dts it ship v2.4 of IP
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>



Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


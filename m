Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D8F63EE01
	for <lists+freedreno@lfdr.de>; Thu,  1 Dec 2022 11:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A231910E129;
	Thu,  1 Dec 2022 10:38:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE1F10E5AE
 for <freedreno@lists.freedesktop.org>; Thu,  1 Dec 2022 10:38:20 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id f21so948436lfm.9
 for <freedreno@lists.freedesktop.org>; Thu, 01 Dec 2022 02:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ir3uvErgUob4NFVyXZ4JMzbDFyUKCFAp6JFwnKMpYXU=;
 b=sDiCfmTwLAL+IKSK6fOyjJI03hKdZIxAwTN23mUq3iwImjKp2FQBCLSi5GOXxBPsHz
 BdYaxRl6VVlyvlU6jG9NE6ZG8rv3Yj0JnmFXHJTRlzsuIL78G6czmw1vTpU9BjChZF3M
 rmMJqL65R3fZNXf0/E6oOy/hBWLN3/iir5072tqA+HRaWY7fBEiO0FbK5YJ6YijcnQ8a
 +mTJELLZsdyHs4cGNDjena94bfmGvZYxnw5jMqOsrOF0BvuaxqpN8pcLqOkR+sqcjRqy
 tsqki7IGeJr9MY0ED0VxJTG89l+ku1voRYszZZ+iJsbbJXKsZ69oEGGy6biAIZwn2wYU
 wjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ir3uvErgUob4NFVyXZ4JMzbDFyUKCFAp6JFwnKMpYXU=;
 b=aKSTQ5gllJkSscffPFBO9SDWxXSUX+haJD6No3RRL9uPVLrxLx7mAdh6Cm/7pcBc8b
 AH54p0JHtyjO14RVUKwaarAIWLu+r8PwVSXhvR1Bc+eG0qZjcEkRYRe6l7U6c6JKT0he
 DwBzr+VYv1gr4KOvdM5Ieqx2xR2XKHRTcJo4fmV19SekMsmzwupaJ21AwaOSau6Y9VJ7
 ATJJ1nDgjMXHPjK57jA9/i4ANMcCL7StUWqpYbVdYcAq6/upW7CS0cUo1LGG8GXIowBU
 oFtgDcvLz2e2d1h1LQ6B5LLWMNfnGBsryJ07yiVtellcNQnyIEoqudJJJ98wEtM/UOYg
 iUNA==
X-Gm-Message-State: ANoB5pmqbMhlKL7y8klUdgDU7HuN+72RKBY3YgpH2AA71TYqMe5YxgKY
 SnsPmcv8N/X0ljbnN4V1e/i8tg==
X-Google-Smtp-Source: AA0mqf5fOBE5NhPN7Xd+BTF4xDsWEodGVKp8iN4/HOQ8OyxhgwJEhznyaRqPwZeYHiXu0T46gbRvmQ==
X-Received: by 2002:a05:6512:3983:b0:4b4:f88:90d3 with SMTP id
 j3-20020a056512398300b004b40f8890d3mr23278296lfu.37.1669891098347; 
 Thu, 01 Dec 2022 02:38:18 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 k29-20020a192d1d000000b004b5138d82b3sm601559lfj.76.2022.12.01.02.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 02:38:17 -0800 (PST)
Message-ID: <382df687-c535-4dd6-125a-5f3b6022cbd2@linaro.org>
Date: Thu, 1 Dec 2022 11:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-12-a39.skl@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130200950.144618-12-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 11/12] arm64: dts: qcom: sm6115: Add WCN
 node.
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

On 30/11/2022 21:09, Adam Skladowski wrote:
> Add WCN node to allow using wifi module.
> 

A nit: Drop full stop from commit subject.

Best regards,
Krzysztof


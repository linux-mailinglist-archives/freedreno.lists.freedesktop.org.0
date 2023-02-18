Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A50AF69B947
	for <lists+freedreno@lfdr.de>; Sat, 18 Feb 2023 11:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B61610E04F;
	Sat, 18 Feb 2023 10:14:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DB510E050
 for <freedreno@lists.freedesktop.org>; Sat, 18 Feb 2023 10:14:09 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id ec30so1711800edb.10
 for <freedreno@lists.freedesktop.org>; Sat, 18 Feb 2023 02:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XlYpUpe2mvgMM93e/W7QPf63bpnY6+x3AWjdp9vVuto=;
 b=vHc8eWnXv559cPUvTjAwx4fjMkcCMs3PZaTCVmo9y2AIJhUH/Mp2yT8Pl2aIjne5Hm
 KM5BtTCbsjyE1g6mTFetLELJG5SuG2FcFLlfDE5lmVnZ9t1KhJ2sisOUBxAjaTFdBE/1
 3+SLrC/KB4z3DqbF8ibLbezZrcFMTxC86DohLdKexLBV9EpJ8UQliQ5S4Biqy1/ffceD
 B5kgjXdVmJpXyFY8lzfVNuzm3X8y+gTKXD1MR1RxR+5cFrSwBalH5q0OblIADiPaNM/E
 xSvsyeoqlLkWo4YTSQcM5VIzUyz2fqIH/S/h4hfwP+5/O6wx+dCtKD1n05e1WBaORrEF
 6klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XlYpUpe2mvgMM93e/W7QPf63bpnY6+x3AWjdp9vVuto=;
 b=yg4hY2Y2s94kCKLVoXT+FAes6cbMv4NuIEP7G6qPe7cThxPlaihOBPxQ81eopZXDUv
 DlwBCYK12aHv959kt+ZtyWL54d82cvqTwG7t4J3LSfTsTWuxRBFQH+h3nH9qpsDQ+HU4
 2rUbIFk3i/U7Gs4E2RIDYErUVZPrQUCw6TT2rG0qSbl84M6DSp4ZzPXOVRnBHqzKpwfI
 UKRVu1Rg+cVYmfTXBVfXg7iF+mM5my/YNl2cGJCj2Lm1JkyKBoe80cipN8S0/tA9iJsJ
 mo1Zm4vBjlnD8VEQNR+3Y23cKYx0q9Nu5xoNYH3f4R8UVFy9JSxrEreUMFfLNcg+v7RZ
 tayA==
X-Gm-Message-State: AO0yUKWeycdEi4otg7P6fpLyclQJAI9dg6ZSrx1nAx4N+M+1sYKJJYBG
 TksKXk6om8vWadyYDiqhK595ug==
X-Google-Smtp-Source: AK7set+3xynx3gDPCY9sAfEctMu3DjKAusUU/V/7HxqiREWds9wQjauq9fvyl47NEeCBkmqS4EqKcw==
X-Received: by 2002:a05:6402:d2:b0:4ab:4ad1:a37e with SMTP id
 i18-20020a05640200d200b004ab4ad1a37emr98905edu.16.1676715247702; 
 Sat, 18 Feb 2023 02:14:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a50c017000000b004a233e03afdsm3381118edb.46.2023.02.18.02.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Feb 2023 02:14:07 -0800 (PST)
Message-ID: <e6d397bb-dd5d-8308-eb07-3aeb2589115c@linaro.org>
Date: Sat, 18 Feb 2023 11:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
 <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
 <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated QCM2290 compatible
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/02/2023 22:13, Bryan O'Donoghue wrote:
> On 17/02/2023 12:24, Krzysztof Kozlowski wrote:
>> First, it would be nice to know what was the intention of Bryan's commit?
> 
> Sorry I've been grazing this thread but, not responding.
> 
> - qcom,dsi-ctrl-6g-qcm2290
> 
> is non-compliant with qcom,socid-dsi-ctrl which is our desired naming 
> convention, so that's what the deprecation is about i.e. moving this 
> compat to "qcom,qcm2290-dsi-ctrl"

OK, then there was no intention to deprecate qcom,mdss-dsi-ctrl and it
should be left as allowed compatible.

Best regards,
Krzysztof


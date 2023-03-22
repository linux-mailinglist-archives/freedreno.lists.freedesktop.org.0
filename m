Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A586B6C4443
	for <lists+freedreno@lfdr.de>; Wed, 22 Mar 2023 08:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1C410E36B;
	Wed, 22 Mar 2023 07:44:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACD310E36B
 for <freedreno@lists.freedesktop.org>; Wed, 22 Mar 2023 07:44:49 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w9so69189130edc.3
 for <freedreno@lists.freedesktop.org>; Wed, 22 Mar 2023 00:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679471088;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S3dGgcVJy56CLtMNjjLfSHiR4v8AC8/EHQCvrk5cImM=;
 b=Q92NDs+Jr1AUX06FcUhFEtn78+j6vJ8Wrpk9z3vu/2gvD8oREGeNCAmWEW6ljtqtiV
 keo8FVP806i0kaVPJ97c4AxvwG2+piRPwsLPj9XNdeuvrb07O7ioXdPCVguBYwwj9dqi
 KNBYAlQaAzI76INTgaOTS6WN0uhHEU7B9qJhlisFznAMtLdX8YIyoNRvG6KGjyokaKgC
 k7QVBDTs457ZVUAeV8A4UhCqZanUxJyWXGrs+FSk66lIyba81QFwop2WEGjv0NpaeMXj
 y50BUeSWJ2085oXz7E/d9z1LNqpNHTHKIf1pSbWrmY3wmN/pYbt/+qtCRUU14q8hPVDz
 3eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679471088;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S3dGgcVJy56CLtMNjjLfSHiR4v8AC8/EHQCvrk5cImM=;
 b=b4N5LGLaNY8J4YXbLvSf1aMiIEUOKO9QufxG6n2oMoF/MA0tqJkwq009OfhERiaw8i
 +KRDudbEpspbQCw1o3vUEWz4vXu28tPliXS6kMjxtj/uclqzVEPhIkMw5NWaiMDpuwpt
 Giqr/M3IZXzkmZa2vJrVFkIipakFpie9+UYeX1t6SSlVHOusp4Iv5agj9l9+rgFUjx+b
 i5wBkXIgJp1FSO5Kl+BnMGnBF0cEiVM+XALQS/H9bqYRomUnipR2dyQvkPtOxTPgwSqH
 mhjr5hptUINGGI/STxiUhqhVknJyNFZhfuEPY2EbQbSdEYfXTHuxyAPeD95fsKfPMXjt
 bEIg==
X-Gm-Message-State: AO0yUKWJv/GFIEhNYnBXHODRbGjCZLOdDHae/J4hiqgtqTzCSG2xjiZY
 X4Q1Dj/abN8fdTA4bbWOpMIAsQ==
X-Google-Smtp-Source: AK7set95apHFzo5CUdeleFgQho6O1MV6v+VQQccJNVBd2oyCWvpIun4HICXyY/p9b5uzS0geTl79IQ==
X-Received: by 2002:a17:906:1950:b0:921:54da:831c with SMTP id
 b16-20020a170906195000b0092154da831cmr1236868eje.31.1679471088266; 
 Wed, 22 Mar 2023 00:44:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6?
 ([2a02:810d:15c0:828:5050:151b:e755:1c6])
 by smtp.gmail.com with ESMTPSA id
 zc14-20020a170906988e00b00927f6c799e6sm6839389ejb.132.2023.03.22.00.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 00:44:47 -0700 (PDT)
Message-ID: <f62299b2-0140-f7a1-c307-925472e302cf@linaro.org>
Date: Wed, 22 Mar 2023 08:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230321213557.1737905-1-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230321213557.1737905-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: display: msm: sm8350-mdss: Fix
 DSI compatible
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
Cc: freedreno@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/03/2023 22:35, Konrad Dybcio wrote:
> The DSI compatible changed between patchset revisions, but that wasn't
> reflected in the bindings. Fix it.
> 
> Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


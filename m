Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3133751125
	for <lists+freedreno@lfdr.de>; Wed, 12 Jul 2023 21:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5DB10E5CF;
	Wed, 12 Jul 2023 19:24:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CB510E5CF
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 19:24:46 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fb9ae4cef6so12059907e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 12:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689189884; x=1691781884;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tuljcwj79SeCATTzgc6uDoymx0z61R4nV+VZRoJJeTA=;
 b=oZiJ//xdw4IWYEMmBWCtYEvGdZPQJpjeg2kIZrJ++GLDxXgNWXoHgR/48CnLbuk8JH
 fI8RJY6e6zH4iZUNIJxaHYPuzyIgCwTyKwMGUpu8eBc6jq9mm31v1IFRZjBD4aYor3XI
 NTaDECo5+pjPu1QD5fIbEug6wxAAaU35vunNj2QWkauR30hPdqlNfNSx7gnvl2wnh5Iq
 nFGzJ2XTx6rLmRj/DLnbilGaqvEOM70y85oU+HNRo904NmIUBboftFy9bOm7ximOHXys
 pnCZY7KLAgmEDVZUZj1IyodREq449fJmNeD5hWO+3qqVFi1Xxyjou6CxmGT2fXYrHbxQ
 e3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689189884; x=1691781884;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tuljcwj79SeCATTzgc6uDoymx0z61R4nV+VZRoJJeTA=;
 b=fVkdB/1UMv4VHfdGPBkqi+7T/iQubaQg7KnZ1KQICMd0uALS58yCz347ay4bmf6l5u
 0gmzegIZJePEbdPFB4RJQUXRSoUx48c5qKG7F+Z3S3lZX4n12S/+01Dfz0fcHIN51e5f
 sHcAgx0g8tVuzDQN0VxHrrbkkHRIrrWTCfmfCLqEiLZmbtYlpE5b9J7wcs8F7IdBByb9
 DXQjFr0LrraUjgYHBNM8Ia3ekOt/LIqrxCCRY1oPZ+oGNreYCVH4Vye7CoahL+3/c9gW
 qGsfhE8VacyvnBUqFuGSy7HvnxkQM1N3uonOISeNzZwWM5YKlN85Ghv+kBLMqZlplBGy
 ko0A==
X-Gm-Message-State: ABy/qLbuHJr4mfjIaCFvhOLiyAducSVfVoth9eADRENewzGKj4cXyiu4
 Q1wTgQcXoTptUcfOl7dASOajJQ==
X-Google-Smtp-Source: APBJJlHH9mhSup4nqjXg2f1Al0hr7uG7FxgO+71OzMqqLnsbjBcgF0gT7glYl3x2V45SA6PNZl7PQw==
X-Received: by 2002:ac2:4e0b:0:b0:4fb:8cd1:1679 with SMTP id
 e11-20020ac24e0b000000b004fb8cd11679mr18570281lfr.44.1689189884583; 
 Wed, 12 Jul 2023 12:24:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 dy23-20020a05640231f700b0051e22d3f328sm3118471edb.96.2023.07.12.12.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 12:24:44 -0700 (PDT)
Message-ID: <1a163ce6-030f-63de-fbfc-04d87a69c99d@linaro.org>
Date: Wed, 12 Jul 2023 21:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
 <20230712121145.1994830-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712121145.1994830-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/8] dt-bindings: display/msm: Add reg
 bus and rotator interconnects
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/07/2023 14:11, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there are
> other connection paths:
> - a path that connects rotator block to the DDR.
> - a path that needs to be handled to ensure MDSS register access
>   functions properly, namely the "reg bus", a.k.a the CPU-MDSS CFG
>   interconnect.
> 
> Describe these paths bindings to allow using them in device trees and in
> the driver
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


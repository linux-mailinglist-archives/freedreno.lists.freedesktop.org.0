Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D827572682E
	for <lists+freedreno@lfdr.de>; Wed,  7 Jun 2023 20:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D96310E53D;
	Wed,  7 Jun 2023 18:12:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DA310E53C
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jun 2023 18:12:05 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-970028cfb6cso1285240766b.1
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jun 2023 11:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686161523; x=1688753523;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c8LLkELG8pk1deRrNltGQ2MtkxURXpppj04DS98maLQ=;
 b=mQwtQAxpJG8jV/xuinu93mq/TbKBa7bsRoILZ55z99uqXXE5DKZVFKH7DpniJCQN1O
 JtBEzsgI5qPT30X/q0Ql60fQqMuONlqxwLiKA7rXEx8zAscuJcOUApu9ynYG/zDz8AAZ
 yaiZnamd97s2iyhRdQ6Okaql4+ryQb3SwBY4YNl7kNJ+HRy1qJPxw4WeNqJZaXWlbO0J
 8j9JXYJRVIh/WIx5MtpUQNuVjTwyALsOrfeJeyaUTiYmEkPHvxCvCXSu4pxjC2GL9bN+
 dO9tWQFuJMI96rn4DT7hGU4eGoGPA47VuIOOtE6tCe61TclepLRJE98yM/i3EPz1lMe6
 SEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686161523; x=1688753523;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c8LLkELG8pk1deRrNltGQ2MtkxURXpppj04DS98maLQ=;
 b=Vf25m4VNKRpwaxvhgupiMNwhaXP0pmg2cWDnlobUrGuIZ54YDViVPT9jZdBRk/HWKo
 Y6iOeTYpACoYx+Eb8VTAPce+AxW3evH5m4n0/35m0f20HHZyahTRA81eR30vAbqFP50v
 JgJy2lMav5voh6PKY0al8NlNlNwGon4DJSfrLjSR6n4taEH5KTjJAXN3RlN1NGrzkfon
 16RPvPRkGHWH6p5GqPgJpY9ij8QN8lYgWYDh886G9qteiYB1fdQi0U7YnyFLvz4k7Vtc
 8H2J3gwRB9Wt411aupDfSp3S0nfxjMcd7QTBTJiZiduxcY/V86XquOPAf4G7mfzFnazU
 olaw==
X-Gm-Message-State: AC+VfDykxTMsg7EVQEDplUjQM1qbnCn4lSIYHmoCh1cV/CP9zuC++UPu
 i2SziCo6xYhmEPrp+RAyQBI6Aw==
X-Google-Smtp-Source: ACHHUZ4atA66ozVYI+ahtfsSLEEsIg2F4Rpb/cEGKV9GpyA79gCHhdMvWAlwmA4CitsH2GXDKLrxQQ==
X-Received: by 2002:a17:907:7da3:b0:977:d676:d3ca with SMTP id
 oz35-20020a1709077da300b00977d676d3camr7269835ejc.33.1686161523172; 
 Wed, 07 Jun 2023 11:12:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a170906a09400b009786ae9ed50sm2488347ejy.194.2023.06.07.11.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 11:12:02 -0700 (PDT)
Message-ID: <7717cc1b-d258-4fb6-3379-05b2de27dc70@linaro.org>
Date: Wed, 7 Jun 2023 20:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
 <20230411-topic-straitlagoon_mdss-v6-5-dee6a882571b@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-5-dee6a882571b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 05/12] dt-bindings: display/msm: Add
 SM6375 MDSS
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/06/2023 14:43, Konrad Dybcio wrote:
> Document the SM6375 MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 215 +++++++++++++++++++++
>  1 file changed, 215 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


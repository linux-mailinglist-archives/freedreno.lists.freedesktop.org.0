Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2343616F38
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 21:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7352010E639;
	Wed,  2 Nov 2022 20:56:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632C410E641
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 20:56:28 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id f8so12631438qkg.3
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 13:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lXaTqQMSB6hK8loYpSwRgRTmm6tfLwGGmxbJhSSNS3s=;
 b=ytNqlRVySr85I+Qa8Irt/BNZJn01KmpooRo/NhrlHmSE/MhvYBO4rP7rpephRc1Jb+
 p6qO8uE6T36mpmpqeObh+iJHjiDk6ikhpnaWr1epir/jK2f07wCMdE9T5LtNbbFNzN0U
 FUQ3iU9PnugYigl7cT5FlpmjYHCTJv93vgQBTPdC5niTdo94POoWp7GEypDSNe3xBK1O
 AY0X5c8BqOirGBefRxcprArFwcsmw7yZ66Qg/no/KaEC1ptM5xcT8GgPEXAXU7ljsO0B
 5d59eSdaeh5b0ymolqTW2jxgUJlasM9W1ocwzBZXprq7AakMd9eRkKwGM5Zxpatud0rj
 EWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lXaTqQMSB6hK8loYpSwRgRTmm6tfLwGGmxbJhSSNS3s=;
 b=aeJVTI+JYCkOlCe6Zra37cz0MJ+dFqv/m9PXqRJORNgQmB4LT0oeH/vWPSpgc+uv5E
 +oEsmqjhUyCNmKd1wm9TAOITAokUhijt5K8BzGXETqTC2I2mP2/YdxWCQvizuYqIdUTr
 zguMq6FsuHxmGyYcePBy1yZjHEcYD+/LnrYFZgVo/2OwnpMfSic86y9/W5qfUx8MrMFU
 +nhwOr+Rg//20nhN6vVd0VxRaHtbimK96HKIHG1ONrOta4gtF4su1bD0FFXBgy3wk4CC
 jfnCgAUAVJehVKuOw4h2kDlprdPuMnchN3iJl3bYN9IXtAAUEPlyTe8jEGw2MP8BY8C9
 +E0g==
X-Gm-Message-State: ACrzQf3c9uApGPlVlbWUSWDpcoN1IBi1tRKVctzk06FkOPEHysWW4hn3
 JL1njHoGNQAXLWH0WJY74byt3A==
X-Google-Smtp-Source: AMsMyM4EeLR1tI8FzAkA5+DmybB7IVuiMLaqywlHHsJRS6oTbfaHD6FMDYMNB50p8rJ7c2S3wbHwVA==
X-Received: by 2002:a05:620a:d55:b0:6f9:fadd:4762 with SMTP id
 o21-20020a05620a0d5500b006f9fadd4762mr19429978qkl.335.1667422587543; 
 Wed, 02 Nov 2022 13:56:27 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93?
 ([2601:586:5000:570:28d9:4790:bc16:cc93])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a37f902000000b006cea2984c9bsm9138468qkj.100.2022.11.02.13.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 13:56:27 -0700 (PDT)
Message-ID: <1a3a1080-9bae-3912-d815-47b221a99e82@linaro.org>
Date: Wed, 2 Nov 2022 16:56:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark <robdclark@gmail.com>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
 <20221102184420.534094-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102184420.534094-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH v2 03/11] dt-bindings: arm-smmu: fix
 clocks/clock-names schema
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/11/2022 14:44, Dmitry Baryshkov wrote:
> Rework clocks/clock-names properties schema to property describe
> possible usage cases.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


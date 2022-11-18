Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8EB62F53A
	for <lists+freedreno@lfdr.de>; Fri, 18 Nov 2022 13:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BEA10E72F;
	Fri, 18 Nov 2022 12:43:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC02710E72F
 for <freedreno@lists.freedesktop.org>; Fri, 18 Nov 2022 12:43:50 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id l12so8022992lfp.6
 for <freedreno@lists.freedesktop.org>; Fri, 18 Nov 2022 04:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NiJMwiexjpUP7f7ZjsLLypcVQ7mNaWepQNRbw1OYtm4=;
 b=qtpZx1/UIdHoxayltqQ4wSi4b4Rfeard4Y79ULV0zSSgxeJ7phYlh4wnkyy/PjSae0
 6NFV+z60FnqaGFYXywY+OTus2kfJ8lCKPX/JkZqVmbzlOVPyGGdCzapAmCnD1n2q7e5U
 vPH8whYhm+jF63rmSUQAOOkyWWe7J0xmZz/ZG8jDgEbG61YeY2wy1NwtAZTd2GKz1PEu
 hD3EqnmNEMCNr8FuHHVeOnHYzg5FkFH7XljW+uKEW+5AqIoLnb4J02VF5cyT8vXUPasf
 977lGiIbZ1SP0gwZPGAEapXiqB3ihxehgKpEUHO2Bfu+BzkBWQtHcN2rZ57TMkjN1p/u
 CZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NiJMwiexjpUP7f7ZjsLLypcVQ7mNaWepQNRbw1OYtm4=;
 b=bmM0qGMTahE+eOGB2jRvMz4PPzhDiAeo1vkZohCwSEkeDvjiqp3CS0MOUUnoAKOUCU
 GODepJW4pTpNYBe7fCX2w86PMiSTu+4miYMAk2HOXA1AOdKAE8/Lrs65NRjzLB86PiXn
 YyXPsHwUNJwPwb8U4ItAebgDNRFb8wWFpkabTdAVKiWxqEfxul9W6kbaxW1j61edy6+s
 yxnfAGLSe9By7/KLxalKnZENcxregJ6pJ/a/gv1IG2pzHfnCGD++fbuDbTAOPcgBondq
 ELzS7qDhHEl2QE/GQYI+L4vPGalQWUqlj/GXEa7aKAYJkj17a7vgIxzZP9fESAw75psi
 PGWg==
X-Gm-Message-State: ANoB5pkBag6s6t5UOW/eOqiwlrnbSmv6H6lPDBfHdbzVkymJvBp08TS8
 rwNUrfZ3wLukxyKXtj2UPCKbZQ==
X-Google-Smtp-Source: AA0mqf4kFMQPrBQUIqNY/nnzlWJ+TlDHY1ENdLRVDtsiTkbe7Sl/yPRQ7nACIJ2NZY3PH0R/GP8kBw==
X-Received: by 2002:a05:6512:4017:b0:4b1:be16:4a4a with SMTP id
 br23-20020a056512401700b004b1be164a4amr2724427lfb.0.1668775429326; 
 Fri, 18 Nov 2022 04:43:49 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a2e7d19000000b0026dd4be2290sm637438ljc.90.2022.11.18.04.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 04:43:48 -0800 (PST)
Message-ID: <e45614a2-5c86-ead2-c7f3-cc7f0720ce75@linaro.org>
Date: Fri, 18 Nov 2022 13:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark <robdclark@gmail.com>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
 <20221114170635.1406534-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114170635.1406534-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 03/10] dt-bindings: arm-smmu: add special
 case for Google Cheza platform
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

On 14/11/2022 18:06, Dmitry Baryshkov wrote:
> Cheza fw does not properly program the GPU aperture to allow the
> GPU to update the SMMU pagetables for context switches. The board file
> works around this by dropping the "qcom,adreno-smmu" compat string.
> Add this usecase to arm,smmu.yaml schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

You already got my tag.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


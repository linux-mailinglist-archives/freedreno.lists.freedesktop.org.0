Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C53616F43
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 21:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C2510E224;
	Wed,  2 Nov 2022 20:59:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB4310E639
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 20:59:06 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id mi9so13336494qvb.8
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qYcMAtX5RNG+cAlcomaCH3MLzGY3RZqr/TOXlBcFA80=;
 b=KZmseVRrRclZFspbMULUnM4pl5+tTyavONwffZSt+tCcZaYH3obEaiJbvNGm7Dtg5t
 uC6ostsBZRlAL+lca1nUJbLPilhLtpYn31YAYRpiRcy+6afQd47NmYkgkKNntAUb8RHX
 YVpD/j82q5bLwnA37i0HowStUvWbvFfngeh0QV0w3rQ5C0UnZNgIm6QNFl4wbxF3s+PU
 FlCsHQITeeXx+tAbbMsg0ThsqGh0gNsLibxll0xQdwZdfZtEX6bRy7TjcIEQqtoWZykm
 sxU/GhEYkawx5hWMhDNxGGfJT89xmjEKS1Qa3l2ppdb5s9OAx9qtZ/AvuUB9PgXUCQFs
 I9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qYcMAtX5RNG+cAlcomaCH3MLzGY3RZqr/TOXlBcFA80=;
 b=46UhhJbFZdQQnq9bGupSo4HkVPZEfNviLWP8MgmkuFxT6ieRmYKjLRfspiwxEy8Mgx
 IlBQANXQXJPWr41RY8b+dHPsGarQ8BnqYKoWekSnsumMQksjfDrEYIv+60KGr3TsjnPn
 bEpGf4lNhhXAnrcyQUjjKw/Syp2erXtSRReCWzs7YEfVEVgQIyabGGDNzK7qNyWe8GtR
 2ieEvHc0zqiVKUqPr15EYgzJSX/skSBP7npymwLkfB+Vtqkf4apxj+djId6w0deU+/hF
 vCz2bqTn1caf1NzHL6BUNx/Czvdw4if7sXfwPcNEOu4Jup3zCmQqXn1BNqlz0f5HnF3i
 auoQ==
X-Gm-Message-State: ACrzQf2k0uzbi+LH9ZDG6RPjEuPDaokuS/rJZSmUY2NFZ+vQhXjN4O4s
 gmbcKMj00B9rw+gCmzbELb5jcg==
X-Google-Smtp-Source: AMsMyM4VzuJehisXyF5sCsBE3/Y+jG7Mbb3k9naaPHhHaEa5zWjzBEFyw6fp8Ov/Ip4YKqT8FY82Iw==
X-Received: by 2002:a0c:c684:0:b0:4bb:fc53:5ad9 with SMTP id
 d4-20020a0cc684000000b004bbfc535ad9mr14794112qvj.3.1667422745513; 
 Wed, 02 Nov 2022 13:59:05 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93?
 ([2601:586:5000:570:28d9:4790:bc16:cc93])
 by smtp.gmail.com with ESMTPSA id
 e18-20020ac845d2000000b0035cf31005e2sm7146861qto.73.2022.11.02.13.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 13:59:04 -0700 (PDT)
Message-ID: <fd6ae966-63a2-8f76-07dc-f1ed7ca076e1@linaro.org>
Date: Wed, 2 Nov 2022 16:59:03 -0400
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
 <20221102184420.534094-5-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102184420.534094-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH v2 04/11] dt-bindings: arm-smmu: add
 special case for Google Cheza platform
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
> Cheza fw does not properly program the GPU aperture to allow the
> GPU to update the SMMU pagetables for context switches. The board file
> works around this by dropping the "qcom,adreno-smmu" compat string.
> Add this usecase to arm,smmu.yaml schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071B9608E25
	for <lists+freedreno@lfdr.de>; Sat, 22 Oct 2022 17:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7567910E0D4;
	Sat, 22 Oct 2022 15:44:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD33B10E0D4
 for <freedreno@lists.freedesktop.org>; Sat, 22 Oct 2022 15:43:59 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1322fa1cf6fso7134750fac.6
 for <freedreno@lists.freedesktop.org>; Sat, 22 Oct 2022 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ju7kxtOhKHTRsfBsXg2/eTdT1+u5aVNes5dScova9r8=;
 b=t+NU1/rm2OYIOGutKekuo5Cb7LFVI4jyvbzHGZxnhEgdUfK4OIiG27Yb3cKYAvy2pV
 VTJvYTAhBPsv5eq4iySUTnVFI2KbzQLGm3jmHDFtEg0+OHQA3phW8OCiT0W085wZEH+j
 6eGJgWlG3Nkc6GnsKY0AhMoF7SwyDYTbwcFay9Josxm8RqUD267fuz58WuMaAq0iHKSo
 4hAXCYtHDAPJ3HDanYSaMEoVS6cO++4FHw4tqbjgb8jYCcjLwMW30QzCEX1rqiroJbrt
 fXh9PgXEJmW58cAdlNyUTl6vzxNQOPX2ZfUaI6Hib+57Hf0395nUIT4COzVcD+urDfWE
 5EAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ju7kxtOhKHTRsfBsXg2/eTdT1+u5aVNes5dScova9r8=;
 b=UKc9TGMoF5O9EI0pQ7CjnKgRfh/KQJodeKy2aLEpirIubjq9uR5AZ7gm5IkUJXr+On
 ACQJGbcCecUHx4+0t4B2Mu7TfJOCIMlc7OUgM59pxtMuro3ySwaMYu8Xx0YJSfAcfWK+
 1HkMugqYnBxUi6qK8gATQ8Grtak0eh/D2aNbfpFvBLE7L/ESjPqr5us9hvnZ6BLsXtxp
 z7uUfYXOAkKIhjxP2OHS+FEV2zCsld2cpHgqJxHOIkwo45BNXjJb7Z/g1ri7GlzzIcha
 X3Lf77t9QoPEeYYrGqF5L48myUE5EbUOndrWY7ble/jy1NgnuNGuBLWaBnPcmM+z3tcs
 UG9A==
X-Gm-Message-State: ACrzQf2IGMO42OICqCXUciC755VVqEgpXZwnrVE5A3+REX67PDxP95qx
 9IgKWf92oBqldlVXfaZ9sHXbaQ==
X-Google-Smtp-Source: AMsMyM6YOhCieDZR89GiEFE08pgj2Qt6dMSwM5GAwGyMbRO7gGqkcoZSc6SrRMkBjYf0g84SmS/maQ==
X-Received: by 2002:a05:6870:b393:b0:136:8cc2:ea8 with SMTP id
 w19-20020a056870b39300b001368cc20ea8mr32922605oap.20.1666453439075; 
 Sat, 22 Oct 2022 08:43:59 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
 by smtp.gmail.com with ESMTPSA id
 q185-20020acaf2c2000000b00354b619a375sm2267659oih.0.2022.10.22.08.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 08:43:58 -0700 (PDT)
Message-ID: <403db1f4-d927-bb73-8aa9-84b9b0330e73@linaro.org>
Date: Sat, 22 Oct 2022 11:43:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark <robdclark@gmail.com>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
 <20221021165534.2334329-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021165534.2334329-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 1/9] dt-bindings: arm-smmu: Add missing
 Qualcomm SMMU compatibles
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

On 21/10/2022 12:55, Dmitry Baryshkov wrote:
> Add missing compatibles used for Adreno SMMU on sc7280 and sm8450
> platforms and for the Qualcomm v2 SMMU used on SDM630 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


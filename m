Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B6169AA68
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 12:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844B710EF82;
	Fri, 17 Feb 2023 11:30:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD5310EF7E
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 11:30:51 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id j20so4597017edw.0
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 03:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v92NiBIjYWfziymAkr6wLKbvWDe+7TdVnIlek7VWKg4=;
 b=aehxZ5CykYoBS2jaabbw30nhDFy3UgG8JrMBcuCW9O+YfUDXX6pii39H9ZcsznmI1T
 qf0FIqy5nT4Vtyt1PUYw0p0mdjCqrE194s+qPTnYjcz9lOHEv0JFVI5Ft/E78PGv+znL
 tMbqplbJwSJuUQAtUvbt1K60YRqjtbk19LcPXiSL+Iz8lwR3vDrrKUgtWCyOoYdeYKnz
 iHccbkLF8IwPh0kXY67uIoE6niDS8GrW1gClhouoUQLTgDh3eo7A8H2e12XT5WR/rSIB
 F8NxsCcQc/OCfpVjei6rL8Z9wY7V3JX0fgvTzUcVD4d3Plimk8AUeQh+r3Cf6NAdf6WO
 j5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v92NiBIjYWfziymAkr6wLKbvWDe+7TdVnIlek7VWKg4=;
 b=C4VaY8VbTwpMggmkCyTVSl+jywwAonr/Hy2LwigER60XGy/8UYC799sXI2gmyl8Z/a
 4x8oYgPMxNjgwrPk0xUibBj0zwAVli+R/aJzRGrMOH5GdV0wAEPvYyq4VmktN0ri/8+O
 jhzUn4vddqD2YQFAmF1j+7mBPfLg7DgBX2PoTvAYYcunil3QCcBMpJ6jgEirvADK5rU/
 qvX+7e1II3Q9jTviJ2hMH4zWCTIUAuIcYN0jGK7YO8/sOsLMX7etsolA82GGC3D0riXE
 DPL1IM3JQ18FQr1ZH0yk8JZa8yXfv3NQUmiIWKLbgzBeDaiWpGcQRcpG+oijj9D6dN7y
 aMpA==
X-Gm-Message-State: AO0yUKUXrGr7+R/S3HcVMi2sSKvevLYki+zOUcJswWLI2Xbw9XMIh6Kc
 OtDg9yATl2tQjOPVCgP/MhdeIQ==
X-Google-Smtp-Source: AK7set9c3OK+BsvdM7YtkZ7FTNv0/+Gz+O1m241k5kxQLoB5GvCYK2NYpdilFc927EHUrqk1h15vqQ==
X-Received: by 2002:a17:907:6743:b0:879:d438:4d1c with SMTP id
 qm3-20020a170907674300b00879d4384d1cmr11441762ejc.21.1676633449765; 
 Fri, 17 Feb 2023 03:30:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a170906529600b0088c224bf5adsm2039261ejm.147.2023.02.17.03.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 03:30:49 -0800 (PST)
Message-ID: <0284de96-0dba-9336-67f2-d70b5bede8a1@linaro.org>
Date: Fri, 17 Feb 2023 12:30:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <20230217111316.306241-2-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217111316.306241-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/2] dt-bindings: display: msm:
 sm6115-mdss: Fix DSI compatible
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/02/2023 12:13, Konrad Dybcio wrote:
> Since the DSI autodetection is bound to work correctly on 6115 now,
> switch to using the correct per-SoC + generic fallback compatible
> combo.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Depends on (and should have been a part of):
> 
> https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
> 
> v1 -> v2:
> - Deprecate the old compatible instead of removing it (Krzysztof)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


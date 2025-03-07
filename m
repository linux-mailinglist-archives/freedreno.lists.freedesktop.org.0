Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232E9A5663C
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 12:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717CB10E0AD;
	Fri,  7 Mar 2025 11:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gOQFns06";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D8010E068
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 11:07:15 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5dc89df7eccso2929112a12.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Mar 2025 03:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741345634; x=1741950434; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yfDn9FH6gBIL3kasCeeYhlqgNKvkAd8JgXjYP0PTb+0=;
 b=gOQFns06i3PMdY5Ffge267GV4gedH49obqaPM4vDpFik1qJWaBPpnIlS9HbgE4hA7f
 jcqsi0a9hiTmrmascN12Ee5cox927SQzI7yOd+ZNLPwAimFxil7sialb8vqZjHHRx5vn
 mQ/3RXM39xv8+V4qNQGFaFOp5R9uW6OpFUogk/duQP60oAR6n0CiUFsZIwEByVTAtt2H
 Cba/yfo6bTfPOakQENoYsk1Fm1qqv60oB3ZzGL6wTCK/N4X4FNfq+KglkmY2Brn0+7xq
 cukrSbv+u3VZSfKLQlRKUyivCAmlrFSbhbfApwtZlv3EPTGYGTtJwmbIwzW1CNwerLbA
 ufYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741345634; x=1741950434;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yfDn9FH6gBIL3kasCeeYhlqgNKvkAd8JgXjYP0PTb+0=;
 b=RmkTfMzd6qII3EU+5kHwWyrwXZjwZiS6CJlZE5QHC5RXPuBjNKSi56W50ALhf2flu/
 SlukT0lshy1tDzeb5oqWXLUlrMfBKvzYvu7DmPnYdOUj+wzld/ZQNZCmmExNd1pPBeQH
 WPaagI7YD5LWVii0NjsHC5JguxGbTRJFCdzyKICf3LVQJSjrWFw8RRXD6JJEHfETZlye
 EZV+nmgvc/x4wz+V404PCQ9lgiiM8bWOQHgvab2LoWsG+ZShnBrwe0aVa1np2mTeNJnc
 gjCbYRdIBWbW7nz8x14WZmAuqTPdRlAUGSuHL0OS1muc/AWPjZfsWNoObZOwTWOZHIkh
 aPPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6KoKm07qkCOGPfFEzD91j/t8Diavn9rpLy5QX42vgCIQDtCSYEUDrhd7KKvhEFUfaSL3sLflLdms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpp005P7kAhe5fA5KqYExenPQvAaPJqhBRyQM3GS4lFViyGIHB
 lQluCIBN8SrOTU7K37gFNJkyLHvlgY0yc28U5wVeplM1AbSPNZ8JZX7bgdW7Ds4=
X-Gm-Gg: ASbGncsE1pwfeh8JQbvM3H6tV9ERjO2CKV5Ae2VzWCd/ZX/nadDeUorNxiGOP6ZsBLd
 gT/udyGolr7YyZm43Uh5zjQ65h6jsqSu5iUwmI/WBwABn4cvl9HX/Ks7NyeK5zD/Fv46DwwpS9i
 uRCSldOLtR2WIvhmum5N/uA8D2PONXqdpSBLRQErOo+2ckTQFqR9DXCY5UTfUqiYUEjoAkqelGP
 /xtRqR2z1ZBZ851FqcVXSpWuoQDQ0ey6xW8+Ddq4Xmhclnr4RLEScFbJECPZQp3BgNeLF5k1jRz
 HxfOcvYkfiUuitkEjMjnn7qRo0rPo/07OcThiUAT/4UJ48EUE8lk
X-Google-Smtp-Source: AGHT+IGgkdI1f8j3o1gNtZn8e4RQmGqfj9SGVx8IYAmQaeWhqRp49yPnbjkO8kd42BMMr1gZ+zPEWw==
X-Received: by 2002:a17:906:f59c:b0:abf:fb7b:8d09 with SMTP id
 a640c23a62f3a-ac252ed8b2cmr349617466b.51.1741345633855; 
 Fri, 07 Mar 2025 03:07:13 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:c140:2ce9:b81:70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac239481685sm264956366b.58.2025.03.07.03.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 03:07:13 -0800 (PST)
Date: Fri, 7 Mar 2025 12:07:07 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <rfoss@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 03/11] dt-bindings: power: qcom,kpss-acc-v2: Add MSM8916
 compatible
Message-ID: <Z8rTW3fQObiZ7del@linaro.org>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Mar 06, 2025 at 07:11:15PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> MSM8916 seems to reuse the same hardware as MSM8974 and friends (for
> whom this binding document was created). Add a new compatible for it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> index 202a5d51ee88c7190805efe8f1bf493bdb69ec45..27dae49163fa0790ceb6fda8a5c674f739d4a41a 100644
> --- a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> @@ -18,7 +18,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,kpss-acc-v2
> +    enum:
> +      - qcom,msm8916-kpss-acc

Hm, MSM8916 doesn't have a *K*PSS (Krait Processor SubSystem), it has an
*A*PSS (ARM Cortex – A53 SubSystem, or Application Processor SubSystem).

I think this should be either qcom,msm8916-apss-acc, or you just keep
the qcom,msm8916-acc we already use. I'm guessing ACC stands for
"Application Clock Controller", so it would be unique enough already.

There is actually a patch from Rayyan already with a R-b from Krzysztof.
Maybe you, or whoever is responsible, can pick it up?

https://lore.kernel.org/linux-arm-msm/20240710155226.130086-1-rayyan.ansari@linaro.org/

Thanks,
Stephan

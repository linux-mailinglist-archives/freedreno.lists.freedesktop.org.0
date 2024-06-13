Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971179069BA
	for <lists+freedreno@lfdr.de>; Thu, 13 Jun 2024 12:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC7210E9F7;
	Thu, 13 Jun 2024 10:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PQd92tdR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E18510E9F7
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 10:13:20 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2e78fe9fc2bso9463251fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 03:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718273598; x=1718878398; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6UhTMrFvQBB8mfMQ4c+fd/Ifc6ucfhQNCFOCAgSgYQ0=;
 b=PQd92tdRTzN2pYvW1uRjIySwkVB7g3bfm3FFjSbYypnTYXgvVLi/lkN9FlYIeFqiwR
 k4lcp4xf+TYvBEbVEPkJu66z3sEBrayvR0NWoS2y4DwILo0C7pFwm4oIOdTGkKP/iXFL
 IuD8Ku6DUprYb/gkhtQeWef/7B8b8UQRYKtd9W2qrF+pSBz2jOpizrFM5cenR50WiY4N
 r3rJmRcPsyD6UjUG4BgFLtxPuw8v+hFz3tPJCWX/IC5dpOWgLilYY/jPsFQFdGBoIH6G
 Obvwk6wknDKK10fkLnhWkekfwqKzmpBD+gKj/LvbNIBfvBRSnHBTnT5IK/YpGPpmuu+J
 mnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718273598; x=1718878398;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UhTMrFvQBB8mfMQ4c+fd/Ifc6ucfhQNCFOCAgSgYQ0=;
 b=I1Wgj9mCAwBUPjAJjbc04MYOFRGYdSBm634O+6NnTA2HpGRr1D2TLm8SU51v3DjaLR
 jyEXZBrfGEqUEdf3cvolFAilKwmLy1M8P3NMYe11vxdx2qnDnNF9QBJWuNtf5PyD3/RB
 4JvVww1ScteP9ZdojGsupf7S6MN+A0cPCevhHhissDxfAopniGBsOPyUCkr421wGws2C
 e1o5KWddhgVfXNifmXzilRDcruM4gUN2qyjmymrvb7l1oUxPUHVV3eIApyILo0+4V1gN
 tbkMwF3IL8r3utZqyl66hdotNLpVkmxZFOQlNitO6lyuAejdqAWsN8vqPSTnob4CB0Ph
 lwKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQOakr1aMrCsgR73YKJxIVB0lrLLYWggvJCZ8po4M4CDyRmO/2huxh+BUizPC0fz59gdeiHCmYsKxNfTXP7MCrGqlBqImAd/hA4xWg+/n3
X-Gm-Message-State: AOJu0Yxkaobk+7yZfrLvgAjBCiNsouek855qLfbP61QfAMAJQX8jlUKC
 rzX5Pesbvz7F5Wlnx2iYP8TkvmPeti7iBiobal/HK3OE31JyWe1PZSW9N3SvjHw=
X-Google-Smtp-Source: AGHT+IEqZFp6DfPOGQtW9vNfCAckczSMPw7RWxGa/vCjp53axsK6Fln9qoOgp1dvliTR80CJljmHPQ==
X-Received: by 2002:a2e:88d2:0:b0:2e2:2791:9842 with SMTP id
 38308e7fff4ca-2ebfc9aa3dbmr23103601fa.44.1718273598106; 
 Thu, 13 Jun 2024 03:13:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c9ac5bsm1561941fa.134.2024.06.13.03.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 03:13:17 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:13:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Danila Tikhonov <danila@jiaxyga.com>, robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quic_rmccann@quicinc.com, konrad.dybcio@linaro.org, neil.armstrong@linaro.org, 
 jonathan@marek.ca, swboyd@chromium.org, quic_khsieh@quicinc.com, 
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: display/msm: Add SM7150 DPU
Message-ID: <4xqa6u3jh6z7zdfaamxl3jpucfymznxmd3ezhihgfky62iifkc@bdslrxujahxc>
References: <20240612184336.11794-1-danila@jiaxyga.com>
 <20240612184336.11794-4-danila@jiaxyga.com>
 <0e7bd7f2-b445-4a59-b456-8d03af121a8e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e7bd7f2-b445-4a59-b456-8d03af121a8e@kernel.org>
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

On Thu, Jun 13, 2024 at 11:23:50AM +0200, Krzysztof Kozlowski wrote:
> On 12/06/2024 20:43, Danila Tikhonov wrote:
> > Document the DPU hardware found on the Qualcomm SM7150 platform.
> 
> In general, this should be before MDSS, because it defines fully the
> compatibles already used in the MDSS schema. For multi-binding devices
> it always starts with children and ends with parent/top schema.
> 
> > 
> > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> > ---
> >  .../bindings/display/msm/qcom,sm7150-dpu.yaml | 143 ++++++++++++++++++
> >  1 file changed, 143 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
> > new file mode 100644
> > index 0000000000000..1a44cad131a72
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
> > @@ -0,0 +1,143 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/qcom,sm7150-dpu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SM7150 Display DPU
> 
> What is DPU? Such acronyms should be explained in description or
> expanded here, if there is space.

Other bindings here use 'DPU', so probably we need to fix all of them at
the same time.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> > +
> > +maintainers:
> > +  - Danila Tikhonov <danila@jiaxyga.com>
> > +
> > +$ref: /schemas/display/msm/dpu-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sm7150-dpu
> > +
> 
> 
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

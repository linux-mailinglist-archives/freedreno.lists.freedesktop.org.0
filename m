Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1278A855DEE
	for <lists+freedreno@lfdr.de>; Thu, 15 Feb 2024 10:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9E310E4BA;
	Thu, 15 Feb 2024 09:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="myZK+Ouo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2F910E4BA
 for <freedreno@lists.freedesktop.org>; Thu, 15 Feb 2024 09:25:45 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dc6d8bd618eso569008276.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Feb 2024 01:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707989144; x=1708593944; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ut8NlXOEY0y/ncuagbllCtcYDmgG86ebbFIp8z5hh8U=;
 b=myZK+OuoyJSt7huTBBWMU4RB0TQMvvSqBqwIG/7tUtkbSaNQcc7Zl9VG3gH6gLZYBV
 v23gfQuVVML9Bfie4xXibkPzKNZaEGgcZh0pStM15lRCs5vbHAtkB3N1U9MAPr3fQaXe
 RcSaanmF9YuS67s1yn1/i4w3adGEUAAKqHLXdSfFRAVQj7kAqbRzk2gdf4WkRxbElMbS
 CUlnlSDE1UVc15MC9UKxBZv7yWXGlCOdbEmsLwubx1fhpLTMqkc16Kyo5TH9umFG1s5T
 ETV6JF1bj6toPGI22g7n4P44CSmzoQh7ZiS2J7meP2x4EtNWtHSA8aedLT+TmQLnM/jO
 ibyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707989144; x=1708593944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ut8NlXOEY0y/ncuagbllCtcYDmgG86ebbFIp8z5hh8U=;
 b=QK8jVJuSmdLaAXj7CbD/+n6bG1vyQq4yX2sqwOV8AYfuSfJPSmEI6qWvagU5ReMH/p
 6Mk+Qm2HWb2w6oITqigP3/DFbE5AXIDzaCHVsrUA7jKjh4OaCRKRUgVgNC/xq9UYGAp4
 gm07BSmhKKNtEWf3Sguit4CIlvX1dugIzbQOkl7ZQkyiFJyAlUdFj+0Y+2Of4PDphaP0
 z/Av7j+03M3YaiEn57RxLSftTMfBiri6Tixbd0Zts1DBGixeeT9/+Og3BMSmBcmKiUPH
 mHO1cNQfSm2jlS0eRAQiM0vPTHVVoIO6kB08jLIgR6GS/jLM979u3d7SpTf2jIya1pvz
 /smg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKOiK2x9s5hDwE5M65FpH/LTqbFp/IBS0lWxBGD81oaOaqW4LTKhr6Q29UXnjlZW05C90jGI+JyeGDsEkOLHxnkQKf23e3jLygtrfIFpL4
X-Gm-Message-State: AOJu0YxDUgDzqpglTG5REuVOWxvlWLELPv3djgbDdJwOW08A40dZ3jQo
 OkD/m48rHDPC89DR2QcSPRELmScttu4Bu6d12J8naMrTdAsTk4OaBqJdaugfFjmjhQPXn1U2KvR
 u6Er8Tdx8c1zGqFObrV1AqjeIB61FEdf2eJP2Og==
X-Google-Smtp-Source: AGHT+IGK2EB5aTs8BfG4jSsckxgl2EOaTmuQv0ycjxUuZs5Mb4QsZ7LrFpeHU2Kn6y9+s5eezLpdwLHcymkVAR1BGTw=
X-Received: by 2002:a25:7447:0:b0:dcc:273e:1613 with SMTP id
 p68-20020a257447000000b00dcc273e1613mr1232044ybc.40.1707989144074; Thu, 15
 Feb 2024 01:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
 <20240215-topic-sm8650-gpu-v2-2-6be0b4bf2e09@linaro.org>
In-Reply-To: <20240215-topic-sm8650-gpu-v2-2-6be0b4bf2e09@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 11:25:33 +0200
Message-ID: <CAA8EJprpYEhGi5b+uWGWtOa+qbSwUR8C0j9NLC+ah_-nvy-=Ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: arm-smmu: Document SM8650 GPU SMMU
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 15 Feb 2024 at 11:20, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Document the GPU SMMU found on the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index a4042ae24770..3ad5c850f3bf 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -93,6 +93,7 @@ properties:
>                - qcom,sm8350-smmu-500
>                - qcom,sm8450-smmu-500
>                - qcom,sm8550-smmu-500
> +              - qcom,sm8650-smmu-500
>            - const: qcom,adreno-smmu
>            - const: qcom,smmu-500
>            - const: arm,mmu-500
> @@ -508,7 +509,10 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: qcom,sm8550-smmu-500
> +          contains:
> +            enum:
> +              - qcom,sm8550-smmu-500
> +              - qcom,sm8650-smmu-500

Doesn't this cause warnings for non-GPU SMMU on this platform?

>      then:
>        properties:
>          clock-names:
> @@ -544,7 +548,6 @@ allOf:
>                - qcom,sdx65-smmu-500
>                - qcom,sm6350-smmu-500
>                - qcom,sm6375-smmu-500
> -              - qcom,sm8650-smmu-500
>                - qcom,x1e80100-smmu-500
>      then:
>        properties:
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

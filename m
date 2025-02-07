Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EADA2C98B
	for <lists+freedreno@lfdr.de>; Fri,  7 Feb 2025 17:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11F510EB85;
	Fri,  7 Feb 2025 16:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a5uze581";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0835B10EB7B
 for <freedreno@lists.freedesktop.org>; Fri,  7 Feb 2025 16:58:29 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6f7031ea11cso22690347b3.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Feb 2025 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738947509; x=1739552309; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=27oFQYf91Dloj6jyxwrUr7dxmGXERcb1UW6tbtKiP8g=;
 b=a5uze581Uiw0eDD9AHtp7xoSQjSxLDt9PMIzP1E2LK/LmnDb55uf2O/FtD8EQsy8wG
 tkctNHRSAp7zN4ZfMPJ5eit+39x6PCNbWjKSm+R+xJ9ggvJzolEvObChaZccARNanTpA
 va09yANs2Vlu8v1Xjm/s9wm1QCKgDvIqjOxvLV9s7mJ/7byvwsXRbcERoPo76yvg+P6J
 /xa3Z7pr91aL0eVsBZ4V2Ap+3Pi7YXOrlqz4yWjrposQDQGoe8C9q0VI+vFs1Ue+sO98
 C4FDNfizGylrB+ayyT7cHcmSTF5sAoHC88lxnFILxRemo/PZPLH9wpQqX0YZXBLVwal0
 gr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738947509; x=1739552309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=27oFQYf91Dloj6jyxwrUr7dxmGXERcb1UW6tbtKiP8g=;
 b=gYVkAwHknNw10U1U0LPl1uaSMcVAsZga6j7wInOd86NmNJw4N6BPBRKRT1p0cATr9l
 6+Ck9wIJf1LlZ4ZhsA+ABbFWUQdoj/RQ2+ddOjnSjDJJw/KHtzBkiUdnIEPo94flbixo
 OF/B4KSSp2I4RByuuYd/At5KBrPtin1lm9XhD9czXh6jnS53r8kT/yUkDQZlweC9w/DZ
 nfeG2fKJov5vJ578HdRTeqO8Vf6oB7Bb6Miz3TKynZDMkgyPq3+sfQpzopG+A909thw9
 kaZeUST9sjQOLEfwQHGs14k9S7HBwbVLoBUyO1A9MrI2DWIJ7t+BxyBV5xjlFaqa+q+6
 0feg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGDF719t65/t1mfOD4+reNKPHdre1a+nuNu7COI1097/+AoYUpd95xggNOjrz7U3V/B2mUkWeS9AQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGv1L5WLlf/Tf+xq+y4g14+74PKBata/PQEmGsYuuYnxzlR1sp
 GBZBQmLsm36CIvrATSpwdTfyoQDLRdRiuK4JnWCnErja7f1Fx0G5p5VkwTRSYH6r25Gh1RavV3/
 Fj5VvK00iQ2q8w1PZBNui4bHxJ+txA0+A/grTPg==
X-Gm-Gg: ASbGncv66GSexUKsGwHL47TqaIxXH3VJa5uelGwvqY/CFegRjzRHVBXNH7bGaEoEBDX
 OHF+55/u1sgNYkdaoQZtdoEj9s2fX8fbjextFETmygapq4Modu5VxdLoU6YZC96+epCP7Lqg/2Q
 ==
X-Google-Smtp-Source: AGHT+IEu4Hyrf15nRFOfu+/0wIU/F0sEzYBhEg4wPUS8216Hy1mszoPNBAKnenIT6vKlzaVZSszBdgs4MWDyXS4Mfe8=
X-Received: by 2002:a05:690c:350f:b0:6ef:8296:359d with SMTP id
 00721157ae682-6f9b28ceac3mr39041717b3.22.1738947508975; Fri, 07 Feb 2025
 08:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
 <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-2-852b1d6aee46@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-2-852b1d6aee46@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 7 Feb 2025 18:58:21 +0200
X-Gm-Features: AWEUYZmBPR-J1PCz9MhgEjUk9CeBfh40TL1EHs1HVsEe3GRaQwWTHGmL1C1gm5Q
Message-ID: <CAA8EJpoLnHfOEH81U=fKuL1vOvZss8+zYRFstXp0JZLQy2OX+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: qcom, sm8650-mdss: only document
 the mdp0-mem interconnect path
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, 7 Feb 2025 at 12:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The mdp1-mem is not supported on the SM8650 SoCs, so only support a single
> mdp0-mem interconnect entry.

No, please add cpu-cfg interconnect instead.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> index 24cece1e888bd35f169dc3764966685de4b6da1d..cee581513c519924712c7e0fc055099f886d0a99 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> @@ -29,10 +29,10 @@ properties:
>      maxItems: 1
>
>    interconnects:
> -    maxItems: 2
> +    maxItems: 1
>
>    interconnect-names:
> -    maxItems: 2
> +    maxItems: 1
>
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

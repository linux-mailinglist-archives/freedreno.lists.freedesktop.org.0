Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1ABA2C98C
	for <lists+freedreno@lfdr.de>; Fri,  7 Feb 2025 17:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC9010EB86;
	Fri,  7 Feb 2025 16:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A4SfuGgk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703D310EB83
 for <freedreno@lists.freedesktop.org>; Fri,  7 Feb 2025 16:59:12 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6f77b9e0a34so17864367b3.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Feb 2025 08:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738947551; x=1739552351; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JKMHSngceKWhs09nWrQfjUrr/IL4+HaHfvztvz8mcLo=;
 b=A4SfuGgk9EGptc0u9+DvzbZw/NoNy6JC93s6VdlSa0imWEEYKtobvEBJHr9/ozYa3C
 9L7rbCLoKaEc/9MszSteTGVW6orB2kqNtYQDBVNJlwUxYW7tIPBeuy6Wp8JHce9uFJSb
 Mojasni8FMgozRjEMR+6t4QAc59yXzGMhy8YNhnOsISdAB1UvpeHENAPcN49nxSGxMjB
 rbpkz4iOF/MVAnT4wcAiwjZUNbgHjiNwXsACK1v+skp8QDRcaqij/X4MR10tF94Yo9/r
 KrWbD+aBn1kJ16mp+Rbize1+9+U3WyGKpTtBpOf4QBQdN2FnPZAvN+tTjAYABCV1n4My
 OiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738947551; x=1739552351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JKMHSngceKWhs09nWrQfjUrr/IL4+HaHfvztvz8mcLo=;
 b=rXWXHZ3K0NtVgvP1JA3ZUIVhF9wAVWxC5XeJOIgqJzevMoiWQYuoXT6AtlF31TA51X
 ocBNGKts2zX9dovvcuCUB4nPvqZD481y80VhtS4JBsCOWVWF7HiRrL/kwcdFhcpu06SZ
 xRQBrrdu7H0Z3+urxZ7NRvGNyr6nHNyF4TBOUlKpza7uSfCqxDYch52kVidJt85G3k2s
 NdS/Ol4llMu5wD3K1d4OaQ7Do+sq0yrCILvs34bZX3gA7FYvpSfWWq1fOR8NvBTZ52ES
 N6dPacHbwl+CsTYVMGB1WYOyS9VoRSftqg6YTprDlxDDFc1YbrpWlawgngq5LQFSTqAq
 N+lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvryaVXEWCNAT3YFfBQR+zFOJUFlDmu4JT3f4qrWp5s9C4AnyqlNeNHxVdoLauIjQ9GOK+CEPrPi8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHcpT4/afm0Aa550XeAoUwu9uZGA/TOsbicSKRkJHgbG0gWksp
 Dt5R4q/EHiyvLedI4ggcZb5rbDjwJZXgCDuo0ynlp9lMtmCxm+XPojMYvFMYmnFFUM3eDPwRObX
 hDFhWXHjEH/8FstqCBUF1uDs8XeKgXIW9Xej4VQ==
X-Gm-Gg: ASbGncvQ48Ym4GHYVSNvzsPFDO2o1LrqaabAwQoCYSU4IsStUPL9hcjcUdi5sdBf7F2
 IyeNxVjN/OJU6cKqfx3eB5y9gasEtM/ZpUAagBLKZaeXYSSno0gnXpCrCxLK8UI21t0dcf3y7Ag
 ==
X-Google-Smtp-Source: AGHT+IFbaQfX0T9itZHt97XrDniKr0h1sCRIXUebFUDmityl/mM6edqe+O7q6s7rU645tsgRdF1l7Tz+EiLmeIjEZ1c=
X-Received: by 2002:a05:690c:7307:b0:6f0:237e:fc67 with SMTP id
 00721157ae682-6f9b29e583dmr35319597b3.23.1738947551532; Fri, 07 Feb 2025
 08:59:11 -0800 (PST)
MIME-Version: 1.0
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-0-f712b8df6020@linaro.org>
 <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-1-f712b8df6020@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-1-f712b8df6020@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 7 Feb 2025 18:59:03 +0200
X-Gm-Features: AWEUYZmNMwbk9eX4OjrXiHrM-Aq3WX39qLfKyYBqXNZ9vycYPBQwR8HodH7ba-8
Message-ID: <CAA8EJpq5bLTfsEBPNzJ9z+KV-oXerr1y7g72A5eWbotSk_Nrzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: qcom,sm8550-mdss: only
 document the mdp0-mem interconnect path
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

On Fri, 7 Feb 2025 at 16:02, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The mdp1-mem is not supported on the SM8550 SoCs, so only support a single
> mdp0-mem interconnect entry.

v2 went too fast. Please add cpu-cfg instead.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml        | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> index 1ea50a2c7c8e9f420125ad30a80b4ebd05c9367a..9631fe11c152449f3dfa0b8f8f53feeba721c950 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> @@ -30,10 +30,10 @@ properties:
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
> @@ -91,9 +91,8 @@ examples:
>          reg = <0x0ae00000 0x1000>;
>          reg-names = "mdss";
>
> -        interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
> -                        <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
> -        interconnect-names = "mdp0-mem", "mdp1-mem";
> +        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
> +        interconnect-names = "mdp0-mem";
>
>          resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
>
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

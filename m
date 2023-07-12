Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF940750A9A
	for <lists+freedreno@lfdr.de>; Wed, 12 Jul 2023 16:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334A410E549;
	Wed, 12 Jul 2023 14:16:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D159310E545
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 14:16:06 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-992acf67388so809662366b.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689171364; x=1691763364;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TtG6m9o3iIqHX2GRVgiObV3lAn01QmFcYVaWn2hSYUI=;
 b=LKIe5TTNimGx4RiYenJa9Av9tUfXqamiQ8Wa+51QVNCfGsEdH8FfEkiJqa/IOCPtbf
 hujSBypqdhaAjZJphywKYLcqdQP7fiJmwF3WO7X1IK6wU7JF3khXrtSSJIGjVBVY4W7p
 ohohbdDnjbKB7IbVUzfHcYAsd0GAsFLGhfsZNzzXfTzShYxWEZy9lxe5OfU1brbRWbNX
 pcLrXV6U9EVl6IB+bbhEiOlLd4ULQuxpMq5WJwLEXR9j3c1OZQLgYh5X0O74z5owkae+
 /RzirOx5Ke9YGc5KtwuF4K/9g67s0yTet+al5Gvxbyrxt29bC3Qs7joGDbVD7h2fDndy
 Nj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689171364; x=1691763364;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TtG6m9o3iIqHX2GRVgiObV3lAn01QmFcYVaWn2hSYUI=;
 b=HULZq54kUPlZKbjOuVX4ixC/e5C6z6qWg0Olkuqd5MMcmcCRyg6q0OU61HJMx09kZr
 Qgku4NjZ2s+CNo0mMVsMJcb5eQu6RMML1oBjHd5BcFm2TznkVf1D+5qpRxI8jLVupywd
 H/glVV2r7NGYufNX5EFcMe6+VJZqmBJEF3GFuvYfivWCBsHK53cRedeht8whNmFY+HvU
 6oOgxUQ2rdyKiQFJKr9kqx29O6S6WHgypyOGqeU2X8g7sP8uA/lp7AL3XhOxNMW5DGEx
 3uMG2XT+A4MXxCLIKFFwIVRAApyqreL0A+wSd8LOkYIrcujgIbR92ONRhbfJcTsoZ/RW
 qXPA==
X-Gm-Message-State: ABy/qLaJZGQH/zFASY8h8f0s7pA9T0tbEuk7QCPcZT9Q1kXtZMPl6xFa
 YtchxsQcGrHm1l/lTVLz7ftw7A==
X-Google-Smtp-Source: APBJJlF9zV63ReZ5T527j/HCK7KAi/1kDcj/AbscFKY9q2fd/lPJoYpuQms4EEa6/+GbYOtHGIhKEg==
X-Received: by 2002:aa7:cf06:0:b0:51d:f37b:1b5c with SMTP id
 a6-20020aa7cf06000000b0051df37b1b5cmr7443937edy.23.1689171364390; 
 Wed, 12 Jul 2023 07:16:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 e13-20020aa7d7cd000000b0051e24284fc8sm2835440eds.12.2023.07.12.07.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 07:16:03 -0700 (PDT)
Message-ID: <c3ea2043-5d02-3a6f-ecb7-fb90d989bc6f@linaro.org>
Date: Wed, 12 Jul 2023 16:16:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Amit Pundir <amit.pundir@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230712130215.666924-1-amit.pundir@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712130215.666924-1-amit.pundir@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/2] dt-bindings: display/msm: qcom,
 sdm845-mdss: add memory-region property
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dt <devicetree@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/07/2023 15:02, Amit Pundir wrote:
> Add and document the reserved memory region property
> in the qcom,sdm845-mdss schema.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>

Please keep consistent versioning, so this is new patch in v4.

> ---
>  .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml    | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> index 6ecb00920d7f..3ea1dbd7e317 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> @@ -39,6 +39,11 @@ properties:
>    interconnect-names:
>      maxItems: 2
>  
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Phandle to a node describing a reserved memory region.

Your description says nothing new. It's entirely redundant/obvious.
Instead please describe what reserved memory is expected to be here.


Best regards,
Krzysztof


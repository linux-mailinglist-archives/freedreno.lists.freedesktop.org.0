Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F0475095D
	for <lists+freedreno@lfdr.de>; Wed, 12 Jul 2023 15:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B24C10E529;
	Wed, 12 Jul 2023 13:16:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139E110E529
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 13:15:58 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b72161c6e9so9577071fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689167757; x=1691759757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dn4rYyKdwTQMplFvM1YHg3Gp1VPxwOyOuPdjDZ4oTQs=;
 b=MjXeUH9brINWRIL75SFSSvwFmVJG2jUS3gyV+2SmtbAKX/SQCvWGhRcT87fnTJmuiE
 yMG3yUecRAAinZBdsfwGWunFL90IVP7OCaKSigAJzC66J5dq7lKbBHSjx0ts327vTI79
 R6FrVsk6YWv4AUH45Vs+/hBbxAW4p9zlnVgkrsZCdNnZ2D2Rx4CM/y6xd3AyNpSg2Ghk
 ViLO6OpihgDYF0R6FVEYVrhdXeOw0bOWgdZlkK+WA7ZX8c5gpscpLSWQhMOtt1yEaBUA
 PfmaYmejlQt3Bhy0/On7Mv5QoUuB82vM32cdVkduN+DbKN3fPzntcD8r3hBE8SqLn4vS
 Z4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689167757; x=1691759757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dn4rYyKdwTQMplFvM1YHg3Gp1VPxwOyOuPdjDZ4oTQs=;
 b=WfBKPmkQdRgnd3y/P8fh1uo+YWJx3kmwKPcmsfm4NSpBKll5eVW0lIShfKApbzcsKK
 rtRb9XQ1GWDltEZpxAbfiUtdRBkHbqRp2kxT/Bbhtg0cBtzWsl9S0W0immvw8R3ESf+o
 b61lahPedcmxGA2/aKzLG2D0h6gnPE1iOSkkZw0FXz8EDFh3oT36i4ICuRPJW3l70VSn
 1vyV0flwSqSdeKDoGP9MOlEzOgIHCavKB0cXug9MWG8kcmOU1K0IBOjkDVjcjlBY9bc4
 3TXRbZkW1IKzTwPOXEd7vjz2KzT+cZIJhv12rK8Bh0NpHzy9ME9VwAP2mhsyiNa1Z0gt
 j3/Q==
X-Gm-Message-State: ABy/qLbF1PotRPW3yfNi+nvfS4846Yrqw4Imd0EPN/Hl5rKNc07pgmLz
 jciMSQ/wLpg2grIcdmN9J9eo0w==
X-Google-Smtp-Source: APBJJlF3SgFBdLW73ntgGd2gci24bmcZ/SHaaJOixefWrDQ+G8QUUfyYVuY0X5Z36wtyT5cVzOllFQ==
X-Received: by 2002:a2e:7d14:0:b0:2b6:d0fa:7023 with SMTP id
 y20-20020a2e7d14000000b002b6d0fa7023mr792416ljc.24.1689167757034; 
 Wed, 12 Jul 2023 06:15:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a2e8049000000b002b6ebc61e85sm962698ljg.54.2023.07.12.06.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 06:15:56 -0700 (PDT)
Message-ID: <3b677200-a201-680b-391f-fbf73064496a@linaro.org>
Date: Wed, 12 Jul 2023 16:15:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Amit Pundir <amit.pundir@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
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
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230712130215.666924-1-amit.pundir@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/07/2023 16:02, Amit Pundir wrote:
> Add and document the reserved memory region property
> in the qcom,sdm845-mdss schema.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
>   .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml    | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> index 6ecb00920d7f..3ea1dbd7e317 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> @@ -39,6 +39,11 @@ properties:
>     interconnect-names:
>       maxItems: 2
>   
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Phandle to a node describing a reserved memory region.
> +

Please add it to mdss-common.yaml instead

>   patternProperties:
>     "^display-controller@[0-9a-f]+$":
>       type: object

-- 
With best wishes
Dmitry


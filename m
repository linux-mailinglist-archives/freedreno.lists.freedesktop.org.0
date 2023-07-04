Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86A8746BDE
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 10:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B17B10E2B4;
	Tue,  4 Jul 2023 08:29:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E6810E2B4
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jul 2023 08:29:48 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51d93425853so6010243a12.1
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jul 2023 01:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688459387; x=1691051387;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nSydRmjgws15bedxlErnljNbotaBQn+Lbon5YDX6p44=;
 b=SwFgQHSvuSl1/DEHWu/vKT9xPNWOMD9kYSXxsFEdq2Bu1SSTPFLaYLMwBuuXv/6xU+
 TC5KnjiNEYjYPvBprtpThRKC9aeHzF2y7iEh47MBa5JRXQkVWhSVFW1qOj/s9A/dYbuz
 WdAhApzqqj6oLXLGeFcQol1FenabtCfl99Ny0f+ZvVaeSj4SfFdHEyI5i8TxwUm/DeVq
 mJkLPkD1J1zhZJH7eD7JzxP45xTDVyU/9ablIfkEDaCogUFW5ygML7q5RIRhoCLIMunX
 MIOn1NelXRZnT1ZFEfxNgVBffQKiF3SlBaU74KqzC8sz2xQzSdJ5JO5DWkSzDqeA0mZw
 QR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688459387; x=1691051387;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nSydRmjgws15bedxlErnljNbotaBQn+Lbon5YDX6p44=;
 b=GB9x0f5YRGjJInuh8rx9/7elcYluJhVq7EgWODyYVCWV7DtCn7PvE8bwC9hBwwBX2P
 hr/xBu2JQ2XaDqQy6wFmEu1ZOpGhrruVOK/gfXWUXpzMPfTJnSwTkmovQznT/cGvPjF6
 pTGI7bAeVEXtcUENt3pAU5y8O9iC4geGgbbDotY0nd6PDqE/ZDVe6Gx0TnNM7nW91+o6
 3pTqwY+Lr8lymbVMJHG32NOkLUmdObrHBfo8ad56PEkxE7YqDD41zTvTjJfteF7h05/K
 IdGCL1037AU62QK2WKnnvN2sIustLrOvVcnLCcyksJ/LKmSbE4jyzlQPhqknAeyDggJ8
 o7dw==
X-Gm-Message-State: ABy/qLYFF5pRkdlg4TDouYc81TTkOntIxtNvRa2UoXmSFfxTlvvngeEP
 AJsX26GMF2SPrSw9AGNACJwu5Q==
X-Google-Smtp-Source: APBJJlHW9oT1caeFSgmLOSMzk0XFqnO4q4Z/spxGyuonofeoCOXIDrcjbbQr+AwH54okYEESIpe43A==
X-Received: by 2002:aa7:c711:0:b0:51d:d4c0:eea5 with SMTP id
 i17-20020aa7c711000000b0051dd4c0eea5mr7695607edq.40.1688459387051; 
 Tue, 04 Jul 2023 01:29:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a056402515600b0051e0f100c48sm2566127edd.22.2023.07.04.01.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 01:29:46 -0700 (PDT)
Message-ID: <9256aa76-ded3-3fad-4564-e3451cf74065@linaro.org>
Date: Tue, 4 Jul 2023 10:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
 <20230628-topic-a7xx_drmmsm-v1-2-a7f4496e0c12@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-2-a7f4496e0c12@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 02/14] dt-bindings: display/msm/gmu: Allow
 passing QMP handle
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28/06/2023 22:35, Konrad Dybcio wrote:
> When booting the GMU, the QMP mailbox should be pinged about some tunables
> (e.g. adaptive clock distribution state). To achieve that, a reference to
> it is necessary. Allow it and require it with A730.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index 20ddb89a4500..9e6c4e0ab071 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -64,6 +64,10 @@ properties:
>    iommus:
>      maxItems: 1
>  
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the QMP mailbox

mailbox would suggest you should use mailbox properties. Instead maybe
"Always On Subsystem (AOSS)" or just use existing description. I assume
it's exactly the same.


Best regards,
Krzysztof


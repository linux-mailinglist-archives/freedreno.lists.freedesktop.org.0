Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB1073CA31
	for <lists+freedreno@lfdr.de>; Sat, 24 Jun 2023 11:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7BC10E18D;
	Sat, 24 Jun 2023 09:33:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C92610E18D
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 09:33:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51bdca52424so1619920a12.3
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 02:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687599190; x=1690191190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tj3h2F7PrfXgiEVSgcmcva0dTAsO+LbFtvUy3HlpOUM=;
 b=ic86rBDVlYcttew4/vob85e87FNpbbw8JM1F4OZp5nVBORwXNv4q2cTt9SNVFlD9m1
 dFi33g/gLFSWKIokJ9yYgX/tAQvFqVzaGb+REdj5S1pJg8PrdKReA0WIdwbevE9qKL9X
 jTb64bNYUQw0MrC41EE0O0A9p8khOb4xXzpmJeG9HS6yk9KoACeNybd0UTWCAMTDIW+h
 KDdKphFAbVxcyXlCNtts7L78DEmH/dMSIUyCQVoipTLDJWOgGB1FLejiUR8b146FM1N8
 zQFTl5lZGymUQd3VgWk49FEUwvT7wCpqn0SQ1lMbET9C6orZAQ1dEMjK8+eDWqCcdBdD
 dvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687599190; x=1690191190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tj3h2F7PrfXgiEVSgcmcva0dTAsO+LbFtvUy3HlpOUM=;
 b=KzpluNnWx35zRmrX0koRBzLLfgkj1Pt5WZqhHP8NmljlllLt4gddBYtFamPdWeSGA3
 e4zoEg6r6rMKeJVKfFiLYAxQf1M35sKoue6nb6KxRQ1J4/muLSKqX/79trsULNaIS61C
 e8ICMHW0gJaGyJ85Lb5zbZiS04BjcSg7bvfVgsVRYgX5734P6Tco3sWwS/S7XpKiPfwI
 F+XL3pmNFeNBiZWFoz7iKQSWMTj81gZ/JvuEYwfASoRmKUNZTgVKLUikmxjjDVmWZRJT
 sZbo1uAPNAOxmLU/ilTnCoiApwJSs77de+E/qTG+PSH7mR+b1feRKRx5OItB4Fb0EcNU
 vYBQ==
X-Gm-Message-State: AC+VfDwezYjXrPsd6OmO+w6gVCTy083AY1CrA6y+E8RfKsZSLtmsRgEX
 4q29a5uQ11uvFp5BPDOa50np8g==
X-Google-Smtp-Source: ACHHUZ6bs/BxTDqMq4cvMfLXihVSFIJDim3qioOSXkCmAssN1V1E4/ail2H+MUzzE3JuAdSuXV/mmA==
X-Received: by 2002:aa7:d411:0:b0:51b:ece3:70d6 with SMTP id
 z17-20020aa7d411000000b0051bece370d6mr4079434edq.26.1687599190265; 
 Sat, 24 Jun 2023 02:33:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 b10-20020aa7c90a000000b0051bed090703sm481937edt.12.2023.06.24.02.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 02:33:09 -0700 (PDT)
Message-ID: <00cd9016-4b2d-b8b9-45da-49d1f82148a2@linaro.org>
Date: Sat, 24 Jun 2023 11:33:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-10-1d5a638cebf2@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-10-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 10/15] dt-bindings: msm: dsi-phy-14nm:
 Document SM6125 variant
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/06/2023 02:41, Marijn Suijten wrote:
> Document availability of the 14nm DSI PHY on SM6125.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index a43e11d3b00d..60b590f21138 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -18,6 +18,7 @@ properties:
>        - qcom,dsi-phy-14nm
>        - qcom,dsi-phy-14nm-2290
>        - qcom,dsi-phy-14nm-660
> +      - qcom,dsi-phy-14nm-6125

If there is going to be next version:
Should be rather ordered alphanumeric, so before 660.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


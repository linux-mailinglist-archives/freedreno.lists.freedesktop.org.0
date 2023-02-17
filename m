Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A88A69AA5F
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 12:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C15410EF7E;
	Fri, 17 Feb 2023 11:30:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A36510EF77
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 11:30:08 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id ec30so3332059edb.2
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 03:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FBs3G+5rDOAD7jz6/mROi4c/cabIc4TAXJ4KNHRdV7Y=;
 b=xdjshueeGfdfkVtEqdmdj/CHWIs7xaE5c4jvbsQpmt2UQWO3DWcFWQDXbOqXyjLzmg
 QDxt7nWPHa8d9XZdU8QxjONPQaMrRNOotXOzqPTCtb0lbk0bQx/nvv/cNeX/t6fjBMNc
 bT3IVdfOZ/8KFRyPBs+4Ak5T4wb/iM73iES1CCLgraAC2IC67fK2vmWUMxlcyRMHICIR
 cy+SVJSfHFgUnWg004CIIBWvxuwVBetSk9TNh+M5k7iKsVR6Ysyq9aSBn6c+Q4jAaid9
 eD/GiYXcMF1xA5R5KtwAA7Rj2IbgVobOB7p4+64O8WENZ4tWVSmum8Ui7/VfUJ7oIMwM
 XfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FBs3G+5rDOAD7jz6/mROi4c/cabIc4TAXJ4KNHRdV7Y=;
 b=yeNaSc12dtiVzM0uLK2I2M3WnLFqzeEPjedy65riE/M195bEvceKC+QJjdU6GTDD/b
 A+5zlIAfSHk9ROyH0cDtCnmgX5fForrBnBo1shU19KVtxtdTLKdbkAwrsLvcFuXVYIZ4
 CV81xLrmgvWwqNoPstZueMa6hYEWdNAgEUR3ZD0iRiNf6JRsyLYvPh1IWdH30S2TWawe
 NMIOXtD7oC4C4G6LBLr5pKeAhFJX4R1mOx/VWCOMMXKOFB7utae0C4MDflApRMsxia3c
 mnGfTZJbnhJGyy3r5uLqw5lgPEJyfSTcGSXFkuJVKBiYB7WOyayDGNiKEoWVcu+qIr7x
 +mzA==
X-Gm-Message-State: AO0yUKVRECsmmijs3yOjUYsJa1xVB/u68hETKAAzzeku1U01ULgjsQUf
 KK+oGWO1pruybMz06eIk0rh6Hg==
X-Google-Smtp-Source: AK7set84zZR/iqCf2WhRExqzAoyqtlMbTwfj3Shf6m/+1SOuGTvZ+sZaA/bAqfZcJy4eRAzK/G8eaw==
X-Received: by 2002:a05:6402:695:b0:4aa:a0ed:e373 with SMTP id
 f21-20020a056402069500b004aaa0ede373mr1235952edy.7.1676633406486; 
 Fri, 17 Feb 2023 03:30:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a50c44a000000b004ad1815f3e9sm2110588edf.97.2023.02.17.03.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 03:30:06 -0800 (PST)
Message-ID: <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
Date: Fri, 17 Feb 2023 12:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217111316.306241-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated QCM2290 compatible
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
> SM6115 previously erroneously added just "qcom,dsi-ctrl-6g-qcm2290",
> without the generic fallback. Fix the deprecated binding to reflect
> that.
> 
> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Depends on (and should have been a part of):
> 
> https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
> 
> v1 -> v2:
> New patch
> 
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 41cdb631d305..ee19d780dea8 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -37,7 +37,6 @@ properties:
>        - items:

If this way stays, drop the items as it is just an enum.

>            - enum:
>                - qcom,dsi-ctrl-6g-qcm2290
> -          - const: qcom,mdss-dsi-ctrl

Wasn't then intention to deprecate both - qcm2290 and mdss - when used
alone?


Best regards,
Krzysztof


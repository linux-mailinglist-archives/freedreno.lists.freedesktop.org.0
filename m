Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E606211A1
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 13:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017B010E430;
	Tue,  8 Nov 2022 12:59:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BF810E433
 for <freedreno@lists.freedesktop.org>; Tue,  8 Nov 2022 12:59:07 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bp15so21053414lfb.13
 for <freedreno@lists.freedesktop.org>; Tue, 08 Nov 2022 04:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8L3H6W6oTJMJdFXCnhanw0HNqYGnHy5fmO+vbXUeMH0=;
 b=o9Ly1gbpN+idILPFeSxz4eOwCpyhasZOzQXDwPubs+I3PFMhAy2EgmnY6507J+eC4+
 OHT/oVSLNmV/ADMON8We2NcyT1j7BmbKyBhcu0/d61iJ2jHdqtPPAruY/92h/+L9WkX4
 HIIIzytwt/nXiSD78R6vvJBDB1sRZuGpuB4PcEKWEpyu4otQ11WqFZIoIa2Arh7A9yVG
 GKkMEDNJzM3M6Y9xHluwBRQt2Oie58WD+nHaEm0HW0jmuXIbhOZMiEIH9M58luibLFrs
 djaHIQcQGfledsIXqtOItRYn1ulvIOcWtv/03O4QxHf7fO3KwFgTa2MvwAl64CsDq2qU
 r7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8L3H6W6oTJMJdFXCnhanw0HNqYGnHy5fmO+vbXUeMH0=;
 b=vtHX7/hqUNfAfc7NJNtNonG/vNW5Wu51xAjQwdX8MA3yglGCHvlkg6VKRhEFsLDoFo
 qDJjyjMxL5Qah0VzLB06uVxSESavJlfOvrUTOA4JT5mE0bbRrlKOBCqyYDCZ/ABxaWf0
 K070XSyzxRKxAMp1MNStixDKSvnyr6JdhhqWGpTXDvlAeYJmaC2Idjvd3kALDJidbpH0
 PNAnZ5wO0jLylk1sgJyNacEBAtmxt/4Q2LMRM9ClwperGD/ZP58CQVx2cI8NIbsBRHW2
 r5mHxYuK1LdYUZpQKodnP6dmBnhKLPIHTXN0iJ4RRFb0VJl6BNCwLDHvdlCbD0Byb3bw
 3Y3w==
X-Gm-Message-State: ACrzQf3HF4m1T01D7mQXRqWkpSqs7RrMgTqt2xgdZshhASAHloMfE0Mr
 +QhlucVv5Ba4+nNhlxlUe+etFQ==
X-Google-Smtp-Source: AMsMyM6gcjtqNKxAqLANJMb4ITJRYeam2CrOZXpXHvLMegg+din9vntf4BHAXpIoKqVtl351DF3ekA==
X-Received: by 2002:ac2:5b50:0:b0:4af:d01:63d0 with SMTP id
 i16-20020ac25b50000000b004af0d0163d0mr19758839lfp.596.1667912345565; 
 Tue, 08 Nov 2022 04:59:05 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 h20-20020ac250d4000000b004a240eb0217sm1770485lfm.251.2022.11.08.04.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 04:59:05 -0800 (PST)
Message-ID: <ceffec42-f9af-6bde-8db1-076f0cc2a34f@linaro.org>
Date: Tue, 8 Nov 2022 15:59:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 03/18] dt-bindings: msm:
 dsi-controller-main: Add vdd* descriptions back in
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/11/2022 02:56, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml we didn't include descriptions for the
> existing regulator supplies.
> 
> - vdd
> - vdda
> - vddio
> 
> Add those descriptions into the yaml now as they were prior to the
> conversion. Mark the supplies as required as was previously the case in the
> .txt implementation.
> 
> Warnings about missing regulators can be resolved by updating the relevant
> dtsi files to point to fixed always-on regulators where appropriate.

Ugh. Are they missing or are they optional/not used on these platforms?
Can you possibly list all regulator warnings?

> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/display/msm/dsi-controller-main.yaml | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index cf782c5f5bdb0..0f7747e55b9be 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -124,6 +124,18 @@ properties:
>         - port@0
>         - port@1
>   
> +  vdd-supply:
> +    description:
> +      Phandle to vdd regulator device node
> +
> +  vddio-supply:
> +    description:
> +      Phandle to vdd-io regulator device node
> +
> +  vdda-supply:
> +    description:
> +      Phandle to vdda regulator device node
> +
>   required:
>     - compatible
>     - reg
> @@ -135,6 +147,9 @@ required:
>     - assigned-clocks
>     - assigned-clock-parents
>     - ports
> +  - vdd-supply
> +  - vddio-supply
> +  - vdda-supply
>   
>   additionalProperties: false
>   

-- 
With best wishes
Dmitry


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B58621E4E
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 22:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F89610E516;
	Tue,  8 Nov 2022 21:12:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5063D10E516
 for <freedreno@lists.freedesktop.org>; Tue,  8 Nov 2022 21:12:06 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id c25so22954668ljr.8
 for <freedreno@lists.freedesktop.org>; Tue, 08 Nov 2022 13:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HVjkux3cMwAxtEY/edHmZbgZZbL5KTdoZT7aFc5Nogw=;
 b=dbYV2VcOWcvtdXJeZS+WpMJdos1rClEv4l9pAMufctBzG2GcWGpxOy7nQA+Hea/m03
 SDIljuQ01BtW/oHZr7z+1as1K1GNVkjpIw0FFshiVH64g85I6zjS8IVbfj1q71gXNLn9
 si+8IuB+wzSudkQTUgLp0UJsVlwDKy3Feqwc6BpkXkFqfjAJNU4DemYABJtj8O4MD55b
 QOkisRpCLDbj23IoBuI3SJXiRXFxaLrvCJlUqKDMTBDZnl4xupRC4gvjtT0TKkFDYido
 umwwftIezMunFx15wDEgy/PQi0Itzw97t2gXRooZivOfGaIp3IXnwI9DdcyGCCRpBIOF
 rRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HVjkux3cMwAxtEY/edHmZbgZZbL5KTdoZT7aFc5Nogw=;
 b=B8dO1rX0ge0BgGvHBn7AT947DxYKytbEwMRGatshx9ghXzoVaUoy66Jjp2SWNBOTHc
 OWb5zpoWJUVRjP4z18k3Qujptayh8Wb8RB3vo+uixJLBfQisE6T3rf1/rYfHoFuSg9pA
 EpgY8UVr0OGWnjp4D/47rgFztJmwycF+ofVu6AgZT2GktmdzENaMILtP6HPYHhBsZLai
 ccKpTLrvfjRsN6R7hgHOjFKLjbmd04dRKwv7+M/GSa+SEeSZkREPT/Lv5nLns077jrxh
 r6nfrGxALdaD6JubhZrkplLVHIN5IAbeFLQHC+3UNeGs7LB/Fq1mjkEYl9Q0zTmbf5CK
 qs9Q==
X-Gm-Message-State: ACrzQf3/DtXCd/ke5PRr1u8jRqfXaSOc0TpSqJWWhbbmrp6JdUZutQf+
 A+meL6YmrNkb4xuVIfuDP5/vFIGPhnRXHQ==
X-Google-Smtp-Source: AMsMyM5xlFqWOoqod0wnpXrCUnHoB0Up1jQ/+andB9sQZbg3hz+hkC/To36ahRaWgJQbAmcI3XRq6w==
X-Received: by 2002:a05:651c:1682:b0:277:1d5b:74b with SMTP id
 bd2-20020a05651c168200b002771d5b074bmr7029770ljb.522.1667941924622; 
 Tue, 08 Nov 2022 13:12:04 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a056512201100b004a26b9cea32sm1926651lfb.271.2022.11.08.13.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 13:12:03 -0800 (PST)
Message-ID: <18e16410-2f20-96c5-1e9c-1ccb6c58c1b3@linaro.org>
Date: Tue, 8 Nov 2022 22:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 08/11/2022 00:56, Bryan O'Donoghue wrote:
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
>  .../bindings/display/msm/dsi-controller-main.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index cf782c5f5bdb0..0f7747e55b9be 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -124,6 +124,18 @@ properties:
>        - port@0
>        - port@1
>  
> +  vdd-supply:
> +    description:
> +      Phandle to vdd regulator device node

Drop "Phandle to" and "device node", so just "VDD regulator". You
describe hardware rather (when applicable), not Devicetree syntax.

The same in other places and with that:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27060671155
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFB58999E;
	Wed, 18 Jan 2023 02:50:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C97910E661
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:50:25 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bk15so22475405ejb.9
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+oWeg8meSzs44XhiL5Rp/pA/MJaJDS/aigL4xzCGs0U=;
 b=DEL6t/7gj2s4mON5g5SB3CNFYOPx6YoirU9j0W7WYtN8eh30O2+T7Xun/VLqhea3xr
 QBYfEgxQo2G2W17p8ZgIMTO4Gnl0B92A9Oo3nPYQSec58ESAb9ipigyC9RtOIQFPZDAs
 FMhYHb75LBbnMHD55vJSrdxjPmXyRb9VY6ig7PuAGJrVX5+6URVQYHVr9Xw02TI5G+Qr
 IvWSPFK1BR33xrd2J7NKxaCOjm2yY+dTQ2vWPyMmJaEK+yKfb6Y+uJtYcMA1CiygjlR0
 XySUcKaf2oUM0AtsrXM5Z+j+Jp4ituhCmkF0wjEZaAq/M42Gux+n4+NyDWJ/4YGyDOtn
 MXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+oWeg8meSzs44XhiL5Rp/pA/MJaJDS/aigL4xzCGs0U=;
 b=RNZzusUFTbLMQrjtMFVZ20hQ7ExGMcpgBtJvmVL83LWRZLuyuGC9v7yUWsVhRnNHa/
 kpOKikiVGyB8i2kOKnIUJR5kVmUMg2kI8yY3ax80Xf5Sa2fnN/PPzQaRdiSsatisw8Z7
 fQSlHgdJbBzqH4izQ1IpRRh8bCesXBpKYfmIew7GUZ4tZahlXSl+S9xWOxg2Wq1DYdYS
 XQqA0Th5KK6npsUsVL4Cz8wfN6Dz/s4ThP6Dy6yp7VNiFT0b86GIo/lKF+zespkmarJk
 yKCHRSF7IWVxhlIrD5WqTD/aEoLwaSwAdez5jAiycx9wnSmbyRXCrT68ncisEIR5M0a0
 g6lA==
X-Gm-Message-State: AFqh2kqPHSBiTDRAxiL8l3wwq9cN14ZFF/AhRbHaTKOjhv6xalZ+sKFj
 Tzo+Y9d4creFOEeNMGaOLoGRSw==
X-Google-Smtp-Source: AMrXdXsoTO6RqYHs+R3tr16MfQfaTjAir7uZ3UgRN3rJfitNwZUHfTX/Ux3TwerOOd+gF4amCKGOOA==
X-Received: by 2002:a17:906:a09:b0:7c1:4a3a:dc97 with SMTP id
 w9-20020a1709060a0900b007c14a3adc97mr6765984ejf.0.1674010224043; 
 Tue, 17 Jan 2023 18:50:24 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170906314600b00781be3e7badsm13971460eje.53.2023.01.17.18.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 18:50:23 -0800 (PST)
Message-ID: <5d0eff7d-147c-b75a-9236-232a5a98e42a@linaro.org>
Date: Wed, 18 Jan 2023 04:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
 <20230116225217.1056258-3-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230116225217.1056258-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v8 2/3] dt-bindings: msm:
 dsi-controller-main: Document clocks on a per compatible basis
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, sean@poorly.run, andersson@kernel.org,
 konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com, david@ixit.cz,
 dianders@chromium.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 swboyd@chromium.org, airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/01/2023 00:52, Bryan O'Donoghue wrote:
> Each compatible has a different set of clocks which are associated with it.
> Add in the list of clocks for each compatible.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../display/msm/dsi-controller-main.yaml      | 219 ++++++++++++++++--
>   1 file changed, 202 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 35668caa190c4..47faf08a37443 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

[skipped]

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8974-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 7
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: iface
> +            - const: bus
> +            - const: vsync

vsync clock is not used on msm8974 platform, it causes DT verification 
errors.

> +            - const: byte
> +            - const: pixel
> +            - const: core
> +            - const: core_mmss
> +-- 
With best wishes
Dmitry


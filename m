Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FA4620E10
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 12:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141DA10E3BE;
	Tue,  8 Nov 2022 11:03:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC21F10E3BE
 for <freedreno@lists.freedesktop.org>; Tue,  8 Nov 2022 11:03:42 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j16so20668905lfe.12
 for <freedreno@lists.freedesktop.org>; Tue, 08 Nov 2022 03:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6bQVpwbAqUwvMZxArhzUm1x6Cngachlupk+1gKRPWrk=;
 b=HruJgZ9ZZvr/Iqxom+HIu2t27taQi9qozy/OZxN/xcvuaVCTl60h8WqfS2STUrXyKR
 uUdp1APaeZHg5S91WsuRHM1UggL+UdLcOUa/sldJJKKXDAQqAywITDeg+fBNm7b+oef1
 C9uP5hr2G+JorbIWcyWvnj710UpR/owDrv7FFnfzUMIoi1j8+VYvqCFRLMvfjaAny8OL
 BqGTXdXZN5Ak4SN3t2BtYMr3C0AtBuzZp9//74Sjw/bPp/xmVBe1K45OAx+2FO6uMisX
 ZoQTRVYxlWKPMVOh3XIlbjzJ1ntHQYJishIBxRfy4Lz92bMKcrqmJTOOpFy5l3IGm8oK
 xdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6bQVpwbAqUwvMZxArhzUm1x6Cngachlupk+1gKRPWrk=;
 b=dv+9JklwtUQ/a75Ev0wJnhMZbWfbdTjKdqqoTGrEsk3SB8VEt1lwS6a3TM2jGrb9eO
 IAOMUqjXhnCTodfDm+loLZ5jCoDLfwh0CDEsqwuWUkA1efqC0YyPfQ9L/eRDGf9JpcVv
 U/O6IDH/wqilnVWJKdjghWoGvXguoI2s+lNWVnLGU0OcVCGmP4htDbeBEkIqD8nDWiRZ
 It/S6hR9tCTBn/O8FpXSH5ICgAF+pXweyWKNUUFMc1zBUWQyWuPHf6x4mk9H1jJDZRZP
 JLk6SWrvyHUBH1CrGHXVrprFVZGaSMtWx6nmo3f0YQ1yXOKEN8fe4SSIQi5dsLUw2fso
 4+Lg==
X-Gm-Message-State: ACrzQf0ybhoAgfXtuYu8ZmSR1Icv9NeD2kzQybI17kMv0iqqQHBFC36D
 78ed0OBIdJ0yaZDK8T79tvRjXQ==
X-Google-Smtp-Source: AMsMyM7YLNyTL/Qlmb+4TtANJeNNFqtIAuqgsICoq0pwzcmY7vaLTFigwtJrIkF5QT3PZlK0TrwphA==
X-Received: by 2002:a19:e34f:0:b0:4b0:6295:1887 with SMTP id
 c15-20020a19e34f000000b004b062951887mr17650810lfk.529.1667905421119; 
 Tue, 08 Nov 2022 03:03:41 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 w13-20020ac2442d000000b004aa8cae6889sm1737878lfl.262.2022.11.08.03.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 03:03:40 -0800 (PST)
Message-ID: <1dd1dde8-b252-b594-48c6-3f4096ab9862@linaro.org>
Date: Tue, 8 Nov 2022 12:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
 <20221024164225.3236654-5-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024164225.3236654-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v9 04/12] dt-bindings: display/msm: move
 common DPU properties to dpu-common.yaml
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/10/2022 18:42, Dmitry Baryshkov wrote:
> Move properties common to all DPU DT nodes to the dpu-common.yaml.
> 
> Note, this removes description of individual DPU port@ nodes. However
> such definitions add no additional value. The reg values do not
> correspond to hardware INTF indices. The driver discovers and binds
> these ports not paying any care for the order of these items. Thus just
> leave the reference to graph.yaml#/properties/ports and the description.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-common.yaml      | 52 +++++++++++++++++++
>  .../bindings/display/msm/dpu-msm8998.yaml     | 44 +---------------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 39 +-------------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 43 +--------------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 43 +--------------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 44 +---------------
>  6 files changed, 62 insertions(+), 203 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> new file mode 100644
> index 000000000000..8ffbc30c6b7f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> @@ -0,0 +1,52 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU common properties
> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description: |
> +  Common properties for QCom DPU display controller.
> +
> +properties:
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Contains the list of output ports from DPU device. These ports
> +      connect to interfaces that are external to the DPU hardware,
> +      such as DSI, DP etc.
> +
> +    patternProperties:
> +      "^port@[0-9a-f]+$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +    # at least one port is required
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names

You do not have these properties here. Require only these properties
which are defined here.

Best regards,
Krzysztof


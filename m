Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C54963968E
	for <lists+freedreno@lfdr.de>; Sat, 26 Nov 2022 15:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216FD10E146;
	Sat, 26 Nov 2022 14:41:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BB310E146
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 14:41:41 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id n1so3505913ljg.3
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 06:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LcpZ2v4R4rV4js+pgJmRUOcThZTfcN01I5uv2UUj3Pk=;
 b=gIr8xGUAH2211xt8AE/1c3ib2vUjORyW7/lrZMgJ1sgEezi/tcWKaWG/HWDhCe10t9
 n+NWIn6IETO3EDXz1TQ94L4F8AmqZmmK+KtG1IQVLgVbr3p+7DYoLVKmO1XRjuXhRDKO
 VCXTRat6DbzSu5GzBxLNkVwR6HhFya5e7L7Bjfiq4rO5D/3dyhzd/SJzA1cq0lc4ejfC
 Vh/6pO5x/MZco7gEzDxjVt8qL1xfsqOQ+tR3WpZ+tJ7BmJ+RcXFn7MdX/qcrMrru3odz
 6YOR6Flgmyd7MjOPuxx6a0oPPS0QUz+VHYhUUSRQNHNJkBtEujhDDthwxnCPXJzX+ajz
 ud9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LcpZ2v4R4rV4js+pgJmRUOcThZTfcN01I5uv2UUj3Pk=;
 b=rKNPC8rHnQ7JMe0hNgzEASrwk716tfnG4yCjMV1xjmQ5P+1bTAgXJYJnbQ78fBiTso
 9b3M5CxDaXBi3QaA9vXr/25+y8Z5j55hjAAie1YIuTTqBaw2GxFBI5FOyC6tehuSMUyl
 0j3siKOfEMN9QW4IdhxY5n36yC0kcJ2Qg2dbs3Yfe4YjuQvhFl2KD1w0pRhs+Rzxokes
 RqsK3lv78/vDfvj+BmxUntKr81Mf4XQKqYb97oM4kOjw0BsX1IJWyBVsFnTJiGiFLysG
 O9JqZ0St4IpQ4fjeDW5tp6DlZ5sWgMmy9yJpVh8aTO0hMawjThwQCTzFAqXdkSsGyoVe
 7t2Q==
X-Gm-Message-State: ANoB5pmR8ek01xE7Snc7k9XU++fNZ8NzkVBVSPzFtNsgqJf0ZaRP+2Nh
 ZQXCkbaZPbuvOtNkxPSz3A7taQ==
X-Google-Smtp-Source: AA0mqf73mQkLWU9ZPxx/9Q10S5YyT13jjhDYgerD8FIcIYglklF652qu6cW2/15lvocuVKeSbGpPMg==
X-Received: by 2002:a05:651c:906:b0:279:1349:b2e2 with SMTP id
 e6-20020a05651c090600b002791349b2e2mr13490093ljq.382.1669473700019; 
 Sat, 26 Nov 2022 06:41:40 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 f30-20020a19381e000000b004b177293a8dsm946364lfa.210.2022.11.26.06.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 06:41:39 -0800 (PST)
Message-ID: <4f562df6-99ce-34fd-defb-217f2cdb5ba6@linaro.org>
Date: Sat, 26 Nov 2022 15:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-8-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124004801.361232-8-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 07/18] dt-bindings: msm:
 dsi-controller-main: Fix clock declarations
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/11/2022 01:47, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml dt-binding descriptions we appear to
> have missed some of the previous detail on the number and names of
> permissible clocks.
> 
> Fix this by listing the clock descriptions against the clock names at a
> high level.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 0c09b9230b7f5..0fbb0c04f4b06 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -36,13 +36,19 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: Display byte clock
> -      - description: Display byte interface clock
> -      - description: Display pixel clock
> -      - description: Display core clock
> -      - description: Display AHB clock
> -      - description: Display AXI clock
> +    description: |
> +      Several clocks are used, depending on the variant. Typical ones are::
> +       - bus:: Display AHB clock.
> +       - byte:: Display byte clock.
> +       - byte_intf:: Display byte interface clock.
> +       - core:: Display core clock.
> +       - core_mss:: Core MultiMedia SubSystem clock.
> +       - iface:: Display AXI clock.
> +       - mdp_core:: MDP Core clock.
> +       - mnoc:: MNOC clock
> +       - pixel:: Display pixel clock.
> +    minItems: 6
> +    maxItems: 9

I don't understand why this is separate from your previous patch. At
patch #5 this part become wrong, so it cannot be separate, obviously.
IOW, Your patch #5 is buggy without this piece.

Best regards,
Krzysztof


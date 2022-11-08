Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7213E6211BB
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 14:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D5610E430;
	Tue,  8 Nov 2022 13:01:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459DA10E288
 for <freedreno@lists.freedesktop.org>; Tue,  8 Nov 2022 13:01:13 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id k19so20995291lji.2
 for <freedreno@lists.freedesktop.org>; Tue, 08 Nov 2022 05:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o2KBnjP+nSiovlrgCNq3pgnMfvwR/TgjyTkfX/lxAXY=;
 b=B1NLcQxYD/tx2pF3yzopjY1j/+5ZIQBGNS2nBPNbnSEbAaWVMjzgybAcu8U73wnSpS
 2p6Wl/qwuoxfmZpHd4pLS6PNPs01SywKDuEOkq/q9Ll06Uhqm9dlrj5PlresGVgbve64
 81jMN8Is3/iJqmZxDo7rnXCEDUqiUT60X5AEQtVsfFO+9JPBb1eHrIMgmHyC84lpfQty
 9u8nsXg0URwU1h2oRYR5vAB2D5t6Snyqq+Yxr9V/yyuKVp2JYkbfKX1XfxXOF1yYSOwy
 F5+k72GuWuWwlibeltt6Y62hytjwcAWnJqWAeXfoAy6vj5S9H50BOjRbtsk+tq78j1X8
 3IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o2KBnjP+nSiovlrgCNq3pgnMfvwR/TgjyTkfX/lxAXY=;
 b=xm3jaGZG1+4jaCqrAcSJtxtRZh241gqZrU0KoUNqARkgaygMGn+dDXC+Pqrmw73SOB
 pqq3h390Z/fDwS7H8DAnR/tgFowtlbCUjnM3X+iZLoQs4Q//4NPg3SoWxP57xEMnFE8C
 7UlXDgpCvbaA+k2XGLGJHbtLBujdKGXFHs9VFZeAx7EUoK7rxUZdDkfh6CKVbUlAu1Ct
 2gxp6piyspS5YIUlSU3oy1hyyq9UP1UzXLhaBN9fminSd5HCdDJes70Owv2Ik5BFne9U
 DQYiuGQ993Lv0S4phndUWCUdXnavW1TWsMahWDcfYBjivR4Rtp6rocR9Mfhxh+bES2hM
 tz1g==
X-Gm-Message-State: ACrzQf3oPYM4JJd32o+oh8SYd+GEPw+7BYcw0K5zRBmybLZF/ETn0vBX
 NOrxTc+kw8rJky7wHE0sdtLARw==
X-Google-Smtp-Source: AMsMyM66xrug6V/sv7oOh3M+8rA31Sg6TAYX3OsMnAX7+YblTowGVcUPAZ+KslM0y4845evMIBVXVA==
X-Received: by 2002:a05:651c:178a:b0:277:8a07:a558 with SMTP id
 bn10-20020a05651c178a00b002778a07a558mr5264594ljb.333.1667912471539; 
 Tue, 08 Nov 2022 05:01:11 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 h7-20020ac250c7000000b004a2386b8cf5sm1767451lfm.215.2022.11.08.05.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 05:01:11 -0800 (PST)
Message-ID: <228c9136-0c52-af0b-459e-23c9f7ee08f3@linaro.org>
Date: Tue, 8 Nov 2022 16:01:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-6-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221107235654.1769462-6-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 05/18] dt-bindings: msm:
 dsi-controller-main: Fix description of core clock
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
> There's a typo in describing the core clock as an 'escape' clock. The
> accurate description is 'core'.
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
>   .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index cab38a20a54b0..a607ccd4a905a 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -32,7 +32,7 @@ properties:
>         - description: Display byte clock
>         - description: Display byte interface clock
>         - description: Display pixel clock
> -      - description: Display escape clock
> +      - description: Display core clock
>         - description: Display AHB clock
>         - description: Display AXI clock
>         - description: Core MultiMedia SubSystem clock

-- 
With best wishes
Dmitry


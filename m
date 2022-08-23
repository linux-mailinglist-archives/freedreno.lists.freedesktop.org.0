Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B7059DADB
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 13:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B07710E1E8;
	Tue, 23 Aug 2022 11:12:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C48112207
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 11:11:51 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z25so19212075lfr.2
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 04:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=RyGB8PQO8ADQrO2JFjLIJii6hzK5vNZX03ZezGuypGs=;
 b=oCfh6AI2QwLBOgQEi1W8eHyNhAH/PsXgbcycKMnCTV5RxfayaL3wtv4jIvSOvZZzE8
 gzUXOExHburHxVgMSsMbHibLI1L2SnbkuVLjvD+bljZz7Sn6Mia3nJOyOn07BVOgDr2l
 abxhLitpMAPOzrXk3jSQvcxgg7QwV8n5lW1lQqSbk8+a6T5oNh/sQQpbsuMaBSgrrI8A
 bJ2jSdmA27l2XZwB1wTkNwf60Ej1NEZsOhpD4PpcvP1LSahuyUmZkYQ+Q6M13KC/36C/
 o/KZNDD1g/R8rdQRYab4Ck4uov5qDnDC/psQAJognpFGI2eXoLgZ6Dd82cMKEbgDGmgv
 HJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=RyGB8PQO8ADQrO2JFjLIJii6hzK5vNZX03ZezGuypGs=;
 b=7ChEWPHxTOwlzp/Gux7AwPXSPqd4U4V+AzFzpLzHqkOhHO+k06nAT+83Xm9tzWf9A8
 RcrKU2aZfsl4QWRZSvXYD4nucxSQ5BHraVH6OEzjJNoURJshioqzFSyiJojlMQQaeCyG
 MmWZhbtyfH45dAwyge+/QvWpL//yps/0blVk1MmY4h0kBVIaxKvieS0OAbTd4Gk9MFAe
 SFkcel6vjPFec2ggV6Q7lWGQj9cgYSTnA15FmshRyaROaPckFFryYKl1/nN9LD3VhqYZ
 zJsgjUQQ8pyRyfOiVHpD9S097+tXtl8OiVhjj4A8MntTeILbB4sU3mQ45FzHZi6ckNrt
 YmMw==
X-Gm-Message-State: ACgBeo2xCb7cHi9MeY/d6axVcw3F1TAawqMrXpbOk7+KPrrXuefa6QUq
 1vqMvipFl4H9P8WAmVQcLUQWgw==
X-Google-Smtp-Source: AA6agR431MJa34QlqrqboyJ2CF1O1nEgGRTLQBgHBhF/nzaTuInpM0Ee1WeB028VXCHqg7KXMU98oA==
X-Received: by 2002:a19:654f:0:b0:492:f148:beb with SMTP id
 c15-20020a19654f000000b00492f1480bebmr1379997lfj.493.1661253109390; 
 Tue, 23 Aug 2022 04:11:49 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 r30-20020ac25c1e000000b00492f1b2ac0bsm511806lfp.101.2022.08.23.04.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 04:11:48 -0700 (PDT)
Message-ID: <e8a02030-d114-fa4b-1978-15327501b7e9@linaro.org>
Date: Tue, 23 Aug 2022 14:11:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220819221017.v4.5.Ieffadd08a071a233213ced4406bf84bb5922ab9a@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819221017.v4.5.Ieffadd08a071a233213ced4406bf84bb5922ab9a@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 5/6] dt-bindings: drm/msm/gpu: Add
 optional resets
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 19/08/2022 19:40, Akhil P Oommen wrote:
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 3397bc3..4576b31 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -109,6 +109,13 @@ properties:
>        For GMU attached devices a phandle to the GMU device that will
>        control the power for the GPU.
>  
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: cx_collapse
> +

Just one blank line, not two. You can keep Rob's ack with that change.

>  required:
>    - compatible


Best regards,
Krzysztof

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7110D54C86C
	for <lists+freedreno@lfdr.de>; Wed, 15 Jun 2022 14:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F1D10E455;
	Wed, 15 Jun 2022 12:25:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B75410E3FC
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 12:25:06 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id c2so18716361lfk.0
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/XSr+w94TsWPuJS7OSNV5L/UO5RzkyOGJs0L8Cgm8pI=;
 b=YNIiePeBhBSlCbM+N7NA1Bi5YsljgHEOEPoGq1B7/1SAdkUgXFreGq6PfnzEl3wqxh
 Kkx4FSpmTs/8BB8Wwnq0kVcc3o6VaqLI7o67MuYadcXKNuvuwcYkeQWYO2gtd3jH/iZR
 wvGqksekdrBM71Zj549aNs+3UZ8IqBiPmAtvf7HgY/z16qtYmD8zAkmg900n2QJ8ApzN
 git4StvRknLnDjZ3m8SRW62FJ6OeHR7o5TBfsmpw5bMm6J3QSefIIcQZNmntHKuDEPhG
 gSWl30CICQNJF7YmDgYlYRJ9m0YvNEp90Ymt+SEad6K0gv77FQTTwpxGk8vjvqB2GTwA
 79rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/XSr+w94TsWPuJS7OSNV5L/UO5RzkyOGJs0L8Cgm8pI=;
 b=RZj/8OJROinh6n+GLzh8YNCAT2OYl8gDSS8sjwq2MFUUWLnOsoQQc5esaMNjUhRTpK
 M7pBPV/LHPdkqAXtzMe7gb3OEw6bFZBjxcfU81bDnka3q3GBvJML3wtKmxCSSJwt3y+i
 +j6TVM0z+A/whz4+46MX7g+UHe33tUTF9QgcF1PEsPGuYQt7kyvJAwBfE+WNn/y1w7Vr
 7wYSPJ29AchItEaTkGbEoSG5+pltFHALCyRp/UfY5//Dgc/GAIk79WVaYIYWhPl97sfI
 gXupwat0tNKaXIDUA/wGvv/5RsCrwVV4PB+ZNhIibPcuwQn8NwAo0RWKEKXuDa/Pxhm1
 nPjw==
X-Gm-Message-State: AJIora+Sr5IIc2M5F0h43s24nwzarxKSjmxOYM6WE2d0aImuVFESOR98
 YpoeoZ4nfdre2uu5nuNODQMx6A==
X-Google-Smtp-Source: AGRyM1u9YJURgXPk9UCSobnkOQ/l5kCouy20zHlxbyP4uQrLCno47jfZPehZeU6Bpo+5+Y8qTa/FKA==
X-Received: by 2002:a05:6512:10d3:b0:479:732e:d62a with SMTP id
 k19-20020a05651210d300b00479732ed62amr6277501lfg.319.1655295904361; 
 Wed, 15 Jun 2022 05:25:04 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a05651c102300b0024f3d1dae87sm1676074ljm.15.2022.06.15.05.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:25:03 -0700 (PDT)
Message-ID: <0030792f-464b-307f-6991-bfc7b0badfd5@linaro.org>
Date: Wed, 15 Jun 2022 15:25:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1654286979-11072-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1654286979-11072-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: msm: update maintainers list
 with proper id
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/06/2022 23:09, Kuogee Hsieh wrote:
> Use quic id instead of codeaurora id in maintainers list
> for display devicetree bindings.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We can pick it through the msm/ tree, if no one objects.

> ---
>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index cd05cfd..c950710 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: MSM Display Port Controller
>   
>   maintainers:
> -  - Kuogee Hsieh <khsieh@codeaurora.org>
> +  - Kuogee Hsieh <quic_khsieh@quicinc.com>
>   
>   description: |
>     Device tree bindings for DisplayPort host controller for MSM targets


-- 
With best wishes
Dmitry

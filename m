Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977276369DB
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 20:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B0310E601;
	Wed, 23 Nov 2022 19:25:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6118610E601
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 19:25:55 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id q7so2069858ljp.9
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 11:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t1DObvPh+Rx+Hqegn0XLyYJdliwmlAQX29QBWofxvPA=;
 b=zusNWTQ0ZtK82/Ue7pGOHYNeKWcg2Ze4ZkbOTBvSyG4O9vOzVzpYdgtbzTQSADp2O0
 vYDxc7B4D1FK1U7DuxqIKxfpDF/Of+Pp7MPdvTk0HyTvUgWAKXEGrXxhNzeP2i+LyrUo
 BSQTTlJ5Qr0BSru3RYd2CIxZ0ApnHiuvpBLQzmCKW2/nUSkfyQCSMIcuYRUGcoy1kdAz
 8UsvIRYvXSnsnZC6brAQOvdNsqdrjnZ6InTX2p2yaHZORdrIC9HRRUGI99+eXjPu7sjU
 VUDluoan1yjaBrHZBnampED/dPUujN6SmSB7wjm13/mUqHHS5JN7cjH8tkSctlPYst2/
 U1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t1DObvPh+Rx+Hqegn0XLyYJdliwmlAQX29QBWofxvPA=;
 b=dmfIyK3GsRze2vE6s5FHCYss31TkHvws18Rsl1QbQ3kFdG7Hy7fXgx/c46ZeljP/Pj
 somn+qE1BQ68PkzK7u9O1MLhlsdyW+gObowHaCj8SMbW1QgoCTX8Ze/Nt07il3KoK1G+
 mFoS3yqchd7Hr2gC0F10m+/jth/zONvxVFzaLVhl3YKnTosqi7exmhtUhur1bswNVpLu
 zaxnTFX/c7Klpe4PShBAfyvQLvYLo8aD08zvOVU6ZuYrFzCuJjojkMzWj62IgUWXsexl
 W9QQkfZJFk/K7YlhrS7yxS7mko5oWh9wm9xqk0xQQQfnaQkiIef0RJxQTnUICf623vDQ
 MUvg==
X-Gm-Message-State: ANoB5pmBpVwIJHcejhfmgiJfT6YtpjaYxn4JM5Jpcxe50PfggyJ/UbaD
 IcO//ta6+ABPW88kkiBK3nWBwg==
X-Google-Smtp-Source: AA0mqf6sCm6NBHdvo+56rXL7omxWiAryfayByRNrgP0gPV7565DlqGRPl39qHB5E1kDK52xUUGeikg==
X-Received: by 2002:a2e:a375:0:b0:277:7c00:e130 with SMTP id
 i21-20020a2ea375000000b002777c00e130mr3104784ljn.268.1669231553655; 
 Wed, 23 Nov 2022 11:25:53 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i29-20020a196d1d000000b004a459799bc3sm2996182lfc.283.2022.11.23.11.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 11:25:53 -0800 (PST)
Message-ID: <879739ef-41a7-3470-da0d-6aa7c8654e0a@linaro.org>
Date: Wed, 23 Nov 2022 21:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-2-dmitry.baryshkov@linaro.org>
 <3f796546-f9ac-353c-9f5b-870f77726da6@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3f796546-f9ac-353c-9f5b-870f77726da6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 01/11] dt-bindings: display/msm:
 *dpu.yaml: split required properties clauses
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/11/2022 12:15, Krzysztof Kozlowski wrote:
> On 23/11/2022 00:12, Dmitry Baryshkov wrote:
>> Per Krzysztof's request, move a clause requiring certain properties to
>> the file where they are declared.
>>
> 
> Commit msg could be a bit more generic, without naming me (there are few
> Krzysztofs), e.g.:
> 
> Require only properties declared in given schema, which makes the code a
> bit more readable and easy to follow.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Ack, thank you

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry


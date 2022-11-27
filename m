Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3DB639A72
	for <lists+freedreno@lfdr.de>; Sun, 27 Nov 2022 13:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E15110E143;
	Sun, 27 Nov 2022 12:24:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7610E10E143
 for <freedreno@lists.freedesktop.org>; Sun, 27 Nov 2022 12:24:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so8166767wmi.1
 for <freedreno@lists.freedesktop.org>; Sun, 27 Nov 2022 04:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iW1UeaNHW1nZvRIYrQGKcf3kFYKlAFXkiSyrwvh4YCc=;
 b=t2GnoaLuuFss6CmlA4LndixCeDygF//BbCfYDWLz7rAAGAQC1sxkhyYYMWSyTBRwuN
 DTv95S7VVnqUDRzXo1t61TmmdGrO3F21id2jWYMivTsh+MP2U288XvKG9IqXe8qkwDru
 pX3nolCG8aKD98lZEKJ8fWOvhsViGijO+KoCXVJxRtA6NyW5BxwhYk1h0Cfza2y3yo8Y
 5c/HmqvA6Qc9zdhk2eF56pXIXCXM2sAowO8VV3L8tRgsb+kLrlRCD0ODYnoOKw0UF7wZ
 rDJUT583iNBybOKvLM3CCvgm/Au68nIAg2YuDDczgvWGJIsIGaMGIrlS5+DS8ohwBU7J
 ZhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iW1UeaNHW1nZvRIYrQGKcf3kFYKlAFXkiSyrwvh4YCc=;
 b=QPdZ4841dY7UnZHMGaOwtmI0l6+WNw1oDAoBzpJb/0K78RK6kmFr2/IS/RvefCF8Rf
 /xRPEEZj1ffhibWPETtQQ3YVBN5yY1lQ4q4QbvhVVyxj/L7DPy0HL3nTK6a21O94fMA6
 k/OHpKvwEa5NCod39DAOP4xYHVG+0FmXlXUFylle3GyDxZJzX7kDhWl98qYjKFJxt+dN
 vDNLxwCOtQ+lUO/GByn5mc/aI2kGRzTj6nkeV6fAHXFGPvtZK8iszon35TzhKWIwGjl3
 HEeECJE5ypZrXZsQLgIsys6i4lC2ErnZm49q2a8VgftZD3i5iR5X93F4ylaNzApY0F2Q
 4AVw==
X-Gm-Message-State: ANoB5pn35RSqEwVDrQ2mIB6MsmstWnS6cAfz3Bha5E7ymWmOgOirV/PD
 dNT9L/E5M2sjkkqa3mMCeUWpNw==
X-Google-Smtp-Source: AA0mqf6kuChrfZ5OyEbwXtrfM4OEbYvTKrEvGJzaEbjBadNowSbANRCdXXjdgtcT0+vBM5cBnuumNw==
X-Received: by 2002:a7b:cc89:0:b0:3d0:57ea:342c with SMTP id
 p9-20020a7bcc89000000b003d057ea342cmr1175375wma.25.1669551866536; 
 Sun, 27 Nov 2022 04:24:26 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a5d4087000000b002366b17ca8bsm9223560wrp.108.2022.11.27.04.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Nov 2022 04:24:25 -0800 (PST)
Message-ID: <5666462e-d416-84ee-ca70-7edd77bab3d0@nexus-software.ie>
Date: Sun, 27 Nov 2022 12:24:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-3-bryan.odonoghue@linaro.org>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20221125123638.823261-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 02/18] dt-bindings: msm:
 dsi-controller-main: Fix power-domain constraint
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robdclark@gmail.com,
 robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/11/2022 12:36, Bryan O'Donoghue wrote:
> power-domain is required for the sc7180 dispcc GDSC but not every qcom SoC
> has a similar dependency for example the aqp8064.

Note to self "apq8064"


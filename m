Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A836621E59
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 22:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AE410E52D;
	Tue,  8 Nov 2022 21:13:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A3A10E508
 for <freedreno@lists.freedesktop.org>; Tue,  8 Nov 2022 21:13:46 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id c25so22960019ljr.8
 for <freedreno@lists.freedesktop.org>; Tue, 08 Nov 2022 13:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b+TEdIfIt1XEAkSUPk37PpRaSa+HP3u0XbUt51o/R5Q=;
 b=hybL/ifLuD7Lq7OrqxEgPb+C3hZe6Zq/o9AmhBC3t26Y3R8MzxahlatCWAkuQxba6s
 EPuEj4JngMnlo3aeVxau/Z1Qxs+H4hGVSBG+Vb3QnPV5hfRrbg/MhpQmYGnQacNIdzM9
 Uu6BHThBxpHD7xHsdvES0oRgA+K49VywCjvxSo4gmm3bP+1480sreCSqcgLZBxKvDrJY
 LM6qrbd3aMdEqxhBvamfi2ZZhgvEXsf2XQ7R8B9S7kurZ6AkdWCrINjDFXXqvaZJcp68
 em7YdfcJ/kU/5L2Qov073/b188bqObSSwO7qpAa8DbMGNzqeRqKQC2x+LRYKkDk4qxAy
 2NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b+TEdIfIt1XEAkSUPk37PpRaSa+HP3u0XbUt51o/R5Q=;
 b=2GjA1puuM0QT+WcfdfA3KIv1VP2z/XsbzPm8lWrC1XhQApCp/NqSxwsh0T559Jk/rJ
 Y78C3uQoKSHx2sJ3CCbqaOelf+7U4OQSVH2n0hyKnUxm4edA8L1l8EZ2NmzkkqieCqL3
 hW3yrytErNcMmivEE7XGecgRBZqoeaRcqogFm69cwwwaDxKCWl8Bzzg4BqO3CX8CKjBK
 Dp0s0+aPzanc6v5d1cCZ5Bp/6kGQFsNH173dFePYEeI13v/M4phgExrAEQWBtuArmwVj
 1PEWdWVo038JEPr9+4h9+XSIHYUG4U4unHcbNX4gnDxnUazK+Tsk0UBOFTtfXEd/En3X
 b1+w==
X-Gm-Message-State: ACrzQf0GAHR7BFL+LE4r0G/8M504cqeFG8pHfr+77egG9RDWc22Rkh/z
 RjF3XFnbLsW345pa5R29q7D1nQ==
X-Google-Smtp-Source: AMsMyM704MrNlUBJ/82vwUjFUx934aW7BWfazzzhogmQIqSx2TtM8uSFy20O42NaVeF2kUOmlZ6Pqw==
X-Received: by 2002:a2e:b626:0:b0:26e:6fb:4845 with SMTP id
 s6-20020a2eb626000000b0026e06fb4845mr7126546ljn.120.1667942025342; 
 Tue, 08 Nov 2022 13:13:45 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 8-20020ac24d48000000b004998d9ccb62sm1939713lfp.99.2022.11.08.13.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 13:13:44 -0800 (PST)
Message-ID: <20aa6301-c576-9221-d084-b11d3e9687e3@linaro.org>
Date: Tue, 8 Nov 2022 22:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-7-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107235654.1769462-7-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 06/18] dt-bindings: msm:
 dsi-controller-main: Alphanumerically sort compatible enum
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
> Sort the order of the compatible strings alphanumerically.
> 
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

I think here you can see how the commit msg looks now... One line of
message and 13 lines of CC.

With commit msg fixed:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


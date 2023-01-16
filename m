Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7B266BD53
	for <lists+freedreno@lfdr.de>; Mon, 16 Jan 2023 12:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F08110E3E7;
	Mon, 16 Jan 2023 11:56:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C190310E3E5
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 11:56:11 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ud5so67550658ejc.4
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 03:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=opc9QPH8t0rwYGBLZ/6s2ZS8vH/2JFxpHjhMhYhyR6c=;
 b=KlD4i9oGhDhDd3KNbQdH9lF+HOJ/AgqpYZwD/CxAPxWpNrMus2+Dd2lWHHX3PACOVi
 uSA9AT1Bv5i4od2dOHIZNXmidte7lLnV+aIivtunzTzfpwhhTm86p8W2vIYI0kAQhNGM
 gp3i31Q6G1aYgAa4RgRmZwYD1sBAHTD0L3Z87z/nb8dbRcZkZPnopllFyhXV922NYUbO
 ZwH+lB/4eNI4X/lX/Ndg4g3hsBTN1McmPXf4InhrdQib+HszshPdXhAKCkxl6vCKMyUm
 rCz9TiCePsv7GDdMqwhwivB6bP8QvinljsQpYHaqKHwV2XgByrDS/u1LtIlbtWGi6pGq
 tX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=opc9QPH8t0rwYGBLZ/6s2ZS8vH/2JFxpHjhMhYhyR6c=;
 b=4MWGLdNdFsqi3V3gy89DHqmDd9pbcbTQOON3n0X450SXLi2HsBtI0KHeihPr1Lzyye
 vU0bdYV7DCK8SHnCnofikHqifendk+llYt/WYi5Z31f1WuSNI7KKlorPH7Gyiui9S240
 KOioCvebW0NAUoP1oYEysaQ82u/WK5bUFbrY/OGPYrxie2+kh+p2z3sX3bUPtW4foqH0
 LMdkHPN1Hf0sCmWhHoQtAhwKduEV2mL9m7uRF4M2WU3zIU8X7YSy57Hdt1NqFKmKVT7n
 FaeX9fWM7DsaiufbeeYgY4qFoZ7nRpojlzPXXfWsqksp+G8g4FUu0gp8ZdZqXkVetm1T
 +h1w==
X-Gm-Message-State: AFqh2kqqF0AscVG41efCJuzy9nILm0lhe5ilZtB95bhHLWn9JPb1R1nf
 WgS+T3CLWU6pJI7GtRFYpN2oBg==
X-Google-Smtp-Source: AMrXdXtPorQ/tIX0rgBIsJ9j1MJAYlH9dZoCXDU0vp+XdYqCRbho82nhjJOkeWYy5DpmT4mQb8oQCQ==
X-Received: by 2002:a17:906:7193:b0:870:d9a:9ebb with SMTP id
 h19-20020a170906719300b008700d9a9ebbmr4434354ejk.38.1673870170238; 
 Mon, 16 Jan 2023 03:56:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 ad7-20020a170907258700b0084bfd0a117bsm11906977ejc.16.2023.01.16.03.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 03:56:09 -0800 (PST)
Message-ID: <6312bc6d-684b-1b01-411c-4c316e754edf@linaro.org>
Date: Mon, 16 Jan 2023 12:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230116115132.348961-1-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116115132.348961-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: msm/dsi: Don't require
 vdds-supply on 7nm PHY
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/01/2023 12:51, Konrad Dybcio wrote:
> On some SoCs (hello SM6375) vdds-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
> which is voted for in the DSI ctrl node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


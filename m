Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4103B66CF75
	for <lists+freedreno@lfdr.de>; Mon, 16 Jan 2023 20:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180A110E49E;
	Mon, 16 Jan 2023 19:20:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7224D10E49E
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 19:20:12 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id cf18so63900233ejb.5
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 11:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eDJhl2JrEfjVRzKQvqBIMz7y/1765blM/Rj+5k8sN3A=;
 b=dMuefG64FEW3xgijUTbpxZl/QVCMjI4rPW55P+7ETbewC1Lq0kcKsAZR8IcIKfPkli
 4HZQtF2DVAtRd6m/3w/i19ZQ49JQ4noTpmGnd7qEcuFXb9sDZEBIWy/r4H/jqTm8/EuO
 e3/t7Aqkbxsw73YuTRkYMm0kM4AwWH+kV4JxkUakKQ3H/7FiNlzT7jyo/sxL2DtZuxSj
 VVGchKDFTn+gv3I7hYjvCVP3nlnvf/TbNrPoN1PoxzAd7/HVIk34vNFE19ZS+GsqLw02
 4tdb3jDAVtNlF7juhkj0CquFde30fTi13j5rRzlgoGTXZEoS3npMQmmREoS+uTpHEPew
 6V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eDJhl2JrEfjVRzKQvqBIMz7y/1765blM/Rj+5k8sN3A=;
 b=5xLZw0CVNM9Dtecqq3JbTrxK8NziyGkUQzBO1RxlwVeiTYFNe84gqOYsMmPVa0EHRP
 35MYMvxMaKl9CfuaIAlaHoCAqZZkKH1jnGE6H8cxsDueBEUNinZ+LP9wr9TbGZiJREOF
 tEZaufHaMMdmJWyH280iPRtypS7j0tQTTVanl5uZmgvf/dgoaHJdhGkr3YjPuV20ugvw
 vUVvjLoiFy9EtC0KcQGOtE3D0ls52cBlmW3nnhfwz7rKmyF8stIwIPJEkuNOSEEKmDtq
 8vY6x+AjgcVjtba8XQqneR7d5rOLs7hOWJFFWncQ4SdObmG7fjd9iGXjtN2OvXE95LFj
 8pVQ==
X-Gm-Message-State: AFqh2kq7ShwmekpkTnK8sqvBw0lyXo8dvjobksHXSk8ty1LFRE5qiM8I
 3dm2JxWpsVWUFWR+odOHgJBOcA==
X-Google-Smtp-Source: AMrXdXvRp1jhXQmTSRUs0FqepxPK0fgrpXAf5m/8kczSCQMkAwnBPCYakTyiXOPRvyGSw0x4I9lc8Q==
X-Received: by 2002:a17:906:4950:b0:870:5ed6:74af with SMTP id
 f16-20020a170906495000b008705ed674afmr4624045ejt.77.1673896810745; 
 Mon, 16 Jan 2023 11:20:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a170906c31800b0086dee4e5555sm2891358ejz.87.2023.01.16.11.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 11:20:10 -0800 (PST)
Message-ID: <ed199baf-a4e2-cbb5-d399-2387e538c466@linaro.org>
Date: Mon, 16 Jan 2023 20:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230116114059.346327-1-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116114059.346327-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/2] dt-bindings: display/msm: Add SM6375
 DSI PHY
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

On 16/01/2023 12:40, Konrad Dybcio wrote:
> SM6375 has a single 7nm DSI PHY. Document it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


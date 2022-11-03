Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D931E617E87
	for <lists+freedreno@lfdr.de>; Thu,  3 Nov 2022 14:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4B210E5F3;
	Thu,  3 Nov 2022 13:57:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B09710E5F5
 for <freedreno@lists.freedesktop.org>; Thu,  3 Nov 2022 13:57:39 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id l15so1238285qtv.4
 for <freedreno@lists.freedesktop.org>; Thu, 03 Nov 2022 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+/kbu/rTJsotk1T/v0yErGccpI1lWEa56+Z8vRnAew8=;
 b=HML+OCBooh2H/+sBWodDoJfpV2vNjt8LpB7Ey/4FeHJuM9yFcAMU8cZqgrFZehOO4j
 Ug0W9MVn6AJqbM9VOoD/Ne//K9ZvGX9vWjmSuXOi8QngNqgZ0vBdHV0f12QGgiZj18yN
 YLSOWKk+oh1ueg2tKHqHZtnMdm0XjZvFOfQCBIpcoexe+Qi8RM42x837At2Sw1RhkYBC
 wWOqp60M+Ruqi8zGsSM0uGjTHEKPhapnbZ6q9IzVJfXoGc/JXfMgEozD7ZZgnIJLnbRG
 QAslBpU8a+ypCl6hi4+/8+KC9HUoO1nH1iFqtn0ffs1V6hMPoEGAkvzlkwTTyDxoGUZA
 wbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+/kbu/rTJsotk1T/v0yErGccpI1lWEa56+Z8vRnAew8=;
 b=KtZSvlm00xI4TZ+5U5sO74I2nSFQrD/TdU/xMSQ1VZYGXVn2uUlIBB0JyFyoFVHLc7
 GwE68e0oE0GPkqMfNRTJEIni0NC/UxyHAtFYezHNVo89i15o+LULm4572jO08UF2Pacj
 3cQ3bm6dn8/4XJ5i+XHCrs5sr3OnJ6bC4SfsJC6fPzrS0NhqdMZBpy9UUw34Bq9D3C64
 eEJmDTl7SLjmVetjeeyT2t0cv6zji6+82OUaBKKIsb2zuK/WKROSFmovoodbZ7DTrNjU
 kVaVLaWNd1N/Ja3Sqtb/pTHkP07bZ1sN0SqZBJ43EpvgdXao8QQUyrSPj8/XgtHkw0Jk
 hGAg==
X-Gm-Message-State: ACrzQf0RVpz8HKqaON2dVYVjTuyFgDh07OaPISH/xiOeT1g6sOJOIly8
 f2NlwngnWjdDobULU5iZ1tohbA==
X-Google-Smtp-Source: AMsMyM5S6KwJzpv2ZmHdDmyclRvj2EtvS6U90ilW1CUAkEh5dEIS3Zo6SMhfCQVOBz+TbcN+eME67Q==
X-Received: by 2002:ac8:6c9:0:b0:3a5:4109:b6a6 with SMTP id
 j9-20020ac806c9000000b003a54109b6a6mr10053786qth.648.1667483857178; 
 Thu, 03 Nov 2022 06:57:37 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb?
 ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 h8-20020ac85148000000b003a50b501a01sm534826qtn.87.2022.11.03.06.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 06:57:36 -0700 (PDT)
Message-ID: <aa116367-9cc8-7888-84b6-d5f7814554c9@linaro.org>
Date: Thu, 3 Nov 2022 09:57:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
 <20221102231309.583587-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102231309.583587-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/8] dt-bindings:
 display/msm/dsi-controller-main: allow defining opp-table
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

On 02/11/2022 19:13, Dmitry Baryshkov wrote:
> Allow defining DSI OPP table inside the DSI controller node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


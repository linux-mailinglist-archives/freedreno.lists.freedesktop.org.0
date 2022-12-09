Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61B2647F54
	for <lists+freedreno@lfdr.de>; Fri,  9 Dec 2022 09:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AF110E509;
	Fri,  9 Dec 2022 08:35:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB1810E503
 for <freedreno@lists.freedesktop.org>; Fri,  9 Dec 2022 08:35:14 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id q7so4200364ljp.9
 for <freedreno@lists.freedesktop.org>; Fri, 09 Dec 2022 00:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ysnzACHXURIkIO+/AQjmEoci49zgr//vhpb8kPXwKcU=;
 b=Dz4L0SfClKX1bHZ81SYcCTOpqPl/TgBLy411jpBd64n3fzciV3rClVWbCDT5GZKmRV
 PP4eUU6/sz8gWqwRx4Rd0yI72rh+vELPXT2Vj4pq1Eiklx1jHNFD46pZnTX9BxP1cq91
 gHfxpu3JJ953kXLi5spr8CtCUdp5Zzc20A75r8x4yZWWNFxTdSjMs0H1I3pex/PSX0D7
 SIN0VvErlW0bTBtizX/T8Q1oKsAP+7wel/FagaS/1+bkt4lue8Aa+gaYf2SaaugUVVB4
 DrH+xVOGbM3EFQmO5KGIZsY2wk2V7cbA1Bl2BdHImwOkn0Sjl09w90hMyf3SKtPWUpq1
 m0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ysnzACHXURIkIO+/AQjmEoci49zgr//vhpb8kPXwKcU=;
 b=DRMqJJPvJ03bSl2IhjGPTTklYG3hpWphWkdnINYEwQx0sFs6btWVPZb12rcfyWXmNU
 h9SHSfo0JcgKfYq0/IiKgR/auxd6o31nD2oVtSJmetWNIG2cpNZBqk9CsnEImqOGC3Te
 kk8fuqUeD0RYNwdpno+/4YP/vZPCbl4zBD2WuM+kJSSFMOR9Krf6WclEfCS2YL1N3eDj
 gKAVnd8pmiomFoRvqrvc/lJEWhrJBpX1F2opjnhE+wd+sOW16SunRTla3GLowrhjh+4+
 MOALmgDeuue3e7G4B/UxjYOdv+LsDhSaNP8GI1N1W6I3lstGb0yHEsICvAHsKPbp+/z9
 EqAw==
X-Gm-Message-State: ANoB5pmaVlI4UkhBMWED/Ok8xmbSZzjePElF1hLPoqvRU/hTFXRETxp0
 W9cZ22pC2WfOJYNf94+7jDJ9GQ==
X-Google-Smtp-Source: AA0mqf4BnUchN5dAKoDAdQcRawUxcca7TShvvAE+vweS7atuhK1MMnvaPvUhFPB+lJePI5J9QSLU3w==
X-Received: by 2002:a05:651c:1187:b0:278:ea26:af88 with SMTP id
 w7-20020a05651c118700b00278ea26af88mr1713866ljo.42.1670574913010; 
 Fri, 09 Dec 2022 00:35:13 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a2e894b000000b0026bca725cd0sm131502ljk.39.2022.12.09.00.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 00:35:12 -0800 (PST)
Message-ID: <be4b57bc-2d1e-3bbe-b5f1-8a3946c2a9a7@linaro.org>
Date: Fri, 9 Dec 2022 09:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
 <20221208005458.328196-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208005458.328196-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/4] dt-bindings: display/msm: convert
 MDP5 schema to YAML format
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

On 08/12/2022 01:54, Dmitry Baryshkov wrote:
> Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
>  - MSM8996 has additional "iommu" clock, define it separately
>  - Add new properties used on some of platforms:
>    - interconnects, interconnect-names
>    - iommus
>    - power-domains
>    - operating-points-v2, opp-table
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


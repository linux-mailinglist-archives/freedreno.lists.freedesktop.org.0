Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EB35E8A90
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840E110E568;
	Sat, 24 Sep 2022 09:12:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5285410E568
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:12:48 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id a8so3613568lff.13
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=b9ndRpD3XDG4vRnZyuWL/4sBXK3UFiGwxkvbkbyDif0=;
 b=E5Tw4dhqCPleX0AI7xMfQutiPwlUTALA+vf7iGYc/EiRXNhGDY52+G9TTuIHGwv8ve
 X56TkANpuChHMQpM+U2+pVbzE4PXhPhNh5cw/1LBf5QcsC5qjJG1lP39FIccfpzHG2uI
 vDOZKO4gnN4ugx8h1wTVfdqtEC5QYiNGHpx9/mMo/1rQPb0HiNVKqkHOLU3G2e3XKagX
 ++FA9My2JQ6id3yuiFpTHmj4oJkQM8evrqbgSWc2XwTQ77nxKY2rXbgnanOHXi0yiixm
 lq4CsRsxrGBYJCWEhkcV6NrUH9rvnGMi1VXc1MjGhFllnqx2bb0bKPH3fER2fAmyPEB2
 am8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=b9ndRpD3XDG4vRnZyuWL/4sBXK3UFiGwxkvbkbyDif0=;
 b=yvtV71AvwCWwUD3DBXEp/Bveb3YrtIGevB6MDwNkGuyVZ6C+AAld0u7x76zvgJJeHr
 FvyQUcsCWgcQeLUzCO+zK2Hu83kQgfkJpfxLRFToiYomOXbHeDi+47B3aq2xHNuE4R5F
 DhAN6ld5M29acarQUII0w6uXn+Ta3vM75rqOrnrkN1kR3pp+JgoZWODJAv8T5Y54ZR0f
 DM+N04oDu1NGwRGDy59sMX5lFuwh6KGk9yTNCBsPorDy1zJ+UtnQjcoprm0glKC9moEn
 QgjiYSqRERuK7R2KT1YZA1yu6Hh/Ip/XWIyqnRNm8UmGNNyMzLNQh3luw5hU03MOO3lc
 98bQ==
X-Gm-Message-State: ACrzQf2aBe5A7db6JKGYUcHdHdAGhxN78dcXusswC8S7re5pbCQdViwk
 0QC54j1yhcpvFh2hti8OTqcBwA==
X-Google-Smtp-Source: AMsMyM60nrNM5cgta+PU9fHotuGfZLcKRFfwhkNz1i/9aGulPbliCfF/QdeBcfr1ty//mUm9CPaDFA==
X-Received: by 2002:ac2:4e8f:0:b0:49a:db9f:d49e with SMTP id
 o15-20020ac24e8f000000b0049adb9fd49emr4566270lfr.652.1664010766668; 
 Sat, 24 Sep 2022 02:12:46 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 z7-20020a056512376700b00498fbec3f8asm1835259lft.129.2022.09.24.02.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:12:46 -0700 (PDT)
Message-ID: <f6ed6e44-ab28-9f13-4193-517eef0edea1@linaro.org>
Date: Sat, 24 Sep 2022 11:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924085129.161086-1-dmitry.baryshkov@linaro.org>
 <20220924085129.161086-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924085129.161086-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] dt-bindings: display/msm: Add
 QCM2290 DSI phy
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/09/2022 10:51, Dmitry Baryshkov wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> QCM2290 platform uses the 14nm DSI PHY driver.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> [DB: changed compat to follow the agreed scheme]

Bjorn asked to keep consistency in other case:
https://lore.kernel.org/all/20220829210408.gxbv6szxfwiiwrbv@builder.lan/

> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index bc3d0b4063c7..088a03ed5f80 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -17,6 +17,7 @@ properties:
>        - qcom,dsi-phy-14nm
>        - qcom,dsi-phy-14nm-660
>        - qcom,dsi-phy-14nm-8953
> +      - qcom,qcm2290-dsi-phy-14nm
Best regards,
Krzysztof


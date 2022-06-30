Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CCA5620D8
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 19:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D1011A759;
	Thu, 30 Jun 2022 17:07:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992C911A72F
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 17:07:47 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id t25so34826313lfg.7
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=5h9m2r1as3dVO5Ej+4ZiJew20CUmK76LyEozgtg6ehk=;
 b=RpClWCfbqMGu2IaKWsyy/R7HM5UFKNt5IfpnOqCRNW7IeAGO0hOQ8gg3W3l8GwANGS
 DndKo5NBBpM7M4OzjLhDl4yyHG1a2jZ4FTPnoNrWLzvsn56ATwrLWpSkSt5wSv3rKAzi
 b1UlsdO/ZFFZxcP7I301pb460P5tLR90qusgBA9D80fQZCRHaYD/f/Mndrmv46pmuxKa
 qEzW8NhW1huy78tXn0ahmqTf/fRTK83e6KpRM2Og0b/4LkNTnPkTIS2PQ3Ww9KSWtv6m
 aaO7S3XYrMgcSvL2T3iBfBcprAhBJamvksBcnSLMCPD8Pwrhs6FSQnvorU6rgaqtRhRa
 q6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=5h9m2r1as3dVO5Ej+4ZiJew20CUmK76LyEozgtg6ehk=;
 b=Et255doe5eDOIhUF751fucug9Dae6IfR00uZONE69aMg0XChpshzCPDlZ4OR8A9MvY
 fbQuLWB76fIC/3TfnbHxklOyxx8IKyINiKT5YiH3OyO6OBQuh5NQtu9YgKWEu+J/T0Mb
 MCszPfYOtChdsJxjKXe3JeSTRA6gFDzo7IJc6QG1/yLJjJN+r5EuOUgCfC31QdCLHyLI
 aTsdMaSrS1sXVVUbByPz3oF/cAlNvesm8naogwSpK3Zy/kdU85SZGOu4D7jhD9TKgzF5
 q0BLUYBXw+sPTJxNtCZ42bB0RhnMw8tTMWNaS4LIQWvE/+FPMQ7TtMRvEGHuXmbDl4Vy
 tiOg==
X-Gm-Message-State: AJIora/PMaiMU5gUgEev5x5uaTsQRuGZE6CMY6pajCYhrOfCcckLW2Zv
 jlpz5LyBrBS46hYBxRf7XqELLQ==
X-Google-Smtp-Source: AGRyM1sYxOrvJE5VNAQuV35nuPVYN8Uc4ZOlo7XwTERwo1oW9GaijikgQCz+byZALgT7XFQduQmvEg==
X-Received: by 2002:a05:6512:3e0e:b0:47f:6a95:9b98 with SMTP id
 i14-20020a0565123e0e00b0047f6a959b98mr6372997lfv.177.1656608865898; 
 Thu, 30 Jun 2022 10:07:45 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210]) by smtp.gmail.com with ESMTPSA id
 c7-20020a19e347000000b004791fc12f6asm3194067lfk.46.2022.06.30.10.07.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2022 10:07:44 -0700 (PDT)
Date: Thu, 30 Jun 2022 20:07:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-3-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-3-bryan.odonoghue@linaro.org>
Message-ID: <6334180D-C29F-4EB4-BD2D-1F832E9FF990@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH 2/7] dt-bindings: msm: dsi: Fix
 operating-points-v2 constraint
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 30 June 2022 15:08:40 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>The existing msm8916=2Edtsi does not depend on nor require operating poin=
ts=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>


Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>---
> =2E=2E=2E/devicetree/bindings/display/msm/dsi-controller-main=2Eyaml    =
 | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml
>index 717a5d255ffe4=2E=2E101adec8d9152 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>@@ -137,7 +137,6 @@ required:
>   - assigned-clocks
>   - assigned-clock-parents
>   - power-domains
>-  - operating-points-v2
>   - ports
>=20
> additionalProperties: false

--=20
With best wishes
Dmitry

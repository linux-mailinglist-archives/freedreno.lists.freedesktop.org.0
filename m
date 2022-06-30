Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2600E562125
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 19:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86D711B33F;
	Thu, 30 Jun 2022 17:21:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A07A11B33F
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 17:21:24 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z21so34860049lfb.12
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 10:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=BohL4XV8r1xt0c24TIuYDlP8R/meGuCrMEtn1MhTCXI=;
 b=wuWu6XFubEpJUzf4oKOWPwR/Ni5MgstHBQVZSoGrPo5OQ2j/JJzHSOIpseOT4tlYiz
 EKu+RQ7K4KvLKZ7znlUg+z+9D1VlMaxHwjHzk6YXNYIaylEOwy6Ab3O6RHruoLzS7BKo
 WUDfTBxkJxsbSj8c9OOzEAIG13agptse6eg9/eemuFzwt7nb+xD3hj7Z7WccXc+LtOHI
 9M6BjnFxAiHGYtYzu8ZZDsbcKJjLfu3jswLr8kDqoDJtCct2HASjWexULB+p2qxuC7lZ
 q21XvRA3OCKGJK7KJuvyer3VWn6T6iT84/pRyhlMMu3Vz1Fecu8iIPPKa7hcC/T+Tk63
 lwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=BohL4XV8r1xt0c24TIuYDlP8R/meGuCrMEtn1MhTCXI=;
 b=OMSaEAz8Rx4Dvaqk+YUIWeYxuhrPD9LH5MboiLAIpx6LwFhj65XtEzphqqF1Cm8T0p
 kv3bFq26WbMFVM2+m8EELW97ORVH44agFsPM24nQ1cUYmGwbIacg2kAKITYO3rYBBQmJ
 YW0sY1Wne27/RcxWNnm4XW8I1aY+O1uk2AR/wkiPKZdMIz863fEMkq/iCFl24vkt+K2J
 XOAt8iBABUEcyxXBfAtTXPEIRLse28YAgWMBtB3LoARdgHsjUQ1Oz1sYGSoYd7EsPRqm
 MizR+wqZ/6M2TwgX6F9K4rKpjnuZge/pF3DSrVH99gDTrovOle3Yr/iviOAoOqajKGCC
 0emA==
X-Gm-Message-State: AJIora89hPVjIbfXZY4/nxuX3tAXCMAu5KbyK9ZHqa9Bw0qc8K8Kbmm/
 aOyPN2+u3tggFR5VEyta4We+zA==
X-Google-Smtp-Source: AGRyM1sR1CtTf9+8L+GphpYCYpwDNnxyY1KqkI8/i9uzVJT0bmWYlpGK15LRaDnHmM45M+BszRz83w==
X-Received: by 2002:a05:6512:139f:b0:47d:c633:2fa7 with SMTP id
 p31-20020a056512139f00b0047dc6332fa7mr6704763lfa.513.1656609682669; 
 Thu, 30 Jun 2022 10:21:22 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210]) by smtp.gmail.com with ESMTPSA id
 bi16-20020a05651c231000b0025a66b3fc45sm2765061ljb.97.2022.06.30.10.21.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2022 10:21:22 -0700 (PDT)
Date: Thu, 30 Jun 2022 20:21:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-6-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-6-bryan.odonoghue@linaro.org>
Message-ID: <CD1AA865-0891-4160-A920-FDB65BFC4087@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH 5/7] dt-bindings: msm: dsi: Fix clock
 declarations
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



On 30 June 2022 15:08:43 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>When converting from =2Etxt to =2Eyaml dt-binding descriptions we appear =
to
>have missed some of the previous detail on the number and names of
>permissible clocks=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>
>---
> =2E=2E=2E/display/msm/dsi-controller-main=2Eyaml      | 23 +++++++++++++=
------
> 1 file changed, 16 insertions(+), 7 deletions(-)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml
>index fd9d472437853=2E=2Eb24ba6c346a77 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>@@ -28,22 +28,31 @@ properties:
>     maxItems: 1
>=20
>   clocks:
>-    items:
>-      - description: Display byte clock
>-      - description: Display byte interface clock
>-      - description: Display pixel clock
>-      - description: Display escape clock
>-      - description: Display AHB clock
>-      - description: Display AXI clock
>+    minItems: 6
>+    maxItems: 9

Please leave descriptions here=2E They are better suited for the clocks ra=
ther than clock-names=2E

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>=20
>   clock-names:
>     items:
>       - const: byte
>+        description: Display byte clock
>       - const: byte_intf
>+        description: Display byte interface clock
>       - const: pixel
>+        description: Display pixel clock
>       - const: core
>+        description: Display escape clock
>       - const: iface
>+        description: Display AHB clock
>       - const: bus
>+        description: Display AXI clock
>+      - const: core_mmss
>+        description: Core MultiMedia SubSystem clock
>+      - const: mdp_core
>+        description: MDP Core clock
>+      - const: mnoc
>+        description: MNOC clock
>+    minItems: 6
>+    maxItems: 9
>=20
>   phys:
>     maxItems: 1

--=20
With best wishes
Dmitry

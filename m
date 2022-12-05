Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CF76436EF
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 22:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0772210E2B1;
	Mon,  5 Dec 2022 21:34:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A7410E2B0
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 21:34:20 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id h10so15054816ljk.11
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 13:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/AFtgz+lK9M2V4Cs5/9PoWBFJhdcyuHdw2Q3pWcGYM0=;
 b=YUevHO9XgqPvry6HSJ6/W2BJQQU25R4upN0Typd6FaqC5gRATvHgY7MXNV3I064Uit
 nFsS1oQIWZ3bcFOEW6RP4tJmb543mBunzrJK8QjQGHoK97Z2MLio0b4rznLjay2U+afj
 qFly6OL7t9m2GhCC4P35fJtgFIlVWHZNDMbCCDlzD7b9IbaX2rscEBxya/UMGCZaB/3w
 GInkZJ0435TBwAFZ8J1xMD60ZjO52UhcbdKENSnASGDa464v/GDfgTWMCd5VjEfcVZql
 W1Ky8ikqcdYSkWb8EGPrM+UV08V3XNFDa/1OWa93VsbsAn0buH6/OpKDGu3YNWUYmVfr
 tfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/AFtgz+lK9M2V4Cs5/9PoWBFJhdcyuHdw2Q3pWcGYM0=;
 b=42ltLQm3E3Ygwi7/qGriT+LRDd9MYWrPOFgf0s0CnhBjIe5KiES/MwnxKa0X+b7l5D
 hSUNhW7hWtmYyswBnWH0PQivushoWsw4Yf66rQnRtFnnmz2bQWE1Zhx4KXgDGBlUcVGF
 +uOZbkevjyInWZu/X87Tljo9KYRDolnqspI2U3ZB5EUSUCbsU0aQqlUhthg/fdhSjUvX
 ffD9pCEOgOI5TMyvGxJwdREX0CLwdGuWM5mMrbY0GGpAonJmgHr+PWBKNZgVm4ZIwZwb
 Ut2IFakZ10MgPW8STMS2bWOZtvlEP9nJUAG/aAcXeIqKrHM0rDR9q1eQ1VaBAfT3CNKl
 D9pA==
X-Gm-Message-State: ANoB5pmrtC67Lmxc6jl2fthQKoMxrLPhTJAt4rDqpT+dIzzMy+ZWaqKa
 oR1D+NPlNXc0rDsTDar1u+DzAQ==
X-Google-Smtp-Source: AA0mqf4BfnB/i1w1SRHpcZzPmtxt7+I3WAaF8JW8L4rYmlZYdEqUFnQ4Z7gOet/Ue5qWPSJ4tfTtbA==
X-Received: by 2002:a2e:b4a3:0:b0:279:edbf:118c with SMTP id
 q3-20020a2eb4a3000000b00279edbf118cmr3085208ljm.425.1670276058362; 
 Mon, 05 Dec 2022 13:34:18 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129]) by smtp.gmail.com with ESMTPSA id
 s8-20020a2eb628000000b002776eb5b1cesm1516828ljn.8.2022.12.05.13.34.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Dec 2022 13:34:18 -0800 (PST)
Date: Tue, 06 Dec 2022 00:34:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com
User-Agent: K-9 Mail for Android
In-Reply-To: <1670267670-15832-3-git-send-email-quic_khsieh@quicinc.com>
References: <1670267670-15832-1-git-send-email-quic_khsieh@quicinc.com>
 <1670267670-15832-3-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <5552E92A-2059-4D1E-AC88-3214D93D93E3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v8 2/5] dt-bindings: msm/dp: add data-lanes
 and link-frequencies property
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 5 December 2022 22:14:27 GMT+03:00, Kuogee Hsieh <quic_khsieh@quicinc=
=2Ecom> wrote:
>Add both data-lanes and link-frequencies property into endpoint
>
>Changes in v7:
>-- split yaml out of dtsi patch
>-- link-frequencies from link rate to symbol rate
>-- deprecation of old data-lanes property
>
>Changes in v8:
>-- correct Bjorn mail address to kernel=2Eorg
>
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>
>---
> =2E=2E=2E/bindings/display/msm/dp-controller=2Eyaml        | 22 ++++++++=
++++++++------
> 1 file changed, 16 insertions(+), 6 deletions(-)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller=
=2Eyaml b/Documentation/devicetree/bindings/display/msm/dp-controller=2Eyam=
l
>index f2515af=2E=2E13d2c3c 100644
>--- a/Documentation/devicetree/bindings/display/msm/dp-controller=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dp-controller=2Eyaml
>@@ -79,12 +79,6 @@ properties:
>   aux-bus:
>     $ref: /schemas/display/dp-aux-bus=2Eyaml#
>=20
>-  data-lanes:
>-    $ref: /schemas/types=2Eyaml#/definitions/uint32-array
>-    minItems: 1
>-    maxItems: 4
>-    items:
>-      maximum: 3

These properties can still be used, e=2Eg=2E Bjorn is submitting patches w=
ith the old property=2E I think this should be marked with deprecated: true=
 instead of removal=2E

>=20
>   "#sound-dai-cells":
>     const: 0
>@@ -105,6 +99,19 @@ properties:
>         $ref: /schemas/graph=2Eyaml#/properties/port
>         description: Output endpoint of the controller
>=20
>+        properties:
>+          endpoint:
>+            $ref: /schemas/media/video-interfaces=2Eyaml#
>+
>+          properties:
>+            data-lanes:
>+              $ref: /schemas/types=2Eyaml#/definitions/uint32-array
>+
>+            link-frequencies:
>+              $ref: /schemas/types=2Eyaml#/definitions/uint64-array
>+
>+          additionalProperties: false
>+
> required:
>   - compatible
>   - reg
>@@ -193,6 +200,9 @@ examples:
>                 reg =3D <1>;
>                 endpoint {
>                     remote-endpoint =3D <&typec>;
>+                    data-lanes =3D <1 2>;
>+                    link-frequencies =3D /bits/ 64 <1620000000 270000000=
0
>+                                                  5400000000 8100000000>=
;
>                 };
>             };
>         };

--=20
With best wishes
Dmitry

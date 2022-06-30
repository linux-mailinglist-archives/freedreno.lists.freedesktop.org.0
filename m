Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53022562121
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 19:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7626811B205;
	Thu, 30 Jun 2022 17:20:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5349D11B205
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 17:20:08 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id q9so23985736ljp.4
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 10:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=damohPfMdpLkq66NtoK5mlqa9rA96R50kIkGHbj3Spc=;
 b=gmjrbUpiJM7zv5Def7+C0oPeRN6HLsd0lqOL/zTp5emkqBsBJSSchUWI8g1iUiSdHa
 CNqWEC5k0ZHEV1Vxpw0dp3ibfnwEH0+buty8lhvIG6PYRxN3mgmAgOOIWxnezK1HJfD4
 DXWNfUQOrNgXyA8twNaiIhIYB9isSOTkxSG0BaPmVrf0Z8JpkqjxG7NUQhQimabywtQt
 gk76F9HxbrVrGA6QYuYIH18axeu/2W5qmMbSogk//RLOYgujOaG8+paWtW+/p81HrApX
 DQMzHTMJE0KfKjTNvCHGmgYk3PcXkEl1j9DroviDiwrYZE3/xcOc5feyq4CllI6mg72O
 p5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=damohPfMdpLkq66NtoK5mlqa9rA96R50kIkGHbj3Spc=;
 b=1ajXeHBV5CGcU0RyxxRdLg5iXkc1yE8D62x4TtQk28HKnyVTry/SVht1Z58qmnfcVL
 xNT3c/BzwV/sPlIN7++PEGnDgrLwlRSAiD+s8mmlGy7voHt3VtUoKCV93siPLzWD57ge
 8QWJQeIFNg42krPuwXTD/Y7hSyXQ9K1m/nCKuJABlyMQiKUxL5Axh/1XAPA2ADreQ8zG
 rZTmuAxft32vw/mDzu3SI2B+illhwrhcuOxgfeEtpzuR3mlDzONYbBazvlqcmJtQYmWF
 V5i8oGPNLKLrAQfXAQCw68tJaOqy1j9B9NLUCYDRWaqViDwwgoCqJPM2vOHFs8fTNOxP
 V0Ew==
X-Gm-Message-State: AJIora9cIY3FW3ZP6+4nM0cz9vxF3buKU2hmAn/98ecZSCZRb6bVkdVY
 CgONkSFdc2tcSUw2VDarA+qWgQ==
X-Google-Smtp-Source: AGRyM1uvlzgvoIauk6FepAZQ9ApDovAivrQMxolpgVL3q7pogIma25pTH0Wsl/qZ/jhThMGXMy3Efw==
X-Received: by 2002:a2e:6e0c:0:b0:255:98fb:cb45 with SMTP id
 j12-20020a2e6e0c000000b0025598fbcb45mr5692263ljc.55.1656609606623; 
 Thu, 30 Jun 2022 10:20:06 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210]) by smtp.gmail.com with ESMTPSA id
 bx38-20020a05651c19a600b0025a6d563c57sm2733279ljb.134.2022.06.30.10.20.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2022 10:20:06 -0700 (PDT)
Date: Thu, 30 Jun 2022 20:20:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
Message-ID: <0F822D11-788F-4527-B50E-0C79F05D69FA@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH 6/7] dt-bindings: msm: dsi: Add missing
 clocks to 28nm DSI PHY YAML
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



On 30 June 2022 15:08:44 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>Add in missing clock and clock-names declarations to the 28nm DSI PHY=2E
>When converting from =2Etxt to =2Eyaml we missed these=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>
>---
> =2E=2E=2E/bindings/display/msm/dsi-phy-28nm=2Eyaml      | 17 +++++++++++=
++++++
> 1 file changed, 17 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=
=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml
>index 3d8540a06fe22=2E=2E9ecd513d93661 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml
>@@ -19,6 +19,21 @@ properties:
>       - qcom,dsi-phy-28nm-lp
>       - qcom,dsi-phy-28nm-8960
>=20
>+  clocks:
>+    minItems: 1
>+    maxItems: 2
>+
>+  clock-names:
>+    items:
>+      - const: iface
>+        description: AHB clock
>+      - const: iface_clk
>+        description: AHB clock
>+      - const: ref
>+        description: Block reference clock
>+    minItems: 1
>+    maxItems: 2

This looks incorrect=2E You have 3 items, but maxItems in 2

Also I'd put description to the clocks node=2E Clock-names are self-descri=
ptive enough=2E

>+
>   reg:
>     items:
>       - description: dsi pll register set
>@@ -36,6 +51,8 @@ properties:
>=20
> required:
>   - compatible
>+  - clocks
>+  - clock-names
>   - reg
>   - reg-names
>   - vddio-supply

--=20
With best wishes
Dmitry

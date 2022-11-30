Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D8563D75D
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 14:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DFB10E45F;
	Wed, 30 Nov 2022 13:58:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C2910E45C
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 13:58:34 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id r12so27127665lfp.1
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 05:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z/IkgJhGlC2jakl2mEql5tWtZmP6qrQiICZlujfOmWc=;
 b=qeI5DGC7HVu7dL1ljYAK70PykFG9IlTdEiF+RN4EhqN+g45Vwfb0ZYUgY30IcuUq1v
 IV1dR+9CViyrU70Ec/JtxkG8vbmJ9DUibs57hRzRMWRhm+b+BWeQqtMAlNk3vcj5vFiG
 dNVaLLdvj6Hx3mzzDZszjzXd06PV4+zwPffdOIlaYUjPb1fdyVTsbB8OcGz6YK70hPFP
 ZfJIWvXt8VFoqdXTPOKHzktLJCAu5zw/lWf4s38du6xHZA6/sbhephVAediUlGN+PIwP
 fwvmp8iMn7N/u3w9zv7nl6VgkDr03TsXtZnrPjhtdBZMbefGO0ouDX9wYea6vX/QqU9Z
 bsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z/IkgJhGlC2jakl2mEql5tWtZmP6qrQiICZlujfOmWc=;
 b=aXGCGoEooq2MXuUSdwSrtt8OIGCGPrMXaFPPCzdEhc3Fdc1GHvN42wPROHUdtqkpyJ
 veoOhw4POzxPnljAz8BIRJB0Lok0oSyyEAqmgjQSojAf3gK2Q1ttCgLr9CIJR8K0+5cY
 pz7GZKWywOJo+HOmw5FmYzNTqMwZZ1TFkdQ6EcgA1Q4XDRcyGEmFPFdwoENmXmYPwLqn
 DS1lwhPd6Hsc1gInDXvuwbnB4RGV0uFUXILIhVg9O00yhkshdC2YfrGf08iRQffYme7d
 zVM0MjQ4I+r/oV8g2zKWonu3RDkcbwSZFk0kndpUbBR1Hn2LXUDSgvo9P+DEvxCWRZEA
 Ohrg==
X-Gm-Message-State: ANoB5pkY2Jy/l4oXp6McaCgYg46dKENWT7Ofp8CnnTs927Sqlk/UaeZ/
 2n9WABsVbGqJb/SGzvmiK8640Q==
X-Google-Smtp-Source: AA0mqf4mhUxGdxDyd1aKC1Sf0nP8jRR+iC9NP6I0ui600XlVx0c7uo//PmdFxfl+aNiow/+mVRXJDA==
X-Received: by 2002:a05:6512:3153:b0:4a2:da6:d969 with SMTP id
 s19-20020a056512315300b004a20da6d969mr17496716lfi.671.1669816712596; 
 Wed, 30 Nov 2022 05:58:32 -0800 (PST)
Received: from localhost.localdomain (95.49.125.236.neoplus.adsl.tpnet.pl.
 [95.49.125.236]) by smtp.gmail.com with ESMTPSA id
 6-20020ac25f06000000b00498fbec3f8asm269889lfq.129.2022.11.30.05.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 05:58:28 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Date: Wed, 30 Nov 2022 14:58:07 +0100
Message-Id: <20221130135807.45028-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] dt-bindings: msm/dsi: Don't require vcca-supply
 on 14nm PHY
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
Cc: freedreno@lists.freedesktop.org, patches@linaro.org,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On some SoCs (hello SM6115) vcca-supply is not wired to any smd-rpm
or rpmh regulator, but instead powered by the VDD_MX line, which is
voted for in the DSI ctrl node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 819de5ce0bc9..a43e11d3b00d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -39,7 +39,6 @@ required:
   - compatible
   - reg
   - reg-names
-  - vcca-supply
 
 unevaluatedProperties: false
 
-- 
2.38.1


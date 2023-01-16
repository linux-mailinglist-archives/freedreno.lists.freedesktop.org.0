Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE15C66BD33
	for <lists+freedreno@lfdr.de>; Mon, 16 Jan 2023 12:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1C810E3DC;
	Mon, 16 Jan 2023 11:51:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6077410E3DE
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 11:51:38 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id j17so42394675lfr.3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 03:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dz2HYd6nJfBe0hgrGwYYDvZ2nmTydvAGaGelNZK5V+w=;
 b=oj/FU/HJqnk/jAgYBwvaJ2+W69VNOMizNLyF/0WaPTch3jGdAdQJxHpz+PLiNNsFE6
 hcMy2Wn1i62w4NG7coXQ6TeQnQXtN8I7PmK81HVjbKDH4ZakqWGUzdYpQJTcVOx5t8+v
 0l5IVByuyubRTEicnaoAt9MXVfcy/8XQnCp+r897cCt2mZnHD1WIa0Yoq5OwJlH3cf/c
 0xfKYVZqHVzNH79YWByHxL+JVuBC3SWCtQw+X01Tr8FY+g3gU1Dfoofk2V4rCiPBnAbX
 7BSuG6PIm+iucEyr2cR/cvc15NJPr1996rMAKakeZ7pxWcp8r6srcH6YcjvwL0hmoT1p
 2VoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dz2HYd6nJfBe0hgrGwYYDvZ2nmTydvAGaGelNZK5V+w=;
 b=FrMTWw7PQoNo5lN/sJfSD/nO08Sq5JCeTNe8G8Rg1u+FveaTEgz2fogcSuORovo3cQ
 SnOsrEECySr7EhbuU4HFnlR17XWaU8B14ucoQSe82pRdVgzkCd3nw6+suH+uvdtfJPw6
 H0l+hhJ+GRekyOgagp4BRpg5FvGBZxlkHzeH2sDeAE4n2SNfVcBlsIh4sCdfGCVgmJ2q
 xGgaJkBqkvdKWJcyECstDs0PSd7Wz7+wOND5fk5tuK7ydDkxfvJ0s0C8H/pfPDgnuDU2
 //qrGdPwtzPcs+qx7pf7eoT9pVF/oCz6zzx4ouD4mw5edus3LJRTF61RzIc2XuuOBGdH
 7K2w==
X-Gm-Message-State: AFqh2koLbCTSLb/ZhVq1g0e8D1nCiSboh6OZdHYxy5hEkdoRtLW0HHA4
 VJNrHby/IhTlgAELivERxVPA6g==
X-Google-Smtp-Source: AMrXdXtfD/BYz/Lr+CotvpV3dJ85ETbEToRFRwov7vQEvMathl0BuERxXo3qGpZjVM3TQU9GgwPizg==
X-Received: by 2002:a05:6512:31d0:b0:4cb:430b:c6c with SMTP id
 j16-20020a05651231d000b004cb430b0c6cmr16706339lfe.51.1673869896665; 
 Mon, 16 Jan 2023 03:51:36 -0800 (PST)
Received: from localhost.localdomain (abym53.neoplus.adsl.tpnet.pl.
 [83.9.32.53]) by smtp.gmail.com with ESMTPSA id
 m10-20020a056512358a00b004d57d1c6ee7sm162433lfr.248.2023.01.16.03.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 03:51:36 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Mon, 16 Jan 2023 12:51:32 +0100
Message-Id: <20230116115132.348961-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply
 on 7nm PHY
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
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On some SoCs (hello SM6375) vdds-supply is not wired to any smd-rpm
or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
which is voted for in the DSI ctrl node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9c9184f94c44..8e9031bbde73 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -48,7 +48,6 @@ required:
   - compatible
   - reg
   - reg-names
-  - vdds-supply
 
 unevaluatedProperties: false
 
-- 
2.39.0


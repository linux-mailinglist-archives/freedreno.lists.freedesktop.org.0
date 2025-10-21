Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11DDBF5F58
	for <lists+freedreno@lfdr.de>; Tue, 21 Oct 2025 13:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A476410E5AA;
	Tue, 21 Oct 2025 11:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ouYxP6Mj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142D610E29F
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 11:11:01 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-42844985499so308274f8f.2
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 04:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761045059; x=1761649859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JZxh2RHqPkMdvbwb2L7q+GZUxl/+aVRyGR8X3MbWpuw=;
 b=ouYxP6MjbGkBZQP5Cw3o+L2h2j1s6vUSQ1wbJ2FPniccQH5HdzpQ7AfmyyZmI8VxZN
 2uGOQJX2atcvAQABbOOLu76k3FtJxmmnn191aShi1VFqKUSaj+lWFisWngVoXtK4z5rF
 MSlhWAuWhkJ+ugRBZE1iK1XoTq/zvUZ9P4cIQk3sna4QelgBSwUJXd9n75z2bqfo4z+4
 5AIgTyCh09HgtAwMlWlIxmFjzEblZfTVS7/4XV61DcfCSLGM/qB1ID4Rt2KeXDqqcnN4
 24GV2ad4aK2nGi08xlN8PIYasUaObwY9IFEwhB56Eymyh76+USv3BLumd0XZluDi4vcw
 RAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761045059; x=1761649859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JZxh2RHqPkMdvbwb2L7q+GZUxl/+aVRyGR8X3MbWpuw=;
 b=XIVYv1Irr9oElXDtCzZYx5oXb8oC5Iu0+B/+GoNUkt+Bf1shWxh3OlzCE0ZmKBQHHg
 IWkejC57ziasVegZAdyV30PGia7mykuKDNAk+iKWw35RY/3Wj0oI6MQnZBx8FlgvQNWp
 DstB6qeA2fWjngNI4fh6j20UW4+0DzafPTo7AlZyZIBojYT37kRKZIpMcHUpaVJwvHhu
 mkpM8DMvUAs4Vma3mHBvWRNsj0COl9lY1pbwEoalTx1AdEDXT2qAQo57NaYZBkDDgBm2
 N+22/PVQVVhBpulzNEZ6U9VNjoCPxBmRgDiTAEnyTn9X4EXAtSeJs0gVzIuM3I6LSesk
 ubKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrK0JHg8QjDCE9JyZD82rzQF/bRj7aC5nRi40lsM9GO8YGSV3hyibNiLZQdRR7swXFfgUatq7d05Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmuOsBw9JjkLMLa1sfVr8jQuAQxXKNJeon3ccEAghAQ/RVFvuX
 /FaPCPoJFfN+BDf8477P6+/0PaF5APZ2QjumRr7wx9I777v0jFFQsU3hevydmYeVzgo=
X-Gm-Gg: ASbGnctVJ6o2psSej37yGnnrDT6+oxHp6XRRU3D1W1LvtmEwKpp7JZF/ibyWu5VowOK
 e7HdeLHi+pTH/nCSeZqFwf3wVTfv8ndiMTP32XbkA2h8n75J3K8BqLmFUliXvFfUKHqHKfPMEE1
 CzttblS7ioT+ZW5HrYyrzrr/TQpqItqioauna78k+vSHE6Kvr8QRCjcO/qU6GCXg8vD1x/kIsql
 DLKZ2bj1ZSevul56+MwW/T8pkOzC/HD7evQ0Ny/SHTJD7VyqECoS01Fo19fYuqMjP1B28PLluKo
 8BuPopynBix42Yf6eMHDX3WcLxY+EnzwYt6nYi2MWRxj+ma9TtPtGZ0WhEbg1LSlz5m3Vlay2e3
 Zkol0K1FMZEFwKo8tik8jAhuoZzh/Bj+4FPwW6Qy5jgZwftSrwMCersVpb0ffl300+7WLni5q1R
 3yo19OBMNqdTSnQmtDoX7i1DIQaO2vmnes
X-Google-Smtp-Source: AGHT+IGVDBYsOBdDa5NG0DSZa5Yr0ZnxdYzLYQZD37fgSLb7c/VmYVbHh3NUBKG7BjssK7ci3BmYKg==
X-Received: by 2002:a05:6000:2311:b0:427:52a:7ca4 with SMTP id
 ffacd0b85a97d-4284e52da1fmr1195908f8f.4.1761045059441; 
 Tue, 21 Oct 2025 04:10:59 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce06bsm19510485f8f.45.2025.10.21.04.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 04:10:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: display/msm: Reference DAI schema for DAI
 properties
Date: Tue, 21 Oct 2025 13:10:51 +0200
Message-ID: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

DisplayPort nodes are DAIs (Digital Audio Interfaces): they have already
'sound-dai-cells'.  Reference the common DAI schema to bring common
properties for them, which allows also customizing DAI name prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044..08c273f707c1 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -198,6 +198,7 @@ allOf:
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
+        $ref: /schemas/sound/dai-common.yaml#
         oneOf:
           - required:
               - aux-bus
@@ -295,7 +296,7 @@ allOf:
           minItems: 6
           maxItems: 8
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.48.1


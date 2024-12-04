Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585E19E37A1
	for <lists+freedreno@lfdr.de>; Wed,  4 Dec 2024 11:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B72010ECC2;
	Wed,  4 Dec 2024 10:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gZ3BH4SY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FF110ECC6
 for <freedreno@lists.freedesktop.org>; Wed,  4 Dec 2024 10:36:40 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-385eed29d7fso487177f8f.0
 for <freedreno@lists.freedesktop.org>; Wed, 04 Dec 2024 02:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733308599; x=1733913399; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CEBWDAJs2F15pzwyozxNKYhFYdToRnM6LzIW6iWekBk=;
 b=gZ3BH4SYZVQ5Ax53NNzo5xieuHV9Njyi8BheOX0nRNfPI4ZR8BYzpPpFx8TZ5xQSWF
 ZlwjPaWqr5YYiqcu+9aRPmmvq3NscEdUVZB51hegAisUdcj51xIonBqpFSynVU9xiDcB
 6jxkScCeEzaKPfDCOU8mB2I6RoQq+bXDyPNHb4mIhs9MaV23W2uZ3BCY75vZDfdR7V7u
 x4vR6UzYDJXszx5fR/Ta69RdNvX8xA16aIQf0/fcdc5KkXkpu1vzlC3bF7jR/gMYwUCB
 NfdR0AWcXQJakBjZpjjZlXm03YDFP/stkTEzvmtjBP0F7VzDyhb4b0ZxU+GbI+WQ43K5
 0VTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733308599; x=1733913399;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CEBWDAJs2F15pzwyozxNKYhFYdToRnM6LzIW6iWekBk=;
 b=WZLTpnudMBGxD3mJPEl3upJcfPgRZD5P38seQ+ZPlKbl/zVlIFsjKF5Ej9QTZDTnml
 Nyr9q1h1iQAH8WnvWURE2vXGcCETJeBSlTJLStKvxPvaajoudc71v+GTiYcU53ZNQpTg
 QALNyeBSf25DAnK9T/8Lb4e7kwCxDGxuoaW8S34I1b7ZbNZz9Gp6X7pZBLGmyNmB8fpR
 40ZFLeuto8m65sWsGCsNRqxZwoh11kgnKrt3ioUjpJ5vJk/knniaH+dRh5250LO7qQyg
 yXP9QdROeKsqHTnB9Pl8jHMelhPW0j2kV4XsidZCEinDPoq9oeUJe0MpmMxhR+FLviOo
 DjGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnQUxVO3paK4HgQjbppDetRkJZ1DnKLRjgzA6oHIB/YofvxvxTWJaWvts5wKTqMiO9k60LTXK5bTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlO/LUJAIKZs4fvnnEvoZtkxMtoC8zOuxNc4cCfckXjW4UoEU0
 Bn06dumjo68ZW/i28mmeI2OczSMikvLxZNR1vPGxCUJc6OkPWyzIPMr0QalXg80=
X-Gm-Gg: ASbGnctNQV2bMbBhgJr/vKBWUKiY948OEdwtOY6eqESq7CLLduaqAWFA5X4UfURb1OX
 pTDIN6oLbHSoQ3TJfZ+3hqvQ9zksLhghC8f4iD1uL/WYGui4VNN9QuSabj2gHrCBuL4w1o1Ypom
 7cYLDAjVaNlEoxRIRM2RX3C/dE+oTIz2p6+AtIfKYoxPdNjDM2BefAeD+wTT5yjX62TK7O6OJei
 ghERyaCYtLHFT9RJJlk8FrqBmvSX7i2knDqqkhvBIwF3/onsEDX9dqzmami1eM+L5Tdueg=
X-Google-Smtp-Source: AGHT+IE1eKytGYhN/G2avEbscWDzaqM2N9y7QbNLOqIY3WvlHqBjWYhCRVwGHZqF/ZoYxBdvoZSCOg==
X-Received: by 2002:a5d:6c62:0:b0:385:f010:e5f4 with SMTP id
 ffacd0b85a97d-385fd9b6c06mr4026493f8f.28.1733308599326; 
 Wed, 04 Dec 2024 02:36:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385df74157asm15409391f8f.0.2024.12.04.02.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 02:36:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Dec 2024 11:36:37 +0100
Subject: [PATCH] dt-bindings: display: msm: sm8350-mdss: document the third
 interconnect path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org>
X-B4-Tracking: v=1; b=H4sIALQwUGcC/x2NwQrCMBAFf6Xs2YVsrFT8FfGQJpv2HZKWrIhQ+
 u8GjzOHmYNMG9ToMRzU9APDVjvIZaC4hrooI3Um7/wo3o383nZELrDIVu7Xm+OSzHhGTaiLcca
 XZXIyh5yjhEC9tDft+n95vs7zB4azNaN1AAAA
X-Change-ID: 20241204-topic-misc-sm8350-mdss-bindings-fix-1701baffc1aa
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=peYrt415YULllPSwRUnKU5Qx+NDdGSX6LQbwju+FB9U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUDC1nleUyZQQLS9gEd7//NknovstellbNGR/a7EQ
 eyLt7XiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1AwtQAKCRB33NvayMhJ0YhkD/
 9U3qDvqecaANAURilULho5J/RjI0flxgZwbAVSkj2UH7c2Ifm0TEJm/PNkwLJgE/jIYZ8DP4o7qTt+
 x4TRZVYeu+QVirVM/e4z8PMgI0scaCwmrwkdjy1dyUlUxXxyZc2tUyOSpsnBmBSqmwb8SCvUoOKhSy
 NTXIvoP2J0YLDMTUryjNP0av/W+9k3Tw8wgy7lse1tXil3MhdXbufiSstkS2MZs9bFuYOvz8leUOR7
 8QE3Fa7FTMYdTWEU9dEwIPqnMBcmu4C8yfbXiWRnru075t6rcT2BKyvA57BY/PYjSYFqO3BTOt7HND
 YcHxVfEDXY7pNe0j1mZ+HQce2nCGEjtWyS8LUDPfntDpf3PaySc0ESyeu32Xm6Z1+2fvufXlUds3rV
 +Le2js2U5SQq2nFRXXzxLltckVq+6122EV+MD2N9ElD180lTFrNXXqSxEHHG+S+KlhuYTGRX1pHBKg
 iNrRGeE+97Ueyk9r1QXJ0whDnFsz32k/VHI7OkelttMYUdUm3HXDuTqyDN+7GcJdFgLZXwe6FFbBuN
 sPd5SpFM+y42SNCOMeiXfZ+DoACTRda1hBRWWGk2oO685P2uFJV21NN7b32MOQ9CJ04CXRQi/d26aK
 jvUGV67nUXQyNFkZiU2Ndxm28uPmob6GYdVFptyfrE08LgbJ8tRqnB1fB74A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Document the missing third "cpu-cfg" interconnect path for the MDSS hardware
found on the Qualcomm SM8350 platform.

This fixes:
display-subsystem@ae00000: interconnects: [[121, 7, 0, 77, 1, 0], [121, 8, 0, 77, 1, 0], [78, 2, 3, 79, 16, 3]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#

Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 163fc83c1e80cf07383f9aef510f2f58a26e1ecc..cd9c6c78413f887c984b522f83cc7e437ce97d25 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -38,12 +38,13 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 3
 
   interconnect-names:
     items:
       - const: mdp0-mem
       - const: mdp1-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":

---
base-commit: 667ff2368867af7000ce32a8b3fc025c2b3226b3
change-id: 20241204-topic-misc-sm8350-mdss-bindings-fix-1701baffc1aa

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C318C9CE3
	for <lists+freedreno@lfdr.de>; Mon, 20 May 2024 14:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC37810E675;
	Mon, 20 May 2024 12:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eiu/AI4Q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A64F10E2AE
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2024 12:12:49 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-51f1e8eaee5so3697445e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2024 05:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716207167; x=1716811967; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=u5zLKnMtRb2Yx+jUatqEm2tktsnKzIpv+CHT4vbWSNo=;
 b=eiu/AI4Qd35PYqqhBjdQfpsSGgV+teqRQ5RkC4mhoA8GeNlz1y9G6agSEespE7RjWb
 MZIGDqad94y95KmmTyxL/svV8O9DvJ8t8UW4S78FSWLxipCMGOrBMBOz2iZuzfzp3Aw/
 klshHTAemxZ1wfLKkQMmA9JmtQuWuKxuuypTTGEYP2FA6dSKd/6yCfAaFojD5MqCX0f3
 XWAkxtNgv9VEAmErSEhK1R5sjmFv4+tgihhzlsa6erYmMWS/xF9ZnZROGk7m5g6ATYzy
 tAQ+iug6QOW7WqyvVEws4Liddvq8laaD4yiLEL2SElYRh03taj86655wvJmd/BINuaES
 IXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716207167; x=1716811967;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u5zLKnMtRb2Yx+jUatqEm2tktsnKzIpv+CHT4vbWSNo=;
 b=iYU5bnq5CrECJAj8fBWhBkCOCdczVoNu1OOROgJPbUu1pobjjLAFaeHDhRC7nD8Cwt
 wkMytQg/wjb1RkeuQPLR6e5WE6jscwYU19ddLooXGBq6hQ4qhFzLI3Wl1878ISlgCb1S
 44P2WlEQwbZy8b2kvGhrQRFnEuVRvlVPnDmPI7ynPKddE6GInvHmiwaoM5lKiKXj0gzy
 aaEjNK2TVeALmV87reMcFTmJdpLd/wkhYgAQgyHKA3NOYmbZbJGsZ1esTiwmAWN8/H+v
 jG4n+FUbm4uZlb3BXdFBkKx6KoMsVxW3ej/4MEzkAYdVVYnp0GhStakIUQF/W5XL8pmg
 x5zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ4bTfbI6zZBbCKsjk3wZkbabM3p6eRivB7disT7FZFkJzVuBGEeDRLHcjz21iyZk0PtdiJbbjrhUeO3GqT3ls2nOTSbkiItFUUQiU65fM
X-Gm-Message-State: AOJu0YyDG1BWtNoR17TusEKYxIghPwi5kRYhCrCIma2nnThLcTy2Jykh
 od2q8e2wLzbt9ZvXzXStIkp5n+jfnIQ+Tc9by85W2CA12JJ50viNmQS24n2eCx4=
X-Google-Smtp-Source: AGHT+IFmCz2UjdpX2jReHWPeQmSe3l39pMsynvOjbskQ/rKPTL0Rxr5iRCVGRc6KIMGt0K9PVz9jrQ==
X-Received: by 2002:ac2:504a:0:b0:523:7680:d07 with SMTP id
 2adb3069b0e04-52407ac106bmr2029575e87.6.1716207167313; 
 Mon, 20 May 2024 05:12:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 05:12:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:12:43 +0300
Subject: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jse+EfinCh8AnjkQx3C/iJk2/gtirSq7agUZaG5U5so=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmSz48jwip4m8plivDyhrPuFWOv0Ug1EGy9W0K9
 cDJzlc2sZeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZks+PAAKCRCLPIo+Aiko
 1Y8uB/985G/uHWGA0fZD2EfZLAaCrUvpeIOFfLeCFEa028C+6blQHf0FSdKZqvw3Zj2Pzfptf9k
 4mn6ZhLgH3HoSk9Lur7syvZFJflVZn9Zyxo2U9VTjxi+78uTiZuZevLadDhhwvjNTghv6uqvqMH
 oDXwGp6eReQbD5gvE+TYsw3cn/6zdGzRcus9oMvln5mkk91k/aoLNpTaBGJ3y5wREkYW0xC22QB
 NTKhnNxwNfYb40pqUpqyMwMIXJp4dwrM8pITaxgYhp1RoskLo7YpNb1tNMWTSmM2LbpkqXyb4zV
 Zt71RD+a1F2Wvdbr2bBMwR4o1PYlHQF+NVi+mylASA5FrqWX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Command mode panels provide TE signal back to the DSI host to signal
that the frame display has completed and update of the image will not
cause tearing. Usually it is connected to the first GPIO with the
mdp_vsync function, which is the default. In such case the property can
be skipped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 1fa28e976559..c1771c69b247 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -162,6 +162,21 @@ properties:
                 items:
                   enum: [ 0, 1, 2, 3 ]
 
+              qcom,te-source:
+                $ref: /schemas/types.yaml#/definitions/string
+                description:
+                  Specifies the source of vsync signal from the panel used for
+                  tearing elimination. The default is mdp_gpio0.
+                enum:
+                  - mdp_gpio0
+                  - mdp_gpio1
+                  - mdp_gpio2
+                  - timer0
+                  - timer1
+                  - timer2
+                  - timer3
+                  - timer4
+
     required:
       - port@0
       - port@1
@@ -452,6 +467,7 @@ examples:
                           dsi0_out: endpoint {
                                    remote-endpoint = <&sn65dsi86_in>;
                                    data-lanes = <0 1 2 3>;
+                                   qcom,te-source = "mdp_gpio2";
                           };
                   };
            };

-- 
2.39.2


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477E162043B
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 00:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C978B10E3F2;
	Mon,  7 Nov 2022 23:57:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED12010E320
 for <freedreno@lists.freedesktop.org>; Mon,  7 Nov 2022 23:57:02 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so8117920wmb.0
 for <freedreno@lists.freedesktop.org>; Mon, 07 Nov 2022 15:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qAGk+nNjornIMJdpYZzX61c9uY3N5rhRbOvAyl/cRcI=;
 b=LKioUSDnQg6JaddBnL63Lvmeo9cXsgp+4PaRCdFRfMnp/G4E2SBh+Qr+90ot0vORsd
 cBm8vJ85nbF0KcTfTBQBZxui99mITeSt+MZzajkr5y51i31J0bYbzHwD1sWa3A1eD7Yt
 CyjEpBu1c2iLGLA2hxgZmTGlThJWCRZwFA3DDM/OCbrIjbpoujOWDjtv6RETaymWOvWc
 86cxoz4lQfZI6CvxvXy8bkHiJtwubeU0934p5lAVNhvUy7WgAKCLP2Jp5K1QnSsQtU3V
 Ddxm6ZleedqzdeXbYDXx8LbNnahwT6OJ+avsNARdNePDPwuD7Ng3x5KSt84TBIRT0pZP
 WYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qAGk+nNjornIMJdpYZzX61c9uY3N5rhRbOvAyl/cRcI=;
 b=ypmi0IXLB6D+wDuOW/rG9tmTp5k3tHlpp9n35CU8BbNV2hPqAFcHECr223z5v/26JP
 EGwWq6vMpb88M963fxTjRl2aheZkLWIUytZNkiiIVNxmOyBYdWGyBSdGo5CkAdRcbpRF
 MXAYfpZjTFbTh7wkz5hUqk8mC66sxzs91u0/gKReMCy3VnzXhNfGELvM1CpqDy05eo6w
 0geYXhdxIxG5vPlgEyIT9V70cWawRanA192o5aM5LkTweGPIaxIM1HCXQ4sJ9cEK1OkW
 GOBIsE+IIYpX3J5TKIQiGQ0xTOdpPq1YQyTFougwMM5daibGBiB4ptb0JIl1Rpdcabl/
 MRwQ==
X-Gm-Message-State: ACrzQf15FyC9uYhbuGUvg1w6a4frl3lAdiojZZ1zc/+CqHNJeXPZ3NTa
 58otMJfvLz3AD5WoFdoNiN8tww==
X-Google-Smtp-Source: AMsMyM5502aGtya1hfA844I0triX6tm96lgDwjECnjdG0GR1QyLeZz1LBUlYaM1trZYKftrwY96Ldw==
X-Received: by 2002:a1c:35c9:0:b0:3c3:d9a:385f with SMTP id
 c192-20020a1c35c9000000b003c30d9a385fmr34399577wma.139.1667865420946; 
 Mon, 07 Nov 2022 15:57:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 15:57:00 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Date: Mon,  7 Nov 2022 23:56:40 +0000
Message-Id: <20221107235654.1769462-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 04/18] dt-bindings: msm: dsi-controller-main:
 Fix clock declarations
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

When converting from .txt to .yaml dt-binding descriptions we appear to
have missed some of the previous detail on the number and names of
permissible clocks.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 0f7747e55b9be..cab38a20a54b0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -35,6 +35,10 @@ properties:
       - description: Display escape clock
       - description: Display AHB clock
       - description: Display AXI clock
+      - description: Core MultiMedia SubSystem clock
+      - description: MDP Core clock
+      - description: MNOC clock
+    minItems: 6
 
   clock-names:
     items:
@@ -44,6 +48,10 @@ properties:
       - const: core
       - const: iface
       - const: bus
+      - const: core_mmss
+      - const: mdp_core
+      - const: mnoc
+    minItems: 6
 
   phys:
     maxItems: 1
-- 
2.38.1


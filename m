Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDDF35F9E9
	for <lists+freedreno@lfdr.de>; Wed, 14 Apr 2021 19:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29346E4C9;
	Wed, 14 Apr 2021 17:36:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3586E4AF;
 Wed, 14 Apr 2021 16:47:31 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 14 Apr 2021 09:41:27 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Apr 2021 09:41:26 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 14 Apr 2021 22:11:09 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 8577221351; Wed, 14 Apr 2021 22:11:08 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Wed, 14 Apr 2021 22:09:49 +0530
Message-Id: <1618418390-15055-3-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
References: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
X-Mailman-Approved-At: Wed, 14 Apr 2021 17:36:06 +0000
Subject: [Freedreno] [v1 2/3] dt-bindings: drm/bridge: ti-sn65dsi86:
 Document use-aux-backlight
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
Cc: mkrishn@codeaurora.org, Rajeev Nandan <rajeevny@codeaurora.org>,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, dianders@chromium.org,
 robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org,
 hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

If the panel connected to the bridge supports backlight control
using DPCD registers on the DisplayPort aux channel, setting
"use-aux-backlight" property in the bridge node will enable the
registration of a DP aux backlight device from the bridge driver.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 26932d2..c8d8c00 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -58,6 +58,12 @@ properties:
   clock-names:
     const: refclk
 
+  use-aux-backlight:
+    type: boolean
+    description:
+      The panel backlight to be controlled using DPCD registers on
+      the DP aux channel.
+
   gpio-controller: true
   '#gpio-cells':
     const: 2
@@ -188,6 +194,8 @@ examples:
 
         no-hpd;
 
+        use-aux-backlight;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

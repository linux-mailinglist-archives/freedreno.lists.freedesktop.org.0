Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0F41BD429
	for <lists+freedreno@lfdr.de>; Wed, 29 Apr 2020 07:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81796EBFD;
	Wed, 29 Apr 2020 05:46:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFBA6EBFD;
 Wed, 29 Apr 2020 05:46:05 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 29 Apr 2020 11:15:32 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg02-blr.qualcomm.com with ESMTP; 29 Apr 2020 11:15:20 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 7DEB929E2; Wed, 29 Apr 2020 11:15:19 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Wed, 29 Apr 2020 11:15:15 +0530
Message-Id: <20200429054515.4976-2-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421045508.21137-1-harigovi@codeaurora.org>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v12 2/2] dt-bindings: documenting compatible
 string vendor "visionox"
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
Cc: sean@poorly.run, robdclark@gmail.com, seanpaul@chromium.org,
 Harigovindan P <harigovi@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Documenting compatible string vendor "visionox" in vendor-prefix yaml file.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
Changes in v11:
	- Added compatible string in vendor-prefix yaml file

Changes in v12:
	- Fixed the string to clear dt_binding_check errors.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 66a7382add95..1c86ebbeae20 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1047,6 +1047,8 @@ patternProperties:
     description: Tronsmart
   "^truly,.*":
     description: Truly Semiconductors Limited
+  "^visionox,.*":
+    description: Visionox
   "^tsd,.*":
     description: Theobroma Systems Design und Consulting GmbH
   "^tyan,.*":
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

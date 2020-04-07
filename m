Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5508A1A1857
	for <lists+freedreno@lfdr.de>; Wed,  8 Apr 2020 00:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F2C6E934;
	Tue,  7 Apr 2020 22:48:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54ECB6E930
 for <freedreno@lists.freedesktop.org>; Tue,  7 Apr 2020 22:48:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586299738; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+BwWb6bZ2jNnwZxDYA2vtg528w7ktuHus/p00QTtFTs=;
 b=trs/mlfFUVAvyOyrmBdru3xtkNflPr1CGOo7afxyOt4LaueK16fd4IIG+G360Em8I3NOYpQd
 jhXs6iV7nv6tLlnMwmRZuFXqK0C3UZ3uXV9vVVTRlMwL92O8Wb8W7lCKYFfaKjrPIGK34UvO
 GIH12ht1qC32Tup5WLXizJIcyvY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8d034d.7f6d4b9a98b8-smtp-out-n04;
 Tue, 07 Apr 2020 22:48:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 51BC7C433F2; Tue,  7 Apr 2020 22:48:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 28C32C433D2;
 Tue,  7 Apr 2020 22:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28C32C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=tanmay@codeaurora.org
From: Tanmay Shah <tanmay@codeaurora.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
 devicetree@vger.kernel.org, swboyd@chromium.org, abhinavk@codeaurora.org,
 robdclark@gmail.com, aravindh@codeaurora.org, varar@codeaurora.org
Date: Tue,  7 Apr 2020 15:48:28 -0700
Message-Id: <1586299709-14222-1-git-send-email-tanmay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Subject: [Freedreno] [PATCH 1/2] dt-bindings: msm: disp: Add Display Port
 HPD GPIO bindings
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
Cc: Tanmay Shah <tanmay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add Display Port HPD GPIO description in bindings

This Patch depends on:
	https://patchwork.kernel.org/patch/11468505/

Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
index 761a01d..003f5f7 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
@@ -155,6 +155,11 @@ properties:
      data-lanes:
        description: Maximum number of lanes that can be used for Display port.
 
+     dp-hpd-gpio:
+       maxItems: 1
+       description: Specifies HPD gpio for DP connector without
+                    USB PHY or AUX switch.
+
      usbplug-cc-gpio:
        maxItems: 1
        description: Specifies the usbplug orientation gpio.
@@ -282,6 +287,8 @@ examples:
         aux-sel-gpio = <&msmgpio 110 1>;
         usbplug-cc-gpio = <&msmgpio 90 1>;
 
+        dp-hpd-gpio = <&msmgpio 117 0>;
+
         ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

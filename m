Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7BF434EDC
	for <lists+freedreno@lfdr.de>; Wed, 20 Oct 2021 17:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FC26E9ED;
	Wed, 20 Oct 2021 15:17:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4E66E284;
 Wed, 20 Oct 2021 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634732446; x=1666268446;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=NDa9KEOle5Dvn0boViSDp3mupUuPQQnHaePh4Ug4R4E=;
 b=QXMSRJo400FKFHtkqhEY6eML1iZTVGj+apnu/2JKwut3NyD1FjP/a80e
 gJC4mDng3OQg02ZQBZFFcalzL9vOFqNQX6SlUqW5h2DVR6BcJcnwEjdwL
 HzZ0JLhJUXV8ZUGlbypdDU6TKXI0Y3eJ96nJFqptL6uEKmNkAVkhtWS/v 0=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 20 Oct 2021 05:14:43 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 20 Oct 2021 05:14:41 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
 by ironmsg01-blr.qualcomm.com with ESMTP; 20 Oct 2021 17:44:27 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
 id 5E91420E29; Wed, 20 Oct 2021 17:44:26 +0530 (IST)
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <sbillaka@codeaurora.org>, robdclark@gmail.com,
 seanpaul@chromium.org, swboyd@chromium.org, kalyan_t@codeaurora.org,
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org,
 mkrishn@codeaurora.org, Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Date: Wed, 20 Oct 2021 17:44:11 +0530
Message-Id: <1634732051-31282-3-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
X-Mailman-Approved-At: Wed, 20 Oct 2021 15:16:59 +0000
Subject: [Freedreno] [PATCH v2 2/2] dt-bindings: Add SC7280 compatible string
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

From: Sankeerth Billakanti <sbillaka@codeaurora.org>

The Qualcomm SC7280 platform supports an eDP controller, add
compatible string for it to dp-controller.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 63e585f..ab2bb1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc7280-edp
       - qcom,sc8180x-dp
       - qcom,sc8180x-edp
 
-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project


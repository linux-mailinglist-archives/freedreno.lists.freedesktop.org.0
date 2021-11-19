Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF77B457975
	for <lists+freedreno@lfdr.de>; Sat, 20 Nov 2021 00:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333386E544;
	Fri, 19 Nov 2021 23:18:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D69A6E544
 for <freedreno@lists.freedesktop.org>; Fri, 19 Nov 2021 23:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637363934; x=1668899934;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=X8rozlh7XZA6KcsavrAkZ5+YLzbzFayI4fUmiQGnRwA=;
 b=MR4XLjz18o1wtq2T3tUY49HJ/cLS94WbXDtFgIXle+hnlqFHe3YFlmoR
 6EdqJX8gAbP4RYltVZ6CEw5N31VJ0wILDNG0B5fUVNUcxwHETVEj5MQ3f
 iWrOBfH21Z+ollHjAaw5L+o4guo1C7BPxI6ntE4a152wM1O6vadZ57Ut+ s=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 19 Nov 2021 15:18:54 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 15:18:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 15:18:53 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 15:18:53 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <linux-kernel@vger.kernel.org>
Date: Fri, 19 Nov 2021 15:18:36 -0800
Message-ID: <1637363916-18257-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: [Freedreno] [PATCH] MAINTAINERS: update designated reviewer entry
 for MSM DRM driver
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
Cc: gregkh@linuxfoundation.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 swboyd@chromium.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Adding myself as a designated reviewer to assist with the
code reviews for the changes coming into MSM DRM.

Acked-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b33791..503112d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5938,6 +5938,7 @@ M:	Sean Paul <sean@poorly.run>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	freedreno@lists.freedesktop.org
+R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/
-- 
2.7.4


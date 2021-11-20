Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2201F457C40
	for <lists+freedreno@lfdr.de>; Sat, 20 Nov 2021 08:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D006F3D0;
	Sat, 20 Nov 2021 07:46:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F2A6F3D0
 for <freedreno@lists.freedesktop.org>; Sat, 20 Nov 2021 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637394386; x=1668930386;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Pp6EhLw7VumofBo6dP+3b3t1m3ZOohSUF4/UlgDqC0w=;
 b=WfuoTRZ/hrfVVzfAWcwDSv7ZH0W5NnFkeHgxtzmE3CDubykA/4mm/ijL
 u5EAUaLs2IV4iu+AIaPcdMuGsP1HsHA/vH6emS+znrU6u3TXwEfirxsdA
 BxKa6+qCGbqmz8cj3FZJIZlFiCGH4KyHTbAKyd52ITOfWVm66N2XQyTzt M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 19 Nov 2021 23:46:25 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 23:46:25 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 23:46:24 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 23:46:24 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <linux-kernel@vger.kernel.org>
Date: Fri, 19 Nov 2021 23:46:11 -0800
Message-ID: <1637394371-16783-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: [Freedreno] [PATCH v2] MAINTAINERS: update designated reviewer
 entry for MSM DRM driver
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
 swboyd@chromium.org, joe@perches.com, robdclark@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
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
index 5b33791..c27d8f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5935,6 +5935,7 @@ F:	drivers/gpu/drm/tiny/mi0283qt.c
 DRM DRIVER FOR MSM ADRENO GPU
 M:	Rob Clark <robdclark@gmail.com>
 M:	Sean Paul <sean@poorly.run>
+R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	freedreno@lists.freedesktop.org
-- 
2.7.4


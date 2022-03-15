Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFDB4DA616
	for <lists+freedreno@lfdr.de>; Wed, 16 Mar 2022 00:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754DF10E42D;
	Tue, 15 Mar 2022 23:12:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC2810E41C;
 Tue, 15 Mar 2022 23:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647385943; x=1678921943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=QxWfK/9s9r+//U/ECM92UOWf42PxUImVXFFs+TSmVww=;
 b=dSkO9B02WlLnIxBksQzRn5XGmMR5Ok4xpg/kESZy25wpsWcT0Nmmzw81
 gME8a+pqi+FYeDO7uB6FJWwWKjP67fMhstEfc1yU+pbm61Vkrcc/qiqRk
 aqApOFgBGMY/CCMkqaeZI55qs/SvUi2f17h0KF7AQNHzNrVNRF6HU9Wyr k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Mar 2022 16:12:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 16:12:21 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 16:12:20 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 16:12:20 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Date: Tue, 15 Mar 2022 16:12:01 -0700
Message-ID: <1647385922-31539-6-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647385922-31539-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1647385922-31539-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: [Freedreno] [PATCH v2 5/6] drm/rcar_du: pass possible_crtcs as
 parameter for drm_writeback_connector
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, mripard@kernel.org,
 swboyd@chromium.org, melissa.srw@gmail.com, robdclark@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, james.qian.wang@arm.com,
 quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org, brian.starkey@arm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As part of this series, drm_writeback_connector_init() allows
passing possible_crtcs as a parameter so that the API can
internally create and setup the encoder.

Pass possible_crtcs parameter for drm_writeback_connector_init()
for rcar-du writeback driver.

changes in v2:
  - pass possible_crtcs parameter for drm_writeback_connector_init()

Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
index c79d125..1a610c0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
@@ -199,8 +199,9 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 			   struct rcar_du_crtc *rcrtc)
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
+	uint32_t possible_crtcs;
 
-	wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
+	possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
@@ -208,7 +209,7 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 					    &rcar_du_wb_conn_funcs,
 					    &rcar_du_wb_enc_helper_funcs,
 					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats));
+					    ARRAY_SIZE(writeback_formats), possible_crtcs);
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
-- 
2.7.4


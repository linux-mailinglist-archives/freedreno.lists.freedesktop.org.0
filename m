Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEC44DD287
	for <lists+freedreno@lfdr.de>; Fri, 18 Mar 2022 02:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDFA10E90E;
	Fri, 18 Mar 2022 01:46:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5368110E90E;
 Fri, 18 Mar 2022 01:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647567959; x=1679103959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=drgfOlbV1tTwxhpdOrf5OdjebHoFT0Bes414dEGx940=;
 b=MFhgszSmQmSzW6jN/6kNWjvdyVc3enPBgj+31E2DfivP+27vlTCSeEU5
 eRvIngMByJGeRM8uWzITmuN2uRpEMvAOLjCh9jGw4lSG+8yjDJhpPNLBi
 QRJP5vWxez35MYEZ3uT01x286H3alZz77FkkKZ0bwfMD20Eme+rluqHK0 0=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Mar 2022 18:45:59 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 18:45:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 17 Mar 2022 18:45:58 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 17 Mar 2022 18:45:57 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Date: Thu, 17 Mar 2022 18:45:36 -0700
Message-ID: <1647567936-11971-5-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647567936-11971-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1647567936-11971-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: [Freedreno] [PATCH v4 4/4] drm/vc4: change vc4 driver to use
 drm_writeback_connector_init_with_encoder()
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

vc4 driver currently embeds the drm_encoder into struct vc4_txp
and later on uses container_of to retrieve the vc4_txp from
the drm_encoder.

Since drm_encoder has now been made a pointer inside
drm_writeback_connector, make vc4 driver use the new API
so that the embedded encoder model can be retained in the
driver and there is no change in functionality.

changes in v4:
    - none

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 341a9be5..3d24ef5 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -370,6 +370,10 @@ static const struct drm_encoder_helper_funcs vc4_txp_encoder_helper_funcs = {
 	.disable = vc4_txp_encoder_disable,
 };
 
+static const struct drm_encoder_funcs vc4_txp_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int vc4_txp_enable_vblank(struct drm_crtc *crtc)
 {
 	return 0;
@@ -498,15 +502,24 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	wb_conn = &txp->connector;
 	wb_conn->encoder = &txp->drm_enc;
 
+	drm_encoder_helper_add(wb_conn->encoder, &vc4_txp_encoder_helper_funcs);
+
+	ret = drm_encoder_init(drm, wb_conn->encoder,
+			&vc4_txp_encoder_funcs,
+			DRM_MODE_ENCODER_VIRTUAL, NULL);
+
+	if (ret)
+		return ret;
+
 	drm_connector_helper_add(&wb_conn->base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init(drm, wb_conn,
-					   &vc4_txp_connector_funcs,
-					   &vc4_txp_encoder_helper_funcs,
-					   drm_fmts, ARRAY_SIZE(drm_fmts),
-					   0);
-	if (ret)
+
+	ret = drm_writeback_connector_init_with_encoder(drm, wb_conn,
+			&vc4_txp_connector_funcs, drm_fmts, ARRAY_SIZE(drm_fmts));
+	if (ret) {
+		drm_encoder_cleanup(wb_conn->encoder);
 		return ret;
+	}
 
 	ret = vc4_crtc_init(drm, vc4_crtc,
 			    &vc4_txp_crtc_funcs, &vc4_txp_crtc_helper_funcs);
-- 
2.7.4


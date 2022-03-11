Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6AD4D5793
	for <lists+freedreno@lfdr.de>; Fri, 11 Mar 2022 02:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA2E10E674;
	Fri, 11 Mar 2022 01:50:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD2010E666;
 Fri, 11 Mar 2022 01:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646963431; x=1678499431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=YvTO3qFnIUwFCrf0DmUbI0J9kHRaerMuWT6XQIjKJWM=;
 b=u80H6CQpfC5cbhtnGw64brQlGN/vjNRtHwMNMfR6HUBDRFh0jZxMn4qd
 PkSHamTO2qk1XIEjbp8lKat43EnOhDfjx4t7ucY9roOwO84jUVuPVNWks
 GU0i57/mfeWo5+otWm0TwPU7TOpqcEsK7p+NO44NbAhP7Rae7FrnIwWJ0 Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Mar 2022 17:50:31 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 17:50:29 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 10 Mar 2022 17:50:29 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 10 Mar 2022 17:50:28 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Date: Thu, 10 Mar 2022 17:49:57 -0800
Message-ID: <1646963400-25606-4-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: [Freedreno] [PATCH 3/6] drm/vkms: use drm_encoder pointer for
 drm_writeback_connector
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

Make changes to vkms driver to start using drm_encoder pointer
for drm_writeback_connector.

Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 8694227..adf6961 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -139,8 +139,10 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 {
 	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
+	struct vkms_output *output = &vkmsdev->output;
 
-	vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
+	wb->encoder = &output->encoder;
+	output.wb_connector.encoder->possible_crtcs = 1;
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
 	return drm_writeback_connector_init(&vkmsdev->drm, wb,
-- 
2.7.4


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1367CDB061
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 02:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B459C10E2F4;
	Wed, 24 Dec 2025 01:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Esi0DjvA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMt1dhYx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEF210E2F7
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNNpvkP561263
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P+SBTDTtGkE8RnKwaj4dcEp5VbeaO6x7ZVfHg3H5ESs=; b=Esi0DjvAzJhxorsi
 g/+0CqqpWMMGETBCdKGbWAK6+wNpcpUgTsjDU9DlpBhFnx5A2q/r6vi44H6iJUXd
 rPPoPBKv2ob/TY6coqKmULhrTq2Ws6j+f1M5oSTqqnWsgVyacZy7WUZUBsb+QMhe
 sVf7WTTTDaZPKrSeFvRIcvrsmY9LL6x5U1DHtvybghVoCFvFFqxVCZzkgRnOiIYx
 H35A0mjZyRosZPZTj7L+ZI3MajMOghue3ZY7KIoamPv5jAAt1K1TE602mnIix5mB
 USOF+TIqUZJyVRx1gM9WdnGaDLRzkPzwjk6ea6N96EV/KiLzbxuB8eejkGQj0J+I
 X+d4Eg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9csxnd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee16731ceaso107834941cf.2
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 17:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538224; x=1767143024;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P+SBTDTtGkE8RnKwaj4dcEp5VbeaO6x7ZVfHg3H5ESs=;
 b=NMt1dhYxyi7LS5tpn0kOGGcLP5LjNJT/J1IIY0z42bV0HHfR5jkk+sRRwiRFqjkuj+
 h3qM8b0fffKoEgGhF5roUeT6PKlzMtk3y3AiFercvGVkfCTi0ae4L3EDxLQE8zHZODxU
 ZfYwzCiL3lQjC3utQ2nBr/EArn0wdG5vZ6FvQnw0CyLixmqPXVlUqEfdCemyW2QpYiZD
 J7W6yNGP+eosuh6iXltmHnpZtpSEFSnDGKlxgmUI+z5/e9vwNCQeXMwrhfZggW2+TJLD
 bC8v0caNUJNyKfjog2JBZglDoRlOciuPMFE5GDBpR+dcAdtzWe+CJmD11w/0NdO2ezwU
 8KZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538224; x=1767143024;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=P+SBTDTtGkE8RnKwaj4dcEp5VbeaO6x7ZVfHg3H5ESs=;
 b=MnZTYEiugojlmTwozvh+FiT808gCoP3nsI3h2uBAYrXETgQS3zXmn+f2n7gTpf/gRe
 FDMAB2dbhtKOlOxKcBKVkoHxahiGbSyciTk+znhTWkEIOU7dPvb49N6sCSvGIfDfSPG7
 pC5aNevTSIqT+dLBj/7zs7lHb40vCbQAVY/cmUVllizfdoD+mGl6tl+U/+c5vGKIijdR
 TaXbw0hp7dPsRf+BueBxh1RAAivArZ8b8MwbQX8iPkiOMPErEXFoqAb2wm7x/XcA5Bs1
 nE9aTcRExDUFmTfr0l9glt9dwO0JeqaT838btvucVRWZoMMl8kxoMC2h4YcHUeZwyfKl
 PtYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXnfwOMARKYoUpdFW2+4Mpx1F1T6jZ9Y7xra3ZICq2Dmc58BEVI2IN2RFmGDLmI7MAci3TGjYvO5E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZju379Hz5u19LkNautKsPWhl9NSOjgCHos1deDdauEUjTpTFn
 uQRlIn7prAnDEFjwKGy0HrO3PzWpc2BW+w1gkM48vAoR3dXd15hu5o7lPFQeLUWCKAC3PVN9J5B
 Rm4CTmEdxJk0OPviKHBFiOaQnBL5UjkdtialauAqm7cCm+4MQWygZ0BXavlujgC9qVk2rit0=
X-Gm-Gg: AY/fxX5oWEyOm36BzlIKiPz0OCJyXRo6jiuRaznZV8YOVAlmBqb/NxIr/x6SHpLKKlg
 anC6PvbbZMoEHBYHySgtFeNIXrSXiATwSE81XIQTL/HpzkKRFeza7t7QS642GYe6meYXJSyIPcZ
 0hP8pasCPzN0pP08YYgohHbGKxPKP375m3D06GXiBT8ukzYS+Ofc+rn0Z4s5DTVXYA5qTukbWbh
 iFVe7c1tkpohZZqhMUFpKrXyKcw8dA7LW9x2+ktH0982w1iyA4ZBgw9Ep/dLSioMnSaxR35Y1QF
 tgAGC2j3i6ZWkQ5S4+HVw7bVQjtNlJJx3liNEkyA3QA00eFUNY3FdbjUWzAF9kXOskMcV4Mjsrh
 dlAeltP+d9DdpSKgttrk6rr+sppDlvyzhzOZAFd9rPimOj6CEfQEkvVI89GKxkr8S4lmWYxHM3l
 /VDGPGVfIE4WGIuKG2YW5hiRE=
X-Received: by 2002:ac8:5714:0:b0:4ed:b06b:d67d with SMTP id
 d75a77b69052e-4f4abd79a65mr200344321cf.45.1766538223827; 
 Tue, 23 Dec 2025 17:03:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3FPxruJlcg4sByZJPHlC6i+AJRJP3LWX/PRkxW+hSkPSJ4R06usLW/tOcstjoguUC6XxUXg==
X-Received: by 2002:ac8:5714:0:b0:4ed:b06b:d67d with SMTP id
 d75a77b69052e-4f4abd79a65mr200343621cf.45.1766538223198; 
 Tue, 23 Dec 2025 17:03:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:03:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:53 +0200
Subject: [PATCH v3 04/10] drm/connector: make clear_infoframe callback
 mandatory for HDMI connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-4-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5379;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nzElO3qrN1ngMVHhZahBd7pKCsEHzR84mn0cPkFgNGc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvY4okwjZ995SvLTt2suiGbzvPytcBxbUZoJ
 IPFjD2XFqiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72AAKCRCLPIo+Aiko
 1VbaB/9msli7nDTqX+64qChKWsJQHzLJSmqJubE1UJ2Nf5Hi/AwpsU7hfYtfCl3WwKKmKfuuu8Q
 Lnl1Ig4EyHgBKD8apvy+9QiFbhlYaqL42IMOn+b4fFQG+1HPmsw4bhcy1pYeNPK2nWrNf4Iot+s
 sd3Qh5XwmI66qB1NAgelgo+ogMATAG/krn39azAVbzRMw8HrEzuws07zAM9ceLRCB1ggf6IEBFQ
 TFqvoA7DhLiuf8z1XlDYFdpss+zjWGa6X0rgks+Jb7dLupcHZqGP6X4NiZ6MxeJ8PeusTd6aEyy
 LwfXlcUtR0hby0mDACU1DWxjeEkPR22us8arufoAaAdFAFeo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: sGd-lnHpKSYqQPEnedjZRst_24C9s2JD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX0YdhMh3XKVKD
 slk4bgvSasQZlYXALvP70NmNi7SAKB7AXXOxLw1St0wyraShM32KPO4IhDZVCe3sL6ADbbJN+69
 namFBCQQLEAcThyr+55NASkK2qjSMPefEJMJ28eveMzR+PiokymhKiBwCgRzU9xttvad6Q/Gdpg
 +nD0sIR1YhVO6iye1xPHw7dhQjZqtA/PAe6coHy7kgpkglJ8RBlwU6h+ez09PEBHqf1TDxMrN+w
 oYt8SUzfaQWOe322YrrZiW4MntT2pT8UFPcsWtibPDz6vq6ZxIxXWAlrnHN2PL97rYOALmBBrSB
 5E0iBoR7VoUrPfUK5awOW7fNn69JtRSz6GhymvgtqlxS5saupazcLrLamcEZ7bIJDXO9UpwQXRl
 YQy4jwUiIUoBrYkmhIUPt9r0MPJfYBwZIdrv0//08JVMasI/weBlM876MxokrcF1Q/EGgpP1neR
 LrygIRTmJTScjfu46uw==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694b3bf0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9fyoTQa5ixSHU3Y6h0oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sGd-lnHpKSYqQPEnedjZRst_24C9s2JD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007
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

We already require both hdmi_write_infoframe and hdmi_clear_infoframe
for bridges implementing DRM_BRIDGE_OP_HDMI. It makes sense to require
the clear_infoframes callback for HDMI connectors utilizing
drmm_connector_hdmi_init().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c                    |  4 ++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 15 +++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 22 ++++++++++++++++++++++
 include/drm/drm_connector.h                        |  2 +-
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d6dc9ebfdb5..40e025712c9b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -600,6 +600,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	if (!hdmi_funcs->clear_infoframe ||
+	    !hdmi_funcs->write_infoframe)
+		return -EINVAL;
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 22e2d959eb31..f356ea695ae7 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -25,7 +25,22 @@ struct drm_connector_init_priv {
 	struct i2c_adapter ddc;
 };
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static const struct drm_connector_funcs dummy_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index bdf14a0623b2..915dcd106703 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -76,7 +76,22 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	return ret;
 }
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -89,6 +104,8 @@ reject_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -101,6 +118,8 @@ reject_100mhz_connector_tmds_char_rate_valid(const struct drm_connector *connect
 
 static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_100mhz_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static int dummy_connector_get_modes(struct drm_connector *connector)
@@ -2419,6 +2438,7 @@ static int reject_avi_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_avi_infoframe_write_infoframe,
 };
 
@@ -2500,6 +2520,7 @@ static int reject_hdr_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_hdr_infoframe_write_infoframe,
 };
 
@@ -2685,6 +2706,7 @@ static int reject_audio_infoframe_write_infoframe(struct drm_connector *connecto
 }
 
 static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_audio_infoframe_write_infoframe,
 };
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..4543833acdec 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1253,7 +1253,7 @@ struct drm_connector_hdmi_funcs {
 	 * called multiple times, once for every disabled infoframe
 	 * type.
 	 *
-	 * The @clear_infoframe callback is optional.
+	 * The @clear_infoframe callback is mandatory.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise

-- 
2.47.3


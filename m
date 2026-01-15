Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEF8D22D03
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 08:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E294010E6CA;
	Thu, 15 Jan 2026 07:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QChqDDhQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpyE+Zml";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870E510E6C5
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:19 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fwem1991673
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=; b=QChqDDhQ+ZNKSQ2t
 6udelvrDHnhlqimBU5vWWtvyf3amZGORYl/j2Q/q4I8DPn6QV2BvR+c0QJ8f+xl+
 V+tqumiqLbzUF0EuYX2c9v/0+V75JXOvILK7PrHfIryNgNNJxylejL+WIxNK3c8c
 eIUTJEAvKgRPF8PRrBRKijr779OtcnvK1aEGho//BLHJpy9h5U/PIb+AgpR4rrsj
 v/k2N23VVMu0iEzdZVpNo0/N3QCdxiCpS9Q0sp+1uWrgLZhOay6X2kXaXGfVQsGb
 ye7jh9hTHvBeTpAlAKC4cT46SlsY66U1ZjoUt84N303/t58ymB5eOzwV2gUyPGGD
 VG0zKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbu1c3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8bb0ae16a63so74140885a.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 23:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768462158; x=1769066958;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=;
 b=LpyE+ZmlQZ8yX6MV5QKPUhPSnZDzuy0QXtAkQCQCYCuheW1O5cilPvNn7qT5gFB9jh
 s/6NLz+kFwgilmgf2VEeiuIsZpsUPRXk8rjhrSmMK5QpeKWGtq1ZyDxORj1so+KfKNBG
 IysuFYAekv7hXm4QY8nUZvOXG/qic0Ih8vr5jWZxQOMbS0yUq0Gm+o+ix+JOy58lPGDF
 vTGJPdwr/47cCegcDtIBRfIrciRCs9LXwqT/xYth2gJwPeQY/pQUnQSQGe7HxxRf7MxX
 /vHmoPkgkFs/YCHw8wJLF/H8PQOG3QMwV2g53ps9YBoS8kOR1tI0NCviuUzDr90My/TA
 aEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462158; x=1769066958;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=;
 b=VTWiTPrSvsRKIKhJgF3JJz46hWBz/yiJSInrJlE1xqLqo3+E7Bt9ltmjlahsJmUjrz
 mqDfOa9Egd1FIlPNiS0fCUBcYGj88OAHJ1eqrwvk0AjN9tBQfysGNyspwOVyaT9SOtk3
 Pajnmj95G/Olu0+4F3kPIZ3TQ4hHcLDgVtKOYF2zrPfl849DSYZmy1bsZLmSXuNFvNUO
 IPLcaWVIQEHF1fWoOcYY2i3iJ9NFKbRRGtwB5WnlmdNRweXJ+ckQkkw7wvBGS7NkX/vT
 MdaWhDATPrlhqYxfJY/y6z905sWdZuF0BDpCWMkmlAaJXbc2/e5DoW0tJGJAsAj7Nfdo
 /X+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvK5V0QeqO03gUO38yg4Rm1eBsT2E05Zzo5oc+WRuZ/vcAcfkn6IQtfswaaDdDPePTh8cJLblofyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6mA5c5UmYtqXgYDlk+Ee1DhNgSuFq+RvqlVSrc6h51eM/5O4N
 /UxV84ZS+V4MAC0oJx6yFlWJqUaqg1/C1bvdw4LdzioVfN5hj3MIEIQVDnQVPLxen632f1H1z67
 WIRdjqjjoiPM6Xh5gOGJRnQguKXD2CYxsSNAdOZ082/PQoYA6j8V0DffOP+MYNqMDB8Mxilc=
X-Gm-Gg: AY/fxX4iX7h21m1xHFzZfNSq0ZqZz0SQp7NZWZ51m0X0TTgD3aO+Cf82RP3/7H0AZvs
 vO6yvTgcpZq5v4wz5yuf1iYu7hzR/tfHo7xwp5IPwbWj3woTndLHTGF6Gb/NeV2hKv6i0bApFdu
 X8yXyHqZo6raKu5LENSHsddWuHVCPhq1KZV3Ew+GcVzpTmKSIAEfB4bU3qRVnsnDQqJtUseB/lI
 LyvgrJRKPcgM+8sdx9LLGToMgORIqujF4izZ2v9pzelIW+08WROvd45PslZU9h78xolfu+uyCpZ
 yJbjaCz2pzvmhU0VADG0LGtJ7yv/Mtpgz5uAoVQALPfVmjQu4arv8wY05tDFz/BCwHk53wkh3o8
 Fdtfs98BhLR0SfYrMBima9oNbKSZwfVmpIs2f9XGKCUl2X87hwz5hEQcekDN/jLr0qmSE8ZtOOr
 gMmdAYiBqkxpzHHEczAvRF6NI=
X-Received: by 2002:a05:620a:1aa0:b0:8c5:391f:1dc8 with SMTP id
 af79cd13be357-8c5391f20c9mr360110185a.8.1768462157963; 
 Wed, 14 Jan 2026 23:29:17 -0800 (PST)
X-Received: by 2002:a05:620a:1aa0:b0:8c5:391f:1dc8 with SMTP id
 af79cd13be357-8c5391f20c9mr360107185a.8.1768462157456; 
 Wed, 14 Jan 2026 23:29:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 23:29:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:08 +0200
Subject: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge detect()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fflo70A3oSMP6LkHXNPuDEYg6XV8ot0GBkcmgzq2Sd4=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlol0OivLl6on31pVXR7v4POr3PP4wwtB7kPm4JaLlWM899d
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpaJdDAAoJEIs8ij4CKSjVAv8H/RxK
 4vcM55F3t2HfQGy/N9jSrzxJoUl2O/G09gBg5g/vA77U5dkM30CVBMwMdMrDhVJ4XE7Lrm4nHm1
 WOS6FAL+uJ9sgIIGruel9b2rVZAFd5xP4Pu0obH9qT4r7bBVIIwaZPeC2H4If3AQjvk1tuibe3i
 qA80BEyM2GpVKZlEjH5lboDiXVADopIFcJXmSJSmcwdOFCHto2CdoATvmNwsGe/YhyAMrdSGh/5
 zGFuSE31wBa/3MiMbjLO/QEpOWrvassaGnhYYPciDu3hNz7B9LL1PStJpvapQacW7TO6FCTd5Fm
 1S3hZzUL5iTkrNOMfaygYTc5ykwuwrRJAO7nPQQ=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6968974e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jcEwYMPARZwhhGfK5pwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: DfCkQ2lvAQBxRYmW3ltQxsM4vTGZyY73
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX094C15paRsna
 eIUafp8O+hX/mEABIFhBFbDsTKGMaQv+q0olA8n67KEK6JFno50y54axOrguBsYs6pLQN6fZCPT
 VPHK5Uj0Mc+38/Im+Y4brn/T38a9zafVDs9RPEe4fCbXd8QQDsFdSvaJYYAv/ZbCLygEmvwOJpz
 SE/cPkUSCOCqs0VeCQ/7k7KwnENoYC+P7J7xfrdZN8BQsbRn/QOowVG6RStf2QQA434LkyFPbMo
 lma0aezoGFKgnCKmAic7ftnLXWOowN3QSjSBtaGsZqhcFvkljdHtVQ4+bBLoUgiMq0hIJSbZZZ/
 97+/mYP7vk0bL6rdXigqKGAWj09NzSEUJ+Gq6QbZRuo7NU+gl4vg4wntSKkcnOkumON9Iq1SLwS
 cMPoy1EEva8KvhAFEzb/WIANjEKOzgT06tF0ZBtKRi0uUpm5NplG3TimiH+XnOERS8gR/PTvyAY
 QsIsWnnNrHA/iOx+cow==
X-Proofpoint-GUID: DfCkQ2lvAQBxRYmW3ltQxsM4vTGZyY73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Instead of relying on the link_ready flag to specify if DP is connected,
read the DPCD bits and get the sink count to accurately detect if DP is
connected.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 3 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5997cd28ba11..a05144de3b93 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
 	return 0;
 }
 
+/**
+ * msm_dp_bridge_detect - callback to determine if connector is connected
+ * @bridge: Pointer to drm bridge structure
+ * @connector: Pointer to drm connector structure
+ * Returns: Bridge's 'is connected' status
+ */
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector)
+{
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *priv;
+	int ret = 0;
+	int status = connector_status_disconnected;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	struct drm_dp_desc desc;
+
+	dp = to_dp_bridge(bridge)->msm_dp_display;
+
+	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	if (!dp->link_ready)
+		return status;
+
+	msm_dp_aux_enable_xfers(priv->aux, true);
+
+	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
+	if (ret) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
+		msm_dp_aux_enable_xfers(priv->aux, false);
+		return status;
+	}
+
+	ret = msm_dp_aux_is_link_connected(priv->aux);
+	if (dp->internal_hpd && !ret)
+		goto end;
+
+	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
+	if (ret)
+		goto end;
+
+	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
+	if (ret)
+		goto end;
+
+	status = connector_status_connected;
+	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
+		int sink_count = drm_dp_read_sink_count(priv->aux);
+
+		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
+
+		if (sink_count <= 0)
+			status = connector_status_disconnected;
+	}
+
+end:
+	pm_runtime_put_sync(&dp->pdev->dev);
+	return status;
+}
+
 static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct msm_dp_display_private *dp = dev_id;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index fd6443d2b6ce..e4622c85fb66 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -15,26 +15,6 @@
 #include "dp_audio.h"
 #include "dp_drm.h"
 
-/**
- * msm_dp_bridge_detect - callback to determine if connector is connected
- * @bridge: Pointer to drm bridge structure
- * @connector: Pointer to drm connector structure
- * Returns: Bridge's 'is connected' status
- */
-static enum drm_connector_status
-msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
-{
-	struct msm_dp *dp;
-
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
-	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		str_true_false(dp->link_ready));
-
-	return (dp->link_ready) ? connector_status_connected :
-					connector_status_disconnected;
-}
-
 static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
 			    struct drm_bridge_state *bridge_state,
 			    struct drm_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 9eb3431dd93a..6c0426803d78 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -25,6 +25,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   struct drm_encoder *encoder,
 		   bool yuv_supported);
 
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector);
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_state *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,

-- 
2.47.3


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47658BA6B13
	for <lists+freedreno@lfdr.de>; Sun, 28 Sep 2025 10:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C228510E393;
	Sun, 28 Sep 2025 08:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nyi1TU8A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3903B10E249
 for <freedreno@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:16 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58RNeRDW022035
 for <freedreno@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=; b=Nyi1TU8AJHWkgYCm
 Mgv7R0ZVX0wOcPUovl7wG0Xnz37w+/sVSXo2xOnDA5fZLQfNP04uFmi3XqhnHER8
 V27tyCm1WzBckV7iYoSaOnrk/9YuFhzSuVVh9vBFpnPy2rDlKrJfAxar4Lmw+TxC
 hf30s2KhImMkUW6QTYYpMaE0tmdL2OqqzOGIEVw8wAeaczRpiDMg0RG3NLdhxtM6
 7zSIX4sVPABYEYHGD3xWrebTn236Du6TKM95MHV8ClPVw4dNHlIMU/HorlOlxhX9
 8gl+QObKHjE+BhIiMu44UtsDfk90OACEMIvL3uv7PAfya2vBjsGj+MPB9Dt+uJ57
 a0vPfw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59mtrd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4deb67c61caso39986861cf.2
 for <freedreno@lists.freedesktop.org>; Sun, 28 Sep 2025 01:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759047914; x=1759652714;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=;
 b=kRm3Ax2kTjq9snnVhYV3eHzCJ5hOxBTrcRD62dscfrWpqw/nLu0wg/oBNDY1WcdDje
 X7aNC/cnqw9HDab3kOGge4bqAoaeHS4Gxh5CNWlCOI0BC1bIi6x6qtJ5LP6ps4xu+pQJ
 04tgPjKYk3eqSxsjZPUz/cToYeU/Ppa0i59svyHm6c5laMUw2HD1YbjeP0Zhk21Whw85
 Se2F2m8aF6FvkVu0ufrAs/fJxUc9AJbZ42tGW3urKwKpcpriyO+UqpiVEhAfF2/ni7Xo
 lI8NvVPRm6rl9iHtcW6iIiP1oqR++c3oL6KkWplA8tKtvPQy2XthKdpTSWW5HwV3pd0R
 nawQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ4XYNOCBpv6sZ5NucJ3InoC0ptTP5bJ3/5zu5ObSzN27AWW2w0yOa9PAW6M4PUAxZc7IkXMaM+mc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEvBgWKDnSsIpppViieV1qt1iZBnmEhgSpouF98PqBO1Xb/8vI
 7EceMqh0zQCqCBJqUEG4yLS67DKfDvKECwKzoMxIfRZjR5AdqBbIXpbTXoXg3XrVaf8/gbZMOA7
 OYoTKOBnI8m7xkDOQH0smltfS4fn/CpJH+GsJpgbTgadq2IxJ9kFKhCrxEiAVzy+O9o2TPXY=
X-Gm-Gg: ASbGncvKBtdyyCyVyuQI5jXFlSEI5OGR3qDonb+E5J0BtwTsPFhamjUk+gRXto80RuS
 Y0uoEqKgGQKWfgg6/vcVDxhpPhn+dbvsg4RpObTLysfECLQJGM1wI2fB6lejHc0Wu3q+9e/w5TC
 3OB+FhmwalXO8WlXQ8P/cuAilxWEHww/A1pCCG2nCI2clSKhlpe3e40eLb2TUv7IxXGJoBsGdfk
 bE4ml7qZs9u4WlM91Imp40nsq0zd8CKPQQrLC0hJ/IdJPlIVaiAcTjdNZlKVgZ16rBOe+tkJcb/
 neubH7cpyJEaWnPD7tWUWXpMnGRXcYTF24Kh6JWhJAoivFBBM71BGNBbKH08estaWs2kGabQZX0
 1kYFEVZ40n9DK3jLyMe8iFIpjSEajjN1BI2jxZ3c2hjuZg1Yr0aff
X-Received: by 2002:a05:622a:47c5:b0:4dd:584:1429 with SMTP id
 d75a77b69052e-4dd05841fd0mr134553561cf.81.1759047914490; 
 Sun, 28 Sep 2025 01:25:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwfsS0Q7LOoaRPfQeD9zvDgobB31SXOr4kE+JJnvQnCOXD4rZ+uP+6M8YxXGzoygRLIGjIwA==
X-Received: by 2002:a05:622a:47c5:b0:4dd:584:1429 with SMTP id
 d75a77b69052e-4dd05841fd0mr134553161cf.81.1759047914018; 
 Sun, 28 Sep 2025 01:25:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 01:25:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:51 +0300
Subject: [PATCH v2 6/9] drm/msm: hdmi: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-6-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vJ6MP4HtyLt5a75BuYCv3CbEFdh6+KuelPeaDQZ+OQQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDUyU7rCSa5YzapriRO9eRiYkhaqCHGmx40e
 u2QgQMrjL+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1c1+B/48g8XIA1mGiOfBerCYJp2Fs5T0zJCKW9Jx4v3PO9b+8QxLYHib6tzym0IumYyly/k7z4p
 aUIpTczb+3zc4DGKfWFnoVBBcTbT+7bBq4805NeNbG7sEYGN5sH64Dx1u+jhfGRODdGJ/E+hDt3
 JpTbshDXWQN/kpzysIXBESgmxv1QN9TZLzCY36KK8KZcY2UZJZ3BuJ+BsHvTwvqrBLm+DD9MXZw
 vI3gknUTNjHrk5YskzwrvFAzYF9tGB9mA9SHw9SegZAAmf7YWzW8SJldbp4vPyMDTLmT6TOGA4F
 JXeghLBFIPITZh4fDuHuLiz5X/nbdlBhKMJwMBQJqDnFjqqw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: wLa2cdNdYxh_pbOdl4ijse2XqKW_vFJS
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68d8f0eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B-oVSsyST8MYkDpc_wEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: wLa2cdNdYxh_pbOdl4ijse2XqKW_vFJS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX9Zh4zTc8V5/k
 0d+jb1eYjQnlXCM5HIwz1fp+d8M4y3tw8juhriuOSx1XEiVFvGeaTuYKU6LYYw408HlmcgEenOv
 5TJP/1RAzsTvGgramjkv5mFvG19CeVc78B7s+SX5GzCtoVSZuF9ivrtrgC9ZyAnFMFMVEJviLx4
 ZP72wyKkdXEC/rAfm5ZfgGl68EdEu3PNxTqzJT6ioy98uWNreQtEs0rE0GRw8rCCntnL1xfXMRq
 6KNkh2OTXk3id0rrUpX/HTu9/RBXtzusWzTR8dBBDkUL2h/RoKhMigNFjMTnyLh7epZ5+0+NEJz
 usLcHrjyWUL95dmSlfBx2JjLg0Mhe+Y6FNO1cazktmKsYNI+5FTEt5pGBIqWXYap+sAJrAkcfvn
 ErSI7SaDVdffgNeDcuoh3AP6ifDeGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
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

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..121239a01cea334c3e7c789ebfb54df71515db28 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -248,7 +248,7 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -273,11 +273,23 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	case HDMI_INFOFRAME_TYPE_VENDOR:
 		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
+static int msm_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static void msm_hdmi_set_timings(struct hdmi *hdmi,
 				 const struct drm_display_mode *mode);
 
@@ -452,6 +464,7 @@ static enum drm_mode_status msm_hdmi_bridge_tmds_char_rate_valid(const struct dr
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
+	.atomic_check = msm_hdmi_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3


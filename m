Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D1FB5001E
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 16:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEB510E774;
	Tue,  9 Sep 2025 14:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dE3M6rSJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB4310E764
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 14:52:25 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LQ6K009026
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 14:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PE+T/FZyuTmpvyf7ua/nvmZNTNQAEt/0dfhmApWw+vg=; b=dE3M6rSJ5PgGEMhe
 RuFknfV1pMtgdva4C58/L5YBG0c/3x1O0gTcymygz9Jrj6ey0eX5G83og2CHnJA4
 zeqFReSVAgfm/ag1z76O9HZpIZgnLeoWsQ8cGKRRL8XnCDD2QZUPJ4Y8e2ekBcc4
 /4qdHhS39lfzHGuzirN4eUjrGBw8Yy/sceJw6boWKYFag0J4JwCzvQzXMpsOVrgf
 sNh36Gt6G3GjIBrqIaImqtkvdodoVnulx2qQdECLQmo40A/WFFVw7tByGfykIU0P
 ge0BzjmRriKxxYlX93ia/IEylKEnaLUv8Z2Fg0XxF5IEQGLAS0OQZPf2AQT3FSe8
 xiNMnQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdwcdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 14:52:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-718c2590e94so157519286d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 07:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757429537; x=1758034337;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PE+T/FZyuTmpvyf7ua/nvmZNTNQAEt/0dfhmApWw+vg=;
 b=tkrPxqlXCfUra1GHxfGsY5ZaN+56Wf0hmq30Z76Vz/L7tQOCUoAJ4f/FHd7Pd8I+/i
 PMwvcb1hco6z1amMMbhwlbQtiYcaNJpX/vK5IsHj00y+TwSLVtF+ESPmMdoxLDXmKbua
 SudpkUDue8FXOW37Bf2dO18MvkG0YoYwhYD6QDd43Lw0ejBbbb5vcgFenlHvuRDejTgt
 0CgCWENgb4UBRfwA/hNOqOJ1wtw1TvMZBZsmq1HQ03smuB17+Xe4BxlYs+QYo5Cmv0sz
 XHi0RYy5vJOFPKdPr9A1YYNFcaTizsuMI8TIJI/UpPuNatdJBbNssujkPMM9tZo3L90F
 qgyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFAJji/GqpctuRNpMnyAUr4ApT3U1s10TH14kJDR8l9BWbx8DgoqOlQoAuVuIR+WMqs7DaGQ1HrXo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWSNeA0CODSRtXsCVUfcfxx5dIs4Sbjk7BGXLtfYQRXWvDlYyi
 5rklgmc/BmuQJJ5OueCGrT3q/8MQzDVuGS0E5k3I1aXoA3l8dUeZtsy6VuPUbrrVw1ytN41i7lP
 Rc8jB/WEi1YCa1FRKC3fDfRFQgGcikA2H1JkpxDJlspGzFFQtz1Vqp/AmTnNYt4Qq5nw9IA0=
X-Gm-Gg: ASbGncslAKOMfoI/+cYHBAHkNd1yGAGchNerpc8dESbOgnpfP9fQb4JiSdFnqHFxmVi
 hyR6yfbBCGUL9SPDObUiBxdLMHTLb3K4pQ2qOyKYRvuztMM5PjS6rDgB8bquNK8rSOVjBwAcRBH
 BSYU3qnNz5J/SnyD2uIxssbXlLF2lSmMFPS7ahyP2wH0xo7UbklCVDAMypyCh8AqKWGPV+/VaPE
 M8rpzFcBuGomw6cNVCFUTwhaqkCMr3vIIyGac+x6NdiKzCislP1tjbeE0RVHTnolIqf+cMAsq2+
 BNIsiYmKX0Dkt8jfHVEp9jv7+cKIgb+wrh2vyPndfakE4LHTm5r99EDXE4BgVcRdBvd3TFxZIkf
 8uGwT0VMQ44atobLOsnQasvm93vD+dPO7Nki1a2amMnhRxDIpF8Xb
X-Received: by 2002:ad4:5de2:0:b0:722:2301:315 with SMTP id
 6a1803df08f44-72bc4f93957mr184627926d6.29.1757429537123; 
 Tue, 09 Sep 2025 07:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6VRM/IqVRJKXO81d0zT+XPixBAwFdKLiapVJ34MeMBozB2in+dHoYjUEUQ6Ok2p00fI7S1A==
X-Received: by 2002:ad4:5de2:0:b0:722:2301:315 with SMTP id
 6a1803df08f44-72bc4f93957mr184627466d6.29.1757429536407; 
 Tue, 09 Sep 2025 07:52:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:52:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:00 +0300
Subject: [PATCH v4 02/10] drm/bridge: adv7511: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-2-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HknzX0xAST5U5QLgNvfO11z5aVo3wOUQOzJF7QU1MaI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8aH5xYcnrhsuEgstp3NDxwVu4bKX6MZD2EA
 4Yu1jcDcBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GgAKCRCLPIo+Aiko
 1TL+B/9MGL4mOR5FQjVfkhA/rQpcknnZoUMUAO2Gqv9h5Cz3u4e16jwPuv5boINoPhZebsK2s+y
 BrjiL1vqNJBOSO/UTkOjx/0fS8qhkk3L5Yv+bNbRqKEfdkUhtA25C8oq5pcAK3F8syC7y4p7S54
 /gF1zO66ME26uY668yT5CVicNHoQ+CGhnN51eeDSMSu69RotLmN7ZhVaUrnI+eeCkKs5zbqyZKN
 NIip2uT0ZPB0mWKx9MTQae77WC4y68wdJUpmh7jQklseJFf8M2MUTedWFV6PvWAs1vBjl3henPA
 rHDVrA+r1ygL8hZqca9H5UpXs3QjLHc65unr3Y/miZKmpJ0n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: CIZOVncc7aqXN4DiijqSNTymLmWHayRw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX0XGtMkgkma2d
 8/PVZP3PWoIjGhL9OkHWr6FODEIHmLQf1ae1t7hf4tub7OXkXV8RbaeZ2ODxuNLSfO06N13CQIB
 zwxsRYvrkt2a4Fv9l7oLp04D0oGcwa4MkobatNSkE1Y0kdNKDoBgQit9HUxmmTLS1Vz6pL6tYgy
 +ZJ/G7XO0eVe8jh+wb8bMfJpsLMH2j8QuhLbMzJyM0zWnwUMpUlRnGL2JexR2EmAHsJ+yaPAiSM
 42R4BrebFSt8AjJvYXpu3DsEi58Upo9WbjnSoygxGTly6QzsE5WbS5kqNHwlJ69BfBiMg9rOkbw
 pfwza8UwHGheHiT06Mcrq3OYDaoMR2C2ObsZF+7tUh839WqNNF/Z3vAMVlwCxwvyYTg5/ywAE6q
 PsQjjPkC
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c03f28 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=2sjEEKaKrRP40jhUrFQA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: CIZOVncc7aqXN4DiijqSNTymLmWHayRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
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

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Return -EOPNOTSUPP if the driver is asked to write or clear
the unsupported InfoFrame.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be8654130758e69ac7ccbc73a82cc25d731a5c..280a5f82ebb0c792a0667e9f55af103f29ff2948 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -907,7 +907,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -967,7 +967,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -1328,6 +1328,11 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.vendor = "Analog";
 	adv7511->bridge.product = adv7511->info->name;
+	adv7511->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;

-- 
2.47.3


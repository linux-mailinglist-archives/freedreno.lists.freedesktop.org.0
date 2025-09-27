Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABEFBA5715
	for <lists+freedreno@lfdr.de>; Sat, 27 Sep 2025 03:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EDA10EAFB;
	Sat, 27 Sep 2025 01:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iB0NPyKz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAFF10EAFD
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:04:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWxih006817
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KHBvbs6wVCtvxZAx2wHIzn0cwgfPtQSReWo4Noc9O+4=; b=iB0NPyKzQp9RO4/b
 NiUXUNjL95SnD6VCYC2k7DHEXwm+tErDbCYYEpxZk1PGBnrfOt59d7H6g7nRmYoL
 BmNhvjHiVdK5EQ7VMkDkLu1MFx3iMTtnUVcyOjXHy1S1KceI/8/zJim9fzkkXSxz
 9Heb2J2vhyGp3HaFE35jg+nhzBles9TZ809gOX4xZ62XfO5nweoxK6mZfHlQTqiS
 /8Lk0vJn/Ovja2ENhnXLkTeWkzfbe1jQpc93dZ4Q9ZYgM5WfpYG2XXPGl8/pHH7Q
 Lf/dfoi9jcixGh95tqcKkkTLSvfxoF/n/ARMhqiz3JCqI2kGNEAlPKuBWewgPWAf
 miLiaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qvh3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:04:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4df10fb4a4cso7697721cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 18:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758935085; x=1759539885;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KHBvbs6wVCtvxZAx2wHIzn0cwgfPtQSReWo4Noc9O+4=;
 b=KK92dbQ9CwfZnsS9bO5RysYrHg/Pbgl5V2SjyIQ2C+LG+pZL0D/geq4rFarW04iVMj
 EF+CUI9OD3mCAh+Yg5OoGOOkDJdREgixrzz86j0P8nSsezk41Dwitmq+jYHe/4BLRnYR
 a8qIlYzF2DYViGpGzZSTlFIcJCfnWWoeIuHbyEQIwLoH9938fueHaxXtgmFBd8pZjt2h
 qAxQ5G2Od23+hVfOV4Evjy1AgceQsZaxfUNIoNHI+BySgbANPmxamam0uP0+8tAZO1/c
 favRGseezPiFM5eYfjkzU+fid/3zXX4BQM0+seQtlVGEbLzBYIMiPB29LjADZtg3wvHb
 4Wrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnaNqqa/l6eS25YNWkg4NOMNYyBsHYXrCWzfEh9uCRFO7lqx5ii0RTAhCUwozVMRjJq0Li7lfQQ88=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4CGXf+00L0cbtSq3MoH010CgIDGUTXZylgQ/BGMdAxsxarjB6
 PU1/b2e9agjqQZcHTt8LaPWcrD8E2GrKLjq0YmGZ6jJYF1A5Z1Jf6iXb0Q65LCfjitmlw50YMUw
 eKlxS8HPbq0ihc4qf/rTzsorJS2S+2Dwg2sqZRXWWrjUyn7q2eC474JSLErS+mLe5aWRCwJc=
X-Gm-Gg: ASbGncv3yGz8gMs8uCflt4etfIEXLuzwPQqNFYmTkkTneR5N2MD0R/K51OCGb1sM88V
 8sr2YJOG7kJmTlIP7rk6NA2BNzJt9YHK9qRbaN/SIz2KaqUULo2mJFlbLDuqdd1qxeL1axKB1Zn
 DTwvA0oIkz63b0GZO5JIwQKt+af0jN6WjHVQOJV1Jatid7/+ZJ8os8n9PO+8BH1Zy5Z62+Cx5E9
 rhpigVXNJztPbU0wqSzqQWK+MvYb46gIRUFNnXyxL3ce5TWPaD7zPh+54rCoDr4Y7to5NtstwSr
 b+G5TxvVI8gPh77jGKRJVt+wzV7KOSmClPMH5tFaKT5p+h6x6cz+cInkBLQsypOEUsEy/y4JgxJ
 lEVtDTBq0iExF9r0dv5cntVOFpOeUaJM2iRabXXC5RV2FZt0GE+wO
X-Received: by 2002:a05:622a:1f09:b0:4b7:9f68:52cb with SMTP id
 d75a77b69052e-4da4bbe54e6mr141708531cf.54.1758935085229; 
 Fri, 26 Sep 2025 18:04:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDgxekAFYTmTTqmCZefeEPl+nSUzBiwY3LbANe6dbEILxpaj8AQRwYb+0/9qkitC+FpZtBTQ==
X-Received: by 2002:a05:622a:1f09:b0:4b7:9f68:52cb with SMTP id
 d75a77b69052e-4da4bbe54e6mr141708011cf.54.1758935084695; 
 Fri, 26 Sep 2025 18:04:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 18:04:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:31 +0300
Subject: [PATCH 2/9] drm/bridge: adv7511: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-2-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
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
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GDJs9stizfNvb2WVbvQCEr8SONIYHFgwY7yHLMQGSzY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Z1C4WwP9P/BahfUM7J/q38y+eoSdQLBoWi9c1+S95+v
 sn2RUOjk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT4f3B/k9v8b97bhIf9U8U
 rWn0L+vfdMc+z9ONLZFtWkd73NlfAtP52OZ9fr5zUayhl/rpazf/lhyvCPNVZLlvN2eaaEvRF7t
 M/RtdPk8PKW1gqT8RmhWS+fDiynlZNom/N/mnfeTKCb/hO+Ovzualbg1512M7InnKQ/p+9Qde6G
 vR8O0/s95ngpGb24U5mc0Vz67N2jhbrCcgpqDGsn7ZwbCKYleeUzyFj/lDhBTmSYZ5q75Wjt3Kf
 Vk1o2NBbWNF/IerWYqvNVZvzdWLWtXKv+is/+R5LVFN5o8X7kjexSmg+/brZ5PqSs5HffbavMEZ
 q1zs5186cY/dRH661Msb39SCc6bVOgZ0nkowVN1rOv0iAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: H5xdW2guWjbOTVcxV0cu-wGpOlEa4wuT
X-Proofpoint-ORIG-GUID: H5xdW2guWjbOTVcxV0cu-wGpOlEa4wuT
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d73830 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXwbpGSfXEMFbk
 emrnpz5J96kUm+aaxkqclthBwuKnk/VuYAnCCRZHuYgxqin6VSfIVS8YJiYvaEnhzzF6e3nJVZU
 pc9u8tMY1MhmPNYcT9pMSOTbOsyOW+wq29qLCOpAF0W2R63eyep0T5orWkxj675PMN6QzNR4cca
 80sloZ215ZEibB8pEMlK/IqAHxmAsAs/LCXEUzcGIKT8Yfo8wk8EK97rnevFjq2mMi+4WuTrQ0Q
 07xr+GqbY+pk8kd5xj33yF1hQ0yLnUOk2PSGDqIG7c7LPUHEfyI+Sd06MauaHUdC28K9WgzwbMO
 Yv6BXf88txN/II3CluV9RvSGIf7cnSbcTSjkJij13TGLLueLX+uicUhapCle4zPURfcqD720YHg
 q5gGUawcCYUUztDO43NRbJoJZ4MuBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be8654130758e69ac7ccbc73a82cc25d731a5c..452265c2d81269e158c83850279a3a58302faf03 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -906,8 +906,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 		break;
 	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -966,19 +965,32 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 		break;
 	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
 }
 
+static int adv7511_bridge_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.mode_valid = adv7511_bridge_mode_valid,
 	.attach = adv7511_bridge_attach,
 	.detect = adv7511_bridge_detect,
 	.edid_read = adv7511_bridge_edid_read,
 
+	.atomic_check = adv7511_bridge_atomic_check,
 	.atomic_enable = adv7511_bridge_atomic_enable,
 	.atomic_disable = adv7511_bridge_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,

-- 
2.47.3


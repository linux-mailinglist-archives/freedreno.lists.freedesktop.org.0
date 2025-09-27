Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABA3BA5709
	for <lists+freedreno@lfdr.de>; Sat, 27 Sep 2025 03:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECA510E17D;
	Sat, 27 Sep 2025 01:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h2aCXGC4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3B710E17D
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:04:43 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX78P032149
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tqL9/YMiIEc6tsQIKNZIjqHO6NoBtjrbfKTgbxxDbRo=; b=h2aCXGC4I/FFoMnp
 ArCQmvc7Xjl5wqsta2feYFgGDI2uIcwDXCd7J0Gmp2mkXhwM/90qPS3j99QD3eNn
 gu19rTNNMHJt7ZXdsPYO5qHfKW9KUaIGFwJlwA5VrvS8yr/bBE7QDMEitmdf1eZM
 k3bKPYzDMow0aPKNFhQvqlPgCShKom8IyZufpGAsNxFXU57aJFdCrvzRp7HkAwEB
 zV5AjopJDVGM1aGGaWsKrwJVMHBwNcQfhCBSQwYvpAJQuSQijHZ+ie/QXEHvJNrn
 X62z9DjXvsPxYiRBif5ns/q3sqsTLemg4FKeDe0ZM9s4ST3bZz8LvreCGTylgB8V
 MqJ+rA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rmh86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:04:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4df10fb4a4cso7695731cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 18:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758935082; x=1759539882;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tqL9/YMiIEc6tsQIKNZIjqHO6NoBtjrbfKTgbxxDbRo=;
 b=kobTQWUtidTYtOU36h1dKnlgFHUWRwZyS06lS/EZ1gTUsTLMw0bFBg3c0d4X3/mutF
 sco9lLuG2Gs+3QA5Xwqmu79GxQaEjKlFsOeY86rrAulSpFhRWkCWMpBCXvfVpPQiwg0G
 WMzTxhvu2vKaLpMAY/NBXdNltxgigo50sESmGu1E4p8KiC+ipGjy09dKkceD0KH0nuC1
 7VsycrXE7o9HZ2FU0BYR1q/eQZJsy9l8HRCYd4KLM/pcv/Y7mMsD2q7FRI2TJOjPb9u8
 vcOIpFVIT9u07UprjnWaNgXIJYIIgqfAWVG3n4xyTsOqkEOWruQn1StbuWcdowNC7Z0j
 R8Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRCqHXg4hkF7t/YBIH4RdCOSwpOqGP2ROKZAPeZLY/7Y9ue4pTJHak6q8+ubNDo37ODfgV2y23nCU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0mJI5uTQg8ODENwozobQfUUYAh0DVK8CcajHAj0UdHh7gF8vN
 OLtUr6oBfn67CK7HImrY2h69DFBOI0e9OVz+KgHsLIzcfVWnp5COs/nYNIQpyYQMMCYGuq7M4Bq
 zUXylMpQPeD6qV7wj0DysmBQNiugOaaMmQ3ruXL9XpW6vYa5/Bl0042vqJvqDbeHVUuYVYl0=
X-Gm-Gg: ASbGncv/ZNQQzNtM7fgqOvWEQmwzNFy3OZuBdbgabZhN41KZfKn7OuVwXUiZoLZriEk
 yKNfEm7XQeWgasTsoPS9feI99w0ADKeAEotAbxtSjQf1H7Kk2GIv8n6FWY5elfYf/qi9ps7S5Oz
 UV5tx4Cc40kYPordfF+VJbyksad1T9AwykC+x+C3dTkLn0u6UzObVBdmqXwaYBtBETp/tVeTVrP
 EG7Vy2j0pv+qc3jHRDnTABdWdgZenbYWh/YhN92yq3rCwvV5B24LZysPsyQm72pazGThI1ciiJQ
 SPXXiESELHqh9JSeQJDUKSborDiZWvZSFfIrThtPzgTdMAelX8rFhx0PdhMkuOYvvLEdULZ19Bc
 5+5brXYv4B7UahnsP+Wi05mA+jNCbNf28hJz4DpnOk2ItJNj1NNT9
X-Received: by 2002:ac8:5f53:0:b0:4b6:38f8:4edf with SMTP id
 d75a77b69052e-4da48c83a55mr117773531cf.29.1758935081764; 
 Fri, 26 Sep 2025 18:04:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF75VibNMp5O2UtPKi1lry6nSqkB5lKg4XgBP9p5gbrQo+2jtHOvdb5uGII3iLSHRo8cejMHA==
X-Received: by 2002:ac8:5f53:0:b0:4b6:38f8:4edf with SMTP id
 d75a77b69052e-4da48c83a55mr117773001cf.29.1758935081126; 
 Fri, 26 Sep 2025 18:04:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 18:04:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:30 +0300
Subject: [PATCH 1/9] drm/display: hdmi-state-helpers: warn on unsupported
 InfoFrame types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-1-697511bd050b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3Kap+upNT87sFn+7RYq1dDaa62IPE0BRWOyWIEU3S6I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zgfX/GIreKBwo6aCquZZY/wID5t6jipXzkNi
 wTF056wjFeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4HwAKCRCLPIo+Aiko
 1f55B/9KVdsAJOIT3RmBfdpKQySqJj7khLyWlEyFtjy3loB2+1eEOtJi2XVpH99c6q6m5nmgika
 FDWK4UD2Q/faYp488okDacpcRd7LG2k1I/KXafk68W0yMIvO5PU37KKyl7UkZWxNov7p7+aHt5R
 Wwp8mCubhX8mMCmlOVFpNKA5ARDnIbuY5e3+fAnV7hsW1ppyyJaXajCEmTQZvwpQoU0oH5PmzTa
 OwUPXQEUskF5wjmeV0dhV8YVx7YAksWi40g7yInbW6g+Q9eVi2VGdPoFWcdBj1TOGc2d7/j1rgU
 PZOjdrVKqzO/S8m9Bgk8t7Er/wOQS12w80Pibwbavv/Oj8jS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d7382b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9qaGXxVFTICEpRVd4z0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: vc85M1ggofJDUiMcgLflGx8qrZ59Yk0p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX32C1d/O0vwYp
 SVQrvD/bEK6oQESZdJRs/HlUiA1hPY+9eHTc/m/YDhTQkxyy3fe9L5EJc3QSH5uExG1JYKXK0wP
 zdDAuwt4JoUHMRoGFbXYgZ5v6mwNsL4QlI10ChIG9I2Q0JLLiiX1bp7EiqbqMas/KX/1605JLav
 gYeAQ1IbjsvWM1DlYJ3nDQDdyqJi+B3o/oPBUKq5ae7YHGaXNgSgm/x+rqi9rt7S4ogQmMYDZOf
 hsIeTatTXJYEaNG9UqCO3ibnbG66xlNJN15GXVnRUV+zC7zgP/jo5hHGzSiPBznjL61t+dyU7oX
 smqU3u64DxwQ4rzg8Dm9pw3/OzK6WSmMhjM2NrS7D1uI4Szbrhzg98fKRqgOOAqdmNXBIjmWXJQ
 3NFl86vvcJ8fjIDq9ciMMhfFKMVR9Q==
X-Proofpoint-GUID: vc85M1ggofJDUiMcgLflGx8qrZ59Yk0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
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

In preparation to tightening driver control over generated InfoFrames,
make sure to warn the user if the driver rejects the InfoFrames on the
grounds of it being unsupported.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99a0cd4259dbacf5f5f6651ff8a0ea..361912de2741939cfb5ec350c08d738a92e2ad37 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -920,6 +920,8 @@ static int clear_infoframe(struct drm_connector *connector,
 	int ret;
 
 	ret = clear_device_infoframe(connector, old_frame->data.any.type);
+	if (ret == -EOPNOTSUPP)
+		dev_warn_once(it->dev, "unsupported HDMI infoframe 0x%x\n", frame->any.type);
 	if (ret)
 		return ret;
 
@@ -947,6 +949,8 @@ static int write_device_infoframe(struct drm_connector *connector,
 		return len;
 
 	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
+	if (ret == -EOPNOTSUPP)
+		dev_warn_once(it->dev, "unsupported HDMI infoframe 0x%x\n", frame->any.type);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;

-- 
2.47.3


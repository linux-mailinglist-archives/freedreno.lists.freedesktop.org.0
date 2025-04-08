Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A27A80CFC
	for <lists+freedreno@lfdr.de>; Tue,  8 Apr 2025 15:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AF110E6BC;
	Tue,  8 Apr 2025 13:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1xJhHsw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90C410E6B6
 for <freedreno@lists.freedesktop.org>; Tue,  8 Apr 2025 13:54:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BXORH010525
 for <freedreno@lists.freedesktop.org>; Tue, 8 Apr 2025 13:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9jtVHB+LSL7jwpKNp08BEBgDkCQoesKM3+hWFxnCDVk=; b=e1xJhHswOE4j6l6Q
 eyVWG9RNqdvggvyxUfHyYMcWyYG8eouF53oi6RQuzOm1EgVeHdmOABFXbIHsZ+d2
 MaCUoas4gMnvz9VVcnLSXX7fb4FISR4LcwxyRpMJmnuww4CnDUDGYUgBplegeibY
 qLXnWRSat7pXNcGzfmX603UqDOyuTpaY9XvF8iGnp3fhLRrkQhLu7ugP1YqAFCaT
 eTwb+XHrNaoNlrPRHrz31UpuIcJ5k26dGtO+Rcp3Pbgshjg3mbvEpCGtD5bXJ2FP
 DK/TgFgWvILOD3MX/Vt0PMBIrPgTpteKorJ2zfA2btHNE2AF1rmNDTQGP5YWouGk
 ba6e8g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1fu8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 08 Apr 2025 13:54:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f0c089909aso54145026d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 08 Apr 2025 06:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744120471; x=1744725271;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9jtVHB+LSL7jwpKNp08BEBgDkCQoesKM3+hWFxnCDVk=;
 b=tgsSPpfxO0gk9V8jVjhRjiB5Fk4jKXLV7lNXfacyO2/M0MkdJswBUqFuHRnCAFSuqJ
 U57I22dcG3hJsSZaktzeVJStamQzMhJH6QXpXfrdBlZWPC1O2+IgoDFDj15GXdkBehUK
 EvVWYPiSsR/cvBU74SXMVEpQoDDo9RzoUdRD3J6YhitYGgr0Qh28ijow0Oz1nWlc5j03
 //qmHGT2uH5x05OYO5lWMQl4KpHpKxSloVdZsQhM0nFNIn/iNvKIwo7KUDxH2MFdc9dX
 LgRk15OUW/FzQuTdn/+PJaU/A2lOviFgtcnh04ccpJSV6xIakh9OiIaXPp1osdw1czou
 j/KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQbnwlBkYCADuf2hzvwZ5eenUIAyDWhfkGNDUAEO4DZrAJnurzy4ehTNaD9CbnktcQ4MfoVOXWUnA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6mFboNu28KMzT4uBaRRcleg06rmSahp4CXvYVrQN9HgVOsS30
 xYo1Ygd/bya3lteNJz/xslAJn5Jaf0nK1Vos6HcMyG3LAiarilFRwimfcQdFuiMQmbpqWU53kZI
 aZ3oWfym3e1NsN6D/Ru2afK+fmcoQzad+fYMTYj84e5dk3mzivaKurABG2LGje/2lxrc=
X-Gm-Gg: ASbGncvmAESOg5QAuabnMhrQe92j8UifR6Ii3DEgdRd83sOyo/oljOz/UFlJIpI2rlK
 WebezGE5yNoG3bIQrwwayU6avvz43+0LZEehXWMSe3N1/vs6W0EwY+DNy1gSZPOJg/2acbaaASh
 CCSj5o2/zXyam13MbBniOdjonzOHRo1ol9BIVnbXHyOrr+hbra8XIn7dyl2XyqoLxfwFcOuAVK+
 CQuQWOy1OE46XWDAD07r3Ynb6ItaGOStajTy7Ncfuf7FZkEO1pOhVNYfNRW3RavoDmUcK99aA14
 6GnMW3N5gui3ySF8d61Uozf/qnWcxLWwqs2UBS2FWYUZUqenj+CJDm40JH9S22htJzR7WKarLS/
 +I3yfzKUomzAuYSslRJnzTrBvfPnW
X-Received: by 2002:a05:6214:29e3:b0:6e8:f60c:5879 with SMTP id
 6a1803df08f44-6f01e7e9b8emr227190376d6.42.1744120471098; 
 Tue, 08 Apr 2025 06:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/mVxtxCHKg/wXvM0W6651vvlIK97AkhY/TbhIAFbIce/NERJC8FY9A2ZvMtOD4hLPH5vZSw==
X-Received: by 2002:a05:6214:29e3:b0:6e8:f60c:5879 with SMTP id
 6a1803df08f44-6f01e7e9b8emr227189916d6.42.1744120470706; 
 Tue, 08 Apr 2025 06:54:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e672306sm1515306e87.237.2025.04.08.06.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 06:54:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 16:54:26 +0300
Subject: [PATCH v2 2/3] drm/msm/hdmi: move msm_hdmi_audio_update() out of
 msm_hdmi_set_timings()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-hdmi-acr-v2-2-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Dnaa5nU2/lgYjZ1nimtJqu9UVySqokolcJlX/EhafY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9SqRdA37uRn+R1KQbc2w0UaLXYPYJwEzzwBtO
 i0APoP8S+yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/UqkQAKCRCLPIo+Aiko
 1fCCB/0aE/Zr52AB9WQRb7/JZUkDvI+VrlMax3gl6oDlXBZl57/YmrlWjBrLJthR0kJSWE99L+k
 vHkJeMBMZ2OchATf4n8Gay6fqxBkWsrP7f7Us7OdenLsDUQvddq9ZAFs3PCez7wM5fkH4xQRjev
 aQWF1H1XZrusgshbp7SkAQyxqkMF+dGp2zIUiF3G849mTz5JDrK1VGeoYxWm2Nfkb5DbAxmd3by
 Y5of9TTXw9nqi2UPzunlNUJRf9loWdk9UxUsYPCBVE6UQpd0UZ0VqTzQ7aZyfEiy9Edwb3CTVHo
 ttmLC/Rwal5LET9cwrI6t6vwn2Wuf/arQZaEydmnSAcNAqNd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FpJvMlBeJzVola6XwKy5wlh06IWTso84
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f52a97 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7vAEta9WQHVFImzO9-QA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: FpJvMlBeJzVola6XwKy5wlh06IWTso84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=828 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080098
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

There is a duplication between msm_hdmi_audio_update() calls in
msm_hdmi_set_timings() and msm_hdmi_bridge_atomic_pre_enable(). Merge
those two calls to be performed unconditionally at
msm_hdmi_bridge_atomic_pre_enable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 1456354c8af4bc7f655e8a47e958e9e0b99b7d29..d1218f2a6e9fd70c0e4e30a620daa69e84e12e9f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -324,10 +324,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (connector->display_info.is_hdmi)
-			msm_hdmi_audio_update(hdmi);
 	}
 
+	if (connector->display_info.is_hdmi)
+		msm_hdmi_audio_update(hdmi);
+
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
@@ -411,9 +412,6 @@ static void msm_hdmi_set_timings(struct hdmi *hdmi,
 		frame_ctrl |= HDMI_FRAME_CTRL_INTERLACED_EN;
 	DBG("frame_ctrl=%08x", frame_ctrl);
 	hdmi_write(hdmi, REG_HDMI_FRAME_CTRL, frame_ctrl);
-
-	if (hdmi->connector->display_info.is_hdmi)
-		msm_hdmi_audio_update(hdmi);
 }
 
 static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridge,

-- 
2.39.5


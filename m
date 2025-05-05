Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F91AA8A38
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 02:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6235E10E236;
	Mon,  5 May 2025 00:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHuhT8N0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7656B10E2CE
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 00:15:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54505xXU019329
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 00:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WKq/kT9g+DsNZXb0KT7/tMrmhMgiNcjrVqoX/ddWVuw=; b=lHuhT8N0IpzXrWhj
 qzyJ2So0umzKv7CWy9gtumN6Zh86h5S30Cg+mK4beZ/BVZMFa0LGcdC1Rlh03Rhm
 A+Y5FNkzOJa93xox7oshmytcGAD7JP4Mo2IwS66smZQ7Jwow3m4qSqnjNJyx7GhJ
 YFauxb5yGsHIDvznsuzf1G37sSnTtzxfXkZ2anFomQVWFm8C3u5Y7H7asQwTkQ2Z
 HsHuOTOlmkeN9LG8A0YHBANvMG/JCbwrTcaXqctwZgn08hAmXHWt4ol9zjSKWNHK
 7660FJZzUVCnnGhC2EfYz/r1Fnsm45jPyxMPuDHl8iEB7urN3qB+34cxageN4Tcn
 nQg7Ew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5an7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 00:15:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4769a8d15afso61251051cf.3
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 17:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404129; x=1747008929;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WKq/kT9g+DsNZXb0KT7/tMrmhMgiNcjrVqoX/ddWVuw=;
 b=CaFXwbYSgwDbuWqC2ZwMOugBVkMFmKoIwJxjvtinMf07YMYR+Sxf9PW4U5OSVQuIVX
 7aO6UgJ0NIBeTpBeSmIPXdV7WryBxmvW/1SbujUowXjSy77sQ7NvlFZtUQE5KPQxknG5
 Y09eV6p0gau4cbEhzt/mL3vmw6VodwTH7f5NsZEeF4UK2f8Jxmp8GOop9fpTTtt6lHLt
 JANPPRExqRSQfiKgT3+ajX7u89md178IDcZcYcWnUFoxgxpcTaPk0cbDm3YiHt9Jljc3
 nmdZL6jIcpG7Bsrk/6iKOjs+5I77rNK3GFoBtGeKOlHg9y0tjKtNdbHuSmZ6nNL5I8BQ
 0CUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURlD3bAnSRLERcRZ8DApm5fY4txK2pUVH2fotum0xBqiIW8TN8PsSu8uGIqEQCaYTqIzbEfexEjyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVryLiCabKQ6czp1VF9ZKXmJVq0UGFxZc27nZaGA5qMDlyobeB
 cT+AlLhSI2oE/Rr08+2taby2yMRFICbgNaDE3Brpw4qZuKAV1OAUgYxIh3Md1PAroAa005zXMul
 kORl+hwgo4u8X+7NG2k0+91nHv5j43cd8LM2nIrGxkxqukYkUR9HktzdgmDQJAvF/u14=
X-Gm-Gg: ASbGnctNvoGVk320NEExYOhD/nRB5oadklNybkcQWNfP+rWufltuosed9wTaLIv0dPl
 QiOC7LK3ohMx5XE3rWl3EHkYS1IWogy6XrlwdV2e0hXaaxdYm989gtZkvZpJA5giO7IjbCqGKgT
 Aps27vQuH7HOiP6jRjQFwWKYyS36O0JVIXX1SLjL+G8Cx+7Z9FGEDIQeiXvwNVU0HxhDGKpiqOh
 m0ViYKI2rmS5Wm3D0GtasNbLQmzq8zy6SKE/As44rHK/37WNaXi8lTSf9m+ggwtf4NXax01ecBO
 einRZbhFtH4hlKemn0Be/1FoTVBdSNKUGAzJjRjojmBhAMkZUBG56TO3YEKTCD0G/O2dwc2BH2C
 NalerANTjmR7Yl7teylaObGzY
X-Received: by 2002:a05:622a:1101:b0:476:afd2:5b5e with SMTP id
 d75a77b69052e-48d5c072eb3mr105036751cf.13.1746404129016; 
 Sun, 04 May 2025 17:15:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp/OhsqgAG8SJaelWw/DfK2Sdqi7I0XDMO57EtM6QoFMTFIiepxIj9H3pi7rYjCKkFGpknVA==
X-Received: by 2002:a05:622a:1101:b0:476:afd2:5b5e with SMTP id
 d75a77b69052e-48d5c072eb3mr105036461cf.13.1746404128675; 
 Sun, 04 May 2025 17:15:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:56 +0300
Subject: [PATCH v5 12/13] drm/msm/hdmi: ensure that HDMI is up if HPD is
 requested
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-12-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3985;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pJMJhJs0UAB/ZtDoYbq6HHPuMctlMC/J56x/3ZZQZmw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL9ltAr7WIgRdaYsly84l2U9p1Mkv0qRemKG
 VIzqb4aVIKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/QAKCRCLPIo+Aiko
 1RA+CACSefjj1PpWQEvfYkqg7JtJJa0X1TdSZiQO09nfDMqSPYfWz/ASkUmG4t1PV4zHcx5aOjy
 iCoYcQWcbGfRbbVIBwG/P09LhdRzNv4qZH/Y3TLB2TxJER7d+vAgpWZJ82G9stzKWJpeDDJ5HlN
 XM2vUJXLo+iwTNeVf0pf6ID2Zz7G22ezGbF1rZ/eNZTvx+C9MmJ110v2XSOc/IeyWg7EVjlZIB2
 /6UiJykd+FvNCWLn1wmoj7TbJlfsXBo4LxyACOwienD3/M7KyGdA1T+W69jnsAA2jazDSwyO5oz
 R3QYXW0ihyh7XCKH7VYXGGYgA4Q1Bew1NYoCy/mldxveus6C
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: aOuD5aNWrObTL1Algh0MSFlJn4l2myiK
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=68180325 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=YSH6xZ7kgCKePGnQ2WoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aOuD5aNWrObTL1Algh0MSFlJn4l2myiK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfXw0FzARjHW61Q
 7/voD0vgO9PC8ldFU4SeaupOXqKJDfZbVZeZxXhI2i4V41yBfbADOrCPoh+ZYkupjzsCjPqajV4
 J3AP3oYYnHXdOg0TBGve9g95StPDzN+ug4WgL0Zj6PRIXbcx4N2Vgo374UQNmJJXpe3DpDczKi3
 yFXuYUX1U3pFmcnkyx+0aPEwoFL+bYVoIARZSdKMle/1rDJVHi3cIW+re68HlMDg0/ipZ+UUcya
 BaBuxxJFmxkQq2NY00nxOA4TmAHhtYyfJhXI1wj61jqjWLtXkeYHL/QWKmxm/r7Mw1pOFNCQ2iZ
 5hH0i9bW8NNRetaR7n7RIYyQGbLMWN7IKm6jX3fTAVcp/Wv0b2szrDH749OZ78Qii6a7Lb2phKN
 MfKIa2APTW5B+sJATEYxMjSBFMI9k4SPZ/t6PXsmlyA+X7cGpy2X2iV55W0Kwe0J41ibDFu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The HDMI block needs to be enabled to properly generate HPD events. Make
sure it is not turned off in the disable paths if HPD delivery is enabled.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 9 ++++++++-
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3d10fe6f8545198365a047b2f5652081703101aa..5355cfd391c5cc3053f771dd03e24dfde16733bf 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -293,6 +293,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	hdmi->pdev = pdev;
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
+	mutex_init(&hdmi->state_mutex);
 
 	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
 	if (ret && ret != -ENODEV)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index fb64652162b6c5e6e2fe3357b89c40e2a28aa47e..e488ee31cc865b4eee9d486d978217c00f7816bf 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -41,6 +41,8 @@ struct hdmi {
 
 	/* video state: */
 	bool power_on;
+	bool hpd_enabled;
+	struct mutex state_mutex; /* protects two booleans */
 	unsigned long int pixclock;
 
 	void __iomem *mmio;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 665c5e1323d09513621429a6f184fb89bae0a37d..8ff0079abc801448e96b73ebea4730edea55ea6c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -302,11 +302,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
 
+	mutex_lock(&hdmi->state_mutex);
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
 	}
+	mutex_unlock(&hdmi->state_mutex);
 
 	if (connector->display_info.is_hdmi)
 		msm_hdmi_audio_update(hdmi);
@@ -332,7 +334,10 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
 
 	DBG("power down");
-	msm_hdmi_set_mode(hdmi, false);
+
+	/* Keep the HDMI enabled if the HPD is enabled */
+	mutex_lock(&hdmi->state_mutex);
+	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
 
 	msm_hdmi_phy_powerdown(phy);
 
@@ -343,6 +348,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 			msm_hdmi_audio_update(hdmi);
 		msm_hdmi_phy_resource_disable(phy);
 	}
+	mutex_unlock(&hdmi->state_mutex);
 }
 
 static void msm_hdmi_set_timings(struct hdmi *hdmi,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index a42ed26a5b7c7d916d543aa2920754347903062a..e03d0ca230e64d7675534074d6e14587815119b6 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -76,10 +76,14 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (ret)
 		return ret;
 
+	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
 	msm_hdmi_set_mode(hdmi, true);
 
+	hdmi->hpd_enabled = true;
+	mutex_unlock(&hdmi->state_mutex);
+
 	hdmi_write(hdmi, REG_HDMI_USEC_REFTIMER, 0x0001001b);
 
 	/* enable HPD events: */
@@ -109,7 +113,10 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 	/* Disable HPD interrupt */
 	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
 
-	msm_hdmi_set_mode(hdmi, false);
+	mutex_lock(&hdmi->state_mutex);
+	hdmi->hpd_enabled = false;
+	msm_hdmi_set_mode(hdmi, hdmi->power_on);
+	mutex_unlock(&hdmi->state_mutex);
 
 	pm_runtime_put(dev);
 }

-- 
2.39.5


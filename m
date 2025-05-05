Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDA8AA8A28
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 02:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A07A10E207;
	Mon,  5 May 2025 00:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZ1oK6V8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E8910E236
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 00:15:15 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544KljXi031774
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 00:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rzjD6W4PVhu5bnBRA6TwITh0IKW78wTDC6QACU3Fu6Y=; b=kZ1oK6V84mEwN0v+
 3Y6GE+RRy3ttADEs4G9dkCBiySKIBJddQpSz+L+IK82Bzrn8JDHUy5QMvX1Brchc
 v32VgXZLmP4mcLsoxbPrs/f1oMZ/montVVwKviY9FXnxZLPOD0QQI67wZFNOh6nz
 uu2jyZc7kryMHf8XUj8fllk7+S+1KDY+Tslqsz9Al0jelRnYKKMmwJLiQWFifRUI
 dMnS4kCRoZtT9DJtpDkRl+F4Jn/AaKEk3GAeKYB3DJ5IFhcvOM4Ets9ybb7GYdIm
 YAvfpJofWFtcdxHWdYIlq2C7kfI9VSoovL7g1uBXYyIcXhMZuwWDf42cDL9aG2O6
 XibAjw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakjhjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 00:15:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-47682f9e7b9so72888351cf.2
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 17:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404114; x=1747008914;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzjD6W4PVhu5bnBRA6TwITh0IKW78wTDC6QACU3Fu6Y=;
 b=mroLFPC9A6o2r52Cq+5xlpwVh2vkjxNcGf7faVPlJWPYvoJnqlbcUvUPNmxGpinuoF
 mg/WrMLKt+ZTeNlHfBUAoytSmHJG1tYapjOST0pQZndmD40cWhrv/sFGR6WAnuui7j/J
 FHum3+miXZLwoiGHlxcbBDqJb5Xj7QsyFy4ZsuQwEkHzgU1220mgT2M1kpqgi45Q+LN1
 nHdI/EnM/mUAA8N1l4iY+kNINAn3EJCe6e6Y5cfHdY4Yg7dL/UrpmgWTfF8cTkM9wUHn
 vGhhiUjDF04qAY5u3UWsd6sItM050Iy/1Ut7HC0+p0TBHCWkkAPdsJVBxTCnzOMbvgvk
 /lmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAzSx0uv33EOgFlr/TnPfYbMoPZmbOg+5yIX762T88wiyZ9ClBJe34p4oYu3vlBNsthwBiQHNpCcE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYVGocvN+bwyvX8ohce963K52B1Dr5oF3GOnANyaz2O5RxCvl3
 Cx6wcsh9/WVQJF1LHBTJk5bJaNzLEHHC/KvCeG8fGJyJor8S7vMJe66tMYpdoQYixMlWPL7XmsJ
 zxDvOgloMHcg80wy28lgLUMQrmvjEyujUb9pRTzgD1KCDWzTR+TkT3GjWQZoc4kbDfz0=
X-Gm-Gg: ASbGncuowwYKXnam8sgvLdIGtEMtH+SyunByI0xPJI/I0xDoSvWAF8CA81++Gs02q7A
 sV0IC6f/zMsAwuKyEguEXPUzs/98XzRrxeea9Aj/N64nTPZ7VZFvC8gHuRSMiOQs7+h7SZ2AFhj
 qNYeqR4r+x3elvP3JF5wFTGWVYkAJpfbYg+4CX9O2CY5+INIwUyDQMsiZFlvJauuiofpFrKY5A1
 nwq79+ebETu9bVVWaCCwInFpNU/HSqAp3Gg7nNWBHvOQZ0UtIKNRBMID+MdsyqbcfJh9vVgdD6t
 eW15bL5PJ66w4Y2jE8dxjQ+rmtk6oNRhpjxOj5UOzlogI/4+5+2FxcpmTU2xTNdCy/Yv1qgirRe
 nPX8G/EJa4kTt/4/Erqcg/bIp
X-Received: by 2002:a05:622a:490:b0:476:a895:7e87 with SMTP id
 d75a77b69052e-48e01552e3dmr83379021cf.48.1746404113769; 
 Sun, 04 May 2025 17:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjy4BDq/ngBUylfvyk62dWRjQlZU6LHc8tgPXKTj0ZxRujx94ZtnGHTZ4N/Ax9Z0ejvKtJ3w==
X-Received: by 2002:a05:622a:490:b0:476:a895:7e87 with SMTP id
 d75a77b69052e-48e01552e3dmr83378621cf.48.1746404113439; 
 Sun, 04 May 2025 17:15:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:51 +0300
Subject: [PATCH v5 07/13] drm/msm/hdmi: switch to pm_runtime_resume_and_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-7-48541f76318c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+KLC0hKahtw/rbBVi8TNRT2LZxqudcybFb57eB3iUWw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL8TRmPzNRqLG+vuhB2OEaPuUfxiYybPe2DY
 iYf3qhPCjqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1XvzB/9S+1ACKUPSypEkRCWGDaqh9SspuUlnqat6JuNHZy0JmdmQyysnZprtX8J5FnlMWKfkSFg
 vkTXQbQ56FkcctwjfGdlhRDd3FnrRMd7S0xJGxu8ayZhKKz42fOr5eanjXTpu2hHoAQQyCv93tL
 2AD9FDzMWrYekF6U+KrooN1wXnjeaixp/nE4xl3Nsvn5l2IIGr1HlFClIkMbgcuUisOkODon2OB
 82+rZQDq4qkSb4dSHILyWcPOx8ThWXkk0d1u5ylyJSzB/Zx8nYn+hjj5CGcwUr16gM1YnruIi4E
 Et9ns3K0HrLR30SEUYGkS7S6+Np/5LAV25eMUCniYw5NYryT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX72EjdZqOw0Kd
 ahZYwAHzg3YF13nZm1oztDpjf9ie/gGI7blEibVcOt/tXZDdXrx3KlVd2ZogATZe0Q0quvDhDMa
 JcOhoaAx46UKOBhQjt5u3UlccTwo6R/gYSjn9bbW7PWj6og0OPCg1KPC5MoVYUK4Am3EPVg3WAD
 eqpLf4+exsgC9iRjolWVo+kIpvlDnWo0ehosSw3bydAdRc9Kwhz76z0nOjT67GkjcF9z87ArRn0
 31H/2FUHNnjOm5oAM0cNjCnngBHe6cq7tSE+UmJvd8F2vOW7BiTTIaata7aWvrJLmcnzeJDfNbn
 WLB2cPRtvzpvF22yX/l1NzPsEDSgpQMHE/zhOUz69JRHElsFSGnhLOwmFjGDLLhHKObEI9rZdUo
 cGXRVS50JIJR8B8+3TJ1gV9eTu3q55Q3nArKsobGIszXW7zQk0R1Cw4EG3vo8ZHMAAwbKDPg
X-Proofpoint-ORIG-GUID: jDqF8u_STcz5iOgHp6TgS2uRGVOXUBXw
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=68180313 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=-J1M-BTCRiek0Q83fKAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jDqF8u_STcz5iOgHp6TgS2uRGVOXUBXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050000
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

The pm_runtime_get_sync() function is a bad choise for runtime power
management. Switch HDMI driver to pm_runtime_resume_and_get() and add
proper error handling, while we are at it.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |  6 +++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index e7997e4a741c3b27c9086651efe6b79dbba6bf88..3ae305e868a5931a8982e261f518cd8134d559cc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -21,7 +21,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
 	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index e253c1408dd1c6dcd7e94506f0b8edcfd4a9a159..d77c68914c5f525cf12971c1058b1abc33792b24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -85,7 +85,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		goto fail;
+	}
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto fail;
@@ -178,7 +183,10 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	u32 hpd_int_status = 0;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		goto out;
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 03120c54ced686dcd2ddfe809dd9c9011f608235..667573f1db7c6bfef6c75828b5c581c147a86d0d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -58,7 +58,11 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
 	struct device *dev = &phy->pdev->dev;
 	int i, ret = 0;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		return ret;
+	}
 
 	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
 	if (ret) {

-- 
2.39.5


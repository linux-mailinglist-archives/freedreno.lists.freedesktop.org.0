Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EB7AA8A30
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 02:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C3610E2CC;
	Mon,  5 May 2025 00:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJVHk4qT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6183510E236
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 00:15:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NlpiT020953
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 00:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jajSFMr5lYMffK+9G2gWOOh1EauR/2XrX+fSYkHoXAE=; b=NJVHk4qTFVxyiCln
 EM7Ecp2Z0yhoTyZtUQcHJvnH2FP2DDa4etXsMlATuGxd+ikHccAgGkJTIR4E0ctE
 L0ctV6InLfJ6Rv8RIZyCSHTSQd7WzU1S1wwHPP7aPlgzmUpJQeyLivW55Rk7E63a
 aXlRJQmdG7/ZcdDkP/gzb348yK6MKK/R36qjetRArP+yqdz9alx+B54jXrrRINPG
 bi4JFXYPKLaiBR0uIXluuqB3paygxpttZso0N/NJiwJ3Cmxs0wh0eSPF3Zstb5a1
 PR7+XkWQ5Q7JehnlRb+c+fUAUikp4BpHIjYmKtDgqDLxmW3mqc0RLzyHQ/Rgy0Lk
 BD00PA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakjhkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 00:15:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5d608e703so737734885a.3
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 17:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404122; x=1747008922;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jajSFMr5lYMffK+9G2gWOOh1EauR/2XrX+fSYkHoXAE=;
 b=JOn2dh3jVFXhPl12uRMyER58ZONSg7gxQuGtGK5s5WdTM9T5K/IBXNZQEsdD9i6fmW
 F7Mt0+HHy3ktsJiMaK7oBHumyFm5GNGcMc8XbaFBTrXy8tSW3ZoJMs69Q3UwJzthlkmk
 j2eml5Jtss/+niCdvYIceBdeDKXdDtWT10bWbA4mBQO7joBxyW8K0W8bQ96P8840TI93
 F4URAjTOARmJQBl+4Y6gK3ven4xBpGvfwHfSTe5dK2mFpQ2s6oesNIRoYXK2kfRcVr01
 263KcYHauUnNGropVai3qZh/Ey+5jdpR/Ul3boB9EvTaEaCyi/d/AawS82RqUNhPws73
 Ssew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEKy/WSo88+VHSqXKgIUGoSWrGbfjg4tzEsaJJikb+erN42C6iyYOR1HDbNQDMMxEbxYQffX8kGFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWB3/nqIIpS0+7NdKtfVQqQSpUObyhct7mmopFJ/QmFNL8Z44P
 TZTyiCqhfl+Wzh2UO5iCmnjpjdt6tcW+AY3o1xj5SeUgPTHB7Kr72yVIUZBxz9o6Bhsuzb7uAYZ
 imzqMn6l9qqI3G1yCaHjPWpOfapEuJKpbtc8YtBPdY6HgFQ2Ef6ox0cWdM9J/NFwFmWQ=
X-Gm-Gg: ASbGncuwlXS1zPP1jewNNG+EzHKGDX08vIyfXJSC8JxNKppk2GKV966j1SHZ4ksqaqj
 nwsSSF7av1qsj+intiprmOQs4VtzJYG0hCJH8gv1u9IpsFxUIb3RyEf1rF+jOcZQk4GwxSpiAHM
 rzDg0U3ZUjnpR7N4KJDvpug4+qax/+EIqF0miIcEFH3Gjn6ZfknuqgXMjxGajWZfyyC3jS4hk/S
 3UQ/qti4AkgZILnHj/h8ADnNA21AUQyEbjZL3Ri59TLYUo/TxCd8GOroyBLuApYyF7+aUdHPTyy
 GMyA02Tg03e62M27xxrOZgFrbTMEjeWsRabAfId7Uhfe/HDq+sp/Ijj5ENr1djVHyQ4VnhzthVX
 0b3UHdC6XSXsgjLsiysNujqWR
X-Received: by 2002:a05:620a:244c:b0:7c7:b5e1:4e45 with SMTP id
 af79cd13be357-7cae3a8944cmr668303785a.9.1746404122575; 
 Sun, 04 May 2025 17:15:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHfQd4fdpXw2cyT7Pt13a3SfvjKp9b+b5JPOEFBwoYuX3US9TJSLCx2Mkjm87vAk3BLxuWHw==
X-Received: by 2002:a05:620a:244c:b0:7c7:b5e1:4e45 with SMTP id
 af79cd13be357-7cae3a8944cmr668300985a.9.1746404122233; 
 Sun, 04 May 2025 17:15:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:54 +0300
Subject: [PATCH v5 10/13] drm/msm/hdmi: rename hpd_clks to pwr_clks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-10-48541f76318c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4084;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+WpYll0ay0xnF4O7o5nyBXY9cEIfu8gX+WDGXWRK1Mc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL85+RFzHM4YW1ldHLSewJCste9D6pvpiH4n
 5xqiI3GQSGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1bfbB/43PPjrEo0fZiqjfyPKdV/fFRD0T1cm2kWrnY4MjGNPPCrcuHruIMnGeY6iVLXiqEepty1
 ZtAlbR6vbvGcNZcCw+qfBvRYP54xITkPSVDU+O3mTXaO3zBu3cNaBXE4ZkUurvvBbMI90kIC+5d
 7e2Pwj7AxIpS6gvWe4emxps0737rHt1k0NMB49iR0yki8RetQ4KpxJsitfymSZ7xyir+m1kt7pN
 90vTKvqo2y9IzfCeGw5fNa/Sd+vUsqHweUwFRlTtpG7j24czau8dS8xKs8KH3ggDyoB5ZvFtgn1
 /D2zKJ788jbDu5LEhWBdwoaQi66btF5XMGm66pOWOPopxY1W
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX6h4eUcX/DG+y
 SG5/nZjjqPjovDHO1sAV/ZZKLKKZBqXh9rwudE3IGjowigYhWcVW795uHLK/YhWOOp0G+Q+XL51
 M4kvgbWSA1QOLzij0J7CYWm6vrgWBc3Q6zs/u6iM6keRzKS9iaFXN322Iz/7Hxu+5+o4w3gRB3i
 YzvjNAPFKa4v9+wIDiENYNJ0kCxWg6egjlp0+kQz4a7uocQg6Wvv7Jai0oUm/lYes9Uc3venv2A
 C5gmQN1495MvvR23jeAgaqfWqVZBtESdsq/+FsZ+ZH+R9ZQOjzoJURkwkU4au+/TeR7KXK0Syjg
 hOaZl0WKgD9H7S97PeoGGMfUy7qAt8kKa/ZoZXDSoA95njvjN82eZe3aeLnt+NPdlYKPHnosAxP
 HrS6nidBzglSfyHLitF+v2IhPS3JWwJbz4pLvtJ3qTu7MOqMt5yN/e1LYX+DM9MoXFLxNLW0
X-Proofpoint-ORIG-GUID: 5RxqkrduPBnl0N8juxqNUxAlDvlHAjXr
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6818031b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=5NGqCyE2FtwQWQBj1xQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5RxqkrduPBnl0N8juxqNUxAlDvlHAjXr
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

As these clocks are now used in the runtime PM callbacks, they have no
connection to 'HPD'. Rename corresponding fields to follow clocks
purpose, to power up the HDMI controller.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 26 +++++++++++++-------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  6 +++---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ded20176aa805db98b0599e617eb6ea9bce122d8..8e6e3e6a04bd2d86bcbd23c110f3533f56c17887 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -226,19 +226,19 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
 static const char * const pwr_reg_names_8960[] = {"core-vdda"};
-static const char * const hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char * const pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(hpd_clk, 8960),
+		HDMI_CFG(pwr_clk, 8960),
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static const char * const pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
+		HDMI_CFG(pwr_clk, 8x74),
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
@@ -333,17 +333,17 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
 
-	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
-				      config->hpd_clk_cnt,
-				      sizeof(hdmi->hpd_clks[0]),
+	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
+				      config->pwr_clk_cnt,
+				      sizeof(hdmi->pwr_clks[0]),
 				      GFP_KERNEL);
-	if (!hdmi->hpd_clks)
+	if (!hdmi->pwr_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++)
-		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
+	for (i = 0; i < config->pwr_clk_cnt; i++)
+		hdmi->pwr_clks[i].id = config->pwr_clk_names[i];
 
-	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = devm_clk_bulk_get(&pdev->dev, config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		return ret;
 
@@ -401,7 +401,7 @@ static int msm_hdmi_runtime_suspend(struct device *dev)
 	struct hdmi *hdmi = dev_get_drvdata(dev);
 	const struct hdmi_platform_config *config = hdmi->config;
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+	clk_bulk_disable_unprepare(config->pwr_clk_cnt, hdmi->pwr_clks);
 
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -424,7 +424,7 @@ static int msm_hdmi_runtime_resume(struct device *dev)
 	if (ret)
 		goto fail;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = clk_bulk_prepare_enable(config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 7e3c035cf913d713ed63379a843897fad96b23ab..a28437beb1574553c1dc00a0c693b390389353e0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -48,7 +48,7 @@ struct hdmi {
 	phys_addr_t mmio_phy_addr;
 
 	struct regulator_bulk_data *pwr_regs;
-	struct clk_bulk_data *hpd_clks;
+	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
@@ -87,8 +87,8 @@ struct hdmi_platform_config {
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char * const *hpd_clk_names;
-	int hpd_clk_cnt;
+	const char * const *pwr_clk_names;
+	int pwr_clk_cnt;
 };
 
 struct hdmi_bridge {

-- 
2.39.5


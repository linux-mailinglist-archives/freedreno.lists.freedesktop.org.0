Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D70EAA8A23
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 02:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E89C10E1BF;
	Mon,  5 May 2025 00:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn23ySEZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF6710E1B2
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 00:15:12 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MvNMH031719
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 00:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X5c1T2okNkBRPy3LP55P7/c8OhgWI8CTU4FhNq9qA4o=; b=mn23ySEZ/pXl19HG
 +7YA8VJNFSYz7kXn9vsxvpHYPUpm6e+g0diYAoj0YCUR6XTbKEZu8dWBs8cOu0q5
 wmc1yXobvHKpopc6dBau5/0IZY6pj/m+h4RVigbZ7qmug6GuyCzMNsOPy34rfCOe
 KRO/ER1QoyknRcIohyzH4QlZ8nIaoV+z5FuYmAyhehzS0+FxVwRmG5Ahenx34lVO
 ki+HwOsBUF4uPU7kRzdUCMkPazignGzzdGkEvaqXnCgLUKnB8ybi3E6a+SvbquJ2
 M/5MykGZv+bhx0eo7vOgAXf+gLHuIoOmR+/wAV0xYbyOC6thOHwY7HaNHngN8fVT
 t7n7NQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakjhjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 00:15:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c760637fe5so104673085a.0
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 17:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404110; x=1747008910;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X5c1T2okNkBRPy3LP55P7/c8OhgWI8CTU4FhNq9qA4o=;
 b=GrHwrreRVo4BsRtJuAFdoV/C7sujDZkLggowcO6XnLMg6Q7Km0+5NNPnmCxBB6TvLv
 mDYwG7bVrpmmc0qcpBjc2gU7CIXHqC2f7NRX//w4mRgQDV4vAuXhn7N4W+X43mB29Tb0
 RIswEJIDfFLTyQVB/FbePV5qa3DMV5y+Q9XpiTM4c++BC8S4ZfKnyKwE6qtlqKpGgzP5
 rHYgVKWpRjc+N0ynUeEQD0l3csg8mVnU4Sk8o1xquFKMHXozCpD5W//X2dziTDoAYJ2B
 Sz/DWCInUwlCkVPDGNIpEFIL+oYOs5g7AfSusrjp+y8efXmb8TmIvJWIkFELyXX6/bsz
 xhuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXImN0AHX0HT3s6ig2zI0PXOqunGGRyc1k9pqzvYBCDOwUrnqhopVAesTVy/CjLpzl8DPsHeybuIYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzikJPZEtqSrjkpLDuBupxHVGahKobALyyAn9v628tHETLio9DR
 ozUDTqMIf2o58Y/FaF/ETKTTXc2NhEr9oQP9rtuaxUx+ZsYFna1+O9WKGlnnIGOVQzZl/C3h233
 gLe0RoQm/mzy6MxO1LJvDzw+UpevwCNhKW2jZpqlKhJvqxxZhN30JlGpcT4TmY8F8h/c=
X-Gm-Gg: ASbGncu83qDNBKSL4Al/161Q+S4It21yycQBY/br+Sa8B8x+h5snKXqtytL48x7kaug
 Ze8xUBKWSPFHe7oO3A9BodCsSPizu+P1Th/NOcW5T258CXcBOm49eVpebEmXD4tOhsrDqzRbdMb
 KtyKpSJOqH4eVpFggpr7cjwakM9nKDhIMw+wHwzWoQQJ0mY3I4GnOVFxpazEO3XRb+f4ypBaX+W
 t+5X/UuH5wdFHLIDlknWZuIhQ6uf/QzopNhwW5iKcUy25qyIA81jWTs5bQCNLCX/9gsKnSC0mOb
 HL1HeNJbNXrZ/+4IqHgBwlIv6tvDPBBN/pA6Ux9yYbzvAUq9shpJkg7RbUtaUbIsyjRSGJInTe2
 heBVMMr6++9CgeS+4HO+ZbNJt
X-Received: by 2002:a05:620a:190e:b0:7ca:cd43:e46e with SMTP id
 af79cd13be357-7cadfea82a1mr1176852885a.36.1746404110477; 
 Sun, 04 May 2025 17:15:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQhfFbqpZslO2eWr4LyRzSnWS8Njh66IBcHVpnb9J96WelvVwOaL7E7JvQ4d0L3KLXii73DA==
X-Received: by 2002:a05:620a:190e:b0:7ca:cd43:e46e with SMTP id
 af79cd13be357-7cadfea82a1mr1176849985a.36.1746404110144; 
 Sun, 04 May 2025 17:15:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:49 +0300
Subject: [PATCH v5 05/13] drm/msm/hdmi: drop clock frequency assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-5-48541f76318c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2616;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WW4ls3rpXG1GIIqJFaRsd5YlkFmkvDhOcZwn0x64Row=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL82x04Ldn8u0VpFSsk00EMCwD9Pm1yAeD5b
 ys5oLHbZ7uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1WmsB/sHPPAf9NychOLipLaNxz2HhgodbrgZJWqKAWrZjaD1lVAT7NmeDWPl9qIV1saOMtOU5lr
 wVowfYQ399VVJQq2/C26DQKbVs8j4NxaEOJNTfJbOnoWc/6OlCBe01vp28OrqdjzDnp+vPPJln4
 JYK7wO+dvBtHfERYjMhTyUKsBzR8G/GReWfTdL9oug+KvOcMytfwahFaxQXH5UJo16spstBcpiW
 5xVK8bJgepjs8phsyTDqNNta2we+VYBqxdJd7BArrtlYmmdCQC+HPJVzuf3Myr4rMQrVmDNtj6A
 9CC+Cv8ORrYXG2FbKrevADexNzYZvs3VBeEbuYf1gDkC6n7m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX/xFnA9FAHQ/X
 kMmVIEKnJpJuSzJ9T/DShbOJjTXReizz8/xQL7r9ecsy5mq2/Ww+Bg6qHgfktn/kugwwkEI6gUV
 kE68nYNJjENzUNa3KukQsH7rzRxuilRN8LOEeNqI0cIsiQ8Ke8HCdsD16ae3Mi6UaKQVsggW8Qt
 0M5NXQ6o9miCXhOQKD4pQVud7/+O6IuWhcOOwM8pIcDJiM1OqW7mLMRKBTH64os8RkhvOi7x3tH
 wliFteQgMr+qo84TpCLOAAJC6u2ls0Sldu/L44xNG23b47m+I6cLlwCcun1ufkaAMutkZOXWEub
 I8broxf18Lb6kOVyOyIFF3reqHy9bznImgEZTdwp/wF1QuXQ46wg83uRiqLCIlBpLYJEATsoqvh
 L/ViOZEwUnj/vEby+VJbKGHvhmD6q+Go+xWRs6j+RWpCSr5onutC+rMtrxXdK5/1ULU5Co/p
X-Proofpoint-ORIG-GUID: F-uya2ESWz0CxJOtVxpwkKNxpPtVefU-
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6818030f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=F7atGr4GHeWUWaFcoCIA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: F-uya2ESWz0CxJOtVxpwkKNxpPtVefU-
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

The only clock which has frequency being set through hpd_freqs is the
"core" aka MDSS_HDMI_CLK clock. It always has the specified frequency,
so we can drop corresponding clk_set_rate() call together with the
hpd_freq infrastructure.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 2 --
 drivers/gpu/drm/msm/hdmi/hdmi.h     | 1 -
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 9 ---------
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 104f9cefa14834d04fb957eb48777e605d1e29a5..6f09920c58190a9c195de0407e4c2dcc3d58b30f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -234,12 +234,10 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 3314bb8a09d6bea7e34ad9050970bf43c64d1558..e93d49d9e86936cb6c1f852a958398de2e134ad4 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -93,7 +93,6 @@ struct hdmi_platform_config {
 
 	/* clks that need to be on for hpd: */
 	const char * const *hpd_clk_names;
-	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 9ce0ffa3541795a076b433566a3cafe156120b15..7ae69b14e953f0ee6deea8a216bfa9d3616b09af 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -68,15 +68,6 @@ static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
 
 	if (enable) {
 		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			if (config->hpd_freq && config->hpd_freq[i]) {
-				ret = clk_set_rate(hdmi->hpd_clks[i],
-						   config->hpd_freq[i]);
-				if (ret)
-					dev_warn(dev,
-						 "failed to set clk %s (%d)\n",
-						 config->hpd_clk_names[i], ret);
-			}
-
 			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
 			if (ret) {
 				DRM_DEV_ERROR(dev,

-- 
2.39.5


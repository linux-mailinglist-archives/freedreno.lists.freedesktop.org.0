Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C57B34313
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA1910E4C5;
	Mon, 25 Aug 2025 14:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0JUGXEJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC46810E4C0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8EIY0001167
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 huRxjuGSYoNfgxEXLoAk2rOpoM2exNn/wvkUX2Zgx7o=; b=I0JUGXEJpQRR8ehU
 vKNTgl4YpCdca2oUs9JoldUj/Uj0KF4HyBjxQcM8CEsDG78N8EMbfV2Ykl+vgw9B
 Uvs0t3larPvHrtzAGAonngGKDnmuz4lV2BYGEQXQo5U/WTQN0uiRVHnnYYLUYWO/
 BEa3s2zORQ0H/6B1/yogatS1JXwwWwAJJQX7V+/pdRuME50YB7E7hhxGFauIMoHv
 VWU0mk9BGNMG0S9b+vtMvldIV9zb226vT85kefbRwXdLP0EkJ/K4EG/yfOJvLnIq
 NzD2ShE0dEs1kQ1Twzsyr44FplQCVRpdO3WCKVnW4jWZ+LEZaI+Rk6Y8cuwH7EBJ
 Zk55/w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdw85t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-771ed4a81beso466431b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131479; x=1756736279;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=huRxjuGSYoNfgxEXLoAk2rOpoM2exNn/wvkUX2Zgx7o=;
 b=XMImi5d0eASvCI8ggIg+SwmDIbjUNuKP/2hM7k5NlWHny/sHrSeVFFXkXpoR7o5+cx
 sgipwfNR65Hv7rp52gIvUOXbqIP7zXIzZJZUVEtah13R7mYuzdtp5EX4cri83/uT0TZ4
 b3J3UdJAOKTNDWG7oSacsTw5qO8spDnvT5yjJxGcBAw1zdSA5M7P+Hnv/6EiSKIyRkP1
 vAOu2ASY0Mpm+mwb2+Po6/F2SNoMbLU5HXWlRk3lYfqqBv2xYZOkI7Q78Zgcl1GFruGH
 2/5lqCY6JKU/wpuR7ZhKGz68mVzQU4Oik/WZJL72LEbJ4VWuRCUGze34kXdurtwnQvr4
 9tSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ31/DTjskhW83korFXBa9aKo81tGpRv4jVBVg0julJ8UPPe3TWlYrL5AbInev8U3MHYz0ybCMrTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzsv6KLfquebY2vewe5LXCjb4XBhr4cRYih6ZDiH/QVIa5t83pY
 r1gpYy489uPgIhf0tix7M7QeRV4ZzLo9qAc0bD8NyJgn0fUcJT6MYhZ9QYTIvntkhd722pzeeus
 /QG9SvzOJ0KiDEaNgRjnbtLZTon7OTtFH63nXI1NwXrqiZaiEI0qtc0EL02zPMv0isulkKnI=
X-Gm-Gg: ASbGncuzxlCV2udlT9QEspV7CYLD3K+BP2WixcM4NOF692SgjIhih4wo8vGiVRKHGcM
 rso13mTrW49VqIv8f+ImUHYAhKga43dRs8ijClNacOCRJ9B5983N1coP3ipux6tMVbCsoFCz8cM
 i3WwcQmCkfZAf6CEHG+3ObWTPo2bVW2Djb5eqkxGwPDLbkpVVctOcZexjyfUzCTtjg10qcWENrB
 wbss/L8RL4ghhDlM5bk+tacyfUNRT9vBLlI8EY2ZwFu6IbTuOSais17CVyJhUwvKm69Yol75cKX
 s8ULHLC0wBiO1nLqSzdTYgPeDDji9aFNthEfM8oFdaGF35wE5yX1/hSO/Qh1TyDCP0CdaxQ=
X-Received: by 2002:a05:6a00:2d0c:b0:771:f393:ceb3 with SMTP id
 d2e1a72fcca58-771f3a31abcmr437969b3a.16.1756131479128; 
 Mon, 25 Aug 2025 07:17:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJsOmXNhwX63on0xU1DsYN40lgyzw/dL6vS5YmZaJ0hGEF583+eIJJtoP+AY+QPELB5iH5BA==
X-Received: by 2002:a05:6a00:2d0c:b0:771:f393:ceb3 with SMTP id
 d2e1a72fcca58-771f3a31abcmr437920b3a.16.1756131478463; 
 Mon, 25 Aug 2025 07:17:58 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:58 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:58 +0800
Subject: [PATCH v3 12/38] drm/msm/dp: introduce max_streams for DP
 controller MST support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131420; l=3160;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jNotEQRdopUDHm8VHZLe0hqvZPdErfXQINvaMylJ1eg=;
 b=rRhkZu50pV6fu1EpF+zr7aOXaRqpdTaOjqvGJlU98YLkjtreL9dZYLPEkr16xi3E02djQZTDJ
 MLevMFHugj0CA8wGPhfesX1gt+mrDMhAMCPiBR97aVU4iuzv0vLqix7
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: P8joLxw1DsCayooyH0owZIjtxap4R8Cx
X-Proofpoint-ORIG-GUID: P8joLxw1DsCayooyH0owZIjtxap4R8Cx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXzkqR8ymLe4NB
 vncOqD24fyO7emSSw8gIhm1c7yRFoappVboDAt/lD3XVT437UdD1eqApMYzrly1pe2oVJGyxrqQ
 QlcigogDYpdyQov5b+5GqEshO8WklWx/vCEp9IfLMMifXTWyWUu6ROaXrcCAD0a13XsrixQ0psN
 wy5znLyBGpEm13lYq+3IUMttNcBRqP8lBLTVW200pky4IuNMruTf1MSyZs+Jowc9VHTzuTOwzGD
 0Lgh/brKHji4CMBUbKxQUOZXpDByzkOqKS7wM0EhrLXPJ54kvXVvRJNBsAaLoL0++4mc5wKdDz0
 GOlgDcJkJUcwLHlSsz1eSndOi8446gCacmYl/WLQ0zHUQppJ8OitrDyzHAum1r9Q0WdDKOxMY+O
 gkV7O51X
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ac7098 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=H3QdGSpFPA7PV-mxWtkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Introduce the `mst_streams` field in each DP controller descriptor to
specify the number of supported MST streams. Most platforms support 2 or
4 MST streams, while platforms without MST support default to a single
stream (`DEFAULT_STREAM_COUNT = 1`).

This change also accounts for platforms with asymmetric stream support,
e.g., DP0 supporting 4 streams and DP1 supporting 2.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 78d932bceb581ee54116926506b1025bd159108f..a8477a0a180137f15cbb1401c3964636aa32626c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -33,6 +33,7 @@ module_param(psr_enabled, bool, 0);
 MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
 
 #define HPD_STRING_SIZE 30
+#define DEFAULT_STREAM_COUNT 1
 
 enum {
 	ISR_DISCONNECTED,
@@ -52,6 +53,7 @@ struct msm_dp_display_private {
 	bool core_initialized;
 	bool phy_initialized;
 	bool audio_supported;
+	bool mst_supported;
 
 	struct drm_device *drm_dev;
 
@@ -84,12 +86,15 @@ struct msm_dp_display_private {
 
 	void __iomem *p0_base;
 	size_t p0_len;
+
+	int max_stream;
 };
 
 struct msm_dp_desc {
 	phys_addr_t io_start;
 	unsigned int id;
 	bool wide_bus_supported;
+	int mst_streams;
 };
 
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
@@ -1213,6 +1218,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 	return 0;
 }
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return dp->max_stream;
+}
+
 static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1239,6 +1253,13 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 	dp->msm_dp_display.is_edp =
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 	dp->hpd_isr_status = 0;
+	dp->max_stream = DEFAULT_STREAM_COUNT;
+	dp->mst_supported = FALSE;
+
+	if (desc->mst_streams > DEFAULT_STREAM_COUNT) {
+		dp->max_stream = desc->mst_streams;
+		dp->mst_supported = TRUE;
+	}
 
 	rc = msm_dp_display_get_io(dp);
 	if (rc)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 37c6e87db90ce951274cdae61f26d76dc9ef3840..7727cf325a89b4892d2370a5616c4fa76fc88485 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -29,6 +29,7 @@ struct msm_dp {
 	bool psr_supported;
 };
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
 bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);

-- 
2.34.1


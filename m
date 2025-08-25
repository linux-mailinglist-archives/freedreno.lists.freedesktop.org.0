Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6849B3434E
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F00C10E4CA;
	Mon, 25 Aug 2025 14:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxc+lxbv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3767010E4DD
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:37 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8wH5M026320
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6MDHF6EGijp0sPM6TWeUG/trV7o7p3CC/iRMxM6EfKQ=; b=jxc+lxbvGnnOiVpl
 HuYN4LgAYuKfAFeT2G8/S7hQI+3ySUvYBUywsrpgqNQk5AIpHG4DwChjM+xZ9FMI
 Fc5yGkuWw0ibwF8gkI6o2OPwF90g4/yLzhjtYp3JrqEVjRktKeiiexckCBhWJuC2
 7j5QtzqV7wM2ft19XhFn9OP1aMPHOppT+/rsNT/xhPC3GsN1ueT0/uPtTzaGMS6L
 TqBE79H5avrKjOG/3PSmoc/oO4MVEaPAIfNmtO4GHFckxh4YfG7hah/ogywGlusm
 4rnEtruKhdNQwpcq+zqVaJLQoXjEPwfmhDCmOla6RwTK2IPrBGcB2Tv/r2nOBZda
 kyNn9Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de5dx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e55665b05so3882489b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131576; x=1756736376;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6MDHF6EGijp0sPM6TWeUG/trV7o7p3CC/iRMxM6EfKQ=;
 b=Gj3EJPMb/ZcwTSzNj/Zpfciscv+0AD5ER6i6aCKuCFPU/q+bx0ZKAfvqxrr0jpE1rS
 eJtGFOStsTDUAeAJkRszBLHDdNi7ou8CuHmjS+UMcluUh6Mymniq35kdo9+FAnDGqkIO
 WFffSTOJiuLnOGEzYCyZVfbCr4Sm/I+t/h5GAmpDLXnDAzAK7iTohlwpqwuLvA2nX4FV
 XE2tcs1VAqedOeK3S3teJqBeQBTQYMqqN+lqQysV1GT+y5Z9hm7Ibpugepzf3xGGl6LS
 y6Pex9yAHqRsVdVxlOf6ATlFgVwAKRIf8cEwhgwFe1NUiUF+3yMMYRU51ZILZYAT9vKB
 9sbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWyM5XaJs44XLslUVgEY73H1Gk2pDvLZLJ9kbWBKmU57kPD4Z0wg8pEY0hhcisgSJVhPvdmzAxKu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBM9BsgsMq9q2OFPY5fB3m77mUGC8gFhWzXpa1YN33iVV1maSa
 hu37TYUG31Opy6zuixPeJQAZwL7TW0NC/kRpgl4uZiEgVjtVW6nPygPVQpvwYlHdamuo77VlWQA
 WXQOST5YO+k8cyrIk0MdwGk1Pu7ERQ7sf4wy8cytgR7FJTY2OOJDa1U869CTXxfX8N+6UCZM=
X-Gm-Gg: ASbGncsPQ5Svxv796q05jet0MuPjB4IIOJIAojLiXAJWxQhctoTkopw14uL/nJNymoX
 mhTJWElFHTuZ+UGqCXRafwFtg4L+u24u2oRd/LlPHsLlWKkM29NyJlv0MJXU/zIXOBcl3tszPOk
 86DQInI26lX78lh+M74S1CgeeAnjYAkgQ1nWTELndVjnP3+l7f5C2xTn0jJsb10HoeLfJ1IzERq
 XjfEVWVU1sd1Z7U2g2jeof1OGsOJnrdokGrt6bPTpRjlzbJoL1NvFGMRRX7ZA16aWdk1vWou/Zw
 gQ4moOiCf/u5DeHi/sNN/WySA5h+akvubRFZGBrPU/9OVKPbKOxhHxnX5GwS0NWxg4xwxAI=
X-Received: by 2002:a05:6a00:2e21:b0:771:e8fd:a817 with SMTP id
 d2e1a72fcca58-771e8fdabcamr3409682b3a.14.1756131575799; 
 Mon, 25 Aug 2025 07:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpW6CmWEIQgWCszUSOnMtZ7sW9kbTpGqPkyb0wn89KFA51RGSTymdfLHBWqN+kzflAOfyMuQ==
X-Received: by 2002:a05:6a00:2e21:b0:771:e8fd:a817 with SMTP id
 d2e1a72fcca58-771e8fdabcamr3409634b3a.14.1756131575307; 
 Mon, 25 Aug 2025 07:19:35 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:35 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:21 +0800
Subject: [PATCH v3 35/38] drm/msm/dp: initialize dp_mst module for each DP
 MST controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-35-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131424; l=3071;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=C+Go3XquSNn2zh7+j/6tFb34Ivx9VwVNL72WyLqa7OU=;
 b=KljTiOHp3LZXWwkE/6kAiOgOMb9Onx0q0Af2bhmvZWyXdDphfqZwhDjqZYm+TTue559zko5yk
 sKwWYioTEaGD9BKLV3lHWGAw6mqDpoURTwpiWHwagrS1kbtn33gUvfV
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX0R4rnzW05k5B
 4Df3+SOkwPZIqKJiHMF7FnCqCuQIcpSEc9Y++jVuhOrVzSCVaif/uyZTGGWq5Y5ndI9KcduHxg/
 7EYHd8759lnW69WTlvTtdDz2mUqXj6Z8iWPTy1Lj5doH/6/yqCibjSP1e3uHAHgCCAQXWK1n3ip
 8U8bC84dERU4z3z7tTSAjmEugcfZuGT3n0XUm4yfRGNtZ+98RzeUknqr2GNi5+WSMnryQQtGQLv
 dHAGvphc1yV08V2gWsMcLgmsRwd1XgPwXDFZK+nxaGncb2HEDBCxDDBdN5KCYmx/OQ0CPNSt+q0
 PN2eqN/EnlNaBFDUduIOri63i7rV9ej7xdbHxCCyJPoq9h/XMu0NkN1dhMExrSF7DeVdeJr6yCK
 k9abaa/k
X-Proofpoint-ORIG-GUID: VY3gsF-agCx5RGT4ztQU_DFFSizwDpK_
X-Proofpoint-GUID: VY3gsF-agCx5RGT4ztQU_DFFSizwDpK_
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac70f8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=AOHtyAuHbwWPpPzu3RYA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037
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

For each MST capable DP controller, initialize a dp_mst module to
manage its DP MST operations. The DP MST module for each controller
is the central entity to manage its topology related operations as
well as interfacing with the rest of the DP driver.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ++++++
 drivers/gpu/drm/msm/dp/dp_display.c     | 9 +++++++++
 drivers/gpu/drm/msm/msm_drv.h           | 6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0b9d9207f4f69e0d0725ff265c624828b5816a8b..4036d3445946930e635401109ac4720ed2282c2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -681,6 +681,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
 
 		if (stream_cnt > 1) {
+			rc = msm_dp_mst_register(priv->kms->dp[i]);
+			if (rc) {
+				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
+				return rc;
+			}
+
 			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
 				info.stream_id = stream_id;
 				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 909c84a5c97f56138d0d62c5d856d2fd18d36b8c..897ef653b3cea08904bb3595e8ac10fd7fcf811f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1586,6 +1586,15 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
+inline int msm_dp_mst_register(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return msm_dp_mst_init(msm_dp_display, dp->max_stream, dp->aux);
+}
+
 void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3e64ec7b7dbe1d1107e85def9aa80277131f40bf..c46c88cf06598df996a17c23631570fda078b371 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -365,6 +365,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 
 int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
+int msm_dp_mst_register(struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -392,6 +393,11 @@ static inline int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct d
 	return -EINVAL;
 }
 
+static inline int msm_dp_mst_register(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }

-- 
2.34.1


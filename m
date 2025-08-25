Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D771B3430A
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21A010E4C1;
	Mon, 25 Aug 2025 14:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bj3zrLUB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A3310E4BE
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P84vm3030210
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4ZQpVtqMzNy57YEFxSSc+VOVJ/6Kni0tmKKCMTUEH7Q=; b=bj3zrLUBFYMN7pV3
 wy47Ih7DTQvll4qZs1lnzelO5Mul7V4gjrX4Qfin4u2nHCvkhYv4QTa43WC9ipI1
 PW885/v01v1Zpfr4GUixWTk0RSmj8lFzJovVM4pmm+WvUsA/vjE4cFPk6O9UBnRN
 zvXlwUsE2VNzhv4aIn3N/mmvprCUQxNpT9PGq1g5B2+CiZInREjup2FWhtGiNI17
 Sb0CCD/vrNCMhjZpriJnIv8o64nPttynsydz/Fk4iObgCjvhPaTahaRqis0wTycL
 UUycY/QJ8+3wbPgsZrrglsLGiyPokHer3NYxdMq4TJm+hrWG99eED4SK0ZPttnzX
 1PeIDA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de5ddj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e6e71f7c6so4622852b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131466; x=1756736266;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ZQpVtqMzNy57YEFxSSc+VOVJ/6Kni0tmKKCMTUEH7Q=;
 b=WufL77faadBEPryDgU169RlGtLpfvy5F5IqZnE4TYsmnH0zZ8FgDsz7CW3N3WAMplk
 Kve3iihGoRA50cf/pFRz7N4/rl/tAmjH211F7HdAskuZMd+pNOKmFXvpnyWkZgYzRjUi
 Rdqed68HcmEM2Yf1RSaNrnA/VjWrZmJdo7nA/Z2lDljEmlQRXaRIJaxI6bin1fzyJUa6
 qJgK7tmn+/jR4brsaDol09+V+n4bUItovFCCEorfF6sbwg5RK6SU1L7OPSNpuioDBPrt
 PhO6K+mQKN5AKOIHmCQyrwPsVrwcBsTQ0mbP1Fq0NI9XVoVPkpAGUzgFr60I48WqsjTD
 iD3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE1L0AIAi0L2IFHPTFpAXd6Wg+ds9qiop9WsJ7gQCx+u4Iu4S00thumDx6kY/uQS10O5Mzpssbe6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpKwBQPUKJk5i4CTbWaCmzWRWAdXKozhUwarceamtnEJPdwM23
 fKGvl3FNuUxCxNDvHMhfllumLXXsFCmGAhGS6AjnRyjmcehmGZ3vSbVdgdBo48U5kt/5u5RfuFT
 wsMpwMnMc6UvC6FaXJYjjyNXIBMtuZkAoYjMLHEAPmmZ9HmyBynNNuTjliXzxHf99KUNgbQPCEU
 DK9yI=
X-Gm-Gg: ASbGnctY3ZQFYAijoEBv9aQNK8t08M+UmnEKMzqd3JLs5EfJNd1oLj1NWFCv3bOypC0
 PywH6nLf7BZlPulUBb5NJKYaU49y0F0w9Gnig/IU3gvu3GdyuKQLtTEOiezfHRwKzckJkzt7EIC
 plHXzvixN18ZptV05DDPyduoNZFCTijVbkexSkk/vqw3xaYweqauvFZLRqyJCGVENQMTrbSfbAE
 bWA4AEoTdhksmntKGM5FrbcKfmhOOHPZ0HvBIxxMeit0S6hqKkbK03RuV6muTO2PyjHe36nDtJU
 fLPAvtWRAKKjP6g4yI8GTBgT5pMOfFs/2Y/rmS3ERUPjZucOW7xttekVTgCkqyfqH72f5ns=
X-Received: by 2002:a05:6a00:4095:b0:771:e434:6c80 with SMTP id
 d2e1a72fcca58-771e43485c6mr2974440b3a.11.1756131466416; 
 Mon, 25 Aug 2025 07:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+Jr0mP2nSand5ZXOOfqSwSeW0fpa8FmcZugfpErsaJhDtP/GLcW5jzX9aJVdVBXmre/4Zfg==
X-Received: by 2002:a05:6a00:4095:b0:771:e434:6c80 with SMTP id
 d2e1a72fcca58-771e43485c6mr2974409b3a.11.1756131465935; 
 Mon, 25 Aug 2025 07:17:45 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:45 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:55 +0800
Subject: [PATCH v3 09/38] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-9-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=3961;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=+g0HjmHzCDQXI6sBnIuFR57IMToALs8q5AH6Jj3XDa8=;
 b=P4vXdvybIYIJKpZ9XXDRsTLNqtzIEdT2hbx4huEOozKqnoR71Rvl44rHeXKIwyyOGxpcx3Ixe
 h/wGlldqGggAaekA/Ok4Ctyo1kOMzDAehF4P9xMsAmnAlVYSd58N788
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX2rN6x5NzTkcE
 eHpXeipJY/JNxQqVuLYXTJLwDO/ORVfBV0bqDyfeTsfXB4H7Lj7SK933FvHwenqAyUVvwxgFss6
 ZUMOvh8aV+qT/hB2zW4x2HEaFK++ziScHlJAqN1wWZ5qz+sQyX5+4bazTHrC+u/J8aAsyTtpTC4
 d9mJffCWoOOqDc8Y2c8pRSD11D0chnecqC/zho/Xs4swHdfvib41VR0g289r7LZxbzr5vFYHF8e
 Kwsdvy5P6t1PXNuhYuUBdRoe1cAJ+UypFSn5ZbUuQQ7FUHNg+IHcVPtXxo9yna+TpH8d850YhUZ
 sOsakaX6RqaX4JqwABhOIsYpn+rihqJLiGTCJJXAOGWFTH08kHdzPTOpuB7Ho1Idx3E5nmBfBz3
 Jpkdgpi6
X-Proofpoint-ORIG-GUID: oFs7MPc2rBNvvb9o29gR830WiyEz8Oxd
X-Proofpoint-GUID: oFs7MPc2rBNvvb9o29gR830WiyEz8Oxd
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac708b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=OtQsdMd2eBjxU-v0TgUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
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

Split dp_ctrl_off() into stream and link parts so that for MST
cases we can control the link and pixel parts separately.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 8 ++++----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c0001b93a194821927507028f392877db585fd2c..b25eb2fa2835f660073b5109496ac9f2f4e038d2 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2186,7 +2186,7 @@ static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned l
 	return ret;
 }
 
-static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 
@@ -2214,7 +2214,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
 
 	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
 	if (ret) {
@@ -2595,7 +2596,7 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 			phy, phy->init_count, phy->power_count);
 }
 
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2609,7 +2610,6 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
-	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 78406c757eccf95e82f1a9d4437ebdbbc4f8ea46..6ff3e9d9fa6ff0afa325a7a6f72a15009635f340 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,8 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d07bb40f848e0e13a0fa32aa70ffb1621edca159..c5c502e51b94a6ac4b9a893b43eb88e87a0c0d46 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -784,7 +784,8 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 		/* set dongle to D3 (power off) mode */
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl);
 		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
@@ -792,7 +793,8 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 		 * unplugged interrupt
 		 * dongle unplugged out of DUT
 		 */
-		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl);
 		msm_dp_display_host_phy_exit(dp);
 	}
 

-- 
2.34.1


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF9A999FC
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCA010E26F;
	Wed, 23 Apr 2025 21:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0d6YnPr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5237810E26E
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAMd5G014535
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ChAM2xKxlDkjz0AThAkIyY93M2U2f989jpdxi9wG/O0=; b=b0d6YnPr6hC21lU3
 YqhDq1qbhliZTxwUPQTRHLwpZuoEG60VdLwyi7gXSy1bZIUArCg9tg23A7ZAF3ke
 nzFUghbXzoZX3Am0VhJtY1QXtSTri1slO+PLsH8cY7psgwcR4vN1qDQcAkgpRLWJ
 WKXYY5PrrGrycu1lEF7nF+HRe/vAUerln+X+81Olc6mcuivaU/zht1BPXbdKft3h
 oWK5B/FjSQP2qeTIqXH7C+YlOL0OYIGaL/0QgY0bCMt3vsW+JSZsFfO9EHs8hDf0
 A5BM6XuSg/1ASJjVt2jOlW72urQ6vXdlaQSFbT8zJ3QdEnACdccPggKnTynwcgeH
 rCowLg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0kcvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6ecfbdaaee3so5450156d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442614; x=1746047414;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ChAM2xKxlDkjz0AThAkIyY93M2U2f989jpdxi9wG/O0=;
 b=DegQGShCt3Mv/5MYlPTscOdWCoGKgy0LeLw8wNwBLKqYZmYzVUFK19KJrrZ7Mo440U
 Xez3nQeAPkj7XyN5lstXn10mO5w7EWBTbnDE2/HjPOkHRu2YTi4r0tpHl3890fLlxbeU
 ru2sKLkYlAWalVMOvRdj5vgtRkDM+HaxAcxXO5h9VhVR+TU+p2utnglZslN9/1VFlrNt
 BeZAfL3W+6tjEZKuDQyL8SKIDLRJHtYeNNW7Q/NpdSpRX9QzHIOw9qraUIu61wD+46GY
 1JYoDbqrcwz8wEpAYXdiBLGh5iJxs6aV/sAWAiZXhj3ix+liAo3zlVHmwbOhbC5hHmlj
 hz9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+naipNlWhFisS1x8ch3PCB4LV5LTo3YjCzw/7N1kWI7TlayoRhELdcRaQEMB+TeL7JmXD8WFiPHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAeqsRtbqoiSjxRMkYHxBVnsbqtv4d9qZPuN/9vEnEaJv5ZSma
 ZnJlRzPK2YKzhiC3q+ZLVQ1Ge+NZAAK9DefL50ya98qUorIOHAm4icejJEaQG0BF1thT43esUmd
 RGxw3Gh7mQhuH5o7ygNODHe6zJmCCbHgROt+SCfI5FDAAimRRCQd1nmXhKOk15y5byKQ=
X-Gm-Gg: ASbGncsl4zKSD0t4e+UYPLN53IyfO7IwBc1dViRA2Jx3ZWNMKESUusz7Wous3paVgNg
 PTYIfkcqDeOBWIizqn5tM4GiyaI7gw90yfG3DeO2FLUbhLBO9d7YJGRBi7SyqJNZ91dUkjUahMl
 b7WfroqLHJRyNM137jQP2Pn3eM8HOIpDh9TXbGwDtxuxHDp76E/g6hUZMGBk0HGxHQsOjKQb2b6
 Crw0f4vNqXbG7bFcmVUWQD96WmvPfOGR+yrd7OScLazE5yySIS7tYsYXdHOXo8z3ce9jrmfMLo1
 a7zk67DlrzAEuAU0hf0UejcO1VJBjXZdvTdwGoW2Bhz1XoOgIT0yl270jay9uAlLV4jPXfjYSWH
 u6J7egnCR6EJ9usFsxgO+vhn5
X-Received: by 2002:a05:6214:2349:b0:6f2:b14e:46e6 with SMTP id
 6a1803df08f44-6f4bfbe07d3mr4037596d6.17.1745442614193; 
 Wed, 23 Apr 2025 14:10:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErrS3K76BJYaG7A0MIve9v/SjGy38dxpovK8hu3rFc4RCXLAfYAD2TRX1xQ/wSBobjzuyq8w==
X-Received: by 2002:a05:6214:2349:b0:6f2:b14e:46e6 with SMTP id
 6a1803df08f44-6f4bfbe07d3mr4037176d6.17.1745442613743; 
 Wed, 23 Apr 2025 14:10:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:09:58 +0300
Subject: [PATCH v2 02/33] drm/msm/dpu: drop INTF_SC7280_MASK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-2-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19101;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xlGqFQKejkBi19WJTCfzWwC/AtKB39a4TtFtZ23pzus=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcqfb51aXfcjSII8EXwam+YPbIAaPdjTbHVD
 tMYo45/fViJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKgAKCRCLPIo+Aiko
 1Rl/B/9/dEubdSsj9c0OqNjLYjxtk1yRHzHcaGZw6smJwhsUlsEigW0hsYYJQn8brJch5rB1v57
 MxGZa/Pwczz37J2sGqZwmGOwX16L+nhM2cyLQhl2kh0iH4OJwIul4sRF6xeNQ9Pyc3S+WdFY0Rm
 Mma5i/UfLN67eGC52XoNjTqBRilQ/qXZlmGc+uVukwtscDkTnsdiuPBa4KSReHs+ecqCJ9LIybJ
 laZBw8jUnTIUFBPHxSl/ZjrWf1MZYoZb4iZbmQtfhbCCB1zmEXOBkiCb5OItqNA9l589hJm5ZpT
 3fdLMBKuwOFS2bVVy8ce7d1l1qfj5YN616sAUIHblUllUJav
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: cwYBEN7C_AR4eLOICb572jHTZQfnj4Sh
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=68095737 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=VRwz4S5yodoF-XQobIwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cwYBEN7C_AR4eLOICb572jHTZQfnj4Sh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfXyL2KlpbVjIYi
 X947YQp7IKBnM2p40l8FT8XCqR8Bsz83pT6CuGB5DgFhLRmbEMPuRsmv8NMboJmZzbkriyLAVQ/
 vXBcLEUWfN/557rBJ9OBY0BIeaQVxXEjc6VXSz25ai/mTXhbh009RyV+C375WpmG0xqKesv7crF
 73yhZ3RPtrt5NMXifnVrpSEpDde4JnchiduZhCtjeTTVboGCge8poSv3QOBsou3XgNM38PGYQ4Q
 SHdZYfekret4PX8yPJkTi2nQt9Xaok8SYPSJsKhHdidKFKHo92yWTSTLHSQW9YDxnFUlJHMYQRy
 OEPvMe+WxKxybe5+Fk5bLpySDAI0sV8nnYgAa54Vknq1DSC4h+xyrcZPsy8VkOq4qqo8cW1JwBU
 OJpp8Cs4YGoUfu/4Zz79mzpCmIuOxlwYTjaS8P3ayazPHiRCV5frUB7rvbBFNBrGju0QrBRA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143
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

From: Dmitry Baryshkov <lumag@kernel.org>

The INTF_SC7280_MASK is equal to the INTF_SC7180_MASK. Stop defining a
separate symbol and use the INTF_SC7180_MASK instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  6 +++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 16 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         |  2 --
 9 files changed, 45 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 6ac97c378056c08c937ed992b81d139cbb1fbbb0..a8b5c5b5a2e8d9d67ee185f00d92feeec42e490f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -375,7 +375,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -384,7 +384,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -394,7 +394,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -404,7 +404,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 0c860e804cab8ece8966596f4ec2b17ff3aa226f..93427f7cac3a370fdac3f119134bf9fee8b87a17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -319,7 +319,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -328,7 +328,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -338,7 +338,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x2c4,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -348,7 +348,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index e9625c48c5677ef221b8fc80e7f9df8957b847e2..1edec0644b078ac1fff129354d4d02eec015a331 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -183,7 +183,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -192,7 +192,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -202,7 +202,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index fcee1c3665f88a9defca4fec38dd76d56c97297e..7d698fc354666a2dc468a71ff08cb8df0c37234c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -315,7 +315,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -324,7 +324,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -334,7 +334,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -344,7 +344,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -353,7 +353,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -362,7 +362,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_3,
 		.prog_fetch_lines_worst_case = 24,
@@ -371,7 +371,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3a000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -380,7 +380,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -389,7 +389,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 19b2ee8bbd5fd3ab6096ea1c9dc2e0f804bec973..ce050c898b9f21e69e5ff967c2af7c2df1e08232 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -335,7 +335,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -344,7 +344,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -354,7 +354,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -364,7 +364,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 4d96ce71746f2595427649d0fdb73dae0c18be60..4291b4f9ce324eb517022eabe3ab6078b1c3a2fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -345,7 +345,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -354,7 +354,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -364,7 +364,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -374,7 +374,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -383,7 +383,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -392,7 +392,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -401,7 +401,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -410,7 +410,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 24f988465bf6ba8e3d3d2691534f0981f222fa27..a6ab5c49654010194bfc1d4991ffec411ef6e6fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -330,7 +330,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -339,7 +339,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -349,7 +349,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -359,7 +359,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 6417baa84f826feb3bc6eaa6b063ad75e597a9d7..ad486b03c54d9beb6d77df4d6b5f142fd1dd8d8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -331,7 +331,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -340,7 +340,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -350,7 +350,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -360,7 +360,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -369,7 +369,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -378,7 +378,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_3,
 		.prog_fetch_lines_worst_case = 24,
@@ -387,7 +387,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -396,7 +396,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -405,7 +405,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 64265ca4656a04d8c5a1d9582d7124c7eb897099..671e1ba35d28a20ca3a483bfc6412a8e53c25709 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -126,8 +126,6 @@
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
-#define INTF_SC7280_MASK (INTF_SC7180_MASK)
-
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \

-- 
2.39.5


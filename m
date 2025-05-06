Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4912AAC4A8
	for <lists+freedreno@lfdr.de>; Tue,  6 May 2025 14:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23A910E687;
	Tue,  6 May 2025 12:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdkUrvRc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3B110E688
 for <freedreno@lists.freedesktop.org>; Tue,  6 May 2025 12:53:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468jwli011188
 for <freedreno@lists.freedesktop.org>; Tue, 6 May 2025 12:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=AgmcAWolgCiPWNjO4wriq7
 aohKZcAwprjCNfGs2zXa4=; b=QdkUrvRcGUMl+tnKigTOVSVpUZ/sKfBbjRwWxV
 sTqicwSp3duCZaLX14bY4RySYzPhFK1/BRTSlQx+06rKhJmSlkrf1hsN0uN8Dd99
 ox4EWtqD4aHmbhuA/t+duN+TeFo4Skxv6HXndvSFitGvCOtu8qAYFxZamz25F0H1
 nCKPevvnQdSmr/RykTyHyBvNjXO/n0UNBIQsQ2GmWkPqjCL8D/Qj04FEAhMnqCI+
 pRB1HCQAKb+JB1hI21Flw+yZZbiXHRxklOXGQVeGOzc6lTbT1AclMOM9ymR5N1s1
 j/hoA7+3r7snI2TEbPJ6OnbJgzqsdzU5TuHAW+nMPt2AT1Hw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tbaafu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 06 May 2025 12:53:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-47693206f16so109879271cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 06 May 2025 05:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746536030; x=1747140830;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AgmcAWolgCiPWNjO4wriq7aohKZcAwprjCNfGs2zXa4=;
 b=eBetZrumy+mT/UncZiS84uylDTXO6i4GxV2j5hYnKGwjHtaRpKcXpWnI8x5hBU9DXw
 EW36A0l+noUUsjp79S4p3UMYCXJZK05asdlBxESkqUrqT2CgjX/JE4CZEJow0or+Mmul
 lpl8aC+A1MuwBGpLHaooRY43WGwYAFPnIrVQWbzvtXQryMmei9kp/9YDKkJvaPQwdmq7
 ySoUo83L5QX5yJtRPza4e7aXUIBVe4zutlv4djokVgU2P6faR6OzdFHjg/x7dvxImoUc
 6padCXf28n/JxGLaEEJ5GNTlx0garOnYPgShcM6WaaEpPW12FTfYjee/r2xGe3ErTre6
 JpvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Ik3cL8kLpweUUca2eufuixz5azC+x1ycu8Ownl3DqmvjVrL109O8Ss4kJzA7QYWGYpMmsmsYRzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL8S8YoSrDlFb25tzQtJ4vDnmBob9BZKQQ7Bg29wybPnOHiL9q
 9AbW6uACq2eL9aU7Yk3lHN+73o2A6jyQHwF7FRJRcgy0VAm3lU1NgwS06l9ETBi6xkapoa/6ZDx
 Z9LQmAZfdSoQ1oEfv9D0IpNwAxODLVAbQXSqFXIXz2MN1C9qPYVgvuwKqlUgj4wCqyvk=
X-Gm-Gg: ASbGncuF4hNPbC3Cn5xZtdDWR9eKvGUVnh34GT1YJox+6/+h9mk9Khsv76pfJtSw7FN
 qLejdyMfZlg65X5Tt+3PicDO6aCgNULnkEl1p2ZWgMAeS3RA/DygXP4SHBPTLOAiTES0uOoU+TB
 b69nn8ieTkuYYWln8OIdWFfyj5kg3bqBeRYQXuGQ9YpS7r4/E8q1mZ7IjJjLty0AUL20khqFvJY
 60LtJJcWAj+o7ND9RpXeJ+wKbTZshj3Wvs2SFfun841SrDr6cgu7vp+ko65xoz5zJ9qLHUIhxQp
 pTGW6a3oqq6XaonyNg1nLr8hovcOoeRU56scAkvqbGnRXYG0PGhr+KQHbCm4/ipqOKKsFkrQvja
 bqb6ce1WNsHfQEcBU8I/UWH9g
X-Received: by 2002:a05:622a:230a:b0:476:838c:b0ce with SMTP id
 d75a77b69052e-4910c3954d4mr48099141cf.13.1746536030545; 
 Tue, 06 May 2025 05:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXsqKKERRcPxEdrvqstmJGewVow5qWh99rnHUM6amWIecro3btKP0XXWIMwlYB2tixxvB4cw==
X-Received: by 2002:a05:622a:230a:b0:476:838c:b0ce with SMTP id
 d75a77b69052e-4910c3954d4mr48098721cf.13.1746536030166; 
 Tue, 06 May 2025 05:53:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202a89f22csm21568221fa.84.2025.05.06.05.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 05:53:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 May 2025 15:53:48 +0300
Subject: [PATCH] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from SAR2130P
 CTL blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-dpu-sar2130p-no-split-display-v1-1-b619c0fddea5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFsGGmgC/x3MQQqEMAxA0atI1gbSamWYqwwuqo0akFqaURTx7
 lNm9Xmbf4NyFlZ4VzdkPkRliwWmrmBcfJwZJRSDJevIUYch7ag+W9NQwrihplW+GKTUX9i2lgc
 aXs50DsojZZ7k/P8//fP8APu7NDlvAAAA
X-Change-ID: 20250506-dpu-sar2130p-no-split-display-442eb0b85165
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aCKhQ5Lb1Tbcv2cIcyI7sgot7I/f5b0mNTjY2gFri0Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGgZcZXlpZXsBrmJ6mYd8gCprsu5r3HsOH21/f
 Qun5IG99seJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBoGXAAKCRCLPIo+Aiko
 1fbpCACk67EUrszUXYFDfhykF/xPSvfXYmeLZ7SoRQp1KkTZCkL5HW/yZmgOCklEiDpvHlz5HeK
 NcACb+qSoOFki/bm1i8iau3yUYd5eIalGF5caokG8SIJH1wEqM4xVlvMfUvZQX+VMab31levnYa
 VD0cMGuGL8OcRbCErhmT6PRDfF2wKUC73lJhURmqpYC7zTOSO5hY/y9Bq+zJXaMUY+Gs/tF4Rmi
 YE2hNx4y6UXT7iAFRFEmJGjKQWAJViipg4pom/NW1ynDO9F0SPjnitUZInizwsm4sI3nGF0+BUG
 w2nIuCDnJHz1nmcSa1Xxaj5uSaHmvZU5ktNOu4cCRnfhxj+v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: gTdveJtGXb4IvtwxxuERE2kmBtVK-hp7
X-Proofpoint-GUID: gTdveJtGXb4IvtwxxuERE2kmBtVK-hp7
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=681a065f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ApOX_RYdNeUh17kXzE8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyNCBTYWx0ZWRfX2Kaq4nwjeEuu
 nbskItHWaZxRPillF7oNMv1rgNqyy/WJqW2hpJIz6irgKLD6PwAhhSKOiBNufiz2EegtHvhZ2mb
 ZI4RwUhLgzxMXAdkn+uMayRk0bo7WGNdD2jWQZqTwYzO1fI9bsC9+EDFNzXCsW0Peq3wemwR7Ho
 VPsit76F4JL1By9OJX69kCMv4pARRoTUlfK/EhcECGFPZXCno9EPelOwuEDWyro8hFz50B6Yy64
 aDN93ExBwBFu4QDCE6i9AdxYf5GSn9V0CQQwvLLm/gQiiSj1cgw7VVaJe6vlGIQdJWhYSFkVwrv
 be2ViD1g7KnQzNPeSdwmjG+k19UmPUGNMUJcyMaXHTWFBaU+cef8BNw7bO38Q6y16uiyFwTMY4S
 xkZBpR9w0uNx3CVtw6okpLmPebK9vNc0tAUv7fwFx1Gc0g92F9c1DIJP95kqrde919UlLbD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060124
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

Follow the changes in the commit a2649952f66e ("drm/msm/dpu: remove
DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0") and remove
DPU_CTL_SPLIT_DISPLAY from the CTL blocks on the SAR2130P platform.
Single CTL is used for all interfaces used by a single path

Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 22dd16c6e210e9520ecb7a851bee402032fa1ee2..5667d055fbd1d8125c3231302daa3e05de5944c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -27,17 +27,16 @@ static const struct dpu_mdp_cfg sar2130p_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sar2130p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SM8550_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SM8550_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,

---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250506-dpu-sar2130p-no-split-display-442eb0b85165

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


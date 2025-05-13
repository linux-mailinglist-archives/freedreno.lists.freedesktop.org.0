Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA34AB5FE1
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 01:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0668110E218;
	Tue, 13 May 2025 23:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RW09l7vl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42A610E218
 for <freedreno@lists.freedesktop.org>; Tue, 13 May 2025 23:30:06 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DISMAE007530
 for <freedreno@lists.freedesktop.org>; Tue, 13 May 2025 23:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=9kw1tJ+fZlLjSs2Ct4UhM/
 9TxVd++C5yWC4uITx73v8=; b=RW09l7vlpXY5+Dfdol9YHPvQp9YsucwyxQ1mnQ
 Xs0GRsyo5cuRM1QX4fldPmhL7my9D2s7TIjhmtjrfAxMYc6ly93wB8EyyScjgKk3
 DG4JqNqvXdAONo+UABQlDfqAMBoJVH0XnU7UQehmPd/NKRL6lxO2vX+rfQT3oehi
 PVVtk9D2WOvSJUHwzndkVUoITdqc9dyEGHelo9dh/zRVZDJyTLcwrzBdKlqtWUr8
 kDwe4IHmHjC5sKfhhFDzS6Y0Ja3AuqSq8S0vrYtCxePQtrqeBCWbdlhbTkXxwXdl
 ALB0/3s13ScG3x7VTB1KIcBDFIq/YidGHIUl7oDcZqsSB7OQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcprq8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 May 2025 23:30:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7caef20a527so1658522385a.3
 for <freedreno@lists.freedesktop.org>; Tue, 13 May 2025 16:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747179005; x=1747783805;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9kw1tJ+fZlLjSs2Ct4UhM/9TxVd++C5yWC4uITx73v8=;
 b=d426JW93M75tr8pAaZw7kE3vZ0r7QbyrrxD7Jix2VrRbzHXOLx3KOKjc2xghUFt/mT
 J6dTMNPzGZ6Z+E/gi1m548NmIFS3mP/OMQPcYf7Fqs0Ax5OGaiq9uulnpCN73FUFq+Xk
 v7DfpBMqnc+iUPu4Rk4+UbXzTtbzXkwlnMKke+uLs1tu8a2xPTKqgVYE1lV6BUtNkxKp
 Qum+NzDQ/yD63crD263Z8an4W2kQT1GAIXNvlF5I2G1SWRrq6MaQAXHsXd6SQPcGVKIx
 Bw4dmBtwB83aj/Q8CSilJa/jAxMx3aBrDKciyPmYZFAcpDReKT6rD4cV+3tyP92smwrC
 lE2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmVL5xACKENUIj1PyLKE+Za7N9NJ0bgIyPyIyb8u5qyVwVdUJWYsnZSSaim5eJmjB+XlDqwCJXg4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGvff1mQyRdvKlJm3klJkaMr/+eGOa5kkoQ6k3t477sUzIj5+N
 wemsWb0HS4f3PrQAyaU08q44WPHcKF5c0v4XUr7CdQj0ebiC222/mQxvWxT8He3ylqMvScwAZWV
 NneA0HMu63satMt6qKw5u6LTufkRFgmSvaWCzwTOtT1aGuFtYzK171HHPGVDYBKFaGTc=
X-Gm-Gg: ASbGncuExqTxk7W48++mtQWwQ+2KhpFor0TxtbnsWM/laWqYUCLSGC2rTuR4OcJS3w4
 U/nvldIElhf0i5nN5l1Pac1A7qRmGUvcWwZlAf5tlulm1gDF0yBEBK4ryu0Ao27qZ69FtV2MABy
 MgSNjBbLsLyhkoWKQ+AWJmlfi1xob7DfyWvSiuiMiDM9RkBOTUxuHsojbBCnWLde0zhFbQTKy31
 Y0wZeU9/NoT3BgLmyMS9xON7xVtuefQAHu7YODBt/pLL3NQ4ixlVoVqje/FvC6oijg7JmsCIcgZ
 qWoXHXekP0VjBhivWtON24uenIrlDkuQqGeFvIvJ91g5uy+HQ5beV9/jYbEvQ8skewpV2vB7gSC
 c+9dRSd64zN3xpavcyWf/cpAE
X-Received: by 2002:a05:620a:461e:b0:7c7:ad45:b3d4 with SMTP id
 af79cd13be357-7cd28832c94mr210565385a.34.1747179004814; 
 Tue, 13 May 2025 16:30:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpnDrtMPY6cQ8xynl/hgQMZ86hVIrUSkBIdvk7KNw4pBWlsnsDSUVPVYKQl7IvTGOcZJUi3w==
X-Received: by 2002:a05:620a:461e:b0:7c7:ad45:b3d4 with SMTP id
 af79cd13be357-7cd28832c94mr210561385a.34.1747179004486; 
 Tue, 13 May 2025 16:30:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c33c26c2sm17934191fa.61.2025.05.13.16.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 16:30:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 14 May 2025 02:30:00 +0300
Subject: [PATCH RFT] drm/msm/dpu: enable virtual planes by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-dpu-enable-virt-planes-v1-1-bf5ba0088007@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPfVI2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0MT3ZSCUt3UvMSknFTdssyiEt2CnMS81GJd8yTz5FSDRLPkVKNEJaD
 mgqLUtMwKsMHRSkFuIUqxtbUAh78N7W0AAAA=
X-Change-ID: 20250514-dpu-enable-virt-planes-7b7ce0a6ce2a
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1LUajNbvybnKkxnxB8nGE1qDfFOK0dPtOLJKSSG9Rbs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoI9X4pcoyU/uZSpo25xT5kZjjrM9k/DGGXTpwN
 kNwXE7FjzCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCPV+AAKCRCLPIo+Aiko
 1bT+CACZMCems+sM/Qwu7e64/XI0cx6/aixT8cBMJNS7bOP7FFiLxSTwDupCGLBjnd9DHANBCOB
 TzgJc3lXaAZp4EB2pXrB6tZO5shx2hts44c633sXNGhEaI0zZG1GOokjOehFlpV8XQsT3rdbset
 GvGYfdYr7J+qy6KAoPgX02Jq0jlPU7p5dacBNptXj//a4RNTp5oDC7DnZ6mE4J5HxWVLXInHxM3
 XGClJQMc799EPmtKtvCOzhFH4A8L/zyaihIB6p2jfi+UWIrLBAyEz7gNn++iaHTr2n7rVrJXc5a
 kv++g1xB7RXyttdDR9DTlPzAredK8HaBxcIN9Sb6uWD0glvj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 5GHqo8bc1B_xwVbTllLWGPBxRoYvpg1n
X-Proofpoint-ORIG-GUID: 5GHqo8bc1B_xwVbTllLWGPBxRoYvpg1n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDIyMSBTYWx0ZWRfX8ghOrPHyq0dK
 C8BS/VOPYlC1Lazv+tOCHbNUNLqHn959tG+x3RN4z19SEg3ckXVw5GWzQ9cAgwEgd0G2A+PMFOO
 rjf1Il5l2PrReR/IUdcgBPLU5yBJyovD+K4xbJO5jC5pYRq/aONgvuyYqgilV1e3tedz4Zk01k0
 Dq/KKy5HYHhUZ7qyy46ucX1AR6tYJ8Nux6I9cgKiIP+HZVPX2qfgyO2ya69I/IOe/lfGCGLQs91
 UmYm4X7X1klnPoGu3QlcnVWLxB6ebzbIhoVnopU2Ebu0x1utVcIlBAqoeiuVlIuGHdSACsOueIM
 LFcT7yP9CWNh92RJzrai5+K9PQWEhkd2K5rpYXW5kDCisudbS2GL0mVkR+zk6Pdp8rirbOviR+o
 qM2j1TkNxMQ7jA4ahzUJhdMBVUEVPCZtpCSB354F6gZGaIr4N6Fql2Tkb5PTUbP8+LhCKMFG
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=6823d5fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=4RDPIAw37ivmvRzZDt4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505130221
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

Turn on the switch and use virtual planes by default, enhancing
utilisation of the display pipelines. It is still possible to use legacy
implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
parameter.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This is being sent as an RFT for now. Please give it a test with your
compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
the switch for 6.17.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..5c0ae6a15d0a55c7568bd7850509390a93cf2bca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -51,7 +51,7 @@
 #define DPU_DEBUGFS_DIR "msm_dpu"
 #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
 
-bool dpu_use_virtual_planes;
+bool dpu_use_virtual_planes = true;
 module_param(dpu_use_virtual_planes, bool, 0);
 
 static int dpu_kms_hw_init(struct msm_kms *kms);

---
base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
change-id: 20250514-dpu-enable-virt-planes-7b7ce0a6ce2a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


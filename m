Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8D6A87287
	for <lists+freedreno@lfdr.de>; Sun, 13 Apr 2025 18:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C2610E304;
	Sun, 13 Apr 2025 16:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/jCmLoW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D0010E2F3
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DEgpPY019915
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xKdgT+dSB0xeGKLnfAIrPSxWUg6xTzhuptWzcax3H+0=; b=X/jCmLoWEnj8ou0j
 FDod4ab3rBKuLB5ncZ9WYScSi4/1YVKEy18589a544WD+HEFNzFaox4/q1PkP20c
 pZ2y4Maf1DRaUvsI7B0yAbnny+DvHoYOFjqDSqgJjkfoTbzpwB/+okAAK7yxq+if
 WAuwWnp8mnfF4Mz/cSm/L6kQTD7JoZsihH14QL92lJmqJx6vDS8op3LzVYNp7Nq8
 nm89/Vf1SvMN67j//x4nHab+EJGOYqnXL1kZmaWPfzACBAJUumt1To2J98A1LptI
 Q/GDL6NeK3o7XyT8953t/3FFE1dhjYjbFEzmh7NaiKewfThkEjsqKn0G8ZJa6Lls
 VxVaJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj2j7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c760637fe5so678406885a.0
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 09:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744561990; x=1745166790;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xKdgT+dSB0xeGKLnfAIrPSxWUg6xTzhuptWzcax3H+0=;
 b=DEZRfD+6eLeWY6/60ZJz+GxRR4roV75pLGcLUvzN0iEtYDlVpHjThcMhy5bjwMs6r+
 1hlvHbYjiKyaNINRgonD02E7MBqhinbkoI44nNyY5nMlkcOPPmM/HwK9i1EaCtekdr7F
 w6WTuvnTnzUOOoFqOLARUqj1vSAySt6n6AxgewOM1N4e4/Q6Hh/FJZDZjaFBsQnjgw7d
 CBdreBlGnoSjDdxakeVh2PBKhbamZwrQDFPY2Sek6+56wmMilrgrzDbWkxfqseUo9SV4
 YAJNlIb6CZuJ69TBViiOsa5iRlIlJjATRAJc7/xBgsoO4JkChrCctyWxuXcPGZOJjl0O
 QojQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6P5gRdNH6vgOHo+qACsylXU5AVntcRFq12WaW89bWojhH6V0QtF1innBxTfemWCV/+uM8SYYTk/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrpKlZshX03rc0hW6ZnYLc94aDP073SSIowSV10wcHYnbu2PY9
 ThJYwq9W9K/m0GK+CT0ykHteUtIUmJIKXIuYlgalnNGwNdbgobJ2eMacU6wYDXlCDnf7weaLuLm
 WspD2AN2/+cQ/O2bh2ny5XCDpOrZLkgNTKe19UfPrJKg5an8BoKm7kbV1wM7CFtszz4w=
X-Gm-Gg: ASbGncutPjYovirpw6fRQGSMMHfLA701bsOxXJBmU6Ka8h2mL+twqzWj05CpaGJDcaX
 tDTL+OAe6/1A0N59ODletMB4wnaJfl8Y69NC5TjFGPAqUzs+lcf5ihdqMABVIGXg8YDAVNKnj6z
 0VjYaU+owXKTdO1h7daWCbYcCPjcmBD9rIwXbV4PogQjTIwQRKBDgwM1Zl2UAjMzSqV09ExCUIX
 NmRQmJ1wzrC7/iMshVwjdjLYiXWQI/IkBbhIHsbSHJMlnnlMPpUe0kmQPwjcqp09/uLWeGXK06c
 t2tPIYguFf9XWDRLfhYMKGcvCmVrAbfwG/SqcJyD25d3/ECQgE5xGuVsA5CdpZT9VGgKzDe844/
 iZi+jPcwIVOnLqVq5dWe2NaVC
X-Received: by 2002:a05:620a:2996:b0:7c5:4bb7:8e45 with SMTP id
 af79cd13be357-7c7af1f333amr1451359685a.40.1744561990318; 
 Sun, 13 Apr 2025 09:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUWRMVIE6OK+FWrYj7sTxXGYMEYvK/1lf0lJmZzzBgGPqel7FWzI3sccgjw6syFjwg6JtAIA==
X-Received: by 2002:a05:620a:2996:b0:7c5:4bb7:8e45 with SMTP id
 af79cd13be357-7c7af1f333amr1451354385a.40.1744561989750; 
 Sun, 13 Apr 2025 09:33:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 09:33:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:32:59 +0300
Subject: [PATCH 5/7] drm/msm: rearrange symbol selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-5-1132f4b616c7@oss.qualcomm.com>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
In-Reply-To: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1820;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TnUzAndi2T1YnSlyFpGeu/Plqylj3xVIJozR04iJiQ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c5zot51bWXjqYm5qRu0xm6DL6T8wScfw9tp
 x2I8HWLsNWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOQAKCRCLPIo+Aiko
 1cr7B/9lhjWA64+i6WMEKng6H1Gjr41aeV+3L9pCQteZeOPJK5kWPokWOND0NMftGAqTLzVGSd6
 Q0abSVqr+c2q3U+INZiBD3rvM2Kulbs85KXkqgNcTN0Tqcw/mFgA9+JkyrSOaf8HWICe8BjtDDh
 v+UN3UXuGskPQIf036Jh3XhAqDFACbyy7E7mKIdZOBI79CniHDIt8LOZgdwErhqo7y2gDDuec1h
 xnGRpDGBTuJNWRh4TRLND3cUeWa6ijjcx5jkj0Ac2fidIHfu/nVLhvE4q3sJJUk916jn85UUcEB
 CSbCS5snIDthUkPE+4OqN0k1sZPVDeTC2BS1alv8KwCCFblI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fbe747 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9
 a=FBDQ_9kEivOruIPM:21 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: OnMl8bk2U9VvNo8ZeeSyOreaRPutXOOY
X-Proofpoint-ORIG-GUID: OnMl8bk2U9VvNo8ZeeSyOreaRPutXOOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127
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

Move symbol selection to be more fine grained: select DP helpers only if
DP driver is also enabled, move KMS and display helpers to the newly
introduced DRM_MSM_KMS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 0be31c5acdd1b7ef80f0e820ff430692616122e0..b3c6117ab035764d603cc257c28df651d9c38175 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,18 +15,8 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_CLIENT_SELECTION
-	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
-	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_BRIDGE
-	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
@@ -69,10 +59,18 @@ config DRM_MSM_VALIDATE_XML
 config DRM_MSM_KMS
 	def_bool n
 	depends on DRM_MSM
+	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 
 config DRM_MSM_KMS_FBDEV
 	def_bool DRM_FBDEV_EMULATION
 	depends on DRM_MSM_KMS
+	select FB_SYSMEM_HELPERS
 
 config DRM_MSM_MDSS
 	bool
@@ -117,6 +115,8 @@ config DRM_MSM_DP
 	depends on DRM_MSM
 	depends on DRM_MSM_KMS
 	select RATIONAL
+	select DRM_DISPLAY_DP_AUX_BUS
+	select DRM_DISPLAY_DP_HELPER
 	default y
 	help
 	  Compile in support for DP driver in MSM DRM driver. DP external

-- 
2.39.5


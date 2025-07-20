Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A54EB0B5F1
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C60910E453;
	Sun, 20 Jul 2025 12:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRTlXFSZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F62D10E453
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K5bpDY032452
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WRxeH17Gt32dkGT9t3Cq+DF2jnA8FBxdstfieXj42R8=; b=IRTlXFSZ1cntunqO
 cXGDPlkyHq6RECuYo2pOpZw98S0PFk0mp3LVMfBz1moqIYVrnI+Oct/dn1XGNEDo
 0cbbXnsemzne7GXRo41+S8vHXTDlDXroLcRHPb4UY+VVWs4PBJZbn2XZflgwPv1P
 mDkfBK8S9NQk02xmgJiZ/FK1waS1tBIpjftb3yOd6vEknNHkXvx1g2cAQBmoBU5i
 6DsMbS9muQvJnHvdNZuBpmN0WbXFqiZ0N92upnuHMpvAwFoi03BnzrBlheH4jqZN
 XsZjWWrRJJxjgGRH//vdxgf42n7/AOqNJYxKIrrHf6cJdf47dqim455lyE5FQR/L
 j470wg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rt79s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-74927be2ec0so4313029b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013867; x=1753618667;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRxeH17Gt32dkGT9t3Cq+DF2jnA8FBxdstfieXj42R8=;
 b=tG6CtjvyW/8feSxRiZs5GECbHq2cfl8JF6aZmm+eK8Us5HzW3bvRzG3pJLrRH6+SOw
 mkWq2vN+ed1nhYsb816xWAMGgpuv7kp0bfIOipOd9tSkHVZB0q2kr05n6Ho/PrB+tBUN
 O208GnFkO9RGXqaUrfxuye3snCnfoK+4/y5D3WhT3XZ15mDOqO+p4HKQ9vvnHwgsDiPT
 16C06wFTmug2FCiXU6UpANLZ7+pI8REB1Yq2zuSrfkUhhwZVsdKivJYhbIic3XT8q4Gx
 MYxADXUql0zGRkFu2bBduclGhhTNGHBuovfhLRGFLQIFVoxNEjC5Pf3YgSpcklvxMTRm
 uBgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9XUyEGIteL5PZ6rkeCmopftmpMOI8gqcT0z7mS4e0bDNCIJAamQeJ85FHu77/tyBJzX/JLX94ukE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwF3XmoXr5rWC3I8sB3quD+X7N2R01tP/dXqL26c8DQYOcBkpkh
 4gZ7VQKtWDWrDegQ2/iYumog+AwWanR22y0UoiSixWVMOAMG1Zmyvo6T+YiXMx+jeCEC8CxZoy1
 3SRkAWNsMHaBr7BrMevnlibgzyDfIbjxZNlNn0NcWusdhLx/SQ4vTup7jvI7p5wyXEBP1IHQ=
X-Gm-Gg: ASbGncsI9CmO5GaYDeBUlP/yWVggzBCfSD+nxvNq3XZRqFdCkihw5dIVW4WFaPIIicM
 45qhQnOTb5gISjxZZqJQJQVoo3bf8xhUuhBL27maDfVIU/r6TO6EZlvvXWnLfQj6zBh9DMAASoN
 wVtcFghiTGe5w5/svZkQVK3g+9li7Xz6lu5dJ57+bcegZYAlORmQhKf78wzWP/Co802YxtEXMfD
 l5eI7zwEehiHw8HGXL/UFpjv7dWmLz9EexJRU6vT3YYbXr+W6I1al22g1GifHZXMhOUESweuOc+
 yh6/cGm/Wre+ix8Mx4ajVEGrmlJHOT/Yx0MbJmrOHcgJLZhcWonoNDLk5NuMajmb
X-Received: by 2002:a05:6a21:6b0d:b0:220:37a7:578f with SMTP id
 adf61e73a8af0-23810d541c6mr27760934637.2.1753013867080; 
 Sun, 20 Jul 2025 05:17:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFDHBtfOFFiy4Mm8pCNlUK62jt3Wh/AIRVjEsH/Xia5be0Mc8Kob8H3nR9Qpl/ZZ6Hg1hlsw==
X-Received: by 2002:a05:6a21:6b0d:b0:220:37a7:578f with SMTP id
 adf61e73a8af0-23810d541c6mr27760903637.2.1753013866646; 
 Sun, 20 Jul 2025 05:17:46 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:46 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:15 +0530
Subject: [PATCH 14/17] drm/msm/adreno: Disable IFPC when sysprof is active
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-14-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=6222;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9XiTPmw4E2lXU3d4VH5CnXgkRVIT0GWJ4Ae+X4ZzvMc=;
 b=oKWn8DgytQ7mRpl1VmXkz6Ejg4H/J5HLWhuQk9sM9RW+dM76YktKBcygz2NCEb1iyHYKayE3T
 /kMrX9l+s6XB0Wnzy9ERhsD/xGxmhVqo4vef/zg6TB0N53EQMufJD2M
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfXz9mmHHfssfQI
 RXTYHEwP9lPq6shllxasKbgH8ciFsDMdUcT8f96alHCmiPrLHtlIxeftYKPgBC+Pl8dj7/Hnvb6
 VZ6MeECGXrcx7+JQYulJUE7x8ywXFu0gByfd+YOz4mCwAyL16Zkigwj8tzuRL7P49nPxZXVLtbN
 enLC5vvDDUi6R/YUxSx1S/f43QLrbXVlpdWg3tWqG4Th4xri8wV6IkUO5FEYlMmcclOjocADhPs
 UUqW7I2IevCSJNqLh2Kd3h9xzkHlEY6Y/meCsaXMn++9BNtMeTW8ltdD924pfzkSVtqDXBfK5Ok
 CUz/tTf+oFykSU/Wo85uhy/C4ojBbVJZWYPr8kAexzz78za3kA95y4D9K2QDOXWfqgEABUYmnKl
 v2+HsIRx8Eq1bBdA6U5TTmQJzVU8Y6fawqK8dhnvVUWictnxOs+zP0iqrk+kgQh0gFkhsK4D
X-Proofpoint-ORIG-GUID: sgbLc65yCSt1OOsSQ-aVUwIrptSbg1B6
X-Proofpoint-GUID: sgbLc65yCSt1OOsSQ-aVUwIrptSbg1B6
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687cde6c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZpAUVitMrpG34TgdG5YA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200118
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

Moving to IFPC state clears the 'Perfcounter Select' register setup
by the userspace. So, lets block the IFPC when sysprof is active by
using the perfcounter oob signal to the GMU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 37 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         |  1 +
 drivers/gpu/drm/msm/msm_submitqueue.c |  4 ++++
 6 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 3bbcc78179c1cf1bfa21ff097e9350eb2f554011..ccdcf5fe4b4f3cd81d765754d00c132960a916a9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1159,6 +1159,11 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Set the GPU to the current freq */
 	a6xx_gmu_set_initial_freq(gpu, gmu);
 
+	if (refcount_read(&gpu->sysprof_active) > 1) {
+		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+		if (!ret)
+			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
+	}
 out:
 	/* On failure, shut down the GMU to leave it in a good state */
 	if (ret) {
@@ -1206,6 +1211,9 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 	}
 
+	if (test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+		a6xx_gmu_clear_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+
 	ret = a6xx_gmu_wait_for_idle(gmu);
 
 	/* If the GMU isn't responding assume it is hung */
@@ -1819,6 +1827,35 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 	return irq;
 }
 
+void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	unsigned int sysprof_active;
+
+	/* Nothing to do if GPU is suspended. We will handle this during GMU resume */
+	if (!pm_runtime_get_if_active(&gpu->pdev->dev))
+		return;
+
+	mutex_lock(&gmu->lock);
+
+	sysprof_active = refcount_read(&gpu->sysprof_active);
+
+	/*
+	 * 'Perfcounter select' register values are lost during IFPC collapse. To avoid that,
+	 * use the currently unused perfcounter oob vote to block IFPC when sysprof is active
+	 */
+	if ((sysprof_active > 1) && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+		a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+	else if ((sysprof_active == 1) && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+		a6xx_gmu_clear_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+
+	mutex_unlock(&gmu->lock);
+
+	pm_runtime_put(&gpu->pdev->dev);
+}
+
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 62c98b198551f26b99bd6e094f8fa35e16ec550d..65c2eb8bb757fd45cd9808a44013ed9453bee558 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -122,6 +122,8 @@ struct a6xx_gmu {
 #define GMU_STATUS_FW_START	0
 /* To track if PDC sleep seq was done */
 #define GMU_STATUS_PDC_SLEEP	1
+/* To track Perfcounter OOB set status */
+#define GMU_STATUS_OOB_PERF_SET 2
 	unsigned long status;
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b3becb230a94163cccff4eaffb8eed44f1c29ad0..b46fdd222913a46e01b984b90c4e63ae82f54e9f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2514,6 +2514,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.create_private_address_space = a6xx_create_private_address_space,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
+		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
 };
@@ -2574,6 +2575,7 @@ static const struct adreno_gpu_funcs funcs_a7xx = {
 		.create_private_address_space = a6xx_create_private_address_space,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
+		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 2be036a3faca58b4b559c30881e4b31d5929592a..bd1194bd15bf013489140c5f9f6b9f8582532a13 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -250,6 +250,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
+void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
 void a6xx_preempt_hw_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index a0a0cf9efb3a8035a80cbbbf30ad294a72ccbd48..76be7f2d7e3e6f890f02d6f38a55329189639a2b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -93,6 +93,7 @@ struct msm_gpu_funcs {
 	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
 	 */
 	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+	void (*sysprof_setup)(struct msm_gpu *gpu);
 };
 
 /* Additional state for iommu faults: */
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 7fed1de63b5d9e20df88db8d9ca6ea45ec1a2846..3332d23ce29943da55beb6704f2f5e8cb1589285 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -41,6 +41,10 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 		break;
 	}
 
+	/* Some gpu families require additional setup for sysprof */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu);
+
 	ctx->sysprof = sysprof;
 
 	return 0;

-- 
2.50.1


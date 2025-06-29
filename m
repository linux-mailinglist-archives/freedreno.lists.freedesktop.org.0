Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B119AECD3F
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB12C10E2A3;
	Sun, 29 Jun 2025 14:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+ygvKBn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE84E10E342
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:03 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T9gZnN000477
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=GiAM1wF2+vU
 wkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=; b=Z+ygvKBni9pEGYCiM9rf0Iu/F7C
 zRLq730rCjKrBWdpuwX27f6nyqZdi3lT7Jq7LK1I2pia9HYJqFYwB/hm9SKdKo0S
 AwC2wEiIUrnaWEqw22IAIJZY5I4eoLHWhkhN7fof12jicGGKcLNBzr7h4T3+ym72
 1RVxlpE+Ozyn/4sOU6J45MGsUtockHqzazJMEPTC6vqyEtYIwZqJCiFg+I8QGbb0
 KSap0cruUndl6TnXrRX38wibe/qP3r9aWoObkNVYxHdq6QQSiKiOzFOFowGQcIK0
 c4dzxkmRrZp5t0FK47c9K9rxoExEkggy84pXyNf+ZpOevRson4X6hxweAWg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-747ddba7c90so1001807b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206081; x=1751810881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GiAM1wF2+vUwkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=;
 b=Igp/BUP2wZ/wIwA3Z9IzjpYO+S3Wj9Yf1DJ5ZtmLZyd+EKf7C/9Ftji3us7m5h/NfX
 QYnKXAHNBx7lgFQMA186D3krWmXMFCKVs3YEb8XsXFYetYvVIfhnvh3ONxHPY2If9A6t
 6uZsYoRIq/UVrTsnWK2BkSRL0ZeAtdZ6HtHUsujNTeOvOMXW7VvZ+OcHrGIPg6dS+x2b
 XhGR8JmdkKDKalAteaUDhclWAWJhNL1pkGPc+GoI+M002QNfF2Xp/m8LtvBePqLYpQJE
 dYM2wMJYdc1pNTK474UYQUaucGe7Ed+CR45MSO0eKXfgXuS2o4rE/OmRjatgLdKj/vzO
 ZrYw==
X-Gm-Message-State: AOJu0YwgKzIMSxyT3uW9Iqg9NzOh/PU3QckeCuyZjys+Bx7shDxpJsA+
 kvU/jIAFoPxYbE+2m2fDNbXZUkNVAQaBfSRM7icONXCUdG2PIPIbD2VQbKIOUIcDRclPUeMLhN/
 LhWUubNUYSJW1FnutsOTEz8I/3jp30aKsFzEArijT9s3bntqQ8WcFM3ICsaNyfLroABNaSXo=
X-Gm-Gg: ASbGnctMQQXSm6xqNqf+njkv5pRL39460KLe4TqlsObHMMs6AKuwaWpTAwAKisFkSx4
 JDzF8b4GFMbhXDDPrS4POIsqfIFfGqRGwBtmuWNRM+PJe45RiBAgbbrWhiZ7DGLB8nSkaJ3nnhk
 SpjDjQXjr84RpIE8+sErnBuWUt44ydpu7fbN65Us5PCxMMN28txZBzLs0CGixDyhurUAuCEbJx7
 1jsc1j7glcfA6sibCuFevW6FtfpqICIBxGsgMJI+oG2gA0zvn7vtYUmFxhxu3kwYcZUO9hwg1fW
 P1d1BSjLv/bv5B4LW/5qYkNAYM4a/pWz
X-Received: by 2002:a05:6a00:4b0c:b0:742:8d52:62f1 with SMTP id
 d2e1a72fcca58-74af6e61b06mr15386837b3a.8.1751206081302; 
 Sun, 29 Jun 2025 07:08:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmEjFT9YhO9qCARxAsGvGVKPjEex9KKnkOxbT8IIcaWHUwA/BA945pWU2NB5DkhvJU1gw/lA==
X-Received: by 2002:a05:6a00:4b0c:b0:742:8d52:62f1 with SMTP id
 d2e1a72fcca58-74af6e61b06mr15386802b3a.8.1751206080907; 
 Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af557591asm6977022b3a.99.2025.06.29.07.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 28/42] drm/msm: rd dumping support for sparse
Date: Sun, 29 Jun 2025 07:03:31 -0700
Message-ID: <20250629140537.30850-29-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IZ3EHMnQP_z8-hIVe2yd8F8xslQm-5oa
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686148c2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: IZ3EHMnQP_z8-hIVe2yd8F8xslQm-5oa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXzZc71+HxeiCI
 BA+46WxYwoEemQZyz6vGKTAeoF4xBr7ufsEKXriaZNIEkymDY6GBv6da7e2pm+zHlhq4atHVhqK
 FcUazwiLl169bAIBgGkdzvweKt24SdEDbWb26S1VpDQK0ud7CGT/6/ayZC5bTd2AcofpEGMMtMX
 bFydFFNhMFLYapbjwUQg/gqo6JBewRL+yUs4m3u9hKUqgOrR5qOr36K8IrGKPBRcpTg9eS8CsC8
 1woRmxvN7k2HFaalfpqj5ey0Vs/Cd0MtRAXc8XUYdTEW4pTa+07qvMA/UOQrN14AxIlU4ZESIzU
 pOCO501HBAxsZWiDiQkQe0VNci3Jt2JCj576OFVMDvux8Aznyqg8Hy3eHIsk+YXFLHRjve3Ng0J
 lcfixZ6UBAXnYF/PVPMgptbz5FXpqk8ADiE21hiXlxzROgQf0WFhEU5VtHQBHuELHdDCZI7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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

From: Rob Clark <robdclark@chromium.org>

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_rd.c | 48 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index edbcb93410a9..54493a94dcb7 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -372,25 +372,43 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_gpuva *vma;
 
-		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
-	}
+		drm_gpuvm_resv_assert_held(submit->vm);
 
-	for (i = 0; i < submit->nr_cmds; i++) {
-		uint32_t szd  = submit->cmd[i].size; /* in dwords */
-		int idx = submit->cmd[i].idx;
-		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			snapshot_buf(rd, vma->gem.obj, vma->va.addr, dump,
+				     vma->gem.offset, vma->va.range);
+		}
+
+	} else {
+		for (i = 0; i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+		}
+
+		for (i = 0; i < submit->nr_cmds; i++) {
+			uint32_t szd  = submit->cmd[i].size; /* in dwords */
+			int idx = submit->cmd[i].idx;
+			bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
-		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!dump) {
-			struct drm_gem_object *obj = submit->bos[idx].obj;
-			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+			/* snapshot cmdstream bo's (if we haven't already): */
+			if (!dump) {
+				struct drm_gem_object *obj = submit->bos[idx].obj;
+				size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
 
-			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
-				     offset, szd * 4);
+				snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+					offset, szd * 4);
+			}
 		}
 	}
 
-- 
2.50.0


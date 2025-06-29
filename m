Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F37AECD3D
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F7910E2C2;
	Sun, 29 Jun 2025 14:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlXxyggX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACC310E344
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T4hSTQ031630
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=POLN6v5Lpeq
 4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=; b=AlXxyggXs76xsX25YWGkU6K2syu
 PdMb0WExu5Uw7MAZYV54/ahuEvU22JTOSuWDXJyLK9V0XlthXx8UnoSW8dmc29p5
 G6tJItREbn523lPzu8Kf5HQgkxgWvPwtkutRm2gromlX0vXpj/9Q5yARTzqihu3A
 ZdGeqhkDfFndE0v+zavpU+VqZ1MQ3Z9/FqQHcdvrzKfhmYDhDXX8y6GG+1X5ffkl
 N4z3b6nbd/PHAx+U4UNAoGgw3qChs0f+AZypaSgI1d1V73DNKnyks2/sf3gMtx/u
 PKaFq4ppxXA09hGHoRLA+0gFGAA66ZQ1rO0a8e1ZKrLPC6Ny6WXVL96GvXw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9t9e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23494a515e3so26512285ad.2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206079; x=1751810879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=POLN6v5Lpeq4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=;
 b=nzYje6721A/zMvekRakEQqjQ6HMSkkpPOp39B9oS4f8XgUw1we1Hdsl2/Tkt4Ilnnh
 b/cu66JBxDhMwSYHrWogXAHb1LDW/PH08h50NpqmMHekgNzBYWkBBeXpTqZLEO7TT+Tp
 Q9mO3uyg3fzr07EeltZv6qaBY6KDr2qGuA13GxwyMyj892hUWCxxRdPPXV1yOfXNM6Yv
 olw1B4G7p6bEfyh4fvh2H9EgbkyAYNqJKDkDR4K4/Kl7I1td3G7pYawNudVXS6vMSvNi
 wAqmMfecNQk2QBs/tQPtaZ0Kje4WMWQTWvEKpZvGoHNMjS/1ZF7IcON+WFnbkWGN5Pbl
 dlVg==
X-Gm-Message-State: AOJu0YwfF7k1cu1oQgnAxav8MsblSA33ISIvotRk/03XikeREVlde4IF
 jynqqDvit1drDxFRRBt2eaGYQvFYGa3n3Cp3PBk9LQXuJDGC28wQlY5dyt4qzPZ1xiMjMGf/57e
 1DKOTTSFDNm1tZLRBe0xz44NGTtUJMKsqw1IUIdUvU36FwpxmY/Y0EgG37ZF3WKtKL/4AEvM=
X-Gm-Gg: ASbGnctXmr0g767Z/7gmyKjbhGbBCEC3RCMIMOlc5VX5SxHnAyf1MCWX6rOUqKkEhUh
 EDhvLmwJq2v9fO6NQFr7A4OPLWoWvMoEqFdx3VDkKb1KVJIErnNXxaNR/81D8tYqleH7lJY+VGw
 zlnlrFm0I6csdb6ewFIETomvuyDdSAR3vlcCMrc0aA7h0bTaA2cWLyhWsv7BMi5tg86mUiVPG4D
 Jt0BtBILOI9W6Rbhsd4khS/63y/olkmYnCw/+DCaWIjd5hFWHuAGrGdNsh7C/SA8pl6hmwwRgGU
 Rh8Z85cq1ftrujSsHWwPPp4OQxQY59b8
X-Received: by 2002:a17:902:dacc:b0:236:15b7:62e4 with SMTP id
 d9443c01a7336-23ac4608402mr153208525ad.38.1751206078771; 
 Sun, 29 Jun 2025 07:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPNU82btQj8+J4hl9ShbsqcvJusHMltr9q+oeq9oKFgZGq/rOI6AAZr3mn9fhniRP+FGNn6A==
X-Received: by 2002:a17:902:dacc:b0:236:15b7:62e4 with SMTP id
 d9443c01a7336-23ac4608402mr153208245ad.38.1751206078346; 
 Sun, 29 Jun 2025 07:07:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e21c8sm62124325ad.36.2025.06.29.07.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:57 -0700 (PDT)
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
Subject: [PATCH v8 26/42] drm/msm: rd dumping prep for sparse mappings
Date: Sun, 29 Jun 2025 07:03:29 -0700
Message-ID: <20250629140537.30850-27-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXyxDWHbvE+LMp
 rlya1RK7OdwfSpQDRMIvGKXyL6rRhntmRpbCppCRA+dB/221V5OXjp2vjxDR1a3BcMi4GDydCb7
 IJkBLmK1/S6BWNVKNEjt9kpIv/zFoRRyQ5bq7O6V5XxSz1kQQ127hKI3jvcxEqP/XMt8zizkfj0
 67GxbFIwwp7ZVYlxxQ9I2nzX90448MgUHLntBx/dKVbMOS0QulaDCdvRiU66q171xHXOKZlvA07
 WoWIry9Z51+uY9raz00gg8oQ3EJLDvz6pT0q+27PcpJZWqwh8eTaccQ8o8Qkw0znzmW9NDIR1IT
 kGSPXVICscPwflkL7rsCYyr4e9FQvFUlFsJZlMNTMaKdWSjsRBz7YfaLJUrfZfC/CTLEI8zKp8u
 +hDwJ2uDPqZX99cqsLQ5kEzVgwyPJTEevaaZQqRqAb62Kk/I6C+gc12vqPv7i3C+WDNbxRE6
X-Proofpoint-GUID: FzWs2w4dhKnU-hg8LJ548U3FCx9r71b2
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=686148c0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: FzWs2w4dhKnU-hg8LJ548U3FCx9r71b2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

Similar to the previous commit, add support for dumping partial
mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ---------
 drivers/gpu/drm/msm/msm_rd.c  | 38 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f2631a8c62b9..3a5f81437b5d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -403,14 +403,4 @@ static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 
 void msm_submit_retire(struct msm_gem_submit *submit);
 
-/* helper to determine of a buffer in submit should be dumped, used for both
- * devcoredump and debugfs cmdstream dumping:
- */
-static inline bool
-should_dump(struct msm_gem_submit *submit, int idx)
-{
-	extern bool rd_full;
-	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
-}
-
 #endif /* __MSM_GEM_H__ */
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 39138e190cb9..edbcb93410a9 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -308,21 +308,11 @@ void msm_rd_debugfs_cleanup(struct msm_drm_private *priv)
 	priv->hangrd = NULL;
 }
 
-static void snapshot_buf(struct msm_rd_state *rd,
-		struct msm_gem_submit *submit, int idx,
-		uint64_t iova, uint32_t size, bool full)
+static void snapshot_buf(struct msm_rd_state *rd, struct drm_gem_object *obj,
+			 uint64_t iova, bool full, size_t offset, size_t size)
 {
-	struct drm_gem_object *obj = submit->bos[idx].obj;
-	unsigned offset = 0;
 	const char *buf;
 
-	if (iova) {
-		offset = iova - submit->bos[idx].iova;
-	} else {
-		iova = submit->bos[idx].iova;
-		size = obj->size;
-	}
-
 	/*
 	 * Always write the GPUADDR header so can get a complete list of all the
 	 * buffers in the cmd
@@ -333,10 +323,6 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	if (!full)
 		return;
 
-	/* But only dump the contents of buffers marked READ */
-	if (!(submit->bos[idx].flags & MSM_SUBMIT_BO_READ))
-		return;
-
 	buf = msm_gem_get_vaddr_active(obj);
 	if (IS_ERR(buf))
 		return;
@@ -352,6 +338,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		const char *fmt, ...)
 {
+	extern bool rd_full;
 	struct task_struct *task;
 	char msg[256];
 	int i, n;
@@ -385,16 +372,25 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++)
-		snapshot_buf(rd, submit, i, 0, 0, should_dump(submit, i));
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+	}
 
 	for (i = 0; i < submit->nr_cmds; i++) {
 		uint32_t szd  = submit->cmd[i].size; /* in dwords */
+		int idx = submit->cmd[i].idx;
+		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
 		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!should_dump(submit, i)) {
-			snapshot_buf(rd, submit, submit->cmd[i].idx,
-					submit->cmd[i].iova, szd * 4, true);
+		if (!dump) {
+			struct drm_gem_object *obj = submit->bos[idx].obj;
+			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+
+			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+				     offset, szd * 4);
 		}
 	}
 
-- 
2.50.0


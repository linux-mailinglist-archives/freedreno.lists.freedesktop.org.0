Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89177ACF6D1
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B91310E9F6;
	Thu,  5 Jun 2025 18:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DK/cxvkV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E1E10E9F6
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:03 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GoHma006342
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=QOMNbElsFZP
 lX1Zq+j4xLdTNJSwjVmJdOq5xQhhnr9E=; b=DK/cxvkVFPdbTRAAbXd5RjsD9Vx
 8v1j9sP812BsQNvgU4jcIshXINVo/is6E1Q+5+Uqpto1FHGgun3r2hPC0abkzMPu
 Osk6yDURYZ5mTV+38Kmcl9F5Pi1fO0Q9kRXvc2agJHyuYPwfaLlxeZ/p+lm0WmwK
 ZvKcyjfIVdxJ9WocnbCXSaVcRSpfzpdbTgVe5Poe7Q5sganhvLnzeo0KM3cZi73K
 i5c6+q4Zc2efEY5f2O1sGk3yy3JG3pjcXjI6HXWIhDYp1V2PSBBWKt/n0MKEERIu
 qhgxUWrEvm9LgVVSiIMor/6qQn+7FbShaNc6Q6ZGSqz2iXM+oIudO7WK6wA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2acu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-742d077bdfaso1717572b3a.2
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148382; x=1749753182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QOMNbElsFZPlX1Zq+j4xLdTNJSwjVmJdOq5xQhhnr9E=;
 b=hesCC4cc8xESvQrGl9k6I9rgDdoWtlTt5ON1WkbcCnER6GXXU+IyITB7Zhyzd/2U45
 zhu4VV/Q5fA/crNs5ZFb7cI26JBlkR0OcQeXnyY7P/mvh3cemfBk0ecRd7gmlT3P4BW9
 mcI24Ii2Y8jYKUTOW2ZYIQ/CQKUR5vlARtW0eMec4qv24HEWctd8UUQhHgnl8dTKvt0y
 AJWNeCmk1UTFVDoV5JFDouKyuw3KaqolRFpZQGZmajg3D91rND91B7Wvb/Lhy/Je0Pb9
 4mBy28QlGELxe2MHJhk8jlLxHxsIpFjE8UcmAxgxls3LTr29q1F+TslqsM5myJryWxWn
 W3Mw==
X-Gm-Message-State: AOJu0YwqnSrYi8bC3nweDXSfN65/IhVq2ft0hGllUtzsD6WyGW1lYbwr
 h907wER8f4ImFsrlPBmBSonRlB/fjt1tJAIg5/gFIr2JJL1eRlDdKM1DoNiEK3R8NngfbBwxtG3
 h9uECH9zkUhTC8095WJMwnyoibUcpoHkQzBD8OooxQ45O6BMhF7MVomyVN8p5M+yh2liK1io=
X-Gm-Gg: ASbGncunyC/12/MIFGsY3dl6lk8BsoEqaYNFyDjkqGycF6k9BM4NKBaMpYGRGccLTc/
 +M1DzGSlzcMBFg7rDTCHNA3RJ5matynvRo5XA2xQBvcGOWLylTSdfPhdD4tAzbPM4WsSdanxH+X
 cRDgF9Krh2YxN2uRzwL0mKB4KSfRuoIlmWgYobDL4ObaGrYll4r6Q8CWQrl769Kq1lwqt35g0RT
 07F5+r0wYQy1o8n0yTg+s/GDnTN6IIbXJNrvFb/pRDDNPiNIo7tDCP03KxylEzPnVgnYYD8I3TG
 yL7RV0dkwk1SzG8NMfQmngA42znwVhsu
X-Received: by 2002:a05:6a00:9292:b0:747:af1c:6c12 with SMTP id
 d2e1a72fcca58-74827e7b12cmr913711b3a.9.1749148382117; 
 Thu, 05 Jun 2025 11:33:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDrhL3Dn+k59t+JotHvK+0jIuQye7jcSS/bDJ3Rw3Z0zwKOzep8XVvL5+334VNT3dzfxxg1A==
X-Received: by 2002:a05:6a00:9292:b0:747:af1c:6c12 with SMTP id
 d2e1a72fcca58-74827e7b12cmr913677b3a.9.1749148381745; 
 Thu, 05 Jun 2025 11:33:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afe96799sm13679698b3a.15.2025.06.05.11.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:01 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 24/40] drm/msm: rd dumping prep for sparse mappings
Date: Thu,  5 Jun 2025 11:29:09 -0700
Message-ID: <20250605183111.163594-25-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a4HusBIdtCsS__KS9XBoLofHVaovHKEA
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2df cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: a4HusBIdtCsS__KS9XBoLofHVaovHKEA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX1xGbBESz80Zk
 nkAdfGgKdZKY1kMJixxIROnv4sn+oKcuW5MFUB3SYyyEVQtyhWiIYHRSGu2ZXDd7EHr9L0RA887
 K3L6mQVzFi3YgA2hH50kN0LpFb0ZvmTU9+DOq1KvtC94jchizCW8kMTEahTGXyqXK5tknXvZQTh
 GWV+462FUokhLnIXLSx4zH4sL/9kYwb0PhqZ/bfdueq3cfQm4Fxw26G9RrLIKKJ8dLvnOTY8QRX
 C2dYeh76vwxP8utOIUREJOCsd5muXxNiS0m+gbWdKlOS1hcnONhUN67RegIgFNDbRuoK7oLj5ss
 RAW2Y9dRSCoVbhwp99RDUYViTDnLux7Oy78zsoYSpabwBJSvTzreWB0qKlK8x4IwkXYGPLarLH0
 YPibUU+x7fTuTo4DS1x5DEuUec0Ns9IHCxGcpP8/Hg/qwt7dxr62R4OdcMFwyRmgBZQgQhnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165
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
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ---------
 drivers/gpu/drm/msm/msm_rd.c  | 38 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 5e8c419ed834..b44a4f7313c9 100644
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
2.49.0


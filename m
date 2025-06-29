Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C4AECD59
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1392E10E35B;
	Sun, 29 Jun 2025 14:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N15+P78H";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7DB10E34B
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:19 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T9TfQA013288
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ufkxvlCaXqE
 +JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=; b=N15+P78HFqJ2QDE4lj0Bqkg67/D
 C1V94pwkSemNSxnav6EC9uQNEn3T5V3CT4/rs5lihNXj4oSuN4423eoHYr4IVTVz
 yE4xRjsO1+Q7SOuXZxmY20VdxujXoUlj+kEqrvdiy/u80I3PSajyNStFuW8NxpqO
 hGaMCU+VUnc2MVaSJqaCJ6K+UOX8/tOHPo9KwyFTXNueddSWoSmBz6Yl544HohLe
 timFtgFDPhlkN/IRG+H7P7Dyxii9cXkLR4s2QTmamE+JDpLcgg31jcEtAqsr7f8h
 9Dw6UWpYHuYKoRbW3RM6pUdQ8KncCX9Ccz/5QX4ps8UIjZzasAl4fa/OksA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a61p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-313fab41f4bso5063894a91.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206097; x=1751810897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufkxvlCaXqE+JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=;
 b=KnRjADbBVh6HhOYFjdQKQBu3zgyMxratjvckU9jHgQUjIsQ0wfehuv5VajkTNTvdRF
 mHwtKm5rnxXZi+SPaErkhjoMhuI9/gYqKKkcCQF3oaBpFxT2rq7GzMcnkDrNQAekuIvh
 lIgapGJjKyLjlq3WPus+qCKhfmUzQyAbcqB4p1/3BuPA3f4DTUOEpWm2qmzMbmUWWCQL
 QHjED4/Qg9tdf9Y0LiV3TOWkFSnAQehCevxofb0O0qSJ7P7g/Jyf7gHUX0/rHPBJHpFu
 uqba2r4FiLrQdL+WC7b208ZO4MpLrVvZrU3368C/09oeyYqxGuCrODSvaGo66gmEAjo9
 L76Q==
X-Gm-Message-State: AOJu0YykmaMUkYJBk1nMDbO4j2k+Icix29NVafQXyvBJpSsCTsFrB8ts
 6zaJlS2hiJoQhml46sfMztq3LKTzZvdEkXRUMPZv2BHageJvVJdV3hTtpKlevTrlFv9MeHeGX6x
 fYRGVohHdVxt1XQoan3//lipLRCXKAk19MrTYmSKps8Sk8Be2MTDSP/wP0qsgb5QvAmvityRNtj
 c/9Kw=
X-Gm-Gg: ASbGncvf40leBIOKBAL1g63+LLZOvbgXoY9W7oK06UNUkslTlyCBkDHNxSJ2e0foELe
 DCL+ITdudt7Jr2cxGWFqjxw/J3JTJglXq76HLisAlA9ng5O9MaAxentd9+22+xGh3S6RyDOTzJd
 o1VITPENwbVWuCk5fB+AkuUMGOjTrYvB0K/vidcWFly6nJh196lemADxzVRBrjL30FlvIuekVTC
 OhMa2Jai1NYixiZKIDdebCwZs1pVO6ve1mBD5AdksbwDqIGWpva+FwD7WgnrEkl845g6zFqI7H9
 NYoYYwUMm/OxpJyHO+qdt+rY1o5ebkR7
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id
 98e67ed59e1d1-318c930f9c3mr14566742a91.27.1751206097270; 
 Sun, 29 Jun 2025 07:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJayQhQWhT5vTJXy0mRK+FWWNsp3OY4G0Nbi/rEwA8XLYXa5Wnw/fbVSwXi+QB7lNSjIGwcQ==
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id
 98e67ed59e1d1-318c930f9c3mr14566701a91.27.1751206096824; 
 Sun, 29 Jun 2025 07:08:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c13921b4sm6582806a91.1.2025.06.29.07.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:16 -0700 (PDT)
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
Subject: [PATCH v8 39/42] drm/msm: use trylock for debugfs
Date: Sun, 29 Jun 2025 07:03:42 -0700
Message-ID: <20250629140537.30850-40-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686148d2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: n_NXLgc84yjGylQeiCHhSbOcqC5NH8kn
X-Proofpoint-GUID: n_NXLgc84yjGylQeiCHhSbOcqC5NH8kn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfXzxEK3Fs1v7XA
 iFNmx//atfaTPBWX39USEv60uP+YyDXTZw29s7gZ92GMjrVmp2XE17d+5BL8O5B6ikBc9eEjvlz
 fw5YyN0SBX+x9VB9OnhLeW08x7Mue+tckfVoXYFSAFj75uN+7+EKtfhB0rOdJA/WUn8qpHYyj2m
 4YJ3Ue9rkM+cOYxsCg0omWsc/xrNf8LJ+oavq/bXszXY6SwbjTfl9ZH95C+59g2jfYAWqSG3Xlb
 C7hc11z7e1kZoC5YRVxGE9pJO9+3b6Z5g/ytGpRZEk4gUu1QhONMhVJuKXF66RAYHrZdtPvgwvR
 vNomTZjNqkF2vk5SxJYLsoGr5lnDewB9lj8ZKZXNPXF5bMGK9kgEtirK7lKUx6mm2kya8hFKjX0
 rlU2bJliuKzD0oQ6KJoKgrshhPKNXZ6NnyzZzAmT22+86wOFMry4ziregkZBuGM7jN3GpG1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290118
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

This resolves a potential deadlock vs msm_gem_vm_close().  Otherwise for
_NO_SHARE buffers msm_gem_describe() could be trying to acquire the
shared vm resv, while already holding priv->obj_lock.  But _vm_close()
might drop the last reference to a GEM obj while already holding the vm
resv, and msm_gem_free_object() needs to grab priv->obj_lock, a locking
inversion.

OTOH this is only for debugfs and it isn't critical if we undercount by
skipping a locked obj.  So just use trylock() and move along if we can't
get the lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e3ccda777ef3..3e87d27dfcb6 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -938,7 +938,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ce5e90ba935b..1ce97f8a30bb 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -280,6 +280,12 @@ msm_gem_lock(struct drm_gem_object *obj)
 	dma_resv_lock(obj->resv, NULL);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	return dma_resv_trylock(obj->resv);
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-- 
2.50.0


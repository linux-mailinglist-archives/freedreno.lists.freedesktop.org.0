Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D448AED09F
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A2110E383;
	Sun, 29 Jun 2025 20:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="otwO/6/Q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BF310E364
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAEgsM011214
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ufkxvlCaXqE
 +JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=; b=otwO/6/QlbufEGIIqV3elURmoR5
 wmZaq0AzynUV8kft65Y8NbAAcDNbInMYLYrGRj08kPp58lLq0q4cbfGrAuijlpM0
 hEn9AoB+RVt9NflNd2jHG+exUbH9f3WzmUTzhaL4fREj5GN5C1ts1Kfnlm5vl36w
 8mEHa3lROIUKe058VXHnc0Ar431lBJiDsXevih5IdyFM8uXNVsyiK+A8Q/1IiRs0
 0D5gPAtedVAQHDWSVdkxXRUtGmK2lZuWftjlN+WX1pT3bRF+40r+5Mx/PRFEBmFR
 P6IZKg2lQ7CG6cTUxcPSKgZgbMKmbD9WdSa4DygOLZSQMgQHyi110G3hi5w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2mvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b3183193374so1161171a12.1
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228235; x=1751833035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufkxvlCaXqE+JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=;
 b=tU5J/PZs4fzDxnx/bR0HslW6dgKG8qk4vq8gO0iGD63ruzydb5Nrdmf+3y3bK7YpWC
 ZMT+V5jhvZf00dsTf2fG8skmG8PkGp/8tM19KndgK33NHalydGafKJKi7eVFMgfLjnWY
 RE7qA6+wA3pdu06NjlPmbx/NdZQ04pMKvrbHQgyjotSPBhI0ydRjF26OrinyMt6qJLcd
 OWYRCcIlLbnqoxYOcLx+x4+1Jd2aSK3zcw7NqFZNhtlBvEAiC3k0jlCCpgRaD45zyatF
 99iRz9JSdGP2XrbRetmA/RB5UPwX0/JpT+zKEd2O4dbWXquyIwjHKdWO9o49xru1gil2
 Q6Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNuP/eK7ZnOyR17lLqk64BVH9fe4aXl3lt4ylk/e7/u5LZI6yCpmbXz24UiWn4qe/NtX9CTqXnRek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM9y9yXPGgrYm+bnPJm73EeTyJwoREsX8KAodx70e/tGeXN8UU
 4ro0wt/FDS0FpMD28q0+FQVPaAStgJ9zkXLfwOAWiYOhjf9Hp0UOlj0Wt6PCiJZYnKeo+Tl+Kdz
 SHBnSVvg1qfAZPmFdqj0Q8pH47FJmWCcS4guYeDHC9xp9CtNn0IB+vd8eZn30zAcijkKzDMk=
X-Gm-Gg: ASbGncvmQnw1Pn8wEKe8udVK37dp/BI1nKmmwfRWimkKvnlItyJsf+AtxmPXKAYrwE0
 YQkT4iBjZoGnojFqwdXmcjl4MH+Gpk7oWJJyuRweKy/z3s263BTFUT8PZ5r3hya20wxvKEFZg4t
 niRIokcmOQlcBmW91R40HrV4e0loiqlOJ/jjZBRah9fmwlb50ynHu/OKaFdnPJjhz96NNJG6k2p
 I0pnA2aH7e69yc8Vas3MECudBNXESg6VdEkJ3hc+muX/ZvqYJ8tQWSKSZCLe5MaWzfvzw7lC3aj
 +ZxEEfSlL5uvnnXnf5Wq642EpqYTLVXqhA==
X-Received: by 2002:a17:903:1a27:b0:234:b735:dca8 with SMTP id
 d9443c01a7336-23ac2d86b33mr141348245ad.6.1751228235229; 
 Sun, 29 Jun 2025 13:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJvTw3e2vrywZVxfjZlEoy2MYDh/wxsQwXvulz3VBukHFPPCVpgZZypcbvOisjgkgC2KTm8Q==
X-Received: by 2002:a17:903:1a27:b0:234:b735:dca8 with SMTP id
 d9443c01a7336-23ac2d86b33mr141348005ad.6.1751228234806; 
 Sun, 29 Jun 2025 13:17:14 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f24c7sm63539985ad.82.2025.06.29.13.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:14 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 39/42] drm/msm: use trylock for debugfs
Date: Sun, 29 Jun 2025 13:13:22 -0700
Message-ID: <20250629201530.25775-40-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f4c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 0QDuWjt94emq2DPuDKhlvV51e_Wa0Mve
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX/Nu+jCMbZxP1
 PB8xJsPYfcv4UdcvwkoSSNmYwuSXWG3r+vGbsxN8TW+2BmowhVqJDeWrKIVgQMrl2MuVzIgzCv+
 qp0vskpEtj8BBi0gGyrkKjqmF23LGrsNq/Ko6VlQOGGTsXU7q73y4QXjedNpxI6/TzHKa3wrqIQ
 7PuRhlbXu0bQ7Zk7zyGUI7+hu1/6uSbUOrm5uJEfT8nsa4hOeP2x7vRfUxGxX7WEGssDbqiUPDH
 h0p9ON3vLhfZ+kKSp0czNyj4I0h3NFmnXaxI50OFfdtWjTPlqoz9+pCdVeOFWIBn2uQNZbDgypk
 4FXtwIfkOwbBvaf8iE1Zkmqmak7Ggswn3/TVRKMcVoboJOmJua2LhBJ3lhNxAkyeDtiqWzmZXUg
 Dg5Hk5Qs5RffnDTFrZLXZheeiiUF0yExBwX3KFxeXsGJknvjCxFVP5Zo+vfGQESTcSRaYgHJ
X-Proofpoint-GUID: 0QDuWjt94emq2DPuDKhlvV51e_Wa0Mve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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


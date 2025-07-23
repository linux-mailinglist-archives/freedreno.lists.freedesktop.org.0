Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCC3B0FB93
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 22:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D9110E858;
	Wed, 23 Jul 2025 20:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4pcGcy2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE17B10E858
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 20:36:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGuVtT009244
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 20:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Jg8G8kDUfiO
 0QN87d8Nmg8E9KepNpwzJOvRP22Q1Yow=; b=b4pcGcy2lrUKAQy2I10T3RvGn2b
 t+63HpxKZk9yhrSZUeuy2/3TlSqrKg2F+1OnALf1oGJQITkXVbZqIHDxbPCwySwv
 UmDVq7/oRsg08WoBQe80b18z2Jr/jVYvcgFVPnQeAGhljqhUK/B1eIsO/FKAfWvA
 0mYzny++ay/+Npx4rD0mGYKnlXoBJym3CYwlRgzXuhcWmxSU+pqlggkzM+k5bd3U
 AVxtjyZ4eyzypCIivqoymC51gqJc98wv0UZrnV2EekeDlRxA1nNdxIysNB6yf7RD
 JypbIqfiJajwQRnbQ4DnRP9ZekRrrm8Cvgha9DdMKH6REYNVOhH10ZjZ6yg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na4xqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 20:36:00 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-300254d9399so808721fac.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753302959; x=1753907759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jg8G8kDUfiO0QN87d8Nmg8E9KepNpwzJOvRP22Q1Yow=;
 b=bn3KbGAMOdBkWXqY+LPZMe1VTs9sXPJT27phsiqN2SwNc2P8kqHO+fQktt3PJX7fUn
 a+JkKxxdLXGQNrh2BNOfcMcls/UlgvAPU1PN9PUqAzgnN+UQrusT4LDgjTPp0smz+7Lf
 WRx4h0xKkvxcZxC11Q5vtqdTk0ye9Vv89wO1sqo1Qa4i6pgjnoLoMiAYhM8nH21WE0rL
 u4yer17CAFxBqitDfbd3TYPnVbaLRwDhGQffFb592I2XvUGnI2O2pRqpvM9XoBwUIcG4
 wG16kKApWvYCEh+fM62dpvvws1z6HYQaJIpfW8DpbQ7d7sqkepLiWs3Mka/wTx7sBmvk
 yZEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNyVq5hgVINNtRfFtcz7qDGRrhzTD/WxM9PDNufB3KgKgcitiVFYda3uGg7/jJuHjMDMGgFG4tMiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+4QDybPkiuq0DW1M2Fi4dRe7mBp5ozrrs/XP//BirxB1vtRCI
 oJnQFcx2YRvIAeCdoWAzyAXIU73LQChkz+wWJNzt5HjrACaZtvL+4BFmfW09WopW1v9BVmi/ANa
 2Y+wzUr6JTxGXqnntgWQ2NXYmNn1y7l9+/Ah/DHKNjYzHfBRG92Hb0392JmLXM0z/4JTqmTw+LW
 olorE=
X-Gm-Gg: ASbGncviLeIFj1w6A0++7fs8UfJOuqAIxnCsI6QKxPml5HaX8I3ijrBKW8YIoQTJVLr
 VKGZl9txh/OB7u0WNOzGMkIyjeSevY9HnJ7eWADtZZWCh40KRm99r4RKStI8QBHNwz1MW1wzqzd
 KAxh4CQnXZNFSJuvR1hhZ+Rd9ctdS46hTY7Xw9Jmaz7Tfk0HFrsPes+L6XJnJOqSKyTWmpFyxzA
 yxYtrd5stpOMjAzs+Z67hxRJ7AZGi8Gd+wLK2kQBsDWrpZZO48SIyv+y+tlxbYXhAx9jDTIYGLn
 1aUYe45St3NuvCpAxg91xw1TLtmEQHjAg77qGpIHkJx3dvKEh28=
X-Received: by 2002:a05:6820:8604:b0:618:f1b8:a5a3 with SMTP id
 006d021491bc7-618f1b8a92cmr1645586eaf.7.1753302958986; 
 Wed, 23 Jul 2025 13:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK5Ovk21o1hIxl/7WYP8zrKYd43nYxItlCMNkL0IAMZTWY2Xcbzi2QZeu1m8gPG607xMRIxg==
X-Received: by 2002:a17:90b:35c7:b0:312:e6f1:c05d with SMTP id
 98e67ed59e1d1-31e5073f550mr6078124a91.2.1753302513335; 
 Wed, 23 Jul 2025 13:28:33 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e6249fe9esm80462a91.23.2025.07.23.13.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 13:28:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Defer fd_install in VM_BIND ioctl
Date: Wed, 23 Jul 2025 13:28:23 -0700
Message-ID: <20250723202825.18902-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
References: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GsDHcDqvsSvA7TjUsRPgRu8lYvYuXJ44
X-Proofpoint-ORIG-GUID: GsDHcDqvsSvA7TjUsRPgRu8lYvYuXJ44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE3NSBTYWx0ZWRfX8RqYrMvHRKwI
 9MpqLVOEy3QnFdNxC99XrIWwxELklW45H9555h6d7AKqrZSaHLrpRSkoCXTP3JI6PLEQOq7wWdb
 6ZTMOwbvn45V+F7FpnycljOTVAKlL+CArov+IShTO90tUnr7oxAK9ama3EG99/8xnnBnJGPRPBB
 Ul+t426yJdRuXwFEj5XcTwjW3xKWelQKFkxAF3wpqZKysQ9cXcvKF2FK9e/Ee3zzxx2kiBGwuN6
 GZFiz4R+ByJAUAeJDteQpz3u3WUPptpGYUJE1VXcx99jChmc2XGTiT2xtkRJIAyh0MLP11/ZfQh
 eTVoak99DS0s3O5JL5E175pTquBdYbvYzc7/IYZn7yuy0pu77wOSlTBWFMNClo64df3BsPdLFUR
 743Fey0DPq0qL3u1ftCuKB/yChy5Gf3hYP8i1WclIYNkuXGR5Vs14TiRYkgwmjkADmzEpMBe
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=688147b0 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=p_L9ESIXKxyW_a9_XK8A:9 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230175
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

Avoid fd_install() until there are no more potential error paths, to
avoid put_unused_fd() after the fd is made visible to userspace.

Fixes: 03b6becb03c8 ("Merge tag 'drm-msm-next-2025-07-05' into HEAD")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index e5162db436a6..d4b1cfb3aa03 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1473,12 +1473,8 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (args->flags & MSM_VM_BIND_FENCE_FD_OUT) {
 		sync_file = sync_file_create(job->fence);
-		if (!sync_file) {
+		if (!sync_file)
 			ret = -ENOMEM;
-		} else {
-			fd_install(out_fence_fd, sync_file->file);
-			args->fence_fd = out_fence_fd;
-		}
 	}
 
 	if (ret)
@@ -1507,10 +1503,14 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 out_unlock:
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	if (ret && (out_fence_fd >= 0)) {
-		put_unused_fd(out_fence_fd);
+	if (ret) {
+		if (out_fence_fd >= 0)
+			put_unused_fd(out_fence_fd);
 		if (sync_file)
 			fput(sync_file->file);
+	} else if (sync_file) {
+		fd_install(out_fence_fd, sync_file->file);
+		args->fence_fd = out_fence_fd;
 	}
 
 	if (!IS_ERR_OR_NULL(job)) {
-- 
2.50.1


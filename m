Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135D5B2CFEB
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 01:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF2A10E227;
	Tue, 19 Aug 2025 23:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+Xj5hQW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A262510E11D
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:13 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0k0n029728
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=xOD0sf9vQpA
 36mr+XQVQk/HHckfya/iFMlPBFmcVO/4=; b=c+Xj5hQWU3OWNtFeY0EHlKy7/ml
 S5tMQOrEHcmUMpdv+G4YQ5XWvQhTgo3wTJrCQz0TERZCWS5l6cwsz9Pes32RY4mu
 4BVg1rBeIEYOHYEiA3N3TUUEkAb90GKegGLkICDjxMVENSQEmCtSiHuOq4R7InsT
 yNlzeqmnH16fGQ2kB9kLaGWDaCHiO9FeFbRxNy7RyBlKj2f37IgTuqfxdane2Oxv
 gXrtV/CuROTQJBmIgAbnk0BIP7Y+W3fpWu3+72+mSAsZHhOn39tbKZAuPvq6Q2lI
 WccOypGE5S0vUDt3l6gTG4944c8FflWWc+pcA3YVZfECyDjRkobPnIn5UHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tdr8p0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2445806eab4so61257465ad.1
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 16:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755646151; x=1756250951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xOD0sf9vQpA36mr+XQVQk/HHckfya/iFMlPBFmcVO/4=;
 b=A+7KKYVuN8Msp0GsI+bZRLIfg+943mp5WWFURpGvmgRo+ztnmbltwIJ9AyKV1Pnyin
 wZixoiljtxTOlDmiKYQM7iZj/+oBPrwN2uPpD5KR9BJWtXs+4ceH9IdRMa5J3KUXtDsk
 g3BgBLlDeebV2mILcD7d9g0xfAtTswoLoAfjvpkU+4hlbgI0DolbBzYeCXg4tpFq1z8b
 ja7v80yKSrSWqNG8QqiCjq7rFZ7sfCec2xzlOL6tg8oBy4cRk4O1OPXvH5UWMeiCn56U
 Bc2eQjXIKKUF5j0GJVTktxV0AbAsYdypn25bH1i6SMszkF2PJ7r9awLfm1L7Z2SuJ/vC
 653g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcSWZf7JL/w3dL3QFZYGOnA4eldI4pbJLqxG+c2z7OrEbXJpM9sYqM8rR0hYOjZ994iKhaLHGOxwo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqIEN+6XmbuwPXj6vVRh0lgQ1qgFOM1tOzGUqv9p52ievJ6CMn
 nxT4CF3FQPSzmFFwA4STNAvs4pfW0EJGFgRrOm46ugjHxCeCN2zoqpW7++FloDA09ZPF6a8j05n
 JvpYTNjJfVVdKx0Ff2L80miTygAP98XsrA2kcum5tnaHoUVB3IyFHgpJIwl4uiSNLSfu+8LE=
X-Gm-Gg: ASbGnct1qvRtLoLj+2Lyudp7vamnzAALJuyQJwSsdmifiPt7JXQ32Ya6xLrBs5+7lMO
 E1q6RhgtzBY42JueZheGal48FqF0L0mVzlWmCLVSki6BccplvHcSlidQvNc3fNMLDux5le9P9kX
 7cwnvkIGhPpflt+yljbhf6iadyQlGNhA09VNzeSpfs6TI2u713SZ7MqFv9/1cFnZPmBCQlLIill
 X8pHVeEc2VVVJKsRQYswjM9IBnfk1dnVTGLzTodUjys3XvvdSfKVMBqPySBKD3iZZU+lJ9+ApDa
 bJ6875oHz9akkz3XROMJTDWqG27L+ZYtmzkvaT9okmSgE5/oRFM=
X-Received: by 2002:a17:903:1983:b0:242:3105:1787 with SMTP id
 d9443c01a7336-245ef278bd6mr8125135ad.50.1755646151400; 
 Tue, 19 Aug 2025 16:29:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBNouQd1WNy02GNK10dJCaNN0bn7eGUl0jW23JNcTKuITpIN2aFC9d99JUYmsh8MwZPEEokA==
X-Received: by 2002:a17:903:1983:b0:242:3105:1787 with SMTP id
 d9443c01a7336-245ef278bd6mr8124815ad.50.1755646151013; 
 Tue, 19 Aug 2025 16:29:11 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33df68sm8352945ad.21.2025.08.19.16.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 16:29:10 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] drm/msm: Fix obj leak in VM_BIND error path
Date: Tue, 19 Aug 2025 16:29:01 -0700
Message-ID: <20250819232905.207547-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a4RpNUSF c=1 sm=1 tr=0 ts=68a508c8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=hfQrMx_BsErUUvjcJTYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: DoHud51BjSwuVdD_-QJEZNECSpKWIbkw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX1ozrA5lX8WP/
 CRDYFODUblhmqDZ0ArqMPJmGTTJb0gA+7G905Iz+9BrFDkMgZaBNYoGfPrXKN1ezh935G48X+jE
 IobF5PQP059fkSCOb9bW2++bqiVIgaTrM8Xtz5X+N6WhPok8jBw29strejH5WRnQKJqoqFqNdaq
 AzDRrM1gOyPEJNYmXdeXuHWg9dAJjHEB0vREGOZoG238C8WP6BY9gqzryjaau9Fb3NoYvkkS+xB
 ZkYmN2HifD68qBgaJVrclum+62q7D7bZJL+ZMNVW2jRWu4/qaq3n1zgYPyc4vmMCfY/rsdyveEf
 CkIzMj/cVYSt28yQxBThAc3P5JX7797yOzI0OHynkw2TsgKJTx1B1TIiZ+T0BlmuvZlT6eT8341
 VKrSRedDX4jq7XtLZSr1vE79osmNlA==
X-Proofpoint-GUID: DoHud51BjSwuVdD_-QJEZNECSpKWIbkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508190196
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

If we fail a handle-lookup part way thru, we need to drop the already
obtained obj references.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 00d0f3b7ba32..209154be5efc 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1023,6 +1023,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 	struct drm_device *dev = job->vm->drm;
 	int ret = 0;
 	int cnt = 0;
+	int i = -1;
 
 	if (args->nr_ops == 1) {
 		/* Single op case, the op is inlined: */
@@ -1056,11 +1057,12 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 
 	spin_lock(&file->table_lock);
 
-	for (unsigned i = 0; i < args->nr_ops; i++) {
+	for (i = 0; i < args->nr_ops; i++) {
+		struct msm_vm_bind_op *op = &job->ops[i];
 		struct drm_gem_object *obj;
 
-		if (!job->ops[i].handle) {
-			job->ops[i].obj = NULL;
+		if (!op->handle) {
+			op->obj = NULL;
 			continue;
 		}
 
@@ -1068,15 +1070,15 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		 * normally use drm_gem_object_lookup(), but for bulk lookup
 		 * all under single table_lock just hit object_idr directly:
 		 */
-		obj = idr_find(&file->object_idr, job->ops[i].handle);
+		obj = idr_find(&file->object_idr, op->handle);
 		if (!obj) {
-			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", job->ops[i].handle, i);
+			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", op->handle, i);
 			goto out_unlock;
 		}
 
 		drm_gem_object_get(obj);
 
-		job->ops[i].obj = obj;
+		op->obj = obj;
 		cnt++;
 	}
 
@@ -1085,6 +1087,17 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 out_unlock:
 	spin_unlock(&file->table_lock);
 
+	if (ret) {
+		for (; i >= 0; i--) {
+			struct msm_vm_bind_op *op = &job->ops[i];
+
+			if (!op->obj)
+				continue;
+
+			drm_gem_object_put(op->obj);
+			op->obj = NULL;
+		}
+	}
 out:
 	return ret;
 }
-- 
2.50.1


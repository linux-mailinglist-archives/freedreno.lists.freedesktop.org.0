Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE38B2E927
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 02:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB99B10E830;
	Thu, 21 Aug 2025 00:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnO3TDYv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BA110E829
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJI6s3002680
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=UUeZ954T0o+
 UR5vuNiqg0BBHjNOT7Hd/arRfZ79Ap5Y=; b=bnO3TDYveWTOLQkrfm5KcRB8buo
 9/wxJEHtJNuR4gVm924oFrvDt4dqX8QBrtQ4wfPF3ZkFOIbppnEeavSg0/NR5KcB
 nJeyjRuQRB7DplRV9XFwpxFA9rNRv0R1ajpcvmihLg2KNTZO6rintJ6vtBJe9m4w
 vxHlDVsFcV55q52w5k+wiY1jHQ4ZUlJQ/kwhPl6yssTnNL/iFqVFfTK+KiiMfreG
 Z70qJTUF0LRPC5Arcq4cUgww6QFylMX1L8yLKH5qppU5Hg0e8eh60SJMnVJK2PeG
 7maKAnXNkVHXES43FarV9w0IYni2Ys9b0wUmkGQJ3naZpHGyx774r56lZJQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528uc3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b47253319b8so221730a12.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 17:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755734675; x=1756339475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUeZ954T0o+UR5vuNiqg0BBHjNOT7Hd/arRfZ79Ap5Y=;
 b=DsUw35kmbLuuIdzYjGQR7ww+61CrHNfBsRJmeyqDngImC/5dafxGXvYpemPcTvlqwX
 59HOf1swZhdsNov7m8xg1Z+pw49BOd3VkCqFpIlQ9O/iesMSBeYk8koPKkV4wj+I0Vbv
 bQoebKWlssF3I75jcLCZ4I7U7EXO0gH5tTcjfcoFbfSuE/ehy1rtbYolTAnLHNqxic/T
 EyUEjv7bkUHe82RZCS1Ie9r9dhLT5Z3fe2JotLH39mscaDACLkM34URAXJLU/4ATva1J
 rllqNrgR4RYZ4z15JEv2G1xlsoJxeRzGpDchuXjetfgtgVkDu0ozi2ijqqgi46r4QPh4
 Sarw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm1+WbdnF97P+1/aWlTPITlDG9xx9WpOcwc8yJGeFeQP45d+VhRoD5SIoz8Q69lqpbZqFSuBBEB20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNTVCJlEh/vJvdc4oMsIc6p8BRjRzjxk5cNBXdcylcBIb1gL5h
 0KK+haHQAJqE0lM+KvubCNuUWmgB7x3tsOq4L2mGla/NYwOKOueJ7MfyB5sK8v4tUP6zqGjzFi8
 900/XSMdIsfAdnDa1h/xMuDOblPiGSRs59tVSQ5GtyAdGpQQWD8eXn2MEE9Vcg6ykuNusguQ=
X-Gm-Gg: ASbGnct2Z7+EnBpfREsYQuRWev5SWB8jlRO7kUN8WVd0DDjo6qg1zT3+fg1VMhdx4No
 VZEt6D6um4KpEcVdeZxENlLk/qq85aBCbET3t0AOSkqWePa3SkOvL7mvhWWy0klIH70gJmoB7Hz
 4nCIpjEojiPYwtXoEYTRzeP2ybiKdBYXvnBgJPq6kRzJfhlOw7w6GIhQ3gWGGdL0rtVEboN0L6o
 bsMts7dDlDMv4zOCQbwwFP4ZdbHUYWsTSgh/jk21PG4KAiDlrTzXEzluxa9YZLGm70EHLf+UAiH
 T4p7W4vr+WBhVC2OHjKVx/4sd5COgkvyX4H3rfYvwRDEBEMMDcE=
X-Received: by 2002:a05:6a20:2589:b0:240:750:58f with SMTP id
 adf61e73a8af0-24330a38b92mr513545637.30.1755734674623; 
 Wed, 20 Aug 2025 17:04:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlUnW8lxbe7CPRYj4ZEmunFvuRSStPlf00u91BAFQGx6Z5Mg65P2yj1AhS1x6n8d3UR7v6+g==
X-Received: by 2002:a05:6a20:2589:b0:240:750:58f with SMTP id
 adf61e73a8af0-24330a38b92mr513507637.30.1755734674129; 
 Wed, 20 Aug 2025 17:04:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e8f20c7dbsm3229516b3a.68.2025.08.20.17.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 17:04:33 -0700 (PDT)
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
Subject: [PATCH v2 1/3] drm/msm: Fix obj leak in VM_BIND error path
Date: Wed, 20 Aug 2025 17:04:25 -0700
Message-ID: <20250821000429.303628-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
References: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a66293 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=hfQrMx_BsErUUvjcJTYA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: DDuIWOmAQ7wy7MmxR748zgcXi3XIVL9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzumfnoAB8i+j
 AEzfPLPNHiNoj4yEuvMBvYUoJfmlWoPMLx5OcDHumFqg5Igc9z4MG5zSvG4LoLVD5UrVV3bM1P6
 IqA6dWg4kt11YWoFI/o4KFBbmZT0o+6eqAk5N4tuBS0jUkX+yQBjyAX1vxSeSNNCA6/hW35uDM3
 vUSpZywswAk3jzxd2ApFIZhNDUhKeY6DEj75LsrcV9pbITCMPp/p+a8ldTk+B6z5UNv+T6S0N61
 MJca+vwpbBH+fq4ITgDC+OXM3C11zDU2Z06SVo3Anx5XN/ML2A+SuOg3L1OiHPLaOUMFGZr37TE
 nueDK1/0vbHsx3bguQk915nlRFyiZ//b1su4KkURWDZkvrrHbTxf6xQpijyPmB4FHcjxmXVmDlz
 38NZFKz4UySkWWxuh//Ge8GE7QRerw==
X-Proofpoint-ORIG-GUID: DDuIWOmAQ7wy7MmxR748zgcXi3XIVL9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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
Tested-by: Connor Abbott <cwabbott0@gmail.com>
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


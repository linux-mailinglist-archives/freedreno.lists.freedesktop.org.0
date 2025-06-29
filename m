Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF5AECD52
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A4410E356;
	Sun, 29 Jun 2025 14:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqH0dLnO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B84110E340
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:57 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDC0ET015448
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/iFe2vNrJqp
 a0S0dcdbvotV9UbXoILAtHKmoL3TqRPw=; b=PqH0dLnObI0wyLWZYTsxKoc/+lU
 dhy15XQHsq1x6UU4b1RFHsjSdRAyJJBYd1jFQizvr/NjykuTPoSWZW7/5cRL6oxw
 tt3l70cJVV5bMH+C/9kWz0mNDequHZVq4xFdgZLdUuQd5mHGKouNhaHZJUfIA+6V
 bEn5xqC6LKqf9X0rWX4SrxOKPoIp2/TObItb49OB9yZyFQRxkjlDY0FOaYI8xWiw
 AYnBDqtmTTY5vpbPXi+VK+750vBJHU3EqMRj3Skw0i1Yi3EcyTIQaoB+CIPrnNcA
 K26RAd2HtcQqiEcfj6RwMAew8JGaMYGxaLBOsDuP9UTRpaKuKb2SFLXj7AA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a5yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-313fab41f4bso5063628a91.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206075; x=1751810875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/iFe2vNrJqpa0S0dcdbvotV9UbXoILAtHKmoL3TqRPw=;
 b=EV2WmRq1Obds06DtzUgpEk0/UNBq13b/aNEl7VY1ov1OkuY9L5pSQEu29f054Yg+fS
 jbo1YetkXYaCUyHgkNkMYAEoAEey+kUpggqYHUuADyGa3Xx7mnna576PTqfMPzpUsxgp
 TYsSS3va6gZua5dDQW344CLMyoe9VAzZRf3fOd+06wJqA55u19UcqruTbtzaUmjpfw1R
 rR4aa5NqT8FToz44412x9IVmba8PR/9Ya07vPbknw6jJKLmtjY3mXiX4ew1DVT4aoyRW
 4jNPRFHiJe+uW3+J1naXai0i/J3D+MynvcuvhJ6RmgbIeunzdKdbSnTDJNMI+8Ogg4V8
 eZdw==
X-Gm-Message-State: AOJu0YwO6ruqsBysFvdG/aKYYhz+NQJUyfUanGVu2+/hxGQwqdc1qmDw
 ljGvFOYwCNBSo9sbC1SxPePX24VHkhAnWtpm4Ku1SNQtYpMBzwA0Wu/HxV8flLo+Q9rZ4cIc3Ra
 Hlh9zFRFKpoRBkfUn6yDHfN8BhqEhUWLFIyn0PT8yGsZuIQn6Yav1jeEiwAhCO87AHNwgTtE=
X-Gm-Gg: ASbGnctUNYggDj4kphFnfBXkRtevzzOfoWh2J8Nft+8Zy7cJSNAG8sadh3FSiXDQygt
 20S357oez0OEDLJ9h6WY/vK0U0B/pqZZC7m+A5WAiLeArorpBX0J/IGaJMf3k6eJfwfGaES/4no
 IZ5nkj1rNsAfq9QFdHvt7wJKI+raM1ukp5NajC7p90LSj3P1s7MWvwvD8/vd2ZLBJsXz29CZiTy
 Pi7PulltnjkU9yok8ESIAxBlDypID3MJnYmslLv9ZDFheVKFyqesYGWnkRZGgtbNgV0e/T7NF79
 F7G5g8i6d8AT9oN8ZtLOy+21+n3aTY3X
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id
 98e67ed59e1d1-318c930f9c3mr14565167a91.27.1751206074992; 
 Sun, 29 Jun 2025 07:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPDMdsJ611F8y8JvrQrlcinGlj6zhivPonGdvEr/gwskrbg5lpJzq8J57v2DwyMT0wLTqjCw==
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id
 98e67ed59e1d1-318c930f9c3mr14565116a91.27.1751206074478; 
 Sun, 29 Jun 2025 07:07:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c14e224csm6959025a91.32.2025.06.29.07.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:54 -0700 (PDT)
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
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 23/42] drm/msm: Mark VM as unusable on GPU hangs
Date: Sun, 29 Jun 2025 07:03:26 -0700
Message-ID: <20250629140537.30850-24-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686148bc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DhdyfM8_h7Qj4WYt2N4A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: _mwzF3wkcvPlqfvfTztDiJ74LjdK_Hr3
X-Proofpoint-GUID: _mwzF3wkcvPlqfvfTztDiJ74LjdK_Hr3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfXz4OEK4DazP8v
 FUyD9tDUW5EqHZMzBZZITYRsAbEC3GRt0oZYq0CG1uqEUImEw6cDumEally4dQ7YhNwQQdpkWj1
 o8uksmxDzJ4JaNMzScSusWtL0eR08R6feJAubSdzOAHJZlyQD5PeC1/hzGca9nar3Fvyx0zCY2p
 StK7x3lDzqpQxAooSnLL8mhiWlsHBEN3Yuvi8dVGlkgTrdpy8N5G2DnVDNNatiyJZYrfnyro5s5
 U+ix4KEg1jAft2w5Y0R1F+FXWvopDA8ih0gk2UqTnwYm7a3KFFcSV8abfFoY2OCPaneB1V6VnTv
 KNAjC6obzlLQBG5aaJ+YruGPYiUU/sXIb50YId/aW3YjIUzSJcqdRVXewZJMrmUETbup94aw5JN
 ZIfYJclApnc3d4bcQ9RTp3omkxDxvMlImJGzUeV6MnOuYdhQhGuAzsqcSfmncvDg4H0RYNlp
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

If userspace has opted-in to VM_BIND, then GPU hangs and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index b5bf21f62f9d..f2631a8c62b9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,23 @@ struct msm_gem_vm {
 
 	/** @managed: is this a kernel managed VM? */
 	bool managed;
+
+	/**
+	 * @unusable: True if the VM has turned unusable because something
+	 * bad happened during an asynchronous request.
+	 *
+	 * We don't try to recover from such failures, because this implies
+	 * informing userspace about the specific operation that failed, and
+	 * hoping the userspace driver can replay things from there. This all
+	 * sounds very complicated for little gain.
+	 *
+	 * Instead, we should just flag the VM as unusable, and fail any
+	 * further request targeting this VM.
+	 *
+	 * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
+	 * situation, where the logical device needs to be re-created.
+	 */
+	bool unusable;
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 068ca618376c..9562b6343e13 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -681,6 +681,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c08c942d85a0..0846f6c5169f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -389,8 +389,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm)
-		to_msm_vm(submit->vm)->faults++;
+	if (submit->vm) {
+		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+
+		vm->faults++;
+
+		/*
+		 * If userspace has opted-in to VM_BIND (and therefore userspace
+		 * management of the VM), faults mark the VM as unusuable.  This
+		 * matches vulkan expectations (vulkan is the main target for
+		 * VM_BIND)
+		 */
+		if (!vm->managed)
+			vm->unusable = true;
+	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
-- 
2.50.0


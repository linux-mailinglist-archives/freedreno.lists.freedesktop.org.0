Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4344AECD07
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C4F10E208;
	Sun, 29 Jun 2025 14:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJSAR4tE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0181F10E208
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:01 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAKPfj008875
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/I8w26relc0
 8VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=; b=JJSAR4tERUHwHwcadQJAfq5Q4Ua
 p0kSHSAWTYEHTVrc3octjQkZXECoUrtgSHD9JZKNY7VohX2hAvtwB16FLQ97wHl3
 EPGWRWHhGOhro8CYGSKUFIlMzPjGrhxU+iSCTfgkP51EYqkPGJMPXk718ZZdGBgk
 FNfGSQfvF8dD6KV4q4mindWrASbL/geWg+0uTpPCTTpWxUUfMnw63geI9xePVCaj
 dJjbuGaAeBneAhjFHD8MLiIIZy1iUFoKIqooIsfgoaL6JSTFNAWmF4HJG0rLuUim
 iVpyNiMq03kgEqMTjnmN2r/AfElSoZxZJgo7CFksbIID3YoUsU0DT9ZU+wg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvj9p1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-748d96b974cso3149582b3a.2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206020; x=1751810820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/I8w26relc08VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=;
 b=s0G44EZcp3VXSED8yV0V4RWjUYtz0BkePDzNE6jwVV2w1fnl4DXHKwN9p3UQyLWI3o
 uiuboEtafI+RmcXIVklStSjFelQv4fcjimR3HIbjq7VzZBlIEMz7napi+3ROXqKQ9EpH
 ZuETwJf2vxQFXMxOyGxkEcjvzRVQPuv97Xi827DH/eTU6K4jf842aamupoL/DRnPRsAu
 vAIo2H9diflHKvVPtvBiWclWft3dnU68OVblgPBhe7T9k2yS9cRXeatNjL2+ypz9EF7K
 X8QqRol4Fj2bH403aIUbwQxu5KMdljcN/EuVJfdp5WFqHQStly1HLSyEbX9/RJe8oyAZ
 Q9AQ==
X-Gm-Message-State: AOJu0YxGMc9KabvXHhV8ku5hpNJHFcC58+ovginu8ctfJ0tHYcINmzOT
 hEIZ77XaWzyd3M42DMvYq4MSptPPXRS5I8NIIArn4BKjWy3IvdmCQJFVligfCEKQaL/qZQ7/OyX
 0TyvCbqqbx/zUbmeHnFkUZvA1mqBZpF0y4T2S4cDYhlU+pjBLX7tDDck2IztAVGv5wZf88oQ=
X-Gm-Gg: ASbGncugYSEn3VWkZv1m4V3DQpsEQIy0IcECE+8Thp8I5ea+x85dUTo4YcRd1sB+Q2t
 axQyfz+qESJQnxVqKIE7QsNgnTipqNcv/O1x8oUF4Vx9Qfod0q0BIwSs3fvXfwDxw4hRjqAchvp
 NMeiUd4egrtLJd86uThMXuPBm9SUqk5wnc4uQWn9SYVu9MhwEbBTPlE7bOqy5EXjofpUWpa2nMt
 VGHlu1HppEPkJDF2V5xbCA8/C7vSBJcwZNPZOb2mjp/QWGDmpqtxn7+CxlSoDEmMBGg39hogGF4
 z3J8vtMkEHdaww/2QPjRNzaDXjTw6n8u
X-Received: by 2002:a05:6a00:2ea7:b0:748:2b23:308c with SMTP id
 d2e1a72fcca58-74af6f445e8mr12526310b3a.14.1751206020524; 
 Sun, 29 Jun 2025 07:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWD00aCTKp3rmy1fVmYh7PmkKjE2n/hAouI0pUy6N9MI8tjXuNWwJzmYWFZ+STLslS/wIm7A==
X-Received: by 2002:a05:6a00:2ea7:b0:748:2b23:308c with SMTP id
 d2e1a72fcca58-74af6f445e8mr12526273b3a.14.1751206020100; 
 Sun, 29 Jun 2025 07:07:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5574604sm6982706b3a.86.2025.06.29.07.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:06:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 01/42] drm/gpuvm: Fix doc comments
Date: Sun, 29 Jun 2025 07:03:04 -0700
Message-ID: <20250629140537.30850-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kjD_FjkeIpkuKDfSsnCN5EqNm5-GhNML
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68614885 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: kjD_FjkeIpkuKDfSsnCN5EqNm5-GhNML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX2wU9uysZ06xq
 xfRAK0db6FTcFRLIkn4InEFbXxvyE+cn5hsqDCzHRrQJ2Saz/Eii4PlBanW8jqXdsrO0PwXdZLG
 dXafwubl6/M1tZpzi8NRaQG5eez5V57DvTAOhrOVav41eeIFmcFdS/Lf4PnU/rJpRpntneuqmvD
 Mu4EV4W0u19XT/NExEP4wMRM5CZip0ocyGUtIb2D6+aU06ZQhGC3pb13KFind1kV5PPms73Mu0r
 I93nP+ezRU1NDrppmKZkRHpooHagIZv/6CYZRC/r1OdLxx9w145F4N0UgOJlD3Qy2++vF/inhoH
 +v5Q62sPyqVOpBj+MVy+AfKWqmLB5PCA09lQH9u6iwSBwJMGalSynN91OkvhLDOt7jvUgtq5rYT
 WZWeCJPb5vzaRYvUxIG6HY6Pu70BMAtl3UFs1Ae3IOU2OjOxxZgsQCSHlDp47oOpl6qPIjbC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119
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

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

v2: Don't rename the arg names in prototypes to match function
    declarations [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..0ca717130541 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2299,13 +2299,13 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 }
 
 /**
- * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
+ * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
  * @req_obj: the &drm_gem_object to map
  * @req_offset: the offset within the &drm_gem_object
- * @priv: pointer to a driver private data structure
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
  * &drm_gpuvm_ops to call back into the driver providing the split and merge
@@ -2349,7 +2349,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
 /**
- * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
+ * drm_gpuvm_sm_unmap() - calls the &drm_gpuva_ops to split on unmap
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the range to unmap
-- 
2.50.0


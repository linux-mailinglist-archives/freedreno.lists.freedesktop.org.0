Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C27B0651E
	for <lists+freedreno@lfdr.de>; Tue, 15 Jul 2025 19:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526DB10E231;
	Tue, 15 Jul 2025 17:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zgdx9DnY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AE910E231
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 17:28:24 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGD9kB022695
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 17:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ga9LEiLYJZQSrksTrc649E
 EuSqapBL05a/sdzXt+JFI=; b=Zgdx9DnYQolsWxN3RaF4WTQGbUGMvVZwdqwtg3
 yJF5YxVONXbzLdUi1XY/eDsLKxU2qhpstoi1FcC3jj2BInJGpbcq+yXsVlopy+Kf
 a8BK6PSAn/pCcLYwkV8WvalxIWEXBzxO8EBijO9C3J3fsUCv3VswAji5OAMAFxk6
 o8cex1ZhIH/PR9WjhGJHxFXGbGuk95yjWfDJNu0SUZxblpNFnb5zZEEbb5E++JLH
 ynbvCpatNR4rcuPAcgnHYAKOdp1B4Qknxd2obMavVAm1HYR2ZVdC3eOOCKNVxxCF
 oRpaUcJ+4hpq50TDRzxgNOoaHDhTckmguXma1HcZMmDH9YEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkruhrcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 17:28:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7dabc82916cso1022075685a.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 10:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752600502; x=1753205302;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ga9LEiLYJZQSrksTrc649EEuSqapBL05a/sdzXt+JFI=;
 b=iiKLEzqkFHsepxRPzMYUHUkgdEQ+HSx74F5bDzBI7kTe53YySqZO0+Oj+jznrvcqH1
 r5mlEooOYWHtGiEVxFj0EoGtqdxEylqLnjz7oc1NmeZm24QuYYFaaEcjK5+sa1L0MQcC
 VfvdxLxl6Sq1xY/yIJND/apen+mcWaLPEoepZmxO0dLxYWirYVOhKPZ5s9u+95vSg5gE
 OYYz+Tj6TbWzqS5Oq0TVpx4yL+Zjt1IvvRYeXpWfa/AYEwvZsLmSsQ+o9CqUPaenTrbr
 UXmU8caaPrfcurzNxIuvQeD/Jx16JlfvOE2hvkPOWYYxe/UqTicV0J7X7gSbC80wOqfg
 sKfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDGHeTq1/ABWZsaXfEhGT6KK+n5uK15YuxfvwWBiGykfUOrIx/5jRuH0R7vhmRTf4rmdjNh1ffjvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyrlth1ASiFEBYxghCi5pMUuZOPl80NhnNdH52cpU5tkAti8Zb+
 NxKfLhohtSLwNqtul8JFC/2FFPQPzxvR+FMpZFE59hvCgpkBr82wkUhs8dro8mtCOLOcw+7JxBo
 aF6bPtCpcnq62LVy9bqu0nFp0pMfgZG5fu/oG1IBMC6FHCgroLzpjIKLjV7Yd2wDfMZ41l0o=
X-Gm-Gg: ASbGnctU7icbuA9ORubfxhAnn+Nrk6u4H9UwXDW2z5uhPHtkcgOWC86yPEcmWawy8sx
 YguLxrS0EHIZrleexDHhy7ujkHIfBWw6SH5BRyfpV2uPuFoOt/NvN2IuRnEd4gYRnrEwECXlghS
 qr5c+gDX+8q828zv901OA1XzsYgxR9n8AW5Q0nBlNsOtab8WfqZMytSmw4QpkTjdziFJXKvnxWA
 fWSuai8DAPk6E6UbIHBZ4UuHhBuuNJgUc+/m7Qlvrv2d5ebftFDB6SiecDC0QcF5PV4cBaCrBDU
 +EzWMtZ31zDfFy6kIvruWLeKEXmPN0dNG8Z9RepTwP/iQPeDVnh8C9DwvpRvbKzdqjoelHo5yjg
 nztdCOVjSOw9xm+74SRcDd5HvmUOR28NJ6trgX5oV4Cz9xkj9M3O4
X-Received: by 2002:a05:620a:4714:b0:7e3:2bff:78d3 with SMTP id
 af79cd13be357-7e32bff8888mr1121107585a.48.1752600502311; 
 Tue, 15 Jul 2025 10:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZEzJG58hA6++K4A4OjwEpcmW9O7bWx0NfNEZFoHJsNZF3DRzQ7RzoezJtTWpqnzcFg4UR8w==
X-Received: by 2002:a05:620a:4714:b0:7e3:2bff:78d3 with SMTP id
 af79cd13be357-7e32bff8888mr1121102885a.48.1752600501890; 
 Tue, 15 Jul 2025 10:28:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b60f14sm2386192e87.155.2025.07.15.10.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 10:28:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 20:28:18 +0300
Subject: [PATCH] drm/msm/dpu: correct dpu_plane_virtual_atomic_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALGPdmgC/x2MWwqAIBAArxL73YIV0eMq0Ydsay2hhkYE4t2TP
 gdmJkHkIBxhrhIEfiSKdwWaugI6tNsZZSsMrWp7NTQ92mjRyIuPhBv17a0Q0sF0ouZuNGS2idU
 Ipb8CF/F/L2vOH3a4SG5rAAAA
X-Change-ID: 20250715-msm-fix-virt-atomic-check-ae38fcfd9e08
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QdqZrsXqEfuVxvLXTf6lvuSiH/gRiLYnrwqhir+p7vM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0ZZ/2YZ1c2H2Pj1pe32uqxj1Ftbcdjz97cdMz9dZrSOf
 nvDZ8mfTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBM5Jkc+/8gboGC1u+Rn+Oe
 fs5qDpzVuqJaZLHg9jlN395YqLoL/FjwvWXypUm9wfsNwj5+nigwM/DvepWmz6/elttbBF/iFmw
 /FdPpxjPhZZ2lmnnOtV1Jx8+l+nYlO3Rqr/julXSXSaT4kerSwExm48zSLTPvuAtGLls2zZztYK
 JS9PJzrpd1eWbndHzMOphqzrE3Il9+/pov+1I3T57JnZ7v5+oZmpnufZlnaUG+kjnzI82oo2t+9
 Mwsc2eIk28/1G16qjllgYyh56kbvzdq2b+yvicpwXVLWd3TuJhhWqboT6fypit3J+fraH/NzJ13
 baleq6214gxvli3MNntKWj7vnNqwVOE534K45pRa5w0PAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: PYb10O9VGAV3me7_OICeAxbERMqh6e5n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE2MCBTYWx0ZWRfXx2UDUabcUYeC
 TWX/lrDOqmnwDcEw1Ja3mXCQDIW4XdotKgzDa7CvBjLZ3GlsulLbSRLVRrMuLhkbpv5tyAzigw/
 l1LYFGUIw1cFqXsIMUIFBA/xtxolfdlpblZXETYw+o0th6/uKNAtzq1RXOHtc1OWLFf36CH3JRb
 Ny+ZuvMkB4tgVoFWjIjsg8egDZMPSQotqWGy8hMAr0DY+DrYzreVCe0CTRYYVSJffzkHyR+sSbj
 Teg5eRgiLYukUqVaVJdDKtlg9k+K8nAtMZjSr0kds0CkbEYqGVWsYiBKwXpikgnuCuagc0mFSOb
 78WudeDi8gXgbzro0VdAlYrrNBtSoPpf0e44IMTEwrFGx568c2jYfARibNcp6qjZU8a0ZcGLlS3
 E6CplgWNTWrHmSK3cM8jo4d5IwcDETdlHUdgeh8YD5gLBTzB7mikNMPAHJik7leAsNsrbB34
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=68768fb7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=GxcwXDoS6YlZNtEUzcMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: PYb10O9VGAV3me7_OICeAxbERMqh6e5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=788 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150160
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

Fix c&p error in dpu_plane_virtual_atomic_check(), compare CRTC width
too, in addition to CRTC height.

Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507150432.U0cALR6W-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 01171c535a27c8983aab6450d6f7a4316ae9c4ee..c722f54e71b03b78f3de82fec4f2d291d95bbba3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1162,7 +1162,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	if (!old_plane_state || !old_plane_state->fb ||
 	    old_plane_state->src_w != plane_state->src_w ||
 	    old_plane_state->src_h != plane_state->src_h ||
-	    old_plane_state->src_w != plane_state->src_w ||
+	    old_plane_state->crtc_w != plane_state->crtc_w ||
 	    old_plane_state->crtc_h != plane_state->crtc_h ||
 	    msm_framebuffer_format(old_plane_state->fb) !=
 	    msm_framebuffer_format(plane_state->fb))

---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250715-msm-fix-virt-atomic-check-ae38fcfd9e08

Best regards,
-- 
With best wishes
Dmitry


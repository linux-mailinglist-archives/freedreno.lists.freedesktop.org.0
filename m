Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4AC59FE5
	for <lists+freedreno@lfdr.de>; Thu, 13 Nov 2025 21:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB9010E209;
	Thu, 13 Nov 2025 20:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTHVYmX4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5aV5e60";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D11810E209
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 20:40:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADGr3mh906222
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 20:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=un1sbvC4EIJ4U5h2uAEeAY
 8i8VLppsg5RBzR6nEWK7s=; b=lTHVYmX4MIZIUUx/+AS+ENIcMw86Zs4P1N8w19
 pJi/0I9ziwFEpEqoR4hBcdhL91/7ypQ7G9RORfSj8Z/pANHgY8zcCQaEkb5yNVOB
 k9qMXlMn0VuVSzxPy/UWABQsK+AbXZ7EPRaEOAtQdQglxN4iYZIBG4cnab4y3O4x
 couksKNHZSIMaejjcg4r3oRvC+a+oZ/WturNENb2SVvEy34npeXdypXpgeLHuzwE
 sUKB88PEnyAF6nHvdkmO/ViVMNyIKQkVArruoSgS7owsVBEZf+JQrD+sAIUShpSw
 8CK8az/kMVYQ3CmbXAqlF1ENcq5brr3/hSUfABysYCcGq+FQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adk828p3t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 20:40:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2194e266aso427012285a.3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 12:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763066453; x=1763671253;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=un1sbvC4EIJ4U5h2uAEeAY8i8VLppsg5RBzR6nEWK7s=;
 b=V5aV5e60YbHlHHaGtKGWn4tvzW9wyzsr6hIdGIlVGx1mcnerJsxJGkTjsZkvOpv0bn
 If+2lavK+/1tXHSCOw7A54uFHpZXsAZhkNoV/BkNic0W+C4pvJUkHt+fQiMLNOebpHrW
 qPHdCbDoS4Qhroud7A7n4LJFnKziSpajQgeIYlWmBUpHHNCcUpX5ryyL5LFzZKXFtgAV
 d6dLttGL16p/tAxLD2HRWqUrhGBsbx8fNNgGjnc0s+P2F1UjkbG71iS/peixG/aYsscH
 PmtO3XREq8ckQytEGy0VWyI8uIw0ARvlZGhBIfylFkYqgSytX8ePVPUpAYuVhk25rN5t
 ANGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763066453; x=1763671253;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=un1sbvC4EIJ4U5h2uAEeAY8i8VLppsg5RBzR6nEWK7s=;
 b=j35OQeBT1dni+Bi3/iFznwV6OTqOJjmK2vneoZc6RrnhhWImiLDMmeQj6YvKf26H3B
 bLMuDY3iffLjTtoZujyG/x9jOq1DMl1TSienNjd4O3jR4n6FRN9JZVwNUcPKO4gIw+19
 pIVHwcBzO95TRRjgaBEnVz4/obyxFg6L6EktGWIaEObJOswrx1jHDi1STpLuRQMMvlfI
 jKd24zzp7pguzClsIvyMIUmnb7MMVd47LZFa2ddwGncQQW17Kvslpglyn7zVXyYR0i0V
 2rQJh7n+lruRyFSIdBydAULRtabpjNgnY3XihwaJJ+6Tn9X4Lj3NI3rKBLkH8nS7vgVm
 Z7qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVML+eVTnLM9rCMehqFj/FSP0WTtqC/6tv8BGQ9wvIiVunJUh+9VsgarXBaDfzBUUoBzCnlME/igDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYR5e73YWSdzGxJ/Dbr++VOd/44PuPUbtL+lEGq7F1jT4YK9OD
 mbWVNVseMD/2/AOfJ9aHQinofQsZU5lSNUHOtTOd57MJcV3m6Zll1URwvtGXWRCtf9VqhaV5bBH
 OV2azNYEDLMjvQr1QxUXzQwdpJCh+eHGteW11iH4ixMagXwD/wn4UH5vv6flJ42iutcwGCZg=
X-Gm-Gg: ASbGncv9fYZc0oI+MTanHQ26FNZeS+Y7YO5GVoSA5lGk85NfK4Tm/+HVe7/gpMFFQnC
 JBnN/uvYqoO1+JmsO/qsloR4znfVAYoRx1QOShfabO26vTmS5hhZ36WQajBbfSXH/gaBEPTW1Zb
 053Ty3E7AEDoEIZFz1MV94nn3Uex3++vOZU869ouuhHnvX+GGKAw30dUMMWl18GOhJOae5zdDC8
 rLzD/GWGsQFGUzu0ieoScilfuUedzWr8VORrwekUP2bxe47WfIAL+eyU8EEOlVAac2Mu2e+Hdkc
 +UD4VDjVAOJXSSJe+R2qFU0trSm9FyRq5QXH+1B2Ub3Jbe/v6jLJYu8s8vZOGmQOVUh3gDl38jW
 wv9vBlGmdW05Z9r4AjC7ghDm6HkAStg29v4CIb2vs5oThdkzcYES8OBKTLExvIIOFOKQphz2tUY
 0edWNs1U/UFMKz
X-Received: by 2002:a05:620a:468e:b0:89e:f83c:ee0c with SMTP id
 af79cd13be357-8b2c31c782bmr99106785a.74.1763066452608; 
 Thu, 13 Nov 2025 12:40:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJcep4EHFroUI4le9fG2p8XxLEpE63t3UsRzTaVzkNUFIpdtbATFPMKQRz+CrN9TDqDI3V8g==
X-Received: by 2002:a05:620a:468e:b0:89e:f83c:ee0c with SMTP id
 af79cd13be357-8b2c31c782bmr99103485a.74.1763066452109; 
 Thu, 13 Nov 2025 12:40:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040567dsm607217e87.86.2025.11.13.12.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 12:40:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 22:40:50 +0200
Subject: [PATCH] drm/msm/a2xx: stop over-complaining about the legacy firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-a200-warn-once-v1-1-c28bdc8e36e4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFFCFmkC/x3MQQqAIBBA0avErBtwNCm6SrRQm2o2GgoVRHdPW
 r7F/w8UzsIFxuaBzKcUSbGC2gbC7uLGKEs1aKUtERl0Wim8XI6YYmC0du36QGYI3kONjsyr3P9
 wmt/3AxdqlE9gAAAA
X-Change-ID: 20251113-a200-warn-once-55f47c138cbb
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tj7tl1xY75QhAePiZ/+a/AlI7VgVWoD4r4G5vQ12TvE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFkJSdvuNwFeOIk5OMolNUdG/dAJrrYoH2YqeC
 q5pIr7R0weJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRZCUgAKCRCLPIo+Aiko
 1dcQB/9L+DF++n7lQF+HQ177fs6ET7FY2o9xrczoEC5Y8wtn8ZJaLVnxYRLzaSUkoJb/4pdkL10
 DZIdKuCGMiyCAlfAZYDhdeY+O0dh3J44hVCij4UliwOvFoO2ohxBqgG/CldOHC2RH4S6uspnXN/
 EK3/Jpqj++7yibambHKiBA2PsI8cOK0LMCmHvrRpeCKoJokXM0OiA4mk2TveKPxv/OfhJk9abA1
 TnXorBTXRQVDjtjjDyh2bIK6KYHOYNxCKln5Z/fIO6gSzs8WvWKAO74KWSpAI9tsOxbekdGGSjY
 u9YhibJjAHKiJRNfeUPIfeEABal9rqv4cx14z1Aml1CvsCpJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: OjubH5a4Ev-CRHS-If-VLvNpQcx8eI_1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE2MSBTYWx0ZWRfXxS1svqB0/rpS
 0b/foCoBv6AF8zrg5WXgNQHwzMVWYfWPlWRSY0MZRcEAeI0xdiiUBgqcPWEBHQfE9MA1IgojQwZ
 9NadvYIsUv1CnnE2y4x9dO+jSs85VIWD2Ck67cotfx17ujGCTMHTj/YItHuWVi3sNWDLXFMYFK7
 yQUk6PgR1WeZwGgzsRC9B8Z0b6ezio0ee6Pw5CJISYRhIBmq0l1eiiD/Vnrebvxmym1QogQpNFw
 CuefYlnmkL7LioaNAgpWLjQXSTsPhOyV+bWDDL0Tl2YmNJQmu5f/zH8mA+b57k8MEH5nCGLruaf
 uzXpUnoxXLdYp3K4sVxrwxCl/rlow4hlO2kMgVNvo1z0lwn/V3TrafuMNyUX29nID+/5+R6siy/
 f9qVBPpi9sQ785JBi+MHWB4LZcatsg==
X-Authority-Analysis: v=2.4 cv=Wa8BqkhX c=1 sm=1 tr=0 ts=69164255 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5wgBRnbEGa8ryjaxEzAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: OjubH5a4Ev-CRHS-If-VLvNpQcx8eI_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130161
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

If the rootfs have a legacy A200 firmware, currently the driver will
complain each time the hw is reinited (which can happen a lot). E.g.
with GL testsuite the hw is reinited after each test, spamming the
console.

Make sure that the message is printed only once: when we detect the
firmware that doesn't support protection.

Fixes: 302295070d3c ("drm/msm/a2xx: support loading legacy (iMX) firmware")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index ec38db45d8a366e75acddbacd4810d7b7a80926f..963c0f669ee50d4568b521e2e8548e04d606d9ca 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -234,7 +234,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	 * word (0x20xxxx for A200, 0x220xxx for A220, 0x225xxx for A225).
 	 * Older firmware files, which lack protection support, have 0 instead.
 	 */
-	if (ptr[1] == 0) {
+	if (ptr[1] == 0 && !a2xx_gpu->protection_disabled) {
 		dev_warn(gpu->dev->dev,
 			 "Legacy firmware detected, disabling protection support\n");
 		a2xx_gpu->protection_disabled = true;

---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251113-a200-warn-once-55f47c138cbb

Best regards,
-- 
With best wishes
Dmitry


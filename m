Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD46AFA492
	for <lists+freedreno@lfdr.de>; Sun,  6 Jul 2025 12:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D6C10E283;
	Sun,  6 Jul 2025 10:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBZjEbQa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A41C10E042
 for <freedreno@lists.freedesktop.org>; Sun,  6 Jul 2025 10:50:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56690iUQ002607
 for <freedreno@lists.freedesktop.org>; Sun, 6 Jul 2025 10:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Pcd4BLImn7q/BF7cV2K1Zp
 P7hDYqnAQYmYuUNx48W14=; b=UBZjEbQatqU9+Ki+/vwADmdgljBOhy94WKKtYR
 brIORsHliOrUBdtpp/1snSLoFcSLMKMMeuw1HQjWXELWRFY/GHkqMkhADf+10IV1
 51h1/cy/hBJu/SOOATkzZ/wUov/K5QHLqnCt73Y+PHRgwDgMQT/l5t629Kx4kX5I
 D46LFNOa+igbLveT3xDwiPEkpueEZtyPQTihwNIt/iLH6lF8s0e5XlXPwETZmPTU
 lW6wJ+Up2/19UHn8gIwITZyQWuGZ1Im7oXgc0NJGCFaXNLif6PFuISvbgoWAQNnz
 NaTtZraH7keq0mG4R92/XT0shESvgAAoXlUNc2RvxcPPib9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0vukfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 10:50:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d413a10b4cso343383285a.1
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 03:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751799044; x=1752403844;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pcd4BLImn7q/BF7cV2K1ZpP7hDYqnAQYmYuUNx48W14=;
 b=Mq5ahUIwqD0mmMMDVzAwZV7A3KZoYLSEFQxLExuBycMai716ou06h/x38noHnC9E9p
 882b9IvEn76bhgshoX6NRFV3tbbhbqbr0ivyBcu10Hzioff0ORgLJAfFpFJpt3QdufxL
 0CX3sl/D51qWU4BRQTGhuVkfus0SS0QwVQPIEZNTo5QjOGk4CtHZ4fuKxg2oHAyW/70l
 554j2qcfcVceWQJrgbWWMS/JWKpp+6wQhzg38kT7iuPFP+IyIcyQIIWStWgaKl1Nv6Cq
 ow6OY1NVmMDlUONsRJFxG+qI1bWG98jZrNyOrAcweQEePF0qGcrBivZmf+M8w9DuPq0l
 3C5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb/ZesC0NVauMRP4orCj+dVJIRsjv5j0B0DiSfOU8iGkPe8suS3yvBq1IwpkiQ9ocMb8VkTrM0lf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl7Ket1VP7wZ8ukUipcSkdDpjRvPezdCMI5H5fHYmfIEnOH4YD
 uD+GiNMy0Ej4VkAAmfSccIAM+vSemiD7YzVrHdPLGTp3zQR8ocoIlJdFkXpONC9pa9Ps7deA0jd
 VzUdA2oaXGOltThL1+G9WQ91+5lVfMmiUUmf5mRjdysWH1hFhuoFURHkF4Lg67G9LRqGHjfg=
X-Gm-Gg: ASbGncvxnX6VaYIgmOL6DMt+5ZV5+LyGJcbr3aHlKIbRFN1Q+ZFkOycuXpVl3R1t7m6
 P/7MYfJ7w8WdCL4YcZKLbpK57HDC6Rd3l+tgLEmtRjdZb3QS45dSzo5vs6sCdFyjU5Of2y6ZIr/
 tcLzwmSL7uSPpRyLyY4lObeWaB1mn3+Rw2l4SdEIkBxhXO4VwLxFWZAgeP99eakRnn3YHh7UE5A
 E8EsciDIUp+tRf7dV2jSEw9Si2vJGMw4w+iCID11k6w/jNNWURSVCkFTE2yn/TT/DVZz5Uto03Z
 qQk/AJwHRxANDFJq8YuQIMfFLJ6e5ZGy7lSDP0/oHgCznxIiSSOHO4Wk8LRRooQHfnxgYf61I+6
 X7ZU4FBNDjvsDcoK+9lW+s+tu6wopYlXFWj0=
X-Received: by 2002:a05:620a:4510:b0:7d4:4b29:6eb6 with SMTP id
 af79cd13be357-7d5f2f3f4fdmr574461485a.40.1751799043778; 
 Sun, 06 Jul 2025 03:50:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIukBC1av8TGs1q9stHT+YVv5BfUre5Y4Hxy81XIwRrW2ee07LeCFv+0xcxt99ugtxwdvE5g==
X-Received: by 2002:a05:620a:4510:b0:7d4:4b29:6eb6 with SMTP id
 af79cd13be357-7d5f2f3f4fdmr574458885a.40.1751799043328; 
 Sun, 06 Jul 2025 03:50:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383bb555sm920621e87.20.2025.07.06.03.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 03:50:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] drm/msm: drm_gpuvm leftovers
Date: Sun, 06 Jul 2025 13:50:35 +0300
Message-Id: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPtUamgC/x3MQQqAIBBA0avIrBvQARO6SrQQm2oWaihFIN09a
 fkW/zeoXIQrTKpB4Vuq5NRhBgXh8GlnlLUbSJPVTo8Ya8SUUXKMFwZjyZDX7HyAnpyFN3n+3by
 87wdslSUWXgAAAA==
X-Change-ID: 20250706-msm-no-iommu-c15212a0e7ac
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=abFeflhuiqRXobFgO/j4I/E9aQ+Bpgb60piKwMt7tVg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoalUB7YNmLatqn6ankqSO0Hfjb6vNG59uNUcyR
 yfJ92XOnBeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpVAQAKCRCLPIo+Aiko
 1ZbiB/95vo+RcFcLBiOFi/mP3tiH9pE2NWoK8npFIpTpCeQvnianNFvEoT6JbXnLTQ1/tIINrGR
 Crby7aelzzZERQY7AONv4DgzKnW+nwyERsa+RG6vPlDNlNwzY1e93D2bMC+enH6SpHKpZqzXiIF
 xgY46g5s5APYU3+APnXEQVl3Ir2X6sUUgeJP44ZYAzafQIJXDcq3YKWsMfp/AH5dlU+DVl654im
 HTizMM8Y0BJ2jYmO4gQKvnv9KuBj90jW5TFh3x/yvtwq4rPzxsZddT+b134io96Zy0uFVi2fpqT
 m2WWrSEjS0dXQ0q1G/HVBbBhJahvmlZx/DBArw+3++tE3Sdl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: MWL3V7stR0cr1E6FW0RoUORolyza-XrD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2NyBTYWx0ZWRfX2+FtBL8CDQwR
 nWkmmluMYlIk4B8RcL/eZyqW1XKlzH14nzVqfI+QNnM1gO+cUqZbVBJcMkVtLkef70oXbFCUdRu
 wcF8WaOpJS4tzaIbMZbwlGxKDU8qCxv4wi3F6ACrmXwSc+itZioMOf1ey+64KLxZADNdwTFeC5i
 KRmyVcPI/04AgbACuoD8PVmZbdyHjP7PFTrkvFZY1qlz0btUZluZnCdFSxm5+odSiAPrlnP5IIf
 vym4mp05L5qrf3wQTV03UTfQFjU5LRrlKixi0mvjTjzCdzh+voqQiq6BBdxGxO2gpcJcd0lth5/
 zErp3uDlisDKTs0DsFjU0uleud2HYq2hAHudfwp2ZFmoOVL1pVNns3qQp4BhxbRyDHzYua3XsQn
 TJrzEY6ztEzCZmoWKhb12/ybp7UrYNMwKsXYr/tMBkRimEY1rc5SCu6M209+BaYgU48y+jHG
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686a5505 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=OCoH8Ai01jLj_7CUrnwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: MWL3V7stR0cr1E6FW0RoUORolyza-XrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=955 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060067
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

After switching to drm_gpuvm, the IOMMU becomes a requirement even for
KMS-only devices (e.g. allocating a buffer for DSI commands now also
requires the IOMMU / GPUVM). Disallow non-IOMMU configurations.

Note: MDP4 patches were compile-tested only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      drm/msm/mdp4: stop supporting no-IOMMU configuration
      drm/msm: stop supporting no-IOMMU configuration
      drm/msm/mdp4: use msm_kms_init_vm() instead of duplicating it

 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++----------------------
 drivers/gpu/drm/msm/msm_kms.c            |  4 ++--
 2 files changed, 7 insertions(+), 24 deletions(-)
---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250706-msm-no-iommu-c15212a0e7ac

Best regards,
-- 
With best wishes
Dmitry


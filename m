Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EEFB2E925
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 02:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C912210E82B;
	Thu, 21 Aug 2025 00:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aw5gBfz9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467A610E297
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:35 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJI6s2002680
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=h/QHGAqsGwM2i5MHloplb39qjZWHbgGxp7s
 oSeiPiFw=; b=aw5gBfz9MKN9vJdrpHWypLK6QY5oMczoueFtm64ZjPpgTxdg/Sa
 GC02oGAioQJ/deR2sjjMx3Q0SjvzTjrYudj9s28UZhxeA0UzZb1RdJHIXqOm66yZ
 8wv1ogTsZtiDfIVrspslTr/gTY4frYeFm0QT5okVoaw9tpNucy2CdTELCTYF3i3O
 x09MuGSyYN/M8RtT7R0ewpcA++jSpGWU2sUtpnoNBA1VqWkH6HqIl6ms0FUfbawl
 QE0rnxmjUnMPU50orHI8/0XKkJ0sBxEqzbYxjr704ayXwbfWBS+tFhTZ6a2Fi3Qt
 wllcmo2m6huLXMt1Ujy5yFAbh87rCbMLN4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528uc3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-244581ce13aso9823255ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 17:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755734673; x=1756339473;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h/QHGAqsGwM2i5MHloplb39qjZWHbgGxp7soSeiPiFw=;
 b=EAsSa8sD/Esh1NhuvssiILE3xIy4zTCUxiAAsuwnnze4NDVcoKiGiy/V96QBK++apx
 uSHTiKBExPYAOriAfMnTkrETGaw3cOkX4GmTPKzgwVR8sVG7ydBtN0sxySUazR93EVX7
 KUtzsPU5Ao611VVM8TgncrPXtW84yOQ2/7BrA/nUpudSSAjYJCjw2fy9qAJgf+sjxFRC
 vDz8NjzA757FofD/Zo+Iwo1GZKrPdgNHLk7cJ0Ojj9QzP70jDcPxg9hh2lvGFRzVoFUz
 3ScJDFl4ovdzDVupS9n6Dd4+arOpMTJ58SAiU7noBoRHBKkTstW6T7ZUTK82vQ/JOu1v
 9rRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxpooUD1Gg+TB0MDm8zECSsWS0tiLxawGOnA8KOAc6wr8UWf72H5pCzwuo7mIB5BtAYw/DFuL5QTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHbyGxo6rIgDqmYsCIU1hdYFVz0SwzR8W55GPWNBXuHnZsTe/p
 6IOhmdekkEoH3Hg/hOHuvsByZHgHUaEaGeZI+PgWLN8+f0j6YHRt0r2cxlLJApXISZQXsQOil04
 Ibn9YE0gsG7NXRdh6/2qC34VxNeX+ailF7VTdgSAt15sYNKDZbXaOJ0AuB7eiGB8pAsetxMA=
X-Gm-Gg: ASbGncunuO94wJHfRV8DmbVAlJm4yloSYqZA6/8/GcNSItQquyGoQISk2PEtSZ2NirI
 ittrEl4wyppNmJoorTSIB9yhyu/g/19kCN/EYBAPkl901mg9KqoPxMtayJkG/PfjjTHuTmAuSLw
 IZBHmX4PO9txJxfmluZoZSa1jmFV+EyvMHlmIoze7HsI+Q+vIQ9wi+w6bhM54UL9sqNuJupp4GK
 xJc/FUiMgri8gV10CeVTcaOnFfe2GtFZ3csBw/PwCxNMTsJWVAeu6F5m0+/pz6Lhi/66rgh3Kfx
 tvZaPNL5EhwxZMAb9p38oXZz5ckGbs1aJEw0Vqja/RZIWdmP0oQ=
X-Received: by 2002:a17:902:d2c1:b0:242:8a7:6a6c with SMTP id
 d9443c01a7336-245febed653mr8861405ad.17.1755734673263; 
 Wed, 20 Aug 2025 17:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK/r8TYTWkV3tyt9AedzmAuktOgPzvmoS7TFw/w6QgXED/i2kMdkuCF/pyGNYjh6kI9D4WCw==
X-Received: by 2002:a17:902:d2c1:b0:242:8a7:6a6c with SMTP id
 d9443c01a7336-245febed653mr8860925ad.17.1755734672663; 
 Wed, 20 Aug 2025 17:04:32 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c747esm37464835ad.83.2025.08.20.17.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 17:04:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/3] drm/msm: A few GEM/VM_BIND fixes
Date: Wed, 20 Aug 2025 17:04:24 -0700
Message-ID: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a66292 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=7-57VTQsmsoFMMg7Vz0A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 7iGMqibA26b7F74O4T8eVVuOaddKadft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2o6ru/6D5s/8
 wsYe8ByTPHniLF/rKIFJC3c8UWSev3hnn8CRlZlZBbrtYIPt1yx4ahn2L4D8vi4HUQYbEjVP8kc
 QgT8nWzdhrWJfXwTy07L9lFvn1J26EfvxFSqd8hami8U9lCChEB+QwcTn0QShj6/dUgXiffyOjT
 p+GEgzgprJxWGmMjB8b7ofBvkaJLOTnwKb/pqVeZ/HvvBCIUmyrt3dCN6WGUQyvpIeOE8bq5cXd
 wepvSzgxWGE87OoZOHi0QUqztZnn16yja3GZ6ma74/T/d2YAfp5hbpfFFkpjo64JpElvRMvg/Sr
 1FeIze2+XvTsIe2StrvUuvYqz4Jg/JZKkzKe84bM7/l8DXJmVaFvQqzk294uR1mcMEz8UeTVZaJ
 LL7dlSsw25jxtQPVznEPHHViv6CCyA==
X-Proofpoint-ORIG-GUID: 7iGMqibA26b7F74O4T8eVVuOaddKadft
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

Fixes for a few issues found in vkd3d-proton testing.

Rob Clark (3):
  drm/msm: Fix obj leak in VM_BIND error path
  drm/msm: Fix missing VM_BIND offset/range validation
  drm/msm: Fix 32b size truncation

 drivers/gpu/drm/msm/msm_gem.c       | 21 ++++++++++---------
 drivers/gpu/drm/msm/msm_gem.h       |  6 +++---
 drivers/gpu/drm/msm/msm_gem_prime.c |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c   | 31 +++++++++++++++++++++++------
 4 files changed, 39 insertions(+), 21 deletions(-)

-- 
2.50.1


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1680CE48C9
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 04:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DA910E083;
	Sun, 28 Dec 2025 03:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QaBQxW9B";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+o7itZZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FED10E083
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 03:57:20 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS2J9Ht1329311
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 03:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=5DiAqw1ZcG0Aq/fFC+FSh7
 8xdWoL0VHM+R2OMDl1/kw=; b=QaBQxW9BLnwlb6go0IfMbEqTj8FNFrCPwySpgk
 VDFzLOLogkoMLRJje1sIqgI9p1ZLq6rpw05sf5q/YvJEQ/ON7rcltoynF9tb3X5a
 dttcc/2QVtoF/7BXmFriTnQav/opH0LlaizWeo+JNJ8hgF394p6MmXmrbOsglWdf
 kneot73LupPicCq0Z8zhYVqb0S1+xgXwzWn1LNUjdpqoPwiaGpg1mK0BG5iMyK0S
 5h8aqjq2GLU+yrxLycoybkd3VzhEfR0+tBW4EepGPT84Ks+Ut+kW+uZavsVWZanu
 vnLz/nkKZnCy5Wxx0KAnd8gGCGcDmyO/k5tJUN9hkjz1O7qQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7p1snfh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 03:57:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88051c72070so166150586d6.1
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 19:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766894238; x=1767499038;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5DiAqw1ZcG0Aq/fFC+FSh78xdWoL0VHM+R2OMDl1/kw=;
 b=Y+o7itZZdEOjh2xcB5+ebiDUNJfEwqS2tKUeeW2rA4HlJMORAjpgsve4ap5xjzBIuv
 BrYGDHE30d0terj60hazbWENoeyJJ9qN98e2uiQvb3nq1LAZ3pPGf9h4XLZQVXfixcor
 q+UahoqAdFAAA1OjhfhT1cCIT7ZBTSDMgAEI+hdb0zRyr1teaR/wx0xiRxzje12wVJWR
 rHPrzB+S5EGbpCcHjtRifKz9qsr0nv1U1qYN8z7E83ptf6g9asGKX/aFI3VKZfCtDAWl
 oCl4kZW7jrkx5JRG5vroEXcKRklm+IX3kGy//OUMZxZYVSu8HLXrW5cxQVcgwAtDDgB8
 bx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766894238; x=1767499038;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5DiAqw1ZcG0Aq/fFC+FSh78xdWoL0VHM+R2OMDl1/kw=;
 b=BHtOS4ubK86iJH4Oehxl+tp+7WeDk60DyEh21p06B6RtrHf8Wv+ZhxQfLMHYsC39bh
 K2Y2DMnzYBBgr4PLjQDy1pqkbnXkMzGs1s/pdWoS/IQ3LSRJAdLDUJ0lQctlcD0bHaJ2
 un9jIKLqR3WCNNeCWv11bDMtwzQ6HudQftQDXdyKKD+wN3UqbEojLJdVG0U93FtZWbbq
 JpN5YmDq4sn76dYwJstmsdcjuh7W33GSJdKqms7Z9lw0IG/1igJrVoVhvsoh+g2HSFjO
 bDJzfGyGAMheMZXmX/Cb1+5ErG53meU9EFSG0UXSs07d8RmS+XlN72V75AM1KAZ0AoDM
 vNQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOTgPQoqfBvpI9uoAf0LN2k8BRocSYi555+0Jti0JTTZunF+0KpH4gzpItqNr+MtteFIgvL2bH2Bk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgEDZFdCkvWzBk+2nSMofUM52iEci0KD8PTkmOKok3Z2HFvq7m
 dsIQ5S33LhqwUxHkFzArj9sLv/fxNI4kGa9Udn9ccV6pdMepAQvxLJiuhxeNiW+NKQejR2waEau
 xXc1G/IcR/GHpwJnjPaSgtALfRlkfDbGuI0XfNZdLKpe2sjKnhwwcwjn0kS1pBr266soA/1s=
X-Gm-Gg: AY/fxX7I9n93SyLDSmfaOKoiZfs3uMKRKMmqOONnfc1YJcYJF7qa47klEpM5h2YmWiW
 LxN7Te/l6FzMWbVRoFlfNW+WWvNkE4eyMz1iuqOSUzeglEqRfpuyyv5Rnh3e5EoAHfM7jis9b7n
 0t925868ljl2FkYXDU4Tl2i91ilnrlhtZUycMzqUD6yAbVt53e23FsvoU3Goxsdl7SmLf+e+brE
 G9b5Aj+8Fq1iM+gyamvQcZ7riYyIyeaTS7LmTKX7wc/pJ1askhOBP4ugcXp6RtZF/yDrZYVIF9X
 wRCdtPNQBFQLlNCSwqg8Kj+Jn4ts/Q/pZKDdXmIv/dasd4imKVLNIzT9cs3q5p6P+TS56374X/m
 DM/gHpwqxZUlC4nZUMH7X4i9AbSceT2Ar5UvtUYiDaNbv3sPf9AtzqULego1dryzy+XXWauEKwq
 Sk/i4gUPjXPXeCDC8Llxe/7jo=
X-Received: by 2002:a05:6214:5f01:b0:88f:ca7d:348c with SMTP id
 6a1803df08f44-88fca7d35d3mr363207076d6.14.1766894238538; 
 Sat, 27 Dec 2025 19:57:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB33EtJboK/KgPGBeUpD01j5/RSStbmZSdsrkvyWaeKXqPomK83RZhgY6FEfKvWZqUGyTtfw==
X-Received: by 2002:a05:6214:5f01:b0:88f:ca7d:348c with SMTP id
 6a1803df08f44-88fca7d35d3mr363206896d6.14.1766894238118; 
 Sat, 27 Dec 2025 19:57:18 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5d37sm7883586e87.7.2025.12.27.19.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 19:57:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/2] drm/msm/dpu: fix vsync source programming on DPU >= 8.0
Date: Sun, 28 Dec 2025 05:57:10 +0200
Message-Id: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJaqUGkC/62QMW/CMBCF/wryXFvGiZ2YiUKaDQkhOlRVByu2i
 VWSS+2QFqH8d5x0qtSR8enufe/e3VAw3pmAVosb8mZwwUEbBX9aoKpW7clgp6NGjDK+ZCzFru0
 ttu4Hf2sseS6YXYrM6gxFR+dNnMy094+orYcG97U3amYc3173Byp2G0Gl3PJEbgq2lUlW5iKhZ
 Zm/FEXBn9d/1ojqqs5rKkjnQRO49GeAT1JBMwXWLvTgr/P1QzLFPjpkqjGkM/nfFwwppphmiko
 mrLKarSEE8nVR5+hufhHjON4BV2HQiWgBAAA=
X-Change-ID: 20251224-intf-fix-wd-95862f167fd7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IxKkHlJfGK7EIDe7WmG8uOdNaTCNZBMfy/15odjwZW0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKqaPfxCPvQoDz+Gk1eRb2fiSIz/KJjGppgul
 ltUwZybMSqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCqmgAKCRCLPIo+Aiko
 1SdTB/9+FZOo/k16YwouZfjY4lczCT8CKZWjxl7t8IX+J3GRcQJRzZyzbXOdk3x0FqJR9hV9cmu
 5ePoLq70earhHc9O1cbxxQAb0DDNKuo+kkcZjPl78dplxB1vG8lLyqe3bcbj9Z53LfQujRjOZIA
 GZ8zL4ga8V7WJJaIse7FjFBGcvNbPwiICi+odcYJzvLuX8xlZC+OBkWMRrOhYZnMuSls6Y9Bk0V
 s867NYcwquv7OhwF/jOtN5s+MfPmgNLlw3ImCkfmAekpHp1YMnYFbZFzqEXmeZ+FtcTGRmqOAvF
 JpkjqZqUvp3nG8eNZlXrD6TgobKZi3PAaCpwEH1j5qzKnk7k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 6qS3RLJHywxoYe4bhujN21dzfdSQdzzB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzMyBTYWx0ZWRfX9UQMtn/ECXqN
 gypi/aHZmbuhSIcsVvRZJrpLrIAI6nEffnBS2LHJlaqlXiMwpSOHZU1u1AOM6QPAE16gmWwEN/T
 AM1qZxjCLl6eJFGcDLuRB1fMoGlCB1pwioI3WDZieP+QWmPwP6WYa/1rQrLtZ2a0nrpWUbG/Nu/
 2l64HY9UiAjvMOXE0nxkf6fOKRKJHRNLtC3crxN1PuDMq0DSwVJFufa5DlFcA6EeLaq2SzncgEZ
 0M2tAtlggDDxChNFVzHl0dR8FXmORUcGIngyvmFMWwr7yd9zkzYl7csirEn7+h4TFpStYPCjgBn
 UDa/VnrgzKrrNw0QDfdkE6nx+P3gj3PSmggT5cAkLXDKrQg9+qbnLdKqpr0vsNz/95QaBp+sCGJ
 VXsvIDt+G8CAhbGPwWa5CrczmPl9c27nsLXW/qBrbzeSymF/VZ6HIwjaR42uDxlIWs2RIcnWkYY
 KIGVvszPvqvTAtsbkVQ==
X-Proofpoint-GUID: 6qS3RLJHywxoYe4bhujN21dzfdSQdzzB
X-Authority-Analysis: v=2.4 cv=PKMCOPqC c=1 sm=1 tr=0 ts=6950aa9f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=4r7oZHox7d71xAMh2p0A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280033
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

Currently VSYNC SEL programming is performed only if there is a
corresponding callback at the top block. However, DPU >= 8.0 don't have
that callback, making the driver skip all vsync programming. Make the
driver always check both TOP and INTF callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Fixed typo and white spaces in the commit message (Marijn)
- Dropped superfluous comment (Marijn)
- Moved vsync_cfg.frame_rate init (Marijn)
- Adjusted the Fixes tag for the second patch (Marijn)
- Link to v4: https://lore.kernel.org/r/20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com

Changes in v3:
- Picked up the series per agreement with Teguh
- Fixed VSYNC SEL programming on DPU < 5.x (Marijn)
- Implemented WD timer support on DPU 8.x
- Link to v2: https://lore.kernel.org/r/TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com

---
Dmitry Baryshkov (1):
      drm/msm/dpu: fix WD timer handling on DPU 8.x

Teguh Sobirin (1):
      drm/msm/dpu: Set vsync source irrespective of mdp top support

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 48 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 63 insertions(+), 20 deletions(-)
---
base-commit: d2b6e710d2706c8915fe5e2f961c3365976d2ae1
change-id: 20251224-intf-fix-wd-95862f167fd7

Best regards,
-- 
With best wishes
Dmitry


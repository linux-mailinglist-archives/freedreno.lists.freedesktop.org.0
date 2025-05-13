Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A11AB5CBE
	for <lists+freedreno@lfdr.de>; Tue, 13 May 2025 20:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F5210E073;
	Tue, 13 May 2025 18:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDVamqxT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE90D10E5E0
 for <freedreno@lists.freedesktop.org>; Tue, 13 May 2025 18:49:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DISI7S001005
 for <freedreno@lists.freedesktop.org>; Tue, 13 May 2025 18:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ur9/QT3f4NlSVORj6iKHoh
 GpLAR+WNwm5SSazTAarpQ=; b=TDVamqxTGbcl3NkeGqGoC9M6ehkZzyeuo1fV9+
 nmvINUnjQxyC3HP0pOaU0f5v1sht2Cvo9fli/KKDHXP3YcffPcNaDgKM1ZAd/3P7
 BVtApOQ1kSQTkRUdHXNLpKxrkV48gQHfVMy6fC0arge1LJREH9/shPWVcZMUC+Qt
 4Cx+4Xv+ZEdyojfRerdefaASD2yvYjHWqMjLyY3sP6AciaB85GTSj2LE9T6g8gQT
 vG4Baocv2fPEpaSXhTPy/MlsWyngUolKLrVzBdSXR267xFmfx+uBkUpO6qFZNCJU
 Ndt83Jw8DfxHdipAKoCK7P0wwmY1RXiKTK9GxU+gb/tuvSgQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr82c0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 May 2025 18:49:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f2b0a75decso168227776d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 13 May 2025 11:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747162189; x=1747766989;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ur9/QT3f4NlSVORj6iKHohGpLAR+WNwm5SSazTAarpQ=;
 b=c3XRM/ncvsu+lqeS6XYr0MG7BNNl0nQdzUB5arnWXUxUZCYR0C5sXmCqvuf9pgZOu1
 MMO+1RXC94l4cO+iUt0+NWm5XR75yPMtoEbAnMp6NPTSJu+zxJgqyC5NzYi6RBdmkekI
 Gq+1XGItkzsiLN5/TL9ZznkTTIj7c3lEvnsLf+4HSzHPY0LpENCJotD9QKllNURDDOKH
 EPhnLyQrqtVAXLp4OWd7UgDJtbUpvNpAb4BOaA9pXQ4RVECWslCyuE3t9EmZNm3DT/tE
 Ut3tNw/twCY6GE1CkfuNELSjm8zl6B7+Oiw4EMD412RiNj9vuQDyWAN/p6eTBErNAnCy
 DUWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8LwjCd4oN+7szNPX7zl9jQvg9wJXkvYI85k/8bWKdIRJoI9Y0FqW+6sJ0MuOjV9/FezF5hvEr7vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yycs2JH9kX0miAcuuYB36GIQGDDp0h1cp3nCDZ4nHIrqo5nXwim
 TOW2g/vwtpyYiL3rKZVsaIHXMa+1XXA9Wb2zmzCdR70dUiUJJU/zz3dj9qTrD0QzAAIv600DM/H
 JjrZDiDx2HO2/9KOB6PT86kFjtk3oX6nRx2T+DuvLXYF3RcJeItWKO9fEzgBu4RUT7Y4=
X-Gm-Gg: ASbGncv8T5MlYJvmQM31qovZPC25Z/DolH8fCjBMZMn0ceD8xT1VM02zYFV6FmK2ZHD
 EjMU+UIRE5ulxHBHp6W+Pjoy+PdxGhFIT2Qa+FwSYVtSaDYPAyXayTjPRhIFZGya1GGVJlEuMyz
 64YKVRtgGCNWsnnV+ufKsXevxxmMqQG5l9BVS2EopYr16NLacUVl51BrWbvQrR6DwVEmNtMJNPO
 5cN6fkCbclnk9nuXr8skCBC5w38tyq+A3RaZYnelYVRqjJUHE5KMejrpPW16abS4Wtmg1LrU/Rb
 myK+8YvRtQew6iLs1E4tQdndp+8VEi5Es4OfXtoVB7U7auZkgvVKQOZhCW8ohJpKNU53ujMVTBg
 kq8P/sR7sm9uY0criBF8sKOgA
X-Received: by 2002:ad4:4ea8:0:b0:6e8:9021:9090 with SMTP id
 6a1803df08f44-6f896e57104mr7119866d6.26.1747162189244; 
 Tue, 13 May 2025 11:49:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYnx9KwLkHl8XFIlHZ3IWinoz3V+RESVtbgcJ3yCiSuf6iNbP/S+IwmwOZLbJQYeQ1xuPiMA==
X-Received: by 2002:ad4:4ea8:0:b0:6e8:9021:9090 with SMTP id
 6a1803df08f44-6f896e57104mr7119496d6.26.1747162188881; 
 Tue, 13 May 2025 11:49:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64b6e08sm1967837e87.120.2025.05.13.11.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 11:49:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 May 2025 21:49:47 +0300
Subject: [PATCH] drm: ci: skip msm_mapping@shadow on SM8350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-msm-ci-fixes-v1-1-baba185529a2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEqUI2gC/x3LTQqAIBBA4avErBvwBwm7SrQInWoWWjgQgXj3p
 OXH41UQKkwC81Ch0MPCV+7Q4wDh3PJByLEbjDJOOW0xScLAuPNLgpamQMb5qKOHvtyF/tCPZW3
 tA6h3V79eAAAA
X-Change-ID: 20250513-msm-ci-fixes-3e7ce259d1d9
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7jV0gWLhUYLAfF5n95PURVvMxbGLkMaUPNgufE+LH40=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoI5RLxylC+eSk8QHj68u4toWVFFh7POdzPeK1z
 GHJsIszJW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCOUSwAKCRCLPIo+Aiko
 1c6+CACUeWGBzYCTAfwvVZeYBUtwdgNnLgXwOMBBLBRRT68ZEkTSaSQ3uRcCWam/prkEliXHBn4
 kETx+C9CZT8Y320rLBoI7rQq2YH2m2OytziosPDB3XKe4PMrTwlqfINfkJu4TsDjv+qldaybpxG
 vMn2yLEuIzGO0kRcFS40BD1yBKXVhmMVeBp9SkSahTivWwnyts+f3E7pwMJCDPz/vKgxi8PnF/4
 +P/dy95wXvT/it4EVzNyKXP2serWeeiWf6uwWEdMPC4SFbbMt9s1Bbl0Eba7PMOxP1moqUtPbsO
 C1hp+FZQcxX2YH9r8fS7rU4SU9YHH7UpNHZDbxeisCuhU6zx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: O8lAj0j-DFIHYw67DBptatFCnGk-1m_z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE3OSBTYWx0ZWRfX2qI7yrN4RptX
 HOjxqBfdLBb4EVvsJmx4WQvxjEDUNrGE6d66x4OeztpZ/Y3/YZVKL2ciuIBgQBKVB0YkMsXzehX
 SEk5OWtc3b8l6VI2DqJbCpZ1ndoiwPYEDxdcRmn73M8t//ODGmBEuqtHv5gB/JvTV0tzo/ZGMjP
 IddLcvYO3cM8VQa9H+65j1uAaJBNLclJPGxvkrjdXPJusePBO6wDT6c/m4Ey1MXXYuOVDXVVYEm
 T9Jz1wC6guog8ZAi2QhkGKrIav9lFhCvO2vFd1icr0JwYDJzRiTH1cVjty0DgA8By3a2q9XIwGa
 wvQlaHg4SiUPQSOqBmbtdrpaA3lzTOfh+BVu38Vs8A/1PHrJVgQN26lAhL6WeBM1AmQX0V67oUE
 nMuU58by1lOTHkzUfbhpaAUn2zcOHHTnWOpHQMMVmdz3TPc1bVXHKVTaqgFm2Cis7+tLquU+
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6823944e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=HB0QJ2FYAIsZ-nyMV3gA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: O8lAj0j-DFIHYw67DBptatFCnGk-1m_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=756 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505130179
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

The msm_mapping@shadow test fails on SM8350, which means that the write
might get through (hopefully not though). Disable the test completely
for now until we can fix the issue.

Link: https://gitlab.freedesktop.org/drm/msm/-/issues/77
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
index 9450f2a002fd7e68f0f674ac6ac84aeebf28347f..a8b535abc8ef0d996d0c73ece1c7a9622250928e 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
@@ -210,3 +210,8 @@ msm/msm_mapping@ring
 # [  229.752499] CPU features: 0x18,00000017,00200928,4200720b
 # [  229.758095] Memory Limit: none
 # [  229.761291] ---[ end Kernel panic - not syncing: softlockup: hung tasks ]---
+
+# Protection doesn't seem to be enforced, don't perform write which might get through
+# https://gitlab.freedesktop.org/drm/msm/-/issues/77
+msm/msm_mapping@shadow
+

---
base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
change-id: 20250513-msm-ci-fixes-3e7ce259d1d9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


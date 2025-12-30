Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C5ACE8DEA
	for <lists+freedreno@lfdr.de>; Tue, 30 Dec 2025 08:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3058310E584;
	Tue, 30 Dec 2025 07:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwxeTQdE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T5iv7lmB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CD510E837
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 07:18:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU0jFV02671365
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 07:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=RDfDov+21c9xI+NU/eqDWb
 Fpcvc+X8yxuZnrRdrgcdw=; b=UwxeTQdE1mzKRJHJcJZqpdvN7C/9A3JKeSyaEP
 qSnqQ0tnLXwamep9uGHftlLHqZoFCfgAcDzGAq3fV0DxoOFOQp/RTj+VcXwgBfd3
 qz+Pqq4xiw95geYp5h1Fg3pHlo7jA4PJbdUdnkEWmjV/5ceR3oOQnEz5q1OHKHx1
 3iiHVbd7CIoHLn8fLQ8oWAKGsGFNKFj1PE4coQS91suCMU4rfzCAYlH5ojU0TLKf
 578YnIR2GWlbIwIAd/LB5wnGsJskXAnK2fw2d79EGtrZH+Hf1NdjF1c7mcS/y1LH
 Upp/fwM9C+tA4uxEf0xNVkL+5ltIjR18IkROHq8vZJgGrgfQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fcrr1c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 07:18:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f4a5dba954so249402651cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 23:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767079081; x=1767683881;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RDfDov+21c9xI+NU/eqDWbFpcvc+X8yxuZnrRdrgcdw=;
 b=T5iv7lmB0zbj+qmC3tuQ6IOGhmE3AqQ1oASUBkhS0oVwS9S8XF52aURPBVoC8f3Yah
 vYz5NrII13SEJwZB1YzdM3/XCczmA50nQ5ut9pi8iBsA8eqdWK1ed7H0CKfBbD9xng1Z
 fEc50sebKq8XyFQFr0oYz19mb15K3SSOgvDDyd60dPHm7RtLTDon3KTVwHwdfwGrBzYt
 S5IsU1ERrScb8+H8i+JmU+k6SZPrI4f1Kl4Aq9TIGDSbjDQws9VMO8s8AFZP15sd2VC9
 FsrK7lO2vKrQDU/5RxCEKtTss8cBRB8sEJnKsXaP4wJLBKY5bfDgkN7tvrK5Y7fdKWxb
 csQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767079081; x=1767683881;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RDfDov+21c9xI+NU/eqDWbFpcvc+X8yxuZnrRdrgcdw=;
 b=KMo9Pouxfl30gK/PX4mda6SPvBMGhQMuFVGPhLiR7Z0+oAYSvcF35mryrE2rAza42Z
 DbnL61rfLIt7lBLrbNtEs0zjmyQGd5UiCuWBZGjkBPNDiNfe6UpCc+ji3EwcrQyJZbKo
 /fkEqBB33UPkp6Lbf1dSroKsUCh2pViHc/1sE4UNOTR27ssueK1vjQc06sicsoTvGAN3
 Hh3RMb/aLLV08GDl6fLckdcBB2wQLXwLzrM/9f+d2cWBQ1maQntmZiaPjdFtu/HL8vhO
 lfPrDoFqS6PdxPAs6uYi1im5Ck6XWtm2QEXAYBDloCXoZJplACNyw/Bsv5eFCrFLQPF3
 eADw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz7/od7F57B8sqt7GHsWK9gu5S1fRXbYSVHtfpwRV4qwTeel/DFy8eZIPFJPqkE95rYZiaNbWBEf4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywc0J2TBQDzBBbPha3spm++qy1sxut6t7sk+sIrYhnUdNcJ4HYt
 fboJ9LDS/6hfkpZr4UJ2keITjFrCww8qIX9zQgkTI4vcAyMeYh/VKPiGhtuQ/oYD9QZqCrU0/bI
 Y/+XVAScMck8M9FGSY9ehl0HaRz6O0gk+n2nKO9gZGlTmdRyNdVupcfneMsSRLiqBtuuWdXs=
X-Gm-Gg: AY/fxX5z3Ya0jfiTUdFuMbJkmhyCG85x96F0uyWCBluB4Usj8XwDxQ+UadCPhI7/LhD
 z0ZU5NUPvPGucu+MNrKLaRjf+Xdma09yzrSLbPZrTsXJeFpv6K7yeSyt2+WUGRPyAt8WwQI7kpV
 FaW2KnbVFrzoKT4TzNtQkoZ1dtOTaOy1bzmO70VPxzwSgL1V0IoMNUdpmSRWU5RxiknNgshZkud
 2dCV9Enl30+SIws0VBfF2TKQVV+XPbamApq8FnJc+77opEJfErVNJ7sf1CUrjMdkyEnM8qwfMBT
 /QYXIwICDzbCo2EwBRDnGSADIL4xtf7Be6eDI96AGB7SyNf1SlcPhw8+ijGs1raYEnAmR3eUGUL
 gwOEQxVTVjFN8qjNjSof6sdk2jwfOvJuiAmp/tsLD6tCvvBFOi3p9Zv9g8xZc649W1+zBwgjrTw
 0xWLo7WJh6zhzJNme6BPcBTZk=
X-Received: by 2002:a05:622a:244a:b0:4ee:1962:dd46 with SMTP id
 d75a77b69052e-4f4abdb6718mr540628141cf.79.1767079080964; 
 Mon, 29 Dec 2025 23:18:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOFJXh7VBC0CA1QEHfedT0Vh9YwUikHzXQJjpFbxXBPOzJd9y+5itmQlXgUcbEv9V2Tridsw==
X-Received: by 2002:a05:622a:244a:b0:4ee:1962:dd46 with SMTP id
 d75a77b69052e-4f4abdb6718mr540627961cf.79.1767079080388; 
 Mon, 29 Dec 2025 23:18:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185ea2d8sm9924615e87.45.2025.12.29.23.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 23:17:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/2] drm/msm/dpu: fix vsync source programming on DPU >= 8.0
Date: Tue, 30 Dec 2025 09:17:55 +0200
Message-Id: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKN8U2kC/63QQU/DIBgG4L+ycBbCaPkKnubW9WZijB6M8UAKW
 LK1VOiqZul/l/aiS3b0+Aa+5+XjjKIJzkR0uzqjYEYXne9SgJsVqhvVvRvsdMqIUcbXjOXYdYP
 F1n3hT40lF8DsGgqrC5Qm+mDSyaK9vqVsg2/x0ASjFuPp5fnhkcL9FqiUO57Jbcl2MisqARmtK
 rEvy5LfbS6uEdXXfdAUSB+8Jv40HL0/kNq3c2Hj4uDD9/L6MZtr/7tkXmPMF/nqF4w5ppgWiko
 GVlnNNj5G8nFSxzTd/hL8LyEuCZ4IC7Y2wIQBe42YpukHWDlk+6sBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rjcGmrYy9UrdPHnUVn7OH4gCfyt6FSy4sSqVbUoAeIk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpU3ymkVB3YAK4jAqFVE9gdL3SXXXvkLAOjZU8R
 hU0zIAxVfKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVN8pgAKCRCLPIo+Aiko
 1RLzB/9kdmTzpOnEuTSthFf6CdLwX9jvhDDNiPuAm1fsVzB9LeCYFkS1KtgR9qkDkQoWk/Uj6qU
 8SLT7RSNnTKNYfunPVMkvN6/FgNWouFy3TnXVttSJ6GoZ4iIkQlKVq3KkTIli+Po+OYZF6DloFx
 A5jbo/NeQaCOzVwHJIp+MDCj0V9wvikrhEI9lxVQc+XfhVLNnKf3WU7siPcAyhaWDJMp9xNka/t
 uTRkx4CXwbYj7PrQGbPSNg0QqfQGZyqheVfRRaIiqPY74WPby8YWZrVDUrYi1pCn1cbEg4rfx5t
 XQZcyPN375v7LhFAEPZi5MXRk8BE/ksVx0e+nzfzbBmID0eX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bKDcc_CrJJ_GBy4JDf__7cjpdyYnMo-p
X-Proofpoint-ORIG-GUID: bKDcc_CrJJ_GBy4JDf__7cjpdyYnMo-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA2NSBTYWx0ZWRfX3s94Xy5lR9/t
 vbqa08tsLGv/y8sQwwiookuobTpVx1lVSRTzb0og692upNW49oIUG+C8SZy4Irqu1QiHCdyIMzA
 vkLISAKpdESEuxuj05tla3OOagruohfzTm1ZP2D7nQRC0G/HnzaaePo1Ucm1zPHRnpzUNc00ABi
 lLZkj99Ku+kCIup5obo0Nl7ZAQ6O1LC8wqNtMccIaCh7JcKJv16h+QawRA+Kbin4QJOB4SfSeg3
 nObX16brsT6TRjM7gdWsMTUvMdRnyF4i6nyVDODqq6ZqmFn1DPmCdSdSNS0j8zsiFhCYCiXfCvt
 apGBUgnCq3u/iHnbD7u7QtKEAk4OYdojKxKHx5xawlQdxTjMSwtfQYZNtXfDY0IBibHsZqpGxp1
 Hv0sJpv1XyDN7tQeTud70AV2s6rs28xBNjSnTH5TRKFCd+x20Y/wyCljBngNSB2hrh+PTXYrfn5
 XUcz+NLkBdhTOU+1/Aw==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=69537ca9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=ytnKcm5597Xeg24-LCcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300065
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
Changes in v6:
- Spell out all necessary bits instead of reading INTF_WD_TIMER_0_CTL2
  (Marijn)
- Link to v5: https://lore.kernel.org/r/20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 49 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 64 insertions(+), 20 deletions(-)
---
base-commit: d2b6e710d2706c8915fe5e2f961c3365976d2ae1
change-id: 20251224-intf-fix-wd-95862f167fd7

Best regards,
-- 
With best wishes
Dmitry


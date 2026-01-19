Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C579DD3A129
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 09:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC1A10E397;
	Mon, 19 Jan 2026 08:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9qOm5JL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6qiLcrE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CA010E38F
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J1dPRH4133987
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=zKKpF+EMehH0PJv6f8uHjk
 tkBJp8RECGD1zdM2RjWR0=; b=A9qOm5JLdVUh0UaUT0vUkJgXX8xNtZbyUtyt3p
 5EgwopA8Tkg0NJ/cCMqsCMpYqKhYwBl1d6+8vBX+P69iWTwa8DqjvmagwzYivnNf
 45MdlNrwmhtSkwP6N3wRf1WKQ9LCsIayEwiGFbJYMz/eVhZNg+rvaSxbj8sNwT3d
 O2au7X6CMXYbmTwW0vbd7rqxqqYN766tgkayuh2KTe9s4K6piRwQcNtse0ZtDIK1
 SZxEMzmHyw98oigt34rFkZY/EONXEmef8//oTZ2cwAAaR+qpOok7Gm1o0yUWAZ7r
 upGscwxRK2HBrmMdIZ60Q+8zPTKMqzaE8SsQuHjXimKOkuWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4ys0rb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6b4058909so385598885a.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 00:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810637; x=1769415437;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zKKpF+EMehH0PJv6f8uHjktkBJp8RECGD1zdM2RjWR0=;
 b=D6qiLcrE7qrnYJXPiw/DPCDpCQVc8ZqewrGrJ3hrG/2iBp7ftyaw9NQsLVXPtnqjHY
 vb/+2d0Vqat+ZdieYt/1Nyf9h0N4UNP85OE+aOEwwr64mDVoPcoqyaTjtGip9r4AgpCS
 +nlHJaGv52hX5ghE4O49+fUpMZd5z1rgChLcNn7H8hwHj+opSaInrTSldp0V8LwdKh6p
 vpUddVtKy9Hy1GQm01TGgCUb9Xv3jXVOYTrWsZ/amAwXdPfbZVL5rLFxmnjqtL0+NmBm
 oW03n9Lgc4RupW5CTEb1cxBYzUi0aOTTUD8iuyZUXDkqLWH3Qmzw+HvylXsDifNpX1+X
 oEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810637; x=1769415437;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zKKpF+EMehH0PJv6f8uHjktkBJp8RECGD1zdM2RjWR0=;
 b=s4zWiH/AzRR18il8EZIm5VIIJw8G9n5OdKtVMh0o1RAWkLBlPzPH4GI1d7l8sC6ljP
 V+ViewH1twJ7dO1OIisDgQJDowEBqWaB/Rn09iroD106tyR3za7HTia58cxkYp9QHsY3
 Oie95r/plOWri681SzgSwuvm6hazGTusBXqvCNv2J7juSjVANwAJg+En7FbibYV64Ijp
 5o769f/jMjzJRLsdPPj8kHRJVu4Omhld6/ms/CknW3Q71EO9EhdbvhBc+RF9jeZSXiFD
 kgiUuir8Et/nfLPSOFowtziE6c24no9N/0x9AI7VaThl5OftTTIpcpP8HOQfW50Vj53b
 KsHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpdV544WEBu89D1HV5BAYOL57J0GKr/9aMStQhT7aBXv9M4bpUGUa0sWhm4PdkXSFwYImvo5D8AeE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxAXqPf0Pr0gh5camaLyAi2TWNBOzhxpXUZBace1GoaRCmefFa
 gu6isgPeaQCi3ILOKRESuuV0rGGAo149oE8lO+0yQ2n+5K/EatJV+W/jy0axOPtb4UdPfb2z/6X
 nceF1/j+DoQ2ZRfkchJelMQR1G4UA9WbXkp+EgfLXLZbPfvLZ5rodXdBne0xTlYJ2LtLn+CsgXZ
 Zk25E=
X-Gm-Gg: AY/fxX4EO5I2EipmNfrtI3s0REGvmvy17wUuFSxa0vbDXCb5rHtMNRYun392YRDDgEq
 /AK4Wk8fkGLqwQZP/cPnfBfEdH8tt3qS1zV8XRjasXmEz7SuOTcm/sb5whkG22Ug5YnXh2FZDOR
 J19tLN7/SEPyGY/HIMlAHSUB5gC6X6imEDq+ursEbBEf/CGNhT7H1FtDY7nWCZnl8Yh3ssak6uu
 cqQsQYoSI0cAaboaqf11I7bYzuhwBt0Y8cL1ikpAgZqAF0JLqW8vABL2EqwgYhg44QCIPn/X6Kq
 kJpum1OKdz5uTfuHMJRhb2yNX2Smt3tSaJWQLYJ1TFYBtZj82fqSBVXj82albT0lQfIATItC7bL
 Ooe/lShHahl0xRmSoGoS9HhukomabbANzrrW2QqaJ+o0tC9+rfD+VYGxOFp/mfXbNPW7oJOld4e
 hE8Dp5EiT1pQACerkeJjIfh4k=
X-Received: by 2002:a05:620a:4627:b0:8a1:ca96:5d39 with SMTP id
 af79cd13be357-8c6a6789094mr1368157085a.59.1768810637417; 
 Mon, 19 Jan 2026 00:17:17 -0800 (PST)
X-Received: by 2002:a05:620a:4627:b0:8a1:ca96:5d39 with SMTP id
 af79cd13be357-8c6a6789094mr1368155985a.59.1768810636854; 
 Mon, 19 Jan 2026 00:17:16 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384dbec4dsm29636391fa.20.2026.01.19.00.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:17:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/4] drm/msm: UBWC-related fixes
Date: Mon, 19 Jan 2026 10:17:13 +0200
Message-Id: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAInobWkC/3XMTQ7CIBAF4Ks0rKXhJ9DqynsYFxWmlkSKMhY1D
 XeXdmWibiZ58/K+mSBEB0h21UwiJIcujCXITUXM0I1noM6WTAQTmnHeUI+eTqeHob17AlKpWK8
 b22pmFSmja4S1KJvDseTB4T3E1+onvnz/UolTRq0yWkGnlDDNPiDWt6m7mOB9XQ5ZxCQ+le2XI
 ooCzLRGS9ZbK38oOec3M0qhCfkAAAA=
X-Change-ID: 20260117-msm-ubwc-fixes-350f67d860d5
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xTfVqbjF2EEF4a/GBzAvQJo/Xn7hoYLjKFLQN+ElBFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbeiLCWZhvvNxvONh4ccavpGgy7jhD4KqgKsEb
 EcODZ4fAwuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3oiwAKCRCLPIo+Aiko
 1XtqB/0XtIDalhO1SoiQ+FC+rt1g1muICmY3qBagvWhn121YOJO44+agNkC02t69CI5hK0NGTKG
 z4n1ivvWoPi0Df9NsceiAbi+Zrej/7+agyemeDRE/xGTIJFL9XRrZYYWGLaGM9Apy9/CLomgpUT
 7QfrUI5+T+82+MV+zxNHD6AWdEjXp3U6mPcQ2hqmIwtNKBu3KmJoInX8WpZclBAgjIRs/703Q7B
 iogwiYtASc9yVu+0XDoEv3Z6Fik0Uy2TUjXDJRTDSEcUrBVu42MvHocoKuflP680VqbjGqgToIV
 gI1oSDMEikWP9izwITVXuT8keuihbbPrkdq53Aj7HIJFGNYW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696de88e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xvqa9-5REf62IQFaZ80A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfX2UQ7T58amOmb
 TC8P2NKR6c1TLYQdEApodkBnMhpew8ksBRzMZaO3PjBkCk+yRpGjFitSLIC5cWRs6GUKzuaOc1G
 eaif3/dqw2sEJvJ5t76woqGe/yP/yZt4QQEIK/QoMu7XiCyGaxcn0gX+93O+PkOl0Ci6VVU1KUo
 1292wTnvhTUj30+a1LfhZGPr9NVjgOH8imyYzECEIjSx4B07rvSZJ5ud+OMCu+pu25UPGcMghqa
 IiWWh45ZgTlmjt70GeCZFFkcuJDBc+brciXLd5oUTlf5pznpIg4qAgQBpf4n5mM5D9d8gFMWP7f
 Dw0KSiruGVuShiBiJurihn8tfuM/XDGTTQwUYBW6UGG6iprc9PIrn8ftaY9kBX0pJG/RGXXrEr6
 p8TEMDd3cLPpxbjdjAV52RKLAnJfca0AnTRdw7c14DQ6euZqOazCOfwm7o7rNfNwbwZa7ksIXzX
 +3g13JH4AyDIEnmF0uQ==
X-Proofpoint-ORIG-GUID: uE-nNva5XI3lZ58ARSJewH9emUSmYIJu
X-Proofpoint-GUID: uE-nNva5XI3lZ58ARSJewH9emUSmYIJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190067
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

Fix several bugs, possibly causing image corruption when using UBWC with
the drm/msm driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Added Fixes tag to the last patch
- Picked up t-b tags
- Link to v2: https://lore.kernel.org/r/20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com

Changes in v2:
- Added warning if dpu_hw_sspp doesn't support UBWC version (Rob)
- Link to v1: https://lore.kernel.org/r/20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 58 +++++++++++++++++------------
 drivers/gpu/drm/msm/msm_mdss.c              |  2 +-
 2 files changed, 36 insertions(+), 24 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260117-msm-ubwc-fixes-350f67d860d5

Best regards,
-- 
With best wishes
Dmitry


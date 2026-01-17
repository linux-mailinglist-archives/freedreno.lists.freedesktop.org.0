Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 371BBD38CE0
	for <lists+freedreno@lfdr.de>; Sat, 17 Jan 2026 07:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB83810E043;
	Sat, 17 Jan 2026 06:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcDteEPV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvuht+Na";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75E910E1F3
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:00 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60H4C2QT3636026
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=1iSIAGNrGGkSorkUrHybP7
 sUtLOj4ZU5tkiLrYXIrCs=; b=mcDteEPVVjgYJNT2aGc7YtApBbfgWDpLQAB6Rw
 XXwWYOFSvCIzRuEap6TJJAFol/k6ZjgFrahqHHTCv8ZyISipLpLF9nlysRZzAOR1
 lLJjijBGlnUL/AbOu4RvUFygpkct9Cpdkv/wPV4d+t94gpTdkZ0te4tKq7yutPE0
 XK8fg86uLJJpIY09zuIDm7KpeCuBkO8+QMCzBUscmQdc4zKO1GXXP1cpsLfDUy4U
 5AHWfhXZsWX6fnoLQ0+vJJad2k9OdcugJ2a3OgXAKiwmzHR+1tVoPCmknqw+5DnX
 myvKazqA5qbGQwIQHOgjxuK4tjB8WyWtPXN1agENcvsvsPTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36d8829-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c538971a16so615920685a.1
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 22:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768631759; x=1769236559;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1iSIAGNrGGkSorkUrHybP7sUtLOj4ZU5tkiLrYXIrCs=;
 b=fvuht+NaSg6z8ZWkbOPQkDdDq6iCqSF11WPOAUEit6ztPDFG+HKBemDc1Nl5hKUn4P
 Wxp0DRyYHy2xsf1uYtz+zzKpWaSDtoQh2tsKE+Vb/njkryRfNBI6avRImM2Slc18MWPr
 +W0G4Pcyykw8NOU4rTq4lHA9cY3w9REHEMR/zCRvSKcbmW4IiGQ3mUSCA+MMN2GXzkmm
 LZQAGzoslVR24IIwdStKCk7V5xSmFhIy8UJefT7AjsE69DziajUXh7S0GT3+JbGF2+bE
 Sf4SxkzICmv/pOaOLHAYgWNTpWgym7gA0mY2bjUmySeDVylF0EQrYY/TPaGa51fC8aHk
 WM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768631759; x=1769236559;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1iSIAGNrGGkSorkUrHybP7sUtLOj4ZU5tkiLrYXIrCs=;
 b=AXkh8TCITYis6euIYDRhhwCSD9a1lB/Y+dcg906i9Set5b7boBnDQJpjSyCO/m3Sh5
 8l0XryFj+3s3sAyF7H5MvJhMKzh5C8+6EXt0YzntmCsfPGXfLdoCUwOcpeI5+pzJqZh5
 bMfUxGFBka/50wb838kImCSGJQCdE7392/IKKkPeX50XVn+58mXOfoF4N4kw+7oRfSVT
 eXSMzwEtQ13SmPA/Fxm+I2W303oYLm0A9PeD2RwMU80KeUnLgwAZ0tqvThzFlDPVboYh
 frqH3UfBUT9oRf7GT7y+FWAXBFTonswl8ei9Zlo9zVtvR8JrBzp+1d0gbvJn5WBBm5YB
 JvUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrtfpicIL+ttAu5uXiPXiDDSQDg0STW5C7iA5nJWP0Ofi76ye6szDDaToGZOkskcOxYIdjYEOI9pE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvdTIx6TcOA4qSbSO6KkYL1YqK/5cPYP5TeWdW+i/xhK+FPkj7
 ulbVmPdoXu26L4qdJqs61TqIG+VA12uNSp05534T7HhdNpHCJFGHpIprxnXl6/J48o8wJLttSMk
 xVFh1/LMtlxZcHjgsxR8P6/kgsAahO7wjmVwWF7g5mFlcA429Aw8nO1E1yYIFsxut+DHnN7k=
X-Gm-Gg: AY/fxX4ol1Y+r9yHCP5UKQrTX//0dw+o2IttCJYyND1dbAVRy+QMyMPJovoVnSo/6m5
 hxZVtZtrV8q4MxFFoEWMEHhkJEKkvNf7GHhMUJ6VRvkCjHk1RU8VJRHyvqljCtn2xY/qA5GJB/1
 GVsWdDEm1qEsZbJkIBVG3xz6bQnWbxXO5ELkc2PnrSVr9gc5YWGncxZ12lGwHxFJgLBqWon/qzk
 f9BhKKMorPO8QC2MQ0TPlSvaxMvSRYbSAbCIKF/oVITxCFRrFgSajJ3QtG6QIZpDbTl8F3zKVKp
 Y0v9gRyJ+H4NLq28FRodUoPiCLaTcmTwVh0Ts7hEp2XwGPPbJAshrlKo843Bt8bLVO/jk2Hs+8N
 rffOXdOHV79XQrGLk/WpevdrKhlQLKobUfji65I+Fk+KRpXNZREbNcByV1v8RdHtAsbtohIYtT4
 KSmfsYSfE3ZPvSV0trZ11S/KQ=
X-Received: by 2002:a05:620a:2d87:b0:8c6:a749:3361 with SMTP id
 af79cd13be357-8c6a74933a9mr457674985a.41.1768631759077; 
 Fri, 16 Jan 2026 22:35:59 -0800 (PST)
X-Received: by 2002:a05:620a:2d87:b0:8c6:a749:3361 with SMTP id
 af79cd13be357-8c6a74933a9mr457673685a.41.1768631758615; 
 Fri, 16 Jan 2026 22:35:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e790fdsm14049851fa.23.2026.01.16.22.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 22:35:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/msm: UBWC-related fixes
Date: Sat, 17 Jan 2026 08:35:53 +0200
Message-Id: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMota2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nz3dziXN3SpPJk3bTMitRiXWNTgzQz8xQLM4MUUyWgpoKiVLAEUE9
 0bG0tALqlUHpgAAAA
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=817;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mEiXyz3E0C/8C/OEmdDzBTl/B0+VTZUOuLjDeTlkZ2I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpay3LCexxQWNuNf5Bwo1GfDaeKRFNST6mP+5MR
 RuA4akOZq6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWstywAKCRCLPIo+Aiko
 1VGtCACV+GM/f9mZ7H9m7cxSCTa6NmJCm/gSLkiqnweGDdE+neyRgWKCjhjGg0/wSNljRdubbPI
 LVhFYbnexBV0dQb0j0+ab8aay+/6qcdPUvj8xmiiF3BoWetIOuugdDgIR4YoMM5kP4CcDKmsGqp
 F1s3GsUih/4acrtTBsWd6wGX/GfsJ0PXzbc+K8ev+oDsNBB0KySX4I/sgx/WUaxeJ6a4ZGaVq3v
 9zHO+kaBfAtR2YvHYbmEqlA8oW0bG6FNh35+jsxeDzLIn7HBqTWKHfs72cBR3vLw3OjIS0ZJIuJ
 8Tvi8+i8Zxma2sD+5+DpkOUURJ0+KMfIcOrjjxexRhwR8HOa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA1MiBTYWx0ZWRfX0rj7ZaFUtR/Z
 5nzrBjg5PECzSE7zpaJsLqiItfAbu+4g8ZeMUq16icgQLdYi2WR3856zCGOE+467fmkgcCwiRmL
 GYrK9GVDiMl/EGvFPa8LR9OUWxM3uQCBWzzbtS6yl5jGMqmLF6WHN5b2xVdMHijqrEZjOfZvFdX
 vVhMg60hSPF97hs5QoNOdTZzyZ02Yc9rdFFl7mz05sZUp70HqrKv2ert4ujMKgYPlDWKnprBgbg
 tHIRBiFtjpa6cgU6mVJ9MkVvu3vUEV1jp0lHKsDU0+a3Th4CK9AprkZuB085N9ZevYgYr47hSpg
 XnQW5QlGmK3my9CQIxcyVSasl7mHWO1ciRwQjbJ+gqxOBhuhyRWAsXwO6fKIBAdyjZrTisAon2N
 EZ6Gjp9WX82SM/Zi3QKAtTjrV3ZMb9QlLgLDlMc5RXi9qfWdg2lkiduLXnCcuP+sOwnu0GrkOh3
 yqeTxWEMFsu6ujFVuKg==
X-Proofpoint-GUID: XoeJIxtL2isEeQMVE_RsFgzBgSJDs4bZ
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696b2dd0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4HV87y4NaVraivzdFb0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: XoeJIxtL2isEeQMVE_RsFgzBgSJDs4bZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601170052
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
Dmitry Baryshkov (4):
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 55 +++++++++++++++++------------
 drivers/gpu/drm/msm/msm_mdss.c              |  2 +-
 2 files changed, 33 insertions(+), 24 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260117-msm-ubwc-fixes-350f67d860d5

Best regards,
-- 
With best wishes
Dmitry


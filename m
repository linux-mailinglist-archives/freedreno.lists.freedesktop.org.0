Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E1FD2D28D
	for <lists+freedreno@lfdr.de>; Fri, 16 Jan 2026 08:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7588710E0EE;
	Fri, 16 Jan 2026 07:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDKpF6UI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEiqN6pl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0056310E808
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:41 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMaPX03192399
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=T0TMXQPqtA4+cBU8YRgxLA
 V4GrYtwj53rF4X6f/w0Fw=; b=cDKpF6UIGtOIC1uxr/epUYgZosWzU98ddK9MOc
 bZKXfOAZZrMXlBfkoLjVniWCq8u17U+Dcgy3gTDzHhZfqAVIZrSo7XGnhqDAiceM
 S+IbBiE3R+Z7w27hF9evOiEp1Dyl04wmZ08GBYAtaBP8kqMC39JSSu5lA1mLPaUz
 11UHd2RWwo1GLy21aX/IuF9lcdtvIPZeSlGtxPgaZ1AAU91oI8IsO5FBERN7M+3p
 VolyRTlqOJao/e7zFBT77xIGZXugpF7ql7VUj79pz/4pkP+AaLSeVZBPNjhM5eWT
 M0TfOqyJ0+JmZH//o9G8klUu6RU6xNa92qxQNewF9bl41LYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968h7yp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6a241b5cdso205685085a.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548460; x=1769153260;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T0TMXQPqtA4+cBU8YRgxLAV4GrYtwj53rF4X6f/w0Fw=;
 b=GEiqN6pl/6gik0Q7ehLU14lVQ4eexpuDYfR/9+ec/EoLabsqRqWGjfIaw0Et/VGEq0
 HwCmRKIwhBf7/m0tiH9tXB5q7+xHazhjAgA4MBkp7Zvfn2aJU6RGWkD/zb7zAJd1Foct
 UcZ0VWgnBIl+t3Cwo+ILT7cwi7aq7P2i+c9E6ay9fydv47ux1RxVwRcgE32iIVg7pWPH
 uOv6hFwWAsbTxQDiN3GOB9Ox1uC14qoQd/LNEkGY9CjaW4J3zd8pX5QFhEkPXlajcwlx
 6hGQPLWM/E7GaGeefknOQqMkKrn/TL8zf5Ljz6LrkUL8dRmKr9tP3fSEO4fyQLYj0Vrm
 ZfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548460; x=1769153260;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0TMXQPqtA4+cBU8YRgxLAV4GrYtwj53rF4X6f/w0Fw=;
 b=OBMg/86T/ACKUGz/za4e30Q1or4fRzbrJ2LVm+bmYcC+2Y7xqrniot1+Hcg2qkGd35
 FF2m9MmWXcVmtzaviX9wL4RPx6Ex+5veYiZL7qNhedQKIAjGqTVWBkL8GhY2OTdGjTN+
 Glk4e+j1M6sKJtzO0eg89UIMgmro7EdIzJLkKFGnZP4FLiQMQoiBOG4r22SDAEdcbYpS
 d0XaoqrdXpEkOf5Pg2KXYOKTnFXWII7p4P/7PmPkNjdn+F2lWSEHtVRQAnrlwdUOIcYJ
 +5ZkgjMjrlI+mMBeMOcoX7wNJDkuWdeZ5kRWFH1b+ufqmGvPzjJc8Im248JPbEVh4yQv
 9YUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDGX0fWCTeyiNIjSfA1UPewMmSyZ+Y2hFPnhxqPK3NlX78rfkGnk8mWDOqlaapbKuozPIqqWe1Ih0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzfdb2+e7/DCF6On54Nru9+69ZMLT7gdh73VNI8BackysOMJ6j1
 jdvMWgNSEGs1pOifJbW3I/+TTgAWrzPAFvNv9GpKd/glCCWLANTvVpsLRCrmog5kTac1nZtedS4
 wszf8usDwtwDFZGySNwMR5WqQDA8JF7fxXpa/UGdI2Jej3s9zj1m3RtcP5OTBEM6cE6/owWY=
X-Gm-Gg: AY/fxX7PTM8fnf7Co2ZflhpxzE6flAzemLoxb1vhileCSQqO0YAutYPTpIHTLGbp/Q0
 Q3e6NqVnvj3uiuTT0s8zJiO6McBy0OE9Ob/tLmeswHIYhaTHcbrxWYBZnb2x+7qAr7PNGLWWpeU
 v7ii+jkNyzDe+pIHsvhLotKQwYOGCXmc+Q9A5huNkYAiNwhK6TE4J++VakCqJIOInQkliV3Obey
 SZyH21tiBkbtha5f5sV46KfRxPOIti5JEOygQJDeVE+nyUBJGVT4KoIfR6/BCZv5LR52Y6NFvbL
 gAPNwgOBq+ickcqeQFcklH9zoNnh3hRS7pkWBdhkROe6jW6KZ1bc6qKr2MtmU6kThRZld0qC9OX
 UOYfujFlGiDtXBodNdK4UEOPvu8EVYldWYXFkOnEwpZ/G3BznGVGC/KlsrvciWGWNpb63TneBS2
 4GLa0dllpBbeGhBmZecg+tNic=
X-Received: by 2002:a05:620a:711a:b0:89f:9693:2522 with SMTP id
 af79cd13be357-8c6a677aacbmr301083185a.73.1768548460159; 
 Thu, 15 Jan 2026 23:27:40 -0800 (PST)
X-Received: by 2002:a05:620a:711a:b0:89f:9693:2522 with SMTP id
 af79cd13be357-8c6a677aacbmr301080485a.73.1768548459734; 
 Thu, 15 Jan 2026 23:27:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/9] media: iris: migrate to using global UBWC config
Date: Fri, 16 Jan 2026 09:27:34 +0200
Message-Id: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGboaWkC/23Myw6CMBCF4VchXVvSW0pw5XsYF70hkwjVjlQN4
 d0trFiwmeSfnHwzwZAgIDlXM0khA0IcS8hTRVxvxnug4EsTwYRmnDMKCZBO9uMo051WzlrJTSB
 l/0yhg+9mXW+le8B3TL+Nznz9HimZU0a9b5hqlXe+sZeIWL8m83BxGOpyyIplsQfkHhAFUFJpo
 0PHGtMeAMuy/AFoQ79S6gAAAA==
X-Change-ID: 20260110-iris-ubwc-06f64cbb31ae
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2466;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zc5bZgS5N9Mbgx60oLHQOfMAt62Z01sy/8DRrMk4RjY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bmi0zBzKOcdbfe/DY8ZtA7d9ri0gV6cT+3VMqzRiypa
 FSfqc/TyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJOLex/xVUOMzPrjLtVbeC
 9/bYBg8F16e/7gXs3XJM4YfyKunoXJH0+jyhLSKvpY6Z/DrTqiITXHjY1Wj95xP7k/4Kybxdbq9
 hUL1AWGiSXM36uS/eMEpWSZeb/t2cfo5X7PWacxLqazi5Zt8WjlKOmW6gIfeT6cpGY8MMbuvIXJ
 uFkw7e2Z10Zn+tpLHQU9M3nGVGgd0P9vukzbl1QOFz6ePMmgnX5pywPdK4gXVxLsf0M88CWQxis
 3NbKrY+XeJgb/j0mQHfYp0/W9bdiEtUbrn0yyY76Hz0+66HHsv4MgS5vdyfdy4P1b+XmGFzo3nO
 g1NXze5YntozS6HLryCTRfOAgU3ccg5xBwHT9YskZRyaAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=6969e86d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zY4cQw36yqIArZjDPUUeEXBTEaNSPimQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX44GQwPaiBgi8
 wsuQXFbp42j50H3P80EW3KwQnx7Rdj8DpBfHGMeBEctd5zsrGpLk4Ziv8TY10NIJKR8x8gcT9mu
 HbpOJwqR4yIJbpbf1JLCLabLN25ybvPoAawbu2HzFkV9z0YsQsVcPE3wPmEj3coqNuFzP4N2imQ
 wuNkjmi5Jm7qjVPkWF0DbomGsjR9HOq2X1V8bYUoO9kd5sxP2hXg5HBlB6vPrm/KljTt1buWzc1
 J3OPbRmC1YE6sV8KZQgbH84/johf42N2Fcr6gMVwVvUC0Q4Pl8VIBhvCFy05x89VqrLet2jQKiU
 5A/aYCXawsWoVG8cIZDsmDSHDz5hO2ZZTDYBLclTCF/3yptiJ62wNiyjHZLsg4aXMSB927KDkbg
 LTUU2KGPcberTNVbshaTfgbl22VSRFTmXrJUBAZ9OqGukrezqfIGQiWx2AUf2w/RA/73N1H9D7S
 tkSkQ3sJNEQ8hHqpUKA==
X-Proofpoint-GUID: zY4cQw36yqIArZjDPUUeEXBTEaNSPimQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057
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

Having UBWC configuration in the driver is error prone. For example, the
driver specifies fixed values for HBB, while the actual value might
depend on the DDR type. Stop defining UBWC data in the iris driver and
use the global UBWC configuration registry.

Merge strategy: either merge SoC bits directly through the media tree
(with Bjorn's ack) or merge to the media tree through the immutable tag.
The drm patches will follow depending on the way the SoC patches are
merged.

Note: the patches are compile-tested only because of the lack of the
Gen2 hardware at hand.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Dropped applied and unrelated patches (they will be posted separately)
- Include printk.h, decoupling the series from fix picked up by Bjorn
- Introduced additional helpers to retrieve the data.
- Link to v2: https://lore.kernel.org/r/20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com

Changes in v2:
- Extended the commit message and added a comment for the min_acc length
  helper (Konrad)
- Link to v1: https://lore.kernel.org/r/20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com

---
Dmitry Baryshkov (9):
      soc: qcom: ubwc: add helper to get min_acc length
      soc: qcom: ubwc: add helpers to get programmable values
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration

 drivers/media/platform/qcom/iris/Kconfig           |  1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 18 ++++++++++------
 .../platform/qcom/iris/iris_platform_common.h      | 11 ----------
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 14 ------------
 drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++++
 include/linux/soc/qcom/ubwc.h                      | 25 ++++++++++++++++++++++
 7 files changed, 46 insertions(+), 32 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry


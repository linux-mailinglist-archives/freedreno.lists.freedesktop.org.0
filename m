Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9226AEC44D
	for <lists+freedreno@lfdr.de>; Sat, 28 Jun 2025 05:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D8310E0C8;
	Sat, 28 Jun 2025 03:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPMNTleF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACBE10E12C
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DctE011337
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Ca0LgcLkNFqV2mw7hYegHH
 5vRj8FHsSnureGggYKmUc=; b=BPMNTleFOulZunmD1KM7BipbyeiJ8tavf5pOF3
 6uo4NZyVT1sJvI+3zPAIX6Aouq0sXvc5ssVoXLh55jtjzw0Ye9GBNJAOCnnT8sjI
 y4gK+6w4i1mfFGsfBnjpy5kFfow+UkTRb86rnDJfLGbrLG/vR5j7n170Ikf22sDH
 IUspdgDVpI04tbmCpmlvUpfFqQtXRSaMn1DgvqK22x7QYurxoStRr6cvSwYSXDth
 ENBAR2K7J9zfYoJc4rQj/cEmOyZX4VtrBZi92EGLH39uSQiPBO3e3fGGNKwfQDhT
 l2VeRa72kfW1tgJkhPemrP70msCUQhDstFMM3H46mGoQHKRQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j58tg77b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5e2872e57so64765585a.0
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jun 2025 20:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751079759; x=1751684559;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ca0LgcLkNFqV2mw7hYegHH5vRj8FHsSnureGggYKmUc=;
 b=Klet65GpA67KsrtmkGzxhsjPIQA26spxhPrT04UmVDWiQAp5gxPdhQYYZsxw1/a5sh
 eWp0squ7i5DJzyOWUeQ35wE/Le4OOnOD/xGEhuMHzbBR6rs0BzEEL+4awc1tvdb4iN7f
 0FKKbXdZbN/Rf2LW+lreAStsfh6wYZXNM3YPC0DRB5A4xruspGXK5YDaQQGnvbmoeUal
 kA0EAkWKbUv8dMkWvd610hPI1qy+VKmWAuXR11EcLkr9yYzMgCkZvJbDmwM9lAN4l2Yd
 Q4pw4OonLZ2Huw0TE5iGLdmKq1NvxWpVQPCdZuBMC9F9JXHmgEFI6CXNDcfpkMX3u/kp
 lUdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJQ5ZElv6RkdjKuLa6W8cBXh7vePz6gNAez3R1La5dvAzKwQ/IjeDRXILOtPUks+ZTmb/AGshJqxw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUzLrU8QmdokmLSMOKV1/3ms3u2QMXsotclbHHm9fOTJOV+ORW
 ymwWmS4ZxaSGYcNarz2qe5YkV7PpggGNg7rqmGM+NGtkYC9pyHHly/088dxo0pcS0DQ6xcCarFY
 2No7YhpnDzkL5Qf2xTyJta0NDIZsXdFtyG7Md1deuMf5YmslvMrjlT7AnH3Y0dVmb+PIhtF4=
X-Gm-Gg: ASbGnctmSpSce+iZ5551UaVcgZ8EYls1dE42nInmm5UC8Nnw2IJZS9g/bujZVxLoCY7
 kA9r2EQ+eys24o65MbGz7MOJcCZ9jkKYINW8pKm3BUE4ZG5C+FvbESz+XCO+PmYc9soxTdUxudZ
 +J8WnT45JbpOkAdxsETllLUEecr6rQMKkJ5bbrMN52sIA7un2dq5LOk8tJe39/77oMZZMatJe2J
 KI7sUVVWNBlBq8Y86KcgA7aq5YVxVQxAPfwaf8oSL91dRfRJR4R6YPdlfh0ESLRa5WdFph9X920
 eNo0EEwVOEfdvUvek8dQRI0nCB0eFyDd3t+Ib+uK5mbDptLDNi7+hTKcZr2O1fosF9tbGSl1T5o
 Zk2L1DefjH9KCCxGOK5at+t81cRo3AQphZo0=
X-Received: by 2002:a05:620a:6188:b0:7d4:3af3:8ef9 with SMTP id
 af79cd13be357-7d44394f4b7mr697102685a.19.1751079758799; 
 Fri, 27 Jun 2025 20:02:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDYWANWNuy16+nJ5OMuX7E6djSxIFc/7BaQQh+t5tnbRh+Z++1SUzPh2ZlXOCteDcaEDP4PA==
X-Received: by 2002:a05:620a:6188:b0:7d4:3af3:8ef9 with SMTP id
 af79cd13be357-7d44394f4b7mr697099485a.19.1751079758366; 
 Fri, 27 Jun 2025 20:02:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2cec36sm652162e87.180.2025.06.27.20.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 20:02:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] dt-bindings: display/msm/gpu: rework clocks
 definitions
Date: Sat, 28 Jun 2025 06:02:34 +0300
Message-Id: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEpbX2gC/x3MQQqEMAxA0atI1gZqpGXwKuKio7GGoSoJzgyId
 7e4fIv/TzBWYYOuOkH5KybbWtDUFYxLXBOjTMVAjrwL9ELl36YfzJYx7QfauHCO6CK3zk/k6R2
 gtLvyLP/n2w/XdQPrpqSiZwAAAA==
X-Change-ID: 20250628-rework-msm-gpu-schema-0ae305d252b6
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=817;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HPCRtSTGwz5zkPqvv1wbF7TQq1M+P6roUP+I7n1ctIo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0Z8tI/AxPjWoLQivp0SXotle4rlTAWfH09VX5jHkLlKh
 nuBDl8nozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACZiwc3+P63z0bcTDGW9UV+m
 ajLa/z8o08CuXPaucf1774fKHzVuNa/PensxbzK7lLBM17rURaeWfOc6zOvx4/OHbq7HhiLTFlk
 u3ebXu/DC26R415k906TDz6/40Jz6JMLLZxkno9m5h7vXa7lrMFzsyGlKSpJ/bFRR0JJ8We5n7c
 7wJJbwsxe61t4yvPSpcga7X27/gn9ZR24mRO7f9U+s45eeg+rmyRNPT98rnhL3wkPu4MHpHMlnU
 qZd1koJrzwUZ6pXH5t5M2ZhEBNjTLxBlcq+DCX2R5Obc80ubvVz9nGM6BDneNG2ga8mvGHq/IZ3
 b35IpyWWm599Y7U85dOsC97rAtSSlHeHJ1+y3bbhjf9GAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyMyBTYWx0ZWRfX56u3a6WDhOiI
 bW2uLC0yHQWKKUuWtHAKMnbgIrqxVI+HPfX6PUXMcvib3mmyfuDk4BYCOpKQJiKGYNfC7hC5ve5
 +Iqd0IPPg9Ut2O54hpMVmV0bhEiHKA1T+f5nBCJ+/zgdJo2gqmdCf2JwZmXiD2+gsm6A6nNEzjR
 06qgzOAbb5w2ge7MujESMI90ExCC13kk0058N0b1t+TBJdD4kY5oweCtv5KpiVJaikbGSZg6x6f
 pPrUhU/MRpwKofcao+kmmEj2wqJa3lv3pCWQS+XICPQJwZ2k5I46hkdi6JkcLbSd14015xS54ww
 eDRMz4fhs6rJ+BDSJsMQs8OEMwAVwVDUgmumIySz+0MmAtf0otgOOilTml3/9vgOvbp8mGy7AQi
 g/gt5ANhizN6b8fEF4uEEePbDQbLTAC+bNt5tkMzO0A4bgo6YnE+s+7dRiiFMW1XPAbrA5fk
X-Authority-Analysis: v=2.4 cv=UZFRSLSN c=1 sm=1 tr=0 ts=685f5b50 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=h7DytwQeoaBOExqUImAA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: lfO_Q_ffr6dx6O73omLDyVIB4UQl-KFC
X-Proofpoint-ORIG-GUID: lfO_Q_ffr6dx6O73omLDyVIB4UQl-KFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 mlxlogscore=980 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280023
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

Currently MSM GPU schema defines a single statement for all A3xx - A5xx
GPUs, listing all possible clocks for all generations. Split the list
per GPU type, listing exact clock names for each type.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      dt-bindings: display/msm/gpu: account for 7xx GPUs in clocks conditions
      dt-bindings: display/msm/gpu: describe alwayson clock
      dt-bindings: display/msm/gpu: describe clocks for each Adreno GPU type

 .../devicetree/bindings/display/msm/gpu.yaml       | 223 ++++++++++++++++++---
 1 file changed, 198 insertions(+), 25 deletions(-)
---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250628-rework-msm-gpu-schema-0ae305d252b6

Best regards,
-- 
With best wishes
Dmitry


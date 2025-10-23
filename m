Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF51C014CD
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85C710E904;
	Thu, 23 Oct 2025 13:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAis9s7R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9C710E8C8
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6dhSj028826
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=mz3AW50CZzl
 RHFBJ07H/zDGQyFPRQspBYOGzKP8xt1g=; b=SAis9s7RiP4SLohaR1jKE5gv3Vg
 dpCapo4DK/R+/sx8BHhnFBgQu5xlP59mniIkOVOg5REcVCe3VL+zMnvCJ9Av0GF/
 IpC7M/5JapZAih/WCqhPllYhB0Dv51ZPx2PDYeCuta4rj+Z1iEWIjxkg1CKGqqNI
 QdXcqXNV3gwLfCNVWXQS+HNc6oIyNOJuXMw37zGhyZP4F1gSEQ1ltqjr7yAYh7CQ
 CYCzPDZpT2iIvR+pESQEQmP/mFc3dCe2FKlQ5lbKvZ7juYpemhTS+bJl1zEF84qr
 ia+GOlhMSkP/YYUx4yFv9sLXZlfWr4R3ZAXty6YfDQfO4Su7BQA0vFVk5UA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wd7b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b62ebb4e7c7so422320a12.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 01:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206842; x=1761811642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mz3AW50CZzlRHFBJ07H/zDGQyFPRQspBYOGzKP8xt1g=;
 b=SbP4NPQNQL2pqGZQMeRaKYfJBloYz2Wpuhj6cxeg1zpvOcMO4c3wn6RqQkGlZIlHn3
 n64HImCYqWSNH+Z/0et2r6XuDPgw3+U86RnHKABo9iNafABlqisaj1p2WWx7QbX/mY7U
 s9v/WghQ3IQbmJFGXUKhAn89JAN2sVOaD39/UPtuKFqi/TJIayfZM7ZIl1GL0oOFdBE0
 llbmszw9mxCBhjZ8EAgAzrxW1++YVmNzwSX6DDE3fj/Zz3uLMEXG6Q7CLAdIuFlnfbRz
 Wjw06LBChU3LLoySKEU357y5jotbxrMBU2UkjBUyxmbp8HaJ2WGJhR6sL9f3fLr1jnSH
 eMOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoQYpNQowdqM+D2Cn0t+0QuT7yCkVyeUPPGbi0gXS54A8P7EegSMpV9z5xiJDeP0P3zs6owiXUZRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4bRthraZK88dgm7wcBNS3Zj4P8Dz/OEpK0QMedEN4VHP6FYJ9
 YXXjHW8wdN4nri6b/DQ+X+nrpoCX2fEZm26X5xkBlIKhzpak6PDbDkIHVNsTfQo8dq/aVrRwaBA
 q+6HpdYuUrJ36iAHSETr7ZSOeDQZOV6qJsXPkiwaLb2MvKAEaPSZakRZ4knmnFXSAvObjUmI=
X-Gm-Gg: ASbGncu/6qCxx3EpK0vgi5mwiLIRZP9oB/UZStYsQMveW63RXT0hF3W5lgQCPirWHwy
 5RFTjTIGI1k4+6yBF1PobjxNSKnBjFoay/Cjkfg9U50Qb2z+uoUn+lX5U30d2AgegVj5uySdsQf
 0mR0DGSRXVPr4FmI0ta9ubxQF9Jm+2XZgCVicQaNJTDOSjS9jQu7t0P9oPKcP/91GQ59lG9m8MC
 7yAUeMr5ZuI596kEK2NXj07tP9naI6YLrqfyn7hiCJJSEkvXPSEbKKj+bM2fZUF/hEwhrl9O8un
 i6bIUAQgwSgwo6Dvlz55T3WLjLay4Wd1qY3FWX7qpgSi6jMzs/wpvkha/PX9VQy8SnWXHuUcZ5L
 q5VSJ+eNE9L2aELYfEi2bVJLuOdxG0gQ5UZ1yMc5BBPhbg2cDWA==
X-Received: by 2002:a05:6a21:6190:b0:334:97cd:26b4 with SMTP id
 adf61e73a8af0-33c5ffb11bfmr2223340637.15.1761206842330; 
 Thu, 23 Oct 2025 01:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWOEGOBmMvhSpmnFUPZtvwT2JAqPOdlZF4Gxli8yHh+BpFytOCUKdhyL6VqRKtXouFki5erw==
X-Received: by 2002:a05:6a21:6190:b0:334:97cd:26b4 with SMTP id
 adf61e73a8af0-33c5ffb11bfmr2223310637.15.1761206841920; 
 Thu, 23 Oct 2025 01:07:21 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 01:07:21 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Date: Thu, 23 Oct 2025 16:06:05 +0800
Message-Id: <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Q4PFrMBY0zMkz-TtzKjdo_Yb2CFNuxwA
X-Proofpoint-GUID: Q4PFrMBY0zMkz-TtzKjdo_Yb2CFNuxwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX8w9i9jb7wZ/q
 ZNDQzxNgMZrLYrP4sPV147FvZlAuVqdyqRhSbFvXDzyuZEXW6n3hEW/o7shIi0hJzpBADG02f8k
 OeSpThNtUUzDdgOiXRunFi/s2923amr7i/e4lCItdIaiWS24qbQrlsHpyP4Sotv3iBz39T2qeNI
 nWic4n9CMdaXO6UZWkWQHGdH5FxelfNrrezJOT0hpBZfXtJM8Yy34BW4TlkKxl0NfJLZDdRvjDD
 JzUOdR5fuWPTj78AMFpTJ6Ck1+PUTFg0hOCaJG812Q7DHS9BmQFximhRdZQS9YENDsRDDlrJ4tv
 Su6Yv/ZV8XVIffaXNgJibWwp/JpXkN2m+UJBFmRWTBKx/s437nEPKYMmrX4BX5z73OhSAphdFSd
 kZ8UQWCqZBKsrM1QQm3Yz+VItRcJzQ==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9e23b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=o76S2ntNi4yxzKwJcEwA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
X-Mailman-Approved-At: Thu, 23 Oct 2025 13:16:01 +0000
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Build the NT37801 DSI panel driver as module.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8cfb5000fa8e..537a065db11c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -945,6 +945,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
+CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_ITE_IT6263=m
-- 
2.34.1


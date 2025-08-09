Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13289B1F17C
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 02:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88F410E285;
	Sat,  9 Aug 2025 00:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeqcSjQ6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFF610E205
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578NF8ua018689
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bOPqaygyz1VOMQKkg7WWHDM49dkikPWmvYtJ6Qfvgpg=; b=AeqcSjQ6V54+/n8k
 degUFSHzA1jYAR6Cnb/jnjHLc05nlzwYXU/C0IZpkFj/52KUxn+PR/vdNJo9V0T5
 4KPbzl9qOeLINoGIoubbNSPN2Ib2XHUMVLY071KTYOxH1buG0QLNLv51+4af2S0g
 bL3FOZ1Bv699JQztT5va2Qpq1dLg4yeU0B+j2/v9ue22BpWRWpWapTZQMPEistWr
 mvpFoc7imTfZfba5aNhawYnMUT5SetJj/6ZzHlzv06z/5qzW8gSc97GWL9L3Yo1M
 JhPBJLyoldCPhykn5k2k8JFgzGt4UcEN7G3EtSt2xvjjZ9uCy5BE/xdSIx0UVJj2
 I2QTpA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1kbay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23fd8c99dbfso22177355ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699739; x=1755304539;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bOPqaygyz1VOMQKkg7WWHDM49dkikPWmvYtJ6Qfvgpg=;
 b=ZbLy0LNip7GYW4aZO6WDPuPboIYN0wI3TNAv65TgCRBDg78q+dxzrd/zGspXcUZHgb
 S+B/kQYRqiXBCucf/Aniek7DtyF+/NTgyE91XdmRPG39WyINImDyw0vxXfb08oObv5p/
 UMsyH8jNlgmOWYpB0e+ouqbIPxZl/qjuivkESL2khWnP3Zdlk1ZRvs0aSHYs9gUkSiuj
 AF27yddZ29gZFlb2KBLMr5dbmmLckeYX6UnCuDh1m8awE3ENSo85eTfUFzLJgplxQVZB
 8jdOnksltT+JyguJ1M8zyplROScQwnmP9wp+YBi6+BrcszT78iMcsmwhFXJ+Dwqs3Xkh
 F43A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbjM/apSgu1tAP+B6rxtHGlyiuLSWphGG0mxVyUeZz4OdA4cgf0uxQpFE0Ii3CBaX2/lay2x9re2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6DLOpgyPdV1bkDVQGbfCBk0tXOdAnAkiiSxWnJCxrVRi2d/4i
 rYXHhmub7OLfzSv+fJkrHLEzKCXhAXwmE0zaNYYNr9rASH07u8OabByoVktlR+fF89AwVqV8cam
 L8fZGqw/8/SBfc/FMwm135aSfUNtTLDIXDQeWZKvLrUGgbA90W7d8+1wy4ryL4pZKF2+4FC0=
X-Gm-Gg: ASbGncsvZGyLKY9Rsyoe8SUgCJONmLu2q+uu0OSBcs4CUyoRCGQhoeHdaPxAPIlBDec
 Dht5NiV5MMVzWuToiVCtAvTLqhb9/A/UOz59cs9vHDcshBWehLP0EFndxiz0W4GqyJ7SejWZ4jN
 5yMjDivNKEv3fMnEiKYIGC7JQawHPMNf1fao2iblhMyVNYv85vgq474wsEA+3gI9nEkM76ks10+
 rlHkTEHZ7sECD+lJppt2F+rtR2EAcfwikemnyH9I0ggKtwiSN5pLdi2shIV7pfAbW7HVHZi6O1y
 O0F/OBA4ouOI8bn/1gbwDIdKQQrNvRzcPpBrSwsbM+G7aoRRVXqaHjHpSRc8l14fAMC7qkfcnLd
 ohZyfrRx4qs8wBjDhRBk+v+lL
X-Received: by 2002:a17:903:1b4e:b0:242:9bc4:f1c9 with SMTP id
 d9443c01a7336-242c22a0e73mr68472565ad.56.1754699738803; 
 Fri, 08 Aug 2025 17:35:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG90TkpPOHu3ik+v+Qlm6PmhiW122lbzmzkgxapd9Ri+VnBLxN8IwuH859qvbq5t5KTGtZyKQ==
X-Received: by 2002:a17:903:1b4e:b0:242:9bc4:f1c9 with SMTP id
 d9443c01a7336-242c22a0e73mr68472205ad.56.1754699738343; 
 Fri, 08 Aug 2025 17:35:38 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:38 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:14 -0700
Subject: [PATCH v2 02/12] drm/msm/dp: Fix the ISR_* enum values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-2-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=951;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=4dI75xSUxUaqLwUMy3UReh9bT/U4ccPbg+CHWdIsNCg=;
 b=9v7t/t5zjvmt0SS7wNe7gTFJ1P3lQd6ZvEw9FvAt79V9e3RldlmDsTJIL0pzQssWYKovivqqU
 IliiZxToWPaBt9Ldj8dLeYd1tzf06Yme4Xmh0XGrjLZQJwBpdZRzhZN
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX9unCjlZ4lGwy
 KmFanfF/fCwBbc+3rNDjdOMpkGhYS/PxdXPAagdkCwmrqA4kgUjzNUbrjBCPXY4Lzt4yS+lDZvH
 nmECwgeCTbtNjBdueudFQyM4ctYm2E/2deipSRRAmlMJhUD95X0nzW2fdZ34UFQFxkueCsAfLbH
 zEQpVd3qnWOUS8UNO1ssZ6wDw3M8pdaUFVyn1t6V809n4CQoUbrFivO3bqB2ug4A/XEIVH70SBP
 K02EB2dN5AzbkBw624RmUIyDB0c494zgIuF8TGxXpPhWXL2+7jIsjifyLgmcZVkug53iEn2+RWg
 arqwdrXyw86900VK/Uci2W+4BRrwYERuHP7Z9SBveLS+x5HlOE+BNTGb4e9VMlf3cXMyQOWEAzY
 HcJU4lO3
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=689697dc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=rrNbjNIy7db4sKJtjcAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: jf0WzOPyjwt23BzQvb1b296_LSLy13lp
X-Proofpoint-GUID: jf0WzOPyjwt23BzQvb1b296_LSLy13lp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

ISR_HPD_IO_GLITCH_COUNT and ISR_HPD_REPLUG_COUNT are not in the correct
order. Swap them so that the ISR_* enum will have the correct values.

Also, correct the spelling for ISR_HPD_REPLUG_COUNT.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3..bfcb39ff89e0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -38,9 +38,9 @@ enum {
 	ISR_DISCONNECTED,
 	ISR_CONNECT_PENDING,
 	ISR_CONNECTED,
-	ISR_HPD_REPLUG_COUNT,
+	ISR_HPD_IO_GLITCH_COUNT,
 	ISR_IRQ_HPD_PULSE_COUNT,
-	ISR_HPD_LO_GLITH_COUNT,
+	ISR_HPD_REPLUG_COUNT,
 };
 
 /* event thread connection state */

-- 
2.50.1


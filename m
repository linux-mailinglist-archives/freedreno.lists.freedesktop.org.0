Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA8AA8A2B
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 02:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3774910E1D3;
	Mon,  5 May 2025 00:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAiW8nE/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3970D10E1D3
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 00:15:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544LkakA025837
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 00:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v2F7Z22Vqvpmj5OI5DLRf+E6nF4Jvc5Wh4oto467bgM=; b=nAiW8nE/itp0xVjY
 YUPQ9BUa9ZyG0iW0m9aLQGvyqzAIpH/uRS0kbvofPJHcAEEeeGwErdmbMjuzO+z0
 e4XtcpvUWGBmS1w5BTgnrep4Wlde9EufgKYLUx3RKytC1W6jOoC+vbMc6EyLwssW
 hMycCqHm6KmsjpJi6vxmBT9hX8GMo5IrFj3kCntI2HEnff583obp8i5f9qJf4v8p
 2l/CXNexgEM0vsgtYOhVNkINSWDjDKR6D0RZtzswS67SEx6T13gwm0gjosMDAiu2
 nft9fbUZAj2FGU1IWbU9SaNUPs31i/KnFfkl88PnIpQYY08ue2zgV3EVZidtyy1F
 E2SSXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nktqrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 00:15:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c3c8f8ab79so98105385a.2
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 17:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404116; x=1747008916;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v2F7Z22Vqvpmj5OI5DLRf+E6nF4Jvc5Wh4oto467bgM=;
 b=C+4b1S2Kcl1hkY0Gtc8IrLMyCK/B6X/J4t5TvI0gCREJOJ8GtHJgIaAMSfp9NIbbwK
 t03VYEn3J8PyQmkdF6MwC6ytOIm1xrR9PuQ851zqCtoX2yIpxNiZFPYpd5Z+aFHPfhoj
 RdfwJVfN4IlgovZBM9Mrt2zJPAnfchElYSjmoNGSFn69w6RUtiHlepvTstgtW4emYlbi
 VZFwHvn+KFmHBpH+Ib5laiFq89ZrJTxjoQmnK0+NIljq4R8vqEgQbfWBNGlu/c+GJ9TJ
 Bi8fFzG1xyobHWHrnKDCoIOv4ncCISDvcae95h1T8d8u+gDL2QQ607UAVLPc3Fz7nDoy
 +OXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMsDoHyN/75buz6iFrJSTKHdraUw93zh4H5gNi38M4Zlt0hD/fFa8CnJ+bZEwrI7JV5CRAQ7qmF9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyuds0FaTyzCNzMZiE6s1abH9v6SD7KLPq23zQUhaYry6VOk1Mg
 GiB4KysKZ8cWeqbjme8GO2+mZZ579mLlXvwe8Rrvb4NVk2p1IdeEa7jYqKKoEdCJIdWaiDX4pZy
 uo8ej6UjeKoZ0NyYhCSxtCkTQlqAgntNhNu01RzCshRrJ2M1pJVzuhz7QdMbi1S5aQpo=
X-Gm-Gg: ASbGnctN/DQvOFre3uesnOk3Xqqorecn6RC+hWgXtatB6GGxrZa6ZTw2QLgO7sAfYRf
 DwTI+1FXpJEUhQkpw+9gMcEEv10FI6jbHOFjdmhSJDlhn2UxGoXJq+WwLrAs1Kzf3dHXwe3J7c4
 W9qo3iO9jj9z5ZoaLef7fH6FZ7yN89opXnlrApmpi6k2qhbudHRMUydP0o2yfem68AIsIKTAZe+
 KMpH7LMBbKcuSrUCEbdYI/N2h5tUJ0SC393tqMqkhjPU63KtOEvsxLx6r3VjSNHsRj4X7tHojtL
 p3Vh8GBfhS3pJm316LvTGJgspH8flXiuYMGZqQQClxIGW1AWsK1/gt3NQFn8uzsTEzU2U2A5L6h
 6jAdSz+vAqSSotWH8eobVO0wy
X-Received: by 2002:a05:620a:2685:b0:7c7:a537:7ce2 with SMTP id
 af79cd13be357-7cadfe17315mr802247085a.32.1746404116390; 
 Sun, 04 May 2025 17:15:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExYazgDRjTexqikZJLs+e8cHSkJCMMfDgM9LGiX5mnr/yYzp0a87xL7ICzXIpxbm+W8Aa1RQ==
X-Received: by 2002:a05:620a:2685:b0:7c7:a537:7ce2 with SMTP id
 af79cd13be357-7cadfe17315mr802244685a.32.1746404115996; 
 Sun, 04 May 2025 17:15:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:52 +0300
Subject: [PATCH v5 08/13] drm/msm/hdmi: add runtime PM calls to DDC
 transfer function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-8-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iRrggYdOsfyNRF7mD9CF5dLKTnVLk9gbl2tlKLOnDn8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL81jAwp87jlj7ePL8czNId/7xi5vSBolYDO
 u7aLLeOGLqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1ZIrB/9urrL2y3ZvkQ2p9CqGK09lcSPj2IysMUziduCLEJKZVJY1Unqn29EtfW09+necJx1FnMu
 Oh1wVjrwn93y14OfZUCkCZj/VuGWmZrHQ2IiCbxAViknRVwNZwHh+SwCKKFz5PmFVRLpqF7UrIx
 lbfr084Ct04AbBoBdVZD2RpfCWmOmm4vfSowLzvpL2RYSix3bg30smbVtDZ0MKDy19qbyEbfmnY
 8BuWNgbVPoGwVrWOWeoynq6TJE3KY5c19DId31Pr0TzKQMEaKnSONTJGKFr50R8fC9Fry/1BX8q
 PX2DyLakLBKEigIRXub1o69z0JHanZVTsxpo2CVxkT2d5eOo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX8gE335Ei63lv
 Igy85jeVM4l2Csb+tHUatizbIJQcF+rIbQBCJ/2AaINIKgpPDQkHbKzXBcH9P+vHGv+wOUqNT6J
 Wq6DoAwzlMcRSkTuRdO7u7UBDqiYBdyCccA0J8PZdLbG53CVXbhl42HfPRM/hwEYXN5icWZVTDH
 6i7t4l0ZewqNAMUU0yYsv+5YkurTo40wvFVerw2TtGU00XelUoV2EbICB6QvzRWGkFQWuqkTILb
 HvsA2TXop2YhnKp4cQlWK/YEa5Tmx56UWAbqvQmcBip9Ji56S9hJw+BeO+VZ5k45I76NjT4NRgJ
 49j3TGQcCbgu7s3gOKdUhCBBOXNgAf/bre3MPRQfQa1SUF51Y/me9mDHGfGrCdVEqiSM3xgum2z
 13Sc7jHFbXjYwYL0Wi91aZ1xRkgjruqMVy6ST4exkq2BcdKgIz01fj1N4fSR/GUtgIYQBmPq
X-Proofpoint-GUID: -MPg9-nNc754ijlvyENDK4Mv7f7uqb1r
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=68180315 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=bgq6psdzRVsaJitvC04A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -MPg9-nNc754ijlvyENDK4Mv7f7uqb1r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We must be sure that the HDMI controller is powered on, while performing
the DDC transfer. Add corresponding runtime PM calls to
msm_hdmi_i2c_xfer().

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index 7aa500d24240ff3ed6694c469eafc4388c982346..ebefea4fb40855745001ed97367d571bde28f413 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -107,11 +107,15 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 	if (num == 0)
 		return num;
 
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
 	init_ddc(hdmi_i2c);
 
 	ret = ddc_clear_irq(hdmi_i2c);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *p = &msgs[i];
@@ -169,7 +173,7 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 				hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_HW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_INT_CTRL));
-		return ret;
+		goto fail;
 	}
 
 	ddc_status = hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS);
@@ -202,7 +206,13 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 		}
 	}
 
+	pm_runtime_put(&hdmi->pdev->dev);
+
 	return i;
+
+fail:
+	pm_runtime_put(&hdmi->pdev->dev);
+	return ret;
 }
 
 static u32 msm_hdmi_i2c_func(struct i2c_adapter *adapter)

-- 
2.39.5


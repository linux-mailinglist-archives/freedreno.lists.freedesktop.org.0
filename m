Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E59EB30271
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 20:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C5210E37F;
	Thu, 21 Aug 2025 18:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLgRJJrz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D60E10E3A3
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI956L010548
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L+vnrfh5wkxvST6moGu8zFwo8y31WtRfprWTPNuMSjg=; b=mLgRJJrzeWOzkkBq
 xCdYQeB0PJkwP3l8K9NTongMTO0eSNXFlAhDK+wUFynDp81nQaIRKh7VfQtXOdiE
 xuNxQC9G5nLfpCnYQ5YrcmR8Tnw8E9nrUo2LxtYJH3kR25h+g4omYtf/tpgSpPMm
 3W2mzK6+YR1LZBLUFpCIEYUwfMMsnV73/pN4oRBoVwSh03Ewz28xC6dc9y3vLvDl
 lp3dk6Q/U9HBqsCJXymhGt/iUaVtzVa/xirDK9/vtjMtF7DBADWB99Ta6/53WWOh
 NmwRBcpWwHyBeEl4BBaZ1BQNgfHoI7YDF+DgnMr+dEZcZMQWXo5KUYCgMxluHUSe
 SfZafw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8cbb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4741e1cde6so1055301a12.3
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 11:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755802610; x=1756407410;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+vnrfh5wkxvST6moGu8zFwo8y31WtRfprWTPNuMSjg=;
 b=rxcBcUMr3ntuFGIaLRuiiBATZrtzIn3DLbDSutRs5ovJdjiAwVj033kPp7IZhOIr62
 l5iCy5i6brYVDS5ErD6zvWcbTANZzUrK+xHLHtkT4OARQ/qLA5Rpw1w5aguw1W2kEk+O
 znhM8A04hcSmhg0hiVR4vfccQgKo6UuygHS1SnAz3KIdOymgMJSAb3BtjlR1nXzeMen2
 CQnNZLG5Tp/t4uQDMWrgKX3CUkFUAJL4+aM/jGbn8ekqd0Myer7lklKDDW5zOWdLzq2J
 khrAVFRUzI9/JXxYa2AuvdHJDk/s9MyPnxcXXY97WOIbi9QnMMNcWj+CKFpeN9X31AD3
 1d+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGT/P4LRNRVPuQ6tJ3dd2njNpIEctDify/QYHjXjlW8x5hIRuXr3VhxtOEalk6RYW/R4nK9y/EtTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEWmW2UIdIT6KwCUbc/rtMY/gdSF0FdNI6Jd71xspZL5V2RR4J
 Cr0Sdz8mmlHY3hwpwTOI3ktbIo3Ze7qNHCtSse8oavKZZ8V8Ci3eR1r5WgSvFciLl7i1JbHc9kd
 w7P2ZuXakj0od8LMaexgbVr75NOuxgWgZQoYcGbzAy8Q27jWZ+vuw0VltnpawAtbqfXYgtFip+W
 W/1X8=
X-Gm-Gg: ASbGnctLAzltTqdIfnQcjsp+FQ1+xuFta4A9AcBP0nQnrC0Sru4ZZCa61KD1XNzVexy
 q+KeGfaJw7lO/E46kPCPor9in3t6pcYgDw8UQR7wvlUyagUadA2DJLiro5YD4HzIW+vaQ6jQQNx
 mYLGjhXHKuDNO34/q3xpkgUuwdaKX3I5B878iF+1nH+ktX394XhDaWjf7oaUu8ZPHKLhW/rH0D6
 LhBgRQ+K52K8brgQ4GD0amafzzU/qcqvxln7RSUt/+TCKJ/ELr75ytyZTALBzsqSbLbJgbikEl4
 XXrL8lvbudeQMB/VALh7lTrckg2Gu6CuxJ7eTmhJ3NBVmjrMBrob6GDzFjJOv+3A
X-Received: by 2002:a05:6a20:72a2:b0:220:9e54:d5cc with SMTP id
 adf61e73a8af0-24340daf836mr290737637.31.1755802610069; 
 Thu, 21 Aug 2025 11:56:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbkoS9Oleg0BMcUAm50PQQmuIuPc1U5sybFr6bqhLl0blAssfD7XkEWCeGVPUZNhzXoPJurw==
X-Received: by 2002:a05:6a20:72a2:b0:220:9e54:d5cc with SMTP id
 adf61e73a8af0-24340daf836mr290691637.31.1755802609615; 
 Thu, 21 Aug 2025 11:56:49 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 11:56:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:31 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-a663-gpu-support-v4-6-97d26bb2144e@oss.qualcomm.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=812;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EfCx1AnACdzORFWTq7a/mK0KpOzkdsdN9am6A77xvlQ=;
 b=XGnXES9y4qk+wZkRRx2ofUbx6TA5EXdyY08i0sz/1HJLxVoi0TaTp4HQb61vD0riKc2tD5RrK
 1hNS0+25QZAB23PNN4ZH5Revq3TcNgTO+Zc4bv5OXYJfmLzq12ECf0c
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX+/EMfs76cJaN
 sAu581uOSNG8e5H3LWOUh24g4GiNbj4lNhv5pcouyZnIDULysJWvgA5VeN9FWFQSU1JMPoWYRgd
 VMMEV3rXrAmWYY3uRDdZNlsX19YoXeDhkESSeaJ/LkAUpUoGGTPeCO/bEczS5q900Jr8l7sVGro
 MqVCdZUHZ3eFGLgBuoINHcw/t3MGOy+h8dBgCbeInngm+wWTkUsftP1ANTV9aiZw2Fx+tWNr8+J
 M5PpbciUQ9otMFcQUARZEDZ4iGAeprsqBVFJPL3MuqUB15KGNSSikY/Ib7Kxkqn3BD6rfOEJFvg
 TgEATszsWceDtIzbp7dIL76lkcGN0O+8zaIY/321iY+cxx+qObvYwr2/9yBMokRyrPRp/VkvB0+
 BH3nVk0h3TzVJ7YHU9EP1u/la8WFgg==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a76bf3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jbU5qkt2-FsioPMlu34A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 2F_5yRsxPulzf1H5pZJWo7zwgY1oJ18U
X-Proofpoint-ORIG-GUID: 2F_5yRsxPulzf1H5pZJWo7zwgY1oJ18U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134
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

Enable GPU on both qcs9100-ride platforms and provide the path
for zap shader.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 25e756c141606fbe0876ed48a54809b372650903..e9540cbff78ee44d6d92de10464c660a05a68db9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -436,6 +436,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.50.1


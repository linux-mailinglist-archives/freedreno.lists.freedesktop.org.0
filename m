Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE999C36F96
	for <lists+freedreno@lfdr.de>; Wed, 05 Nov 2025 18:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AF810E78E;
	Wed,  5 Nov 2025 17:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYdEt78l";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gwGhkOoh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EC310E78E
 for <freedreno@lists.freedesktop.org>; Wed,  5 Nov 2025 17:12:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5H2rWi1379679
 for <freedreno@lists.freedesktop.org>; Wed, 5 Nov 2025 17:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sJFOrjhFJZHkN7hWb6jUgTkGNx4wTKXUTuj6Z9f24XU=; b=pYdEt78lNbsQqDKA
 st9bvE0zVFewi8LElkEqz6rHQUZ+mzdCdeoNgIXXbm32m8xamBRyZNFGSm1qh5CV
 nkG6nm8KWX8L7wl6Zz03yVNPbVsEgtqthvWBCX0MQ9i9gfQCsvfT5r8fskMBA2x1
 fGPhaAdDRf3yyWl2XetqUQAcuylgNISsmzURV6yvaNCIeedNWQKfAUlCvZH4uBey
 6Fj/yko3Pe6qPmdhItt7qZpH1xn+b3heHEzIl1Mb61ZjIpqjg2nKIOQjQ2QWh+id
 GXTrb8e/7EO53EVUWm7rBC3vQEi29ScfPEOlVi3Mtj5a4z/mD6G+wD8MrkzmVS/w
 BzqdnA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8amx819s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 17:12:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2958a134514so802855ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 09:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762362726; x=1762967526;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sJFOrjhFJZHkN7hWb6jUgTkGNx4wTKXUTuj6Z9f24XU=;
 b=gwGhkOohX8VKZ8MfbGaR0JiVJJwCR5H3xrBL37khvrhQFZMicf13AwISzRUTXhXZRk
 FfuQH7GBUgGXCt6FcJ6uu5HIvZ8oQGyLhGjl7YgfDYY5vF3ynmAkdY/HHcuvkqevz783
 dJ55u6xDL92mToCDBgD7k4AeXYn0csK63BE0TMFiIr6q2J7CVClk+Xd1+DdLRcJTzhol
 0GTIRVuTmEyjU7dv2bJccC7AvgsVCwgcrf5pYcbMEEiQNKmZjTAg0rQp10qF0rsKpiAu
 ilfMp47/DEmqwyZm8seZEWoMH98YyX0GJg0jgoXC0sUPqPjLzjLcRSpp271VgXqXr5Ht
 oXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762362726; x=1762967526;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJFOrjhFJZHkN7hWb6jUgTkGNx4wTKXUTuj6Z9f24XU=;
 b=PSfj2KWknh5nIpoGAmVJcP4EtbNtohhNDlvZKCxhVTIOhJgZ6GIteHLnbaCblAi958
 MXSxy4JEo5VItamaXJBYiPAT+qQhgOF115TUw9hygWgf5Cgte/OdLCtFe5ej31VtbnlW
 whl3yxNj/B0S/qu5ks3JGTt38DQahJcdzBDeo8q8m3D1vW0h02TRajqJEo1iXVmAKGi2
 LM++3ioXCVwWZ+goPgAEXyXxsZle+E430AT/yFA62UStitzupI31/cpKGnNokXS0oYsq
 vy+AkWLNR8I7tvOP2o+G9P50kNhj9MN8y7xsjJ5BlVmJh+XaOk5MenlgJsUwyuE/wxx1
 ZyCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxA3XNhEx0lvp7Aka03C9X07uWroVAogeK0upEQC/I6TZ8gNdqEdh7EUkZSAXoHd5O6hGAUg81KOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6A3L1M6NHN4Z6gH3Ac75FyEwxccLuOznmMFAueqUjAXxfJm43
 R/N/n0iWq6j1qTi8T97isLFAB2GZxKBi4zsvr6Y6Hgn3riUn0sUE5492l6nr6V6bzjsRNKq77tG
 0ygJE5b55H3Gq2notI7nl6zbckvuuVglK9n1xhS5A+R7oAXyc4Ye0qqsdYkDeqDRikWawc3Q=
X-Gm-Gg: ASbGncti/bsnGQKdulUWxOmvIyeWqj1Mn2iDrFhx5wJvZt9n81lSoHgcx7OSn7q+/xh
 nTkpEBYfcA7NYBIy1z902io8GLLk8L9ZT2PLrm3zkRT+GmRz3MRk3isJ+G5jKuVCDSZpf4jMZnG
 Yo8CI7zrzsDt8LuxJQ2GZqk/fSPPsFw+ZOtUKi7bXsya5JI5Bc4KML3dA9CO7IMum+5Q02ZFv8b
 X10uXcDb+F3YYN0CAd0Jik5aAyCsI2HmOzF6ubqN6vnKDaFqp7L4I7qQaX4DGYT4zuwBCY4HyIc
 cWVhmaWIxsrzPMPyUI4NWxH0RQoJwEDEFpsahtL2OG0+Do8coXEAoIwmABoEzKpgv2DHRFzL+vS
 OrXkr8yBbG3EzqN3aYBZ1u3I=
X-Received: by 2002:a17:903:1ac8:b0:295:7454:34fd with SMTP id
 d9443c01a7336-2962ae4cc84mr53527225ad.39.1762362725897; 
 Wed, 05 Nov 2025 09:12:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeCFKvc+cu2EJhNOU40JxGO+dLcv4OKAgN90pitr4Vd0dhyF8vMM9GVJDPYkZIN/AZ9xuYcw==
X-Received: by 2002:a17:903:1ac8:b0:295:7454:34fd with SMTP id
 d9443c01a7336-2962ae4cc84mr53526725ad.39.1762362725371; 
 Wed, 05 Nov 2025 09:12:05 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29650c5e3c5sm813955ad.43.2025.11.05.09.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 09:12:05 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:41:34 +0530
Subject: [PATCH v8 3/4] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-a663-gpu-support-v8-3-62a7aaa551e3@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762362697; l=804;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=QygCnmXl5Esc5BPNyYe6tgH6/RC9PgKmXDBI3B/5l+4=;
 b=4/hnbaftD85vWOiRvY79AVqajy4IKr/MoIHXNURbn3WJqFZ0h5rcXRY1eU+wws26E3w2sj3Jv
 fn3x+H05GDlBtuMUaJxbVtDl1uWFqTpSagbZRjGwuY+NhsIIxXpYshb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: oZdqcMK4fuDq5IXXL3ATfbmMeKXlEVEi
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=690b8566 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNCBTYWx0ZWRfX+dilD9JPueIP
 2mrTtu2CsjrmFbTC1beN3dR+W1MbxggNHeovuY5RW2AMZ844a39EIwllCyJU6IJzJy3SyF0ALCx
 10lUr7iZw6vQmgTzvmB+u8IeeCGDuwGTX/Gsc851XQcu2niMsZX0sfHGm1ibdBZV3vlya9Jrjgy
 WYhSEBkEp5rNt6tJjljX3NdSTvsXtWDXs2GWG2R9/17TlsrpxoU49Z2rtbJSt3SV2m4Y2clSN0p
 5+RfqcQsVAB4TdViDrz37q/u8MPbUNiHLhxNpqa8+Uw7qy/gSMo6k1Rf5EOiCjqaEzbh9TOUWTi
 4x0UkBJBMTapuicTo1wUBGrydPHOlUFFEyMTURa/yJicp/rn/EFWjfPE+Mn1znQs7kKqkcCyvSe
 xxrh7QVTglPqBI2kNOu0WbS72nZwrA==
X-Proofpoint-ORIG-GUID: oZdqcMK4fuDq5IXXL3ATfbmMeKXlEVEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050134
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

Enable GPU for lemans-evk platform and provide path for zap
shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index b40fa203e4a2f080f501140fd1c68b72d797fd00..28bf152f5fa8e8d7779904986da1a5c2f06a5909 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -454,6 +454,14 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c18 {
 	status = "okay";
 

-- 
2.51.0


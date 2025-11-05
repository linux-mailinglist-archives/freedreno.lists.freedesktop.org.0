Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D12C36C53
	for <lists+freedreno@lfdr.de>; Wed, 05 Nov 2025 17:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB93B10E2DC;
	Wed,  5 Nov 2025 16:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="We2S4wmO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqj5WWc8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6313B10E2DC
 for <freedreno@lists.freedesktop.org>; Wed,  5 Nov 2025 16:46:15 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5E8Cj8876632
 for <freedreno@lists.freedesktop.org>; Wed, 5 Nov 2025 16:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V0NNfdE3hYTw3zNUDaf9Tkr9rvcnD4dKnWyPzOQRNqA=; b=We2S4wmOLyuO1nHH
 rRTzXzsQ0dFfXANFMEu8iGnKmhNm2oE616DBj3v3aCGlvbiYW9J2KTkWVN8Z2wKM
 ruW7IWzMG4AdH7m3znPgYiDHvwg3/5L3akRs6IJUXJn22vHaFE59yHtS+0DHZVMO
 NugzL9PqaCoXhXizTTGVs5/GJpxwt5KfCUMkqCqcqNIzgax3DbWtc04X+23pIloz
 NnalIx3qCMW26nytLWWck0+rr+N0JycPwuqrqYBgVJMNh6tKo4EC5WphkBlxKDZs
 PtrqDw4kvrkadaw+qnwKayn0ZvJPBEoSCc5F1FtIHEbaNlo0bJM0y2b814WSF78z
 X2L43A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88318gye-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 16:46:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32eb18b5659so58062a91.2
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 08:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762361174; x=1762965974;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V0NNfdE3hYTw3zNUDaf9Tkr9rvcnD4dKnWyPzOQRNqA=;
 b=fqj5WWc8PPRMKx/Eucd+oBym1zTHDzcofNVpDFC9t4IClG3k+ZMgQ6hLZd9+XqIND6
 bBBTMRxU/Lps5eaKrRokT/ExOc+qLw8sS0ZEe7AK5OxXdLrjiTKoPQGrfsO/kgwGIMga
 nS8IhS9Ftt1JwwdnDni5mwthV3VBPwIEmLsaKadSmU84JS019/AeWweIvwLuemNOwrVO
 RqwgKpNuVOSsP4QOuGDoFapF7wiMDqWowXou0cfbxJ4UKFplAGWWxku0ZRQI85voeb8a
 Joe3/6vsDxQRbG9Y4nCP2I0H29uSutzWdRY0PSYgo150VCZWshx02f0qEuF07bPee6Ay
 xOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762361174; x=1762965974;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V0NNfdE3hYTw3zNUDaf9Tkr9rvcnD4dKnWyPzOQRNqA=;
 b=S2lLqG+gagwa60tn2iMBf4gxuf6MucflAr/C+WlLZYRAlrRorDfySFJEt/b7Ef7f4R
 l8sKdxm9+TW+bxyq7B3lrh7IK/At75w+xLHaY82dwXMaDicW45SmnmnhQ3EjkNiDixal
 zXmi1gTLnGREumCkznd5L3fP2nmxEHKpXjc5pbAAEgZO0SMWrQiqG2vBOVLgXXjpjnyt
 5vXQeUk4fqlCdWuZbeOeLuu6LVvK4a464aFfTpurYC/MEt7rJBzVx4NHxIUvkgqCWRkJ
 4lLjZQodXD5U6bu3y97nrfb5NKRUapT0ZT1WtIku95hxMF5nkoZqU1W5QXbACkkVUPKs
 mffQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBhbEnN8bFgU2pCduFEicFRvmY1aAbiaImGJ13Cp0e1V1z4T+Uz4kv0hlKnpN7ldmLSKyRSi8zwag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm88KN4tkd99I4VPaZVsnKc+Hg6X0tCn2j4tm7g7mTqvo3Lf7M
 z4KmB+zDvzr87GyCCe/bzCu9ZQpKTHkAGXXNBgpF1eb8tz6cvQ9YSxVBiXJxTYhLeHZgnIS1Xg5
 Uw12eDzMWLSDs/CQxLIukBAE8PKBKW8OlBDWDWun22Zkd/r2223HITE5b8O9ephDEaLbaTAs=
X-Gm-Gg: ASbGnctbF/+Eniv4z8z6LrtcuN0Ja7bGtf+B2j8mcwhC45Ova3bu0TbF+u6C3SCyU+G
 r1neFIFvh40+s3Ni6p+0wzV31Rnl7rILCq9fDD7zvOE2kygeUuacpkwS3F4lrV6NIXkLwPDH8Ia
 U65XSvfBa1EjQ3UC2skCyUXDHfEt+PD/r1D6HPUxgFBMVV19oh87B6waHFhuC3n3LhmvGLhelYT
 UDop7o1KLywwUT4WAGS/GhrwOp9RgBQTgN+y+sBVPD3QqcRaVhOyUwyjLCnyTxTXMw3+xsF5eRz
 fCzJi5+fnlS+9T3Mb2IzXA1C2bD9+QRNa4+jGx4aOI43OLzo3OLP7NFDARmWCYPOHaonlhTELr3
 nwkQiOlJqQHSm6mK4+30+yiU=
X-Received: by 2002:a17:90b:274e:b0:33e:2d0f:4793 with SMTP id
 98e67ed59e1d1-341a6c2dd89mr5133567a91.11.1762361174257; 
 Wed, 05 Nov 2025 08:46:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExDXPdqPDT2NkdJ7fX7iWKr2pf+irb2Zq0hx+Byc3+KFA1DEVgM9hn1fe4HmX+JkqxfTmWJw==
X-Received: by 2002:a17:90b:274e:b0:33e:2d0f:4793 with SMTP id
 98e67ed59e1d1-341a6c2dd89mr5133518a91.11.1762361173752; 
 Wed, 05 Nov 2025 08:46:13 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341a68c822dsm3426249a91.8.2025.11.05.08.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 08:46:13 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:15:45 +0530
Subject: [PATCH v7 1/5] dt-bindings: nvmem: qfprom: Add sa8775p compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-a663-gpu-support-v7-1-1bcf7f151125@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
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
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762361159; l=998;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=CSOgdQpc0lMePHubTaI8zKt7XuYIPcsGjD7SJ+d1YnY=;
 b=i1IXdpI+2THuQXFa8wLghoNr7UkEvIZ+HYFBfmuX0sPOdoo24L21KRdyc21kfonQ2ky812AeR
 7Q+ZR+DzxwSADT8vgD11jIiqgJfy4qZSSfcOGwkSN4fE6qUFppbBcpE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: sRXcCAsUBjLX7sDEUNMC7l_cEbk55gdA
X-Proofpoint-GUID: sRXcCAsUBjLX7sDEUNMC7l_cEbk55gdA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyOSBTYWx0ZWRfX2O7gb9x0U4L7
 kAXkj0VDiShh7UX9xzwC/2yLmCitr3iS0SQcWp/MpfEO0og3D7xBvR4j32BmkZLUtQKWK/0KVvv
 OmkoB09RqYLOn+wZTJMIPpFFPt7HFapKMNjTiISsh32mKwEbXyoBz5S7MTtWgkCn4SUawmykcob
 /ig6Kv5iosqWCP7uAgs3p+Nn8T05n+S4fQlDhAW8me7edPjORAHLKXKcfwZ57Hrhl3rjvOwmTLY
 WWQwjdbMZcDXu7vS2SW+6GHYmP4xO1AVJsdByGRKAly43J+GBhsuGKyq3UTQp9IqNDY34xW/y3V
 ll/O24JcVEsso/sX24x6d7LvHxd4BmxWr9IUguCch10VdIrZVwsv6oMgz0Pf3w5RgadOQ+neP3Q
 +UZP7AZ05iCJZBqbss3Aa/+/pxM7sw==
X-Authority-Analysis: v=2.4 cv=Mdhhep/f c=1 sm=1 tr=0 ts=690b7f56 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=TNpnUgr77EDisZP18eEA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050129
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

Document compatible string for the QFPROM on Lemans platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 3f6dc6a3a9f1adc582a28cf71414b0e9d08629ed..7d1612acca48d24c3b54c4d25fa8a210176d3bb5 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,qcs404-qfprom
           - qcom,qcs615-qfprom
           - qcom,qcs8300-qfprom
+          - qcom,sa8775p-qfprom
           - qcom,sar2130p-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom

-- 
2.51.0


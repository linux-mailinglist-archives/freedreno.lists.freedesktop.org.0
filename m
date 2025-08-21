Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5196B30263
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 20:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823D810E37F;
	Thu, 21 Aug 2025 18:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYFWGnrk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2456510E1DB
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:26 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9BvI003079
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hg0J2wlHD+qbwTRIm0aZirbDd2NKawJ141THIM96R+U=; b=bYFWGnrk+i631NeN
 LipidM3q73BVwNp3x/3nmDSFegEAqSk22I2FZVjSDjQ4TfkV8p6N32nWyG5nrSOj
 BrdNOSb7U0GL3jZKcw1AGkRhu/H+Ueia/4rCnqpao9ci9cKqCzxAMHz6Zp7bvKHI
 uHkeChvMAtG14JP5W+xZyXn6bZTG/qmcJUk0CU0LNkCeQpGZX8+N292G6nVr4pZx
 uAhJIZsZg5Hd5yuOP5Ems6LUJiRt7+of9qf5CL+x+Am21GAnwHoUaVMdKpZxyCe/
 1Pc1x/Ktbr5CXi4r45Dm0bMIEsMtV/1OzCUjSv9b3MSP4z5gxlSVeMOVEywzT49N
 YK15pw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5296j5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b471a0e5a33so2311129a12.3
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 11:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755802585; x=1756407385;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hg0J2wlHD+qbwTRIm0aZirbDd2NKawJ141THIM96R+U=;
 b=Vicyq9YxOoq6fuJlNJYt0MK/SnySFDwkHlcIdBFbEuFANm6/b2HHiaDPkEvSUtTbhz
 OhbEok2ThC7bP0rnS5rFnubrUMQOCDmHlEHmYRaauPsZN8lJ4T/9JtwmvpCvQHsGb+Ph
 6mUY7lHUiAKwVGc0GwC/YR8S4DrJDwQq6nelUjWqtiqFHogKKQDtbE0TJXu3ZtiWnRfr
 wdnG3w8t1gFsWq4nSorlAR9KD3HK9QP39xOuBggN1FkEn7R0S3Qz5E7Usz+MA+GI5Tt8
 yxrLq+weCjaBVA0V5fNdq2ISOr5nQ9jUiRUsD4XkfrfsxEDMHQ0b52zX+woWKb/ZwqVo
 z8wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHFRleAcePEWWB1YKAydmX+msdqjqkSmPbtkVcw2ke7mWrON19bkwG70+ozzuWv7RLUPaYAU/9Zks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWFaMKW2oW22FBHGYt+CISGMFP/L9dO1I+fsOASjYwkKrfgdYm
 dt8RIc1yjXCI102LNeVmF8kkpuqKzMa0WgXW9UJKVWo8HK/xgLanHLX6PbGvFAXw/umPxtFrt2V
 37SxYbtHgMrfiTwUJBR6VKKKfT7c5JZsRUVUL+xFqA9a3owkI8417AdDAc3Mh9vXiMFvFx9Q8tG
 VrqHU=
X-Gm-Gg: ASbGnctBbqLYgpyj4hYxDCMNndNZ/XjXRZu9K4TWassye3mdVfm7aTqlT1RCuclQihv
 gpeX0WXOSOJ6Uk4FLJLKZc58XTtYAgzKPH6heJEMpdqlBt0D+/Wf0JrJvbT/DHlN4JscbNlKCQV
 9pQ6kyAYhy4+QXfUisoFbLzLo9s38oooWiamtyrYYewEUnev/hdSMHQfMFkcgaMxNaSFRXPd7wY
 E83FTSM4U4PxXbQZ4dZW/xfajE2oYgvkTrz9stBmjwaM4+DdAV7GfDiXQoZGHDgPq4QgRJARKap
 7UljSLCMfsAiO7Qvk5qpIsoKeyZ+O+zL1klbpwJOtMfXXSV2Pv2/kVOz+L0eRJTo
X-Received: by 2002:a05:6a20:7489:b0:243:15b9:778c with SMTP id
 adf61e73a8af0-24340e6cb77mr247429637.48.1755802584612; 
 Thu, 21 Aug 2025 11:56:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn6rh0B7c47MXx8XdwaklyhTGhJwh7xCUoqZlm5H7COv9fUxz3qKZRUNFP5avMhQt1EeCF4w==
X-Received: by 2002:a05:6a20:7489:b0:243:15b9:778c with SMTP id
 adf61e73a8af0-24340e6cb77mr247380637.48.1755802584196; 
 Thu, 21 Aug 2025 11:56:24 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 11:56:23 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:27 +0530
Subject: [PATCH v4 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-a663-gpu-support-v4-2-97d26bb2144e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=864;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=aChjfEXy6a3w7pDrZzuIMywJYTXB4ltbGRJ/LVzK4KE=;
 b=/XcmgOUoAHeDff1fiNFaye/iAKfeR2hwV0huFEwN3Fp7thPfeoVIoG3nl8g+jN7M47WJKWChK
 oKS2daX3S28Ac8lIb00kR4jkby/DjG7Xj96UckrTpIbzxV58+O+9Y0g
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: mZHJRRUfEiPyVxiNMwJc9rk0JoxWDiK9
X-Proofpoint-ORIG-GUID: mZHJRRUfEiPyVxiNMwJc9rk0JoxWDiK9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzY656dFtl6db
 zBbfbmnqBaeeWUurgUXzuNFEup1D7edZYgWOUQHf7z6Jq0ba6cOlzV6TklQhaPjzYb4QGsxcNXh
 ikSvBeV9slMrCl5OXbXDQVKpnyb5q7R+eD7WPIqq/iL4xEGy98La5gBdhgBSozZ2p8SkioBCOAH
 UURmt5hWNIQPLzqDRRoAXlADEYDDB0yjKXLYmuvlsam6YuTtOA8/1dGwI7q1enOaxAnmteQQ4uN
 jTXk7vpnYDd6stT2EyEKe574kgvSy2kQS9kO3vOW/Mul56STUEqYuB/YMo733YNv9SakGEgMxa9
 TJpOwJ2TlNAEUlxSjDYo9BAodwd+p/A0EwgbbVjl2mE+Q2k6ZMQEqBQqs6NuUCn/8pQRj92bmYU
 D3lIa9VLo9tEXFtIkYcYSpk6hB7b4w==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a76bd9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vw9LXNJGsfarEDkO4cMA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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
2.50.1


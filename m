Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333FFB1F34D
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 10:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E0810E299;
	Sat,  9 Aug 2025 08:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9GwGara";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6612010E299
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 08:34:07 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793ZCEu013380
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 08:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wukwq66wPKvNOpEVoTlqCM/dX5GluHetZv+gB4FYahg=; b=G9GwGaraZ/Op0nXw
 0zh7xI5yozxuNGwywTecJ/riIn228egTIbjUCc/RD/zp8tZSD04p9PsEXzzOCmjT
 +RY3OYjDYELTx8GIdvM8OKLgB4Wsul5l4XxLUuvSZurneQjXG8jqFiKQv7aPO3Fy
 fT8VatYlMmom6IVuJf2wKyWKaHsMqUuO6R1sZLd+ZJaD7ByNEd9nnAdmTkdHYOYM
 wABPMoTGl1DCcTsGbK9cVoJ5pA6biRKdMmkmFNkQAyAY+OIwoWDyF+ok4Mqy5631
 b4kH5rPzmq+jshKeSsCGbb/Z7xDJ1PhqarMSzeylQICQYxdzWGqjXqQ30HLPGmI/
 c2jxDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj40b3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 08:34:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b065932d0bso79847601cf.3
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 01:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754728445; x=1755333245;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wukwq66wPKvNOpEVoTlqCM/dX5GluHetZv+gB4FYahg=;
 b=idTxMsuDznhcpwHdXx2+fOlkJhIq/iETy2VxEGJKiOqjmEXWpchIgn3tfdPz633v8A
 jIG5YifbeWJLFEQ93nfLruOZlkme10iQ8tuWWjcoNKNlqbQUr6K8KTHsmgvYWp7gdwxo
 M1M053AuNjSxlBU+2c6XNbS5P13fy4CpEcumiq32pogHIDWRZXTCftuBmctkKomyuIsS
 o17edH0l+OwgjJmjLCnPbNWBE6npg4IiDj5rTWitmB1Qp05VAkVq7B+8ghDo8dijsrWg
 YqinOzbTkQgTxlskXwrfOYxdwxduh823NCJpYwVxJAkQm0Z0Ai/ldmyAMRgGq6d5byb8
 OxtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEwCvMAZ+Q8LdUzn+sFrEPLZ0pYxw28I8PW6sMKmfWfMogMCvkS8k9rgkOwzQtOz2YPa1+3KjJX7A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw98QRSzyIzWgkTE+TQ/7V0vTdJXIj1ddAfWFeA1In2VY/NjyGg
 0Ij667BMZQ5Hp01BkfpLrGtvJcUwgloyYUgXvO2USww/NeJKMDfvnguSMynZfefdhRW8M2pXqHW
 heghf2LKAlwcUMzSbGWE3PCbBJxGPztMocfTx5/bVQy/x3VwhXZsTpTYIZ0hQq1eUMzyEVWk=
X-Gm-Gg: ASbGncsgfLjfY+DReFgNdby2a49d6qiRwzC03cBLzOojv6hPuWwHEEsBDlkRpPU3bdZ
 hqN4yOU9SOgt4+vatCSM+QdOsFiFk3ZhibUuGBjSUqqI6Z5jI6hJIOmbB5QxQgUA00LLKY8qq4A
 bzmsi6/+g5zrq2o2jGkTQpAtu9TYWuKEKI3Op3q2r5ZOd+BDTY/LNTehT8ltEg9gZhIFpXMo9ll
 83p+x0acPXdKhqeSkWXsC4kiFetLjaMa2Nx0c5rOYlKHVV13Sv98NW9Ixro1C2bJPmPhvhKO2vb
 WNmdK0fjX3HjagFr6j+kVhVH8I33UmA3BBI2bne3WDSANQkyqi4yrmCgqw0XSfy9koIQlEA/r3p
 9X/3ce8cO6qlshCa5lWvDJC2ami22vLrmGQsOCdrij1v1mW0rdHVA
X-Received: by 2002:a05:622a:1a26:b0:4b0:871a:1d29 with SMTP id
 d75a77b69052e-4b0aed40874mr94915591cf.23.1754728444745; 
 Sat, 09 Aug 2025 01:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFig4RLdVa+ZKtVVWlKq4qwy4Mdk+4soSl8FgCqEL8l9Uc8hKFCmYGvSZPG/3ishEDqASv9uw==
X-Received: by 2002:a05:622a:1a26:b0:4b0:871a:1d29 with SMTP id
 d75a77b69052e-4b0aed40874mr94915251cf.23.1754728444291; 
 Sat, 09 Aug 2025 01:34:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:34:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:54 +0300
Subject: [PATCH v4 3/6] dt-bindings: display/msm: dp-controller: add X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-3-bb316e638284@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1DHFOJ/5Vedl1A10IE8+ZyGBBk+aXq5TcrqsRnBV7aw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwf0KySR7b5nEafzqIH/w6XFWN5nSrXlVFTPu
 zpV2R/SmsmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH9AAKCRCLPIo+Aiko
 1d74B/wLBzPtd5TN16CKun8cN+yKqM7XKe3lvESHvQ8ynyfNoHn2CFWTXxVgsxf6kOzCuuYZEwk
 U4siRD+S3q1ax07b8niuiEcC1bFAuvZ+x2e2UGJnkcip/ABE+g346Cq4711K8seCP4WT/47F0Ih
 eo/YMwLkL5YN7FTwCpai0BCighJaX7h1r1Krn6ZoBIUL0MlgPOqeMvbZ2q9WdTUpHnH0YKAosQh
 O7NB/nEzNgTA8sWUC24e6EMISlwAtmCCPWiHzhItkxdnAmi/lK+34OQSOhdIciDWozHs4I5ieHY
 A6hnaS2SU7P3o3tzqurhlD5EuBeq6qP/P7sFd+2QE4otzehv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX49ZgnEg+zpXK
 647AKpQtCbLm49CQdz1U4UMtTZBQSAk3A1a/7xKEDQF9A2Jn/oGvRYpFewboIZP68nf7xY7oxip
 UBcMWqqF6rl8pv+8GLOdfMVxexPGYspveHWJi6LC1BmJ5wr5rOw+yd2XBbpm3UtOwNGLrMIHPnx
 K/JVe5rFDU0trT6ZuzZECidonw8znYe66LG9auUQKu6maphCinX5v1P6cq+lE7ko/xunWimnN0j
 V+jDbf4G1Lqlw12mtf8utP78cwk4JLdNjGiZPbgmY+xLf57NaZdrrR40Z7CXos5sFOSoJ6H40rN
 4jfcs6ZtS4g2+KXNnJRx1NOWlXSHu6QTFXEAZxPCeIO29uBib8CS2QjJyjWGqlGZPJeS4WsUq8M
 GFFc6Mnr
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689707ff cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LXTjkAqqvG_e-hvHT3MA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7nnpEm1T-sXBOcMTtMAeb2B_5PhKe5-0
X-Proofpoint-GUID: 7nnpEm1T-sXBOcMTtMAeb2B_5PhKe5-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add X1E80100 to the dp-controller bindings, it has DisplayPort
controller similar to other platforms, but it uses its own compatible
string.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..55e37ec74591af0a1329598f6059475926fdd64e 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sar2130p-dp
@@ -180,6 +182,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.39.5


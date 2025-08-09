Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D13CB1F34F
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 10:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E393110E14B;
	Sat,  9 Aug 2025 08:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fgx+DwV8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B0410E13C
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 08:34:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793M94L012859
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 08:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=7UX7bgPSUhQT7z5Z1Un47p
 xf4yqu0J+5ck4pwI5id6s=; b=Fgx+DwV8iEE8s8dHFpHddXxqQG07+GNE4mjaha
 UWkxgLo3MPckF71aZ2IvxWECBxYRPY/k7UNn00B7kXYxsZMlsQ2EMhctU0uX8Unf
 +ORQrQQYr+bgNNwxnJjNuyvZifQmiLreJmaGHs5Ba6SL/cqEVYX7RUgGfsyuxpdZ
 EOw4bl0LYnamFJto9y33Aus+ri1VpxFqmXQ1CfhNlnqRPSQsMLwjBrLQ+dBVAAwJ
 isNhb2JK+MYXCDJ9vNXBv/RLrr75TKIRjqH1CPvlasE2mEWRnvqN6BB69Rslggmf
 k2su7RclCyOw/dBK0ZqAd9lE7EMkIHzsheWcmt4mCXT2eVgQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fgj3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 08:34:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b096d8fc3bso65081541cf.2
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 01:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754728439; x=1755333239;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7UX7bgPSUhQT7z5Z1Un47pxf4yqu0J+5ck4pwI5id6s=;
 b=Crp8uoOy2P7BogKjlK/brh79u4ViSJ3rPw9w6sT6O0xz+tDi6t3jN5G1dm4z/AGHjh
 hP5Mit3mNsAsRht1yq9ESvDfhw8qd6pV9tpC8/wLfxduXYdV4MDytsEbUfeCeXGValWK
 /SfaHNYIgLkv4w3F3x0vIiUJcFRxZ3eyZMxP2XVBq69p3/5c71VR+BLf1AweJm9IZC03
 9HrsRoKdDu1UEnw68LuJS0BQIclYOR4AUI173o7WcP1o/okixkvk1cyib87sjpLH6U8q
 40KEcInrxkmI6xOZNA/wfT5qHNJcQtLgKxZSRLDhlgxdus/D0bGdX+/W5I7AYB6Pz7bu
 Z7LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8ZqCf34+nt+x6KClv0CtlSgd4EmQ36Yztbnaq0GE6jjrm1vDPkt74xGt9aEelnY4FSuSK0DqaVB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxigXitb3m2sBSZdNISvd/2b1XcV0j8ALomw6WQ3lZJipi1MdM8
 vnidZYHxA+LCutw+v7VyjJ8wM24U89WM+uENlPAltWm6P0c1u8eTU7vPbBxFNfpZ9CnDJy2z7P9
 tXtyqzTAeXhTsw1AP8lt4JdElx4EbPXCCdBfN0iyAyhOAr6EHPKHcxuZXEThbBLFJr/FVREo=
X-Gm-Gg: ASbGnctHMoJVdhdcMf7Ddv1wCZ269zduEsCCegVAiYIwWmR6lX/sdcXsw5MDGbvVxvb
 Ij4J2NfJNolfV8tV+C6OsVlACfdyQFeujjxOdmJ89NgyktXADC6fnxf8VyxPkz0aB4crMOegQNK
 MZtss6Bc261YWJUqzmBrPspiJP7mc36Oy73TOh2gMfrFCzUTNxL4laEcrMCRVn2cTjf/sOD+mv7
 ngPFOtT6V2vj+oTBkO90nuJLCGh1qMuHcRCERg1ffAQipp3H3yjasoNR/VZr++iK5Kr3D+OzSxS
 d2kmNf0/BvX8nAaD2PQe3SBkCbJaVfyMgy3C/GUf7ifU50b+jr7EUzMrAGSosqJCPY2R+Wppogp
 AbBAslUVU/P8yWLaH3VKToVFKzOr2uvhSv+BTQ+Nk4qZ14F6WUwnA
X-Received: by 2002:a05:622a:52:b0:4af:3b7:7011 with SMTP id
 d75a77b69052e-4b0aedce1f4mr68179891cf.35.1754728438840; 
 Sat, 09 Aug 2025 01:33:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzXew2BZv/FrSskTEV3OQiREswKfah58pn6beTUeaVcGNjzqZ+Saio9GUP+GmDUIANs7S+BA==
X-Received: by 2002:a05:622a:52:b0:4af:3b7:7011 with SMTP id
 d75a77b69052e-4b0aedce1f4mr68179681cf.35.1754728438341; 
 Sat, 09 Aug 2025 01:33:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:33:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/6] dt-bindings: msm/dp: Add support for 4 pixel
 streams
Date: Sat, 09 Aug 2025 11:33:51 +0300
Message-Id: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO8Hl2gC/3XPzW7CMAwH8Fepcl5Ymo+m5cR7TBNKUwcsrSnEo
 QIh3p0UNHFgu0T6R/bP9pURJARi6+rKEsxIOMUS9EfF/N7FHXAcSmZSSF2Xhw+H7Uh522McMO6
 IW6OaEHznQAZWug4JAp4f4td3yXukPKXLY8BcL7//W3PNBe9c57TqRSO12xxP6DH6lZ9Gtmiz/
 BWMMEq8C7IIoZNGN3pQ0rWbiWh1PLmfIowvRr0YW9t3RhXGSg+ila2xQv3B3J7HJig7Eubnxax
 3BHwpwryuIpzz5+goQyr1tzu763mzbQEAAA==
X-Change-ID: 20241202-dp_mst_bindings-7536ffc9ae2f
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3425;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9AclRADJb8VLv70wpJW0mU6YC9fXqR1BQywSHzWiIpM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwfzJLdyI/SxMbkpE8OyCKZOpEmNd+X5B/vHk
 dPx+BKg+kmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH8wAKCRCLPIo+Aiko
 1fePB/4rgi2qJiP6az48o3ODT0jSQnBLloIfbWVkjJucrhIx9xoiJazRPdND2hGWh3IMoR5H8sS
 Lb4enqqjSFWGuevD+4vJoUT2Lav7XVIDD4WVlKA3Ez4sewHIK/VOSLWkapVjhWI5r3GAi9jLnix
 KZUC6c8nMJMUcp1MW83nj0UrXIxETKSS2c1j4jgKFwNyDfzkm/fp0QKc5jHU/QWGwXwAO5zAboE
 oSS9IKec4RQa/37AWRcAcAEymr/tXWHHhK65a6zNXXdg9KXdVfEWCiskhqZrd4YElsbYKS08XYH
 0satSs36Pq4pI6XaN2WN3AnLfBMvv+fmqBCtZ4WyF6ejw7Qy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: nXyQq-SPnCmqNF3jLU56k_CRGeo5yYOD
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=689707f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=gPXn7k77wXcESHRIjWcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX73e3Wd/ySpgG
 +uZ4iB0xQ1sIxaYZgOwGQPWAMvmlpjzejrTJM0vgzqUjw/12l+arCYR/oDEjudVkjs3iqPgbt8M
 SVr0xFlsFQeRMvhc8UjMzGNCy7mRNcG5mUQoaKmq70TnknqMCfVq9rOiY4Rn/DIj2Uz4aW8RWdk
 qdkQSH7820nv8MZR54Afk0T07iMS3p4qAxfzCMlRursC+s0laFlIK5gPk4iyzSdnGu7R1kLhJBB
 Bq6BHFkBey6Sfpj34eAaX8nsjGbxsvgPOjrKdEKnrBbrWff0rZYfH01zA4FyQkYaYhJXhPIGaZU
 GlW5iavwcIdPNx+6Vp2tSe1P+xgX60M7kcOKke3NPhUD/zP5iZE2ev8740qqDDazP8PJezVbY4b
 /l3TkrDa
X-Proofpoint-ORIG-GUID: nXyQq-SPnCmqNF3jLU56k_CRGeo5yYOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003
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

On some MSM chipsets, the display port controller is capable of supporting
up to 4 streams.

To drive these additional streams, the pixel clocks for the corresponding
stream needs to be enabled.

Fixup the documentation of some of the bindings to clarify exactly which
stream they correspond to, then add the new bindings and device tree
changes.

separately.

Note: SC7280 changes depend on clock driver changes and will be posted
---
Changes in v4:
- Picked up series from Jessica by the mutual agreement
- Corrected Rob's tags (Krzysztof)
- Split X1E80100 DP patch (Dmitry)
- Removed SC7280 changes
- Enabled the MST clock on SDM845
- Link to v3: https://lore.kernel.org/r/20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com

Changes in v3:
- Fixed dtschema errors (Rob Herring)
- Documented all pixel stream clocks (Dmitry)
- Ordered compatibility list alphabetically (Dmitry)
- Dropped assigned-clocks too (Dmitry)
- Link to v2: https://lore.kernel.org/r/20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com

Changes in v2:
- Rebased on top of next-20250523
- Dropped merged maintainer patch
- Added a patch to make the corresponding dts change to add pixel 1
  stream
- Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
- Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
- Updated dp-controller.yaml to include all chipsets that support stream
  1 pixel clock (Krzysztof)
- Added missing minItems and if statement (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com

---
Abhinav Kumar (4):
      dt-bindings: display/msm: qcom,x1e80100-mdss: correct DP addresses
      dt-bindings: display/msm: dp-controller: add X1E80100
      dt-bindings: display/msm: drop assigned-clock-parents for dp controller
      dt-bindings: display/msm: add stream pixel clock bindings for MST

Dmitry Baryshkov (1):
      dt-bindings: display/msm: dp-controller: allow eDP for SA8775P

Jessica Zhang (1):
      arm64: dts: qcom: Add MST pixel streams for displayport

 .../bindings/display/msm/dp-controller.yaml        | 107 ++++++++++++++++++---
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  20 +++-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  10 +-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  10 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  20 ++--
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  34 +++++--
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |  10 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  20 ++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  72 +++++++++-----
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  15 ++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  30 ++++--
 17 files changed, 305 insertions(+), 103 deletions(-)
---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20241202-dp_mst_bindings-7536ffc9ae2f

Best regards,
-- 
With best wishes
Dmitry


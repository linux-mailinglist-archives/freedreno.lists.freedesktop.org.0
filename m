Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E63AB53022
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 13:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166AB10EAA3;
	Thu, 11 Sep 2025 11:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/3/0a2g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3813610EAA1
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBFsDQ015134
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=FDS423Gjn6+znX8tqCMjzT
 ud1+whZkmRe0whIAVRLPE=; b=W/3/0a2gR+Ps/e3URteG2ximy8KQzAk8FnuPf+
 iWE9rtDZnLlrQFP8kCQszJWYPfi+ZCcPvKnLZRjTUQrfd8lJ22aBHZbTF0V2nGF3
 1E5bib4U6HYO1fc+Nm+wavSqmpodxxGlonGHIGjKoR0QJ1+TUAhAUHeXFDS94FI9
 B+3IR4l5MfbCRpO9kx6HOi3T5E0PJ5VnJxmHVkYbkwm3MXQfcHBMIhcU/fpjxoh7
 cSENXlo8MS+581Cv+iPbPhuxM6d02QMEuu1TvpdvIfEDhDRi45qifixEgl4eoHc4
 Yc+lMHBz98sT/B+KK4GYEXW8HxrNo6KEOlaHG4qo+gTpIQZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m78v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24cba71c71fso5730105ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 04:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757589855; x=1758194655;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FDS423Gjn6+znX8tqCMjzTud1+whZkmRe0whIAVRLPE=;
 b=cL4Src9ogjY/oBcJzdRGyjFScsiAUXLlBgnfMlBL5oAO58Vs1RyVaj3nVpG+4l9nVC
 ccA/GUXK7T8AO8WAbAhnejVMwtbW1EpnS7QgQk7+c3818Koln9ryxJTZ3hjAmnIGdDeo
 AmqG3xQdbkBkWT8Sbc8hwe6LuPe77lWZxF+IItGaP9SD41uFXumWB4CbzGjFW71A6rzO
 D+lA2ByirQU98bWDtWHi2sYGVBzjRKdHkK0pHBonBdsXSfIIihBuBTqs/pxqX9P/vurw
 8GuPY9drKaPd6lqR9mSjzWOC2xtVUfi/HB1CMUSNHgNPwI70kMFYCyxXajT90oGFnHv5
 45rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi2ms9ERjsB9UDKwKapGgEJHJZtQGIeBcGbd7Y+BE6vXJwznhjY16WWEJL59uyuzDG1AKD+Z/6mQA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymoiH7Q7U4sYj/F1Bw7xuybLYefWQHxoTHAplbp6wmzd6S5UD1
 MNY24W5uic4l+yMQVNtnB76FsRqv+GchUAGFkFyXYGiu2BZsZLc7Xnz5jIQIP5/fyD2QCtPqce+
 27x6yt3EnjkcudrgXCEt+ZNKkAt+4rq5JrBKJ3nQRecLNhK7pIuHQRTtZwFFhu+pAAyYMPI4=
X-Gm-Gg: ASbGnctUqgnyWjOg6Rt22xCLIrrQEMzQY3Lco+fsJkMpuOB5K4SYHOzgVj9EftDq+YY
 IecnTSur8LVHeqPzJ9bj7MF+CMbMvBkwEro4Xh+vac6Qauq1OZQQSiFlJo8tvS1c3psGjjaWt3B
 wTsqYTPkpO3gbwt9jkUBmngPwfcXrZecc+WAbBHD20M5y/QaCeJA3sK6PAzZ3n7KOVzjnTOZMuS
 YT0Yaggysh2hQrpL7JulAL7xIN9dA6GqctnfYina2agtputRRNFlXi1SfHUqM0vZE08MnMD/7yS
 jhz4alpAfeK9qtwiJCLZsKqManhcesslu69Dm0I8dHTOFawqza8gMI0badOENMNW5OQQXjzFKO9
 IpF2V0ITPMqd/Wr1gvO9PEz2d5IzUyvGA
X-Received: by 2002:a17:902:cf41:b0:23d:f986:6472 with SMTP id
 d9443c01a7336-2516e69b45fmr251381575ad.25.1757589854207; 
 Thu, 11 Sep 2025 04:24:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoBDLirfMfhmGKvavAai/ZI5dn47yVg9pTNdTv7KZc8akLZUz9rWyiQlLajY4JSGJBKzIqWg==
X-Received: by 2002:a17:902:cf41:b0:23d:f986:6472 with SMTP id
 d9443c01a7336-2516e69b45fmr251381105ad.25.1757589853668; 
 Thu, 11 Sep 2025 04:24:13 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c37294b17sm17005365ad.40.2025.09.11.04.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 04:24:13 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v12 0/5] Display enablement changes for Qualcomm QCS8300
 platform
Date: Thu, 11 Sep 2025 19:24:00 +0800
Message-Id: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFCxwmgC/3XQ22rDMAwG4FcJvp6LbCexXcboe4wRfJA7w5K0c
 RpWSt99Tjq2rl1vDBL4k/SfSMIhYiLr4kQGnGKKfZcLxp8K4t5Nt0UafW4QDrwCxRTdu6QEQNP
 6lKgRtQjgwRqwJH/ZDRji5+K9vl3qAfeHzI6XJmkxJbOo6+J5QTUI6ndNm8bGxs7HbpvopChQW
 fE6gGAMjdn0Ka32B/Ph+rZd5edlHnePybya5JJXK1YKIWqgjOb5rjn23bbtD5u5iJ37IaxJSGc
 0jutCGKfq0nGvrVU1KEQualTahqpmirGaCWODQzLf9h7T2A/HJbpJLsd9h6T/hjTJfEyppawwM
 FGG8u6YxZvUlcHZjTEHgtqiqoQWKugHhr42qhtDz4b1hnlU4Aw8MBj8IhpuF2GQFSWdsRJLVcr
 /Njmfz18gpM/8WgIAAA==
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757589847; l=5558;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=s/1T+D31g0bBfRYavOqwENc/3522k0AsmdZ12ZRSWZI=;
 b=4V9nK82alAe+CFeWPPLI9h1X/7x+HJXL74IAe4kqLJYxSFTawMC5SkG4spPySUgesQh2Jhn2O
 eXcv04ReFQyD+/kBaZ3KEOfd568o1GxAq87zM2S3lY/XRSg5rrPY6B+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX9EJIC1W/q2A7
 wIXSrSPNzZJNM/H6gTdf4i+BDKKyEVUqEBwxJYTkQqjIdnQTjSQXoxlR6MALHnBjbtELmhfUI5q
 5h9UltMoVibe7Oo1JCURRDrLdXUh+6aoJVal6+DU7Xd7Zq/FRHPq+9E9qDbV45BqiiRkVQn8JTg
 s/MHLmJpGoIY4bvi3Gp9zqpFXPJSk1tpYHdaxN6lVMnhODct9jQyMmImHuSpgDsoL52UJnUnAo9
 c7x3cITXZ7FVUJdKLIVGC1zZ783MfRXJ8OTtYXKSvApD0S/g+2/rUfG4jpdC3qKyZCRH90QlgvH
 RPMPqcs+wUwMfnfiMuBOGlJWSw5P1/8iM/L8seyHXsWE6yJfKmUnT82fZAv/MQZ5efIkXfVZZgJ
 RoEZTG2b
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2b15f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=A9Q8OG8lNi9f-aPTaEwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Qh89lgYSp0n1HBVU6bDI1kiqazCb2wmh
X-Proofpoint-ORIG-GUID: Qh89lgYSp0n1HBVU6bDI1kiqazCb2wmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

This series introduces support to enable the Mobile Display Subsystem (MDSS)
, Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
QCS8300 target. It includes the addition of the hardware catalog, compatible
string, and their YAML bindings.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v12: Fixed review comments from Dmitry.
- Use SA8775P DP controller as fallback.
- Remove QCS8300 DP driver changes from this series.
- Update the corresponding modifications for the QCS8300 MDSS binding and remove Reviewed-by.
- Link to v11: https://lore.kernel.org/all/20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com/

Changes in v11: Fixed review comments from Dmitry.
- Rebase to MST bindings V8.
- Update the clocks-name for QCS8300 in dp-controller.
- Link to v10: https://lore.kernel.org/r/20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com

Changes in v10:
- Rebase to MST bindings V7.
- Update the P2/P3/MST2LINK/MST3LINK regions in MDSS yaml.
- Link to v9: https://lore.kernel.org/r/20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com

Changes in v9: Fixed review comments from Dmitry.
- Updated the description of dp-controller DT binding.
- Add new clause only work for QCS8300(one DP controller with 4 streams).
- Link to v8: https://lore.kernel.org/r/20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com

Changes in v8: Fixed review comments from Krzysztof, Dmitry.
- Fixed incorrect description for dp-controller in driver/dt-binding.[Krzysztof][Dmitry]
- Fixed incorrect description for ubwc change.[Dmitry]
- Link to v7: https://lore.kernel.org/r/20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com

Changes in v7: Fixed review comments from Dmitry.
- Rebase to next-20250818 and 4 pixel stream series V6.
- Add more description for the dp-controller dt-bingding change.[Dmitry]
- Reorder the MDSS change and UBWC change.[Dmitry]
- Switch to the OSS email.
- Link to v6: https://lore.kernel.org/r/20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com

Changes in v6: Fixed review comments from Konrad, Dmitry.
- Rewrite commit msg in dp-controller dt-binding change.[Dmitry]
- Optimize the description in MDSS dt-binding.[Dmitry]
- Pass the sc8280xp_data as fallback in the UBWC change.[Konrad]
- Add the DP controller driver change.
- Link to v5: https://lore.kernel.org/r/20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com

Changes in v5:Fixed review comments from Krzysztof, Dmitry.
- Rebase to next-20250717.
- Change DP compatible to qcs8300-dp due to add 4 streams support.
- Add QCS8300 UBWC config change due to rebase.
- Add 4 streams clk and phy in the mdss yaml.
- Link to v4: https://lore.kernel.org/r/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com

Changes in v4:Fixed review comments from Krzysztof, Dmitry.
- Use the common style for the dt-bindings commits.[Dmitry]
- Update the commits msg for the mdss binding patch, explain why they
  reuse different platform drivers.[Krzysztof]
- Link to v3: https://lore.kernel.org/r/20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com

Changes in v3:Fixed review comments from Krzysztof, Dmitry.
- Fix the missing space issue in commit message.[Krzysztof]
- Separate the patch for the phy from this series.[Dmitry]
- Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
- Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com

Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
- Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
- Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
- Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
- Correct formatting errors and remove unnecessary status in MDSS
  bindings.[Krzysztof]
- Add the the necessary information in MDSS changes commit msg.[Dmitry]
- Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
  20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
- Package the DisplayPort controller and eDP PHY bindings document to
  this patch series.
- Collecting MDSS changes reviewd-by Dmitry.
- Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
- Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
- Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
---
This series depend on 4 pixel streams dt-binding series:
https://lore.kernel.org/all/20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com/

and separate eDP PHY binding:
https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/

---
Yongxing Mou (5):
      dt-bindings: display/msm: Document the DPU for QCS8300
      dt-bindings: display/msm: dp-controller: document QCS8300 compatible
      dt-bindings: display/msm: Document MDSS on QCS8300
      soc: qcom: ubwc: Add QCS8300 UBWC cfg
      drm/msm: mdss: Add QCS8300 support

 .../bindings/display/msm/dp-controller.yaml        |   5 +
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 286 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  15 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |   1 +
 5 files changed, 303 insertions(+), 5 deletions(-)
---
base-commit: aece0ae517b9bdb725113dbdbd8f409a236bf5fc
change-id: 20250818-qcs8300_mdss-a363f0d0ba0b

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


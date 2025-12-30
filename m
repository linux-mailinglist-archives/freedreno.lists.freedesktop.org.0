Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA21CE9AA3
	for <lists+freedreno@lfdr.de>; Tue, 30 Dec 2025 13:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5234710E8D7;
	Tue, 30 Dec 2025 12:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J43SkAqB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NfCiqIMX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9312910E8D7
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BUB8mkY3971206
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=e1EJpHuhHtgin191Z1rYYK
 gqk35MDf2jz1zjH1Q2Oqo=; b=J43SkAqBxQeiaPEKOBpDHwee5U953tHh555fky
 /aevh/9Iq3GzUKnwtMGj7QFlmsQj8MwTZ3Gq+vDplE2fjXhLuYHv1+nPUWQamcqP
 jN2jUVcWjbSBh7RJ1xHdLZqPsZouXbxAPjlJJMYAZTc5pRCKnvrV22h5LDDHIotI
 dv8AhZaRwiPcT5e2swN3YQI5mqr/qMNfP2gvlKiCQYtuqw/86Q3h0I9UA2MX3TbU
 d1cuplNJjw7r5k2vrF+Ncn1ioP0Pfrvmv7dBc+/oAdi2PNsA7EXfo7iRBkB1i59L
 fSijAU0I3Sh58Xwy9swp7hLlxP/Yp/TdguUFlvzqKIpYKugw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky05qr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a0e952f153so329473055ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 04:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767098044; x=1767702844;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e1EJpHuhHtgin191Z1rYYKgqk35MDf2jz1zjH1Q2Oqo=;
 b=NfCiqIMX05Gq2HHUPSo9zGN1UDT64Lsaz3bY66MPMmV8g0WP7uIyRoE4L1nE48SEFF
 ILZJrR81DRqWYjddOWBDRn83n+4t8gp3/+UFaiVMdY9P2b9s2Kw2S84gDVByF1MCebnt
 4fUq5BbC7Ir96vwfs3eIVRC/jPZsWU7822NY5+YVJxuR0Xa1np/U/zMi4PEl+SYrAzcy
 76Ytnx/1zw7/GuUGbdeod+mfS+lez3iXBgfkgAAE4Bv+03FueP+ckESIluKvoY/8+VIP
 KewINCET/FF8VbcbGjU0lVhsBB1h8tyQzzLQkO8xJ200PFZT7OGK6EhZhunW/HxowNWe
 JVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767098044; x=1767702844;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e1EJpHuhHtgin191Z1rYYKgqk35MDf2jz1zjH1Q2Oqo=;
 b=bYT3jx3wrczrrkYYwD6vjBXNn4sdtetrvf0fYiE7SK40YmtUx3uH0s7Adll6GxxbHf
 lu7YeH0ep1/cLAZ8YutvmHCd6EnqUPxS4glUVGlGPbroOUncG42OvdbH+CscqVWVsUEU
 rcIntMUbnGjeDmklb5elD4rhivAKOngfPKlSZK3AaaEDMRdvuHll1RUMBPAohFalM959
 WA9A7IlLr+P8rsuwgFixTe1iIGGw5D+1PcLVf7FsvTl7dGCN9Y7LICgAvgsIS/bCs6kA
 O+MFVBhednxxP7nhvGXTnfScPrgy1z1/xVzfflCy6nCHKfg06N508A+B/jumG8VfaD5y
 /Zyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDnjLZcAutJ6uXUlRXiIZxt9vasaYQHQAML0Kt5kzR5hB9Ve30OCfqWQHzWQO8QSxLMjdZmCFmlR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweSh1qaKeSaVQC3rQ1l2Dy0LQZ6Uuo+BMpZwbSMolv5x3jxi4p
 6oQLaMWdji/edwhSCP9362/a8BC51WLpSNQ/f/o68/BWxuwGlFYdUuqbD+f1FtsHSFTYWAIcLay
 cC0+vnlh6z1rBMFYzTUYXxWVyoBWjy/Gpe/FquAw4P7Iv8dCsV5l5Nvs4TLCr/HkUNzOrIz0=
X-Gm-Gg: AY/fxX6xASDYlkXveR+6pmaBjlqNs6+W1G2cdK02DpFQwAVFf3oVvG8BEZaBV3EPRSF
 BoPruTVRJJOzMjGoB4mT16B4s2lttlwO4qd/NeEdBu9CsNSlx6gdYfhpcCMUVQreqh2RL4/rBhT
 s2uMT0UNYJp+sbLPUtJ4QTXJnNgd300+8hVtoRZTe2zMnjGGdaSWgiXZAaaKBNlye6qWCSxonOj
 1MafQ1ePjMW6asZZOTRa+KOjJei4w94wBtRxKTWsv6ivyGKZDoVSYDJUeabrZuWYRqwHuIIXBQg
 aKf09L7KYlx6HMlkUKlrsC/D0yjNrsMe2Q0lnm9jOzzH/mMi8NIPJEZbHScRlKcpACOhogLM0MQ
 DRxQONJ1/lQk93fusVhwTHJpOzsoTjPh5GA==
X-Received: by 2002:a17:903:19c8:b0:29e:e925:1abb with SMTP id
 d9443c01a7336-2a2f2428bffmr302949885ad.27.1767098043874; 
 Tue, 30 Dec 2025 04:34:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENyF+WPIkSCef75cAbbFwXBGFHVz0cB9iQySZ5v8vKBfyeFO1nsdl5NeVeEPctYc/krqYECw==
X-Received: by 2002:a17:903:19c8:b0:29e:e925:1abb with SMTP id
 d9443c01a7336-2a2f2428bffmr302949455ad.27.1767098043327; 
 Tue, 30 Dec 2025 04:34:03 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c6a803sm295748695ad.6.2025.12.30.04.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 04:34:02 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v9 0/4] DRM/MSM: Support for Adreno 663 GPU
Date: Tue, 30 Dec 2025 18:03:24 +0530
Message-Id: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTGU2kC/2WOQQ6DIBBFr2JYdwygIHXVezQuRotKUkVBTBvj3
 Yu67GaSP5n/3mzEa2e0J2WyEadX440dY7jfEtL0OHYazCtmwinP6Z0VgFJm0E0BfJgm6xaoWV6
 IRnElqSSxNjndms+JfFYx98Yv1n1Pw6qO7QETjFHxD1sVUJAcC0QUgunsYb1P54Dvxg5DGgep9
 kvi9Bziu8tlIjV6DceRWcoE3SBzaK0DmXIaK/sPgvJdxOkAAAA=
X-Change-ID: 20240917-a663-gpu-support-b1475c828606
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767098036; l=3289;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=FdqG9zrZ6rbteItBZ4Klh3Dym5joJY1hFv9zmxGAJeo=;
 b=ijannswjECqxNrfPcXOhcEvxUr3Qf/PjtIcNRbeD7PQbwVOFwoEbGGc730H3mXsXqOqrtLt3q
 mTxS/TWG605AUYn7iYLDZ4XxexXiYan9oIJXRiD2DyJmWTfvZtinyM5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExMyBTYWx0ZWRfX6breGNjKL0sD
 w61kkKFjcywANzIWIEEl+Xsc58tg/CezI4IFH4fp8C8SBe5yqoSgXUAYLGv8L6vBpA0ke45tCDa
 EzR/vRV0CFt7X/Ej8QIjpo+nFlroFt6tWqNx8WXzJjHkok9Myonn/XYxMRPBJuLD0y1G1GJbkrn
 oTmRp9nhAZI0V3JiPsp+oodWepf1vVmurMF0XNaMkhmi/dpSUBV/6fDTv9zastqKSoGrvo58pdp
 r0CzLuhAejbpqir7/GzeGctEKP0A+vNNb3foS8r8eemaz/Y6Gq6flUTrX3+X2kWlkgJctEmZDf5
 DKCe01IEfMV8COcxnYumpq5AQrK4fW9nXFP77kpVEys08wQVxe5+LTSqh+ivlMuPpCUn5Mrecq9
 UrQ9BfUhF9gx1yRHU5hRNf8QLPgm9HPx8rgJ4zYzeOHpT8Y2RuUY3asxf/lcMqks7+l4ftNPYsn
 iGsrXuMtN+a1gOSviJA==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=6953c6bc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=XWgRTdVboDXnaEeUzZ0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2eKsy6OkrOXo4h8R51DCGE_CILXFYQ-H
X-Proofpoint-ORIG-GUID: 2eKsy6OkrOXo4h8R51DCGE_CILXFYQ-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300113
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

This series adds support for Adreno 663 gpu found in SA8775P (Lemans)
chipsets. The closest gpu which is currently supported in drm-msm is A660.
Following are the major differences with that:
        1. gmu/zap firmwares
        2. Recommended to disable Level2 swizzling

Verified kmscube/weston/glmark2-es2.

Bjorn, only DT patches are pending in this series. And all of them are ready
to pick up right away.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v9:
- Rebased on top of Bjorn's arm64-for-6.20 tree (Dec/30 tip)
- Link to v8: https://lore.kernel.org/r/20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com

Changes in v8:
- Corrected patch#1 subject (Dmitry)
- Dropped the patch for qfrom binding doc as it is already picked up.
- Link to v7: https://lore.kernel.org/r/20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com

Changes in v7:
- Rebased on next-20251105
- Dropped drm-msm speedbin patch which is already picked up
- Picked up trailers
- Link to v6: https://lore.kernel.org/r/20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com

Changes in v6:
- Keep the efuse's reg range 4K aligned (Konrad)
- Update GMU's opp table to bump frequency to 500Mhz (Konrad)
- Link to v5: https://lore.kernel.org/r/20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com

Changes in v5:
- Remove unnecessary labels in the gpu cooling patch (Konrad)
- Update the RPMH corner for 530 Mhz
- Wire up the gpu speedbin node to the gpu
- Link to v4: https://lore.kernel.org/r/20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com

Changes in v4:
- Rebased on top of another series which renames DT files
- Enabled GPU on IoT boards as per the latest definition
- Picked up SKU detection support
- Added GPU passive cooling support
- Link to v3: https://lore.kernel.org/r/20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com

Changes in v3:
- Rebased on the latest msm-next tip
- Added R-b tags from Dmitry
- Dropped patch #1 and #2 from v2 revision since they are already
picked up in msm-next
- Link to v2: https://lore.kernel.org/r/20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com

Changes in v2:
- Fixed ubwc configuration (dimtry)
- Split out platform dt patch (dimtry)
- Fix formatting in the dt patch (dimtry)
- Updated Opp table to include all levels
- Updated bw IB votes to match downstream
- Rebased on top of msm-next tip
- Link to v1: https://lore.kernel.org/r/20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com

---
Akhil P Oommen (2):
      arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
      arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: lemans: Add GPU cooling

Puranam V G Tejaswi (1):
      arm64: dts: qcom: lemans: Add gpu and gmu nodes

 arch/arm64/boot/dts/qcom/lemans-evk.dts          |   8 ++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi |   8 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 174 ++++++++++++++++++++++-
 3 files changed, 184 insertions(+), 6 deletions(-)
---
base-commit: 0e31dcfefd21ed76ff1b2d05647cd34336ab9772
change-id: 20240917-a663-gpu-support-b1475c828606

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


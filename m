Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11727D237F3
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA12310E71C;
	Thu, 15 Jan 2026 09:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWtbIack";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hf5UFYMp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21A989321
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:12 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g0SJ1055228
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=FV3nONimYsR0PrhxI5KPJUKAwXWGm5Fx9h2
 vmS9IGy8=; b=cWtbIack/GPOswRmiz/IdCY4Ooq2WW+TUMInLIpoDDcH/s1bxxT
 zha1Ql0Fh3C2ZVHfgivUTuElxgxhUa95MhhNpCZy810ftY8Ko/r4Bg0NFwjyFljw
 AOCBoUqL3rvn03KTAd3Ex2y4T74H8fCre1JqPBKRc/DYLsBGa+647/Nww6RbGbB1
 iMpONPNwjRD3xlxd1BPvoLPpBANKvvItX0A0XPkjFQ+DXgUNRA9WMHNgFIjNEFID
 aEmVdx35X15dBKCQxSNwWO4PDEMEaLec3Sb2KMEBHN0nd6W3+A7I+7NX3ithsl3n
 4vPI8o5KI3h1uCvwml9hozATYke3QHI5w+Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d3448c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a3a4af701so17516916d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469290; x=1769074090;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FV3nONimYsR0PrhxI5KPJUKAwXWGm5Fx9h2vmS9IGy8=;
 b=Hf5UFYMpgZj92ZSn2bktSzS853ICqNj66Wwx/dtSwNVA5bEytLcQAp44wdfmKdprMG
 KrGCzB3JTAg994O/YHhrswcsl+pgIai4FGDsGmlbMi9W8j0J3c9lVgY3nTM+0Y7vz+DA
 n8iThxXVe9YTpM/FQALQEqSqt1fQYQSUBOwKG3LR75Rqxql6c7yvXzrYV3jm1S9P5NXS
 KarpoCcwZYIyjpp916loXCm7+iWr7oYAtrlWqw5y6TSGiHbMlWm/1wGxidxC9zAMUUax
 0kF9m1qX2vJLBbVxpGJ+LpINMMwKxoH/9iZkUfMdjtgY00QaDFApUGhmR3IAyq+ld6KT
 X0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469290; x=1769074090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FV3nONimYsR0PrhxI5KPJUKAwXWGm5Fx9h2vmS9IGy8=;
 b=Coejx0dgWAR3NWmh00OcZ+P//ppQZ79ybel2DjUm+MgMubmiFFMj1GLMdkLM6rWc3Y
 izo9l3qXMXH5URdpd2xxmQhnwnoTbLcs2t8GfKw1Zsr9vOD/dmNYZpI9mN2gY2X44YiF
 GQCLMCLwj5UVoIIgbV9QV/MqUEIm4BtauAwgOs++l9nTPsmPL3LVjMhNAtKG6+Gm6ltM
 KJlHAcoI5K8vowsb5/8M0FL3lNWKawObNuopgDjMNMYRq3f5QUXSEccLEixknSeCk+8Z
 REKznKKKSVE8N6gB8lGqVWBcegUDFHPCr+WJTrQoJI0u59t0kUl9eNfyD1eZb4SWu8iT
 oXTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaEKrlpMPeYOIaM4SxKBgJ9vQIlzuWOcvBApwGmQZ3QNh4bLzqR92awTb0pKz7SuKwT/PkLsn6k8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqmmBawedDxuCIJc5IPjouuL9S0rgt/7Xkxncr6f6fMTrfyeIA
 EMltH6iMlLl+InxapCI3U3dwZiy/Yw09252gBCHNDbMFb2RuSpII9vFRnVCrDZWZrTscfwF0Odc
 jsun/HB9L2X7alAc3ldA+ppS2ZR/pguNF7JC3MdKsFYhvK6+nKNT7mdw0E2ZOnsAz9rvkQAs=
X-Gm-Gg: AY/fxX6w5BWaxZSTthseqLw1+YJDzI/5IkNr1EnrDBi/6QG/BOSp0hYDE3sXlxejwFR
 c4fizuyC0c9mn/EEIPJH1EdBLuN4x5AKOd+D4HokjwTOIcaQB8nqrSncfL+lIHmKv4AhAyW/0CN
 i/20W97pa5Lq/+by6YhyTTIrg8Ppz7kfDnxc2SgsNHqbHwqdxjrIDUd6lxGLXenJQ9jkNcFS24L
 dGqHH/q+DltwkNJYBn29xIHP3hQ9USHR02yyNCupj1062RjmKdCiU0IPn2Fc+2wl+Rc38LnJAr7
 ACr+U5hMsD62+H3k2m7mrK/rQWiLLORU1AEqOg92ilwUAJy2nNkJj++jkz7roH2gyhxudaCG6rk
 bsFZUGJliPpoA6LnVnNCCTHIvdrx4t13cMX+C+MTvbXhJa8D08ru4SGyQo3U+PNFfF2U=
X-Received: by 2002:ad4:5baa:0:b0:87c:2967:fd32 with SMTP id
 6a1803df08f44-89274387480mr77132476d6.22.1768469290192; 
 Thu, 15 Jan 2026 01:28:10 -0800 (PST)
X-Received: by 2002:ad4:5baa:0:b0:87c:2967:fd32 with SMTP id
 6a1803df08f44-89274387480mr77132276d6.22.1768469289733; 
 Thu, 15 Jan 2026 01:28:09 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:28:09 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v6 00/12] drm/msm: Add support for Kaanapali
Date: Thu, 15 Jan 2026 17:27:37 +0800
Message-Id: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7sbjG72geHVAby0dgcwpxpQbVDkIox30
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=6968b32b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oHaaim5x4gMG4YHD5WcA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 7sbjG72geHVAby0dgcwpxpQbVDkIox30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX7tLv7qz4CoRU
 CyjG8LPq+Ubq9vsJU34b6x3CW+lDfmmGtFo5I5/1BpgsF5QgFf+clNJYi/OfZUzhNNEWJSwW4rT
 EEIwuv4bBG1v2J4Gc1llijSUriq2wGaM/OPuzaifYg2UThm+oowDoH7m96+ZY3XVTrgaOwu8i1M
 HGrD7cgcCCuyJBJt0od7LE2elogOxdRZm2GH2mOIe6cv2OV2w19XUKquK9wqqzdR8jNM04epuKQ
 0B8LTxw42lsAvGXEb94FmAaC/ERjXFmlzK65FUY7GG73MXzC6GDZUDKmU2AafilJHsx4suwFGhw
 MukMzaDP/wiwWNYSPuvjD2Mjv4ZXW+dXRlUnBIGqDybo0AdgZ83y7wj124anTCVCzIq3nzczWQd
 WMj3VuZx2iwhG1s7yGqs0cskjAS0smEJof8Y+f26X/oZRKCl3a7GazzVyFaTcFMsupYZReGzmdy
 JLtoPfIV03kBJdAT8OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
- DSI PHY/DSI base address have some changes.
- DPU 13.0:
  - SSPP layout has a great change.
  - interrupt INTF layout has some changes.

This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
in addition to the driver changes.

We have already tested the display functionality using the Kaanapali-mtp
device on the Kaanapali branch of kernel-qcom repository.
Test command: "modetest -r -v"
kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v6:
- rebase on linux-next tag: next-20260115
- rebase and fix merge conflict "dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY"
- rename _dpu_hw_setup_qos_lut_v13 to dpu_hw_setup_qos_lut_v13 and put it to dpu_hw_util.c
- fix wrong indentation in dpu_hw_sspp_init_v13
- Link to v5: https://lore.kernel.org/all/20260108085659.790-1-yuanjie.yang@oss.qualcomm.com/

Changes in v5:
- move sspp v13 related change from refactor patch to sspp v13 patch
- move sspp ubwc change to dpu_hw_sspp_setup_format
- split wb change into a patch
- Link to v4: https://lore.kernel.org/all/20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com/

Changes in v4:
- fix qcom,kaanapali-mdss.yaml compile error
- reorganize SSPP patch order
- fix Dmitry ohter comment
- rebase on top of msm-next
- Link to v3: https://lore.kernel.org/all/20251215083854.577-1-yuanjie.yang@oss.qualcomm.com/

Changes in v3:
- split SSPP refactor patch
- add devicetree email list
- fix Dmitry comment
- rebase on top of msm-next
- Link to v2: https://lore.kernel.org/all/20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com/

Changes in v2:
- Drop panel patch
- adjust patch order (bindings then drivers)
- add dpu_hw_ssppv13.c to complete kaanapali SSPP function
- fix bindings example dts compile error
- fix other comment
- rebase on top of msm-next
- Link to v1: https://lore.kernel.org/all/20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com/

---
Yuanjie Yang (12):
  dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
  dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
  dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
  dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
  drm/msm/mdss: Add support for Kaanapali
  drm/msm/dsi/phy: Add support for Kaanapali
  drm/msm/dsi: Add support for Kaanapali
  drm/msm/dpu: Add interrupt registers for DPU 13.0.0
  drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
  drm/msm/dpu: Add Kaanapali SSPP sub-block support
  drm/msm/dpu: Add Kaanapali WB support
  drm/msm/dpu: Add support for Kaanapali DPU

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 +++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 124 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  56 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  13 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  23 +
 drivers/gpu/drm/msm/msm_mdss.c                |  10 +-
 22 files changed, 1475 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c

-- 
2.34.1


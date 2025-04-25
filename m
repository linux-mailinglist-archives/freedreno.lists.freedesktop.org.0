Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD72A9C43B
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 11:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC5010E908;
	Fri, 25 Apr 2025 09:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOPRG4LN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBC110E908
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:51:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TJJh007565
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=JRsnett4kSInQcfMQHChey
 cJ1f7Fq7E53m4nPx7dOrY=; b=fOPRG4LNX5o4fTJpyTJufH5J/xL6fYrcuZucl3
 KQsUeqhuNdWcq6YzVIlIEsuyrGIiMFouvz4GTpqRmOeXaVvkLuv/pVP0p9VYFfdZ
 ox2v+jvvo9OdbahYa1UZOwjHMssRoTXTQ+05Q/ufCXRmzPO+Y/3+trau2N0clDL1
 7SM6OdHZHyeiivXo2z6Yn3djbLPeXT99Sj0sP94xf0tb7e1Fr5025d3vrfFZtSuZ
 g6EZaKGUHyrotqCv2johyCNsb/fGH0JfCGTAOWik1DQKVxBJpdmkEVCw6Xi4dNxt
 9ewKJQ/NvHteqYprIav/c+M41m3qGQmFLTOUXVtHY0QcklHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0res1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:51:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5d608e6f5so577158985a.0
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 02:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745574716; x=1746179516;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JRsnett4kSInQcfMQHCheycJ1f7Fq7E53m4nPx7dOrY=;
 b=g6lj8gWpDMvjTn9LECc/TXsa2eV/d6MAoFIWY9jzschYR7Nh5Mr/G4xJ7/DdWTuS8T
 ZHsyCUo3a9hLjBGvfNx/LIJeWaT80OWDPk3XqFbjORVU1nGbyDiueWvCucjvEDrhwnGl
 viSGn519Mt7abIGUy65Ff17ELCVcSCvrztz2Gg5VAMzatHwRFJ1Piltu5XorhudzWaM4
 jHigJoOR/5B15nD/X0oH3YzJAggevFPuzolEeoDiLcct0ii2tMMRcXrY5G/ROhgN64sS
 M9esSQAFra5FRZuDqDJaIoW7RCIH6oGg9ouui+yHIKD+frRy45Xn0PW23EvCKaMwqVUh
 vAMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv0x1anKQnTb7z+nI6hv6SZYu6sPa0QC6192xMrlTpEFhmndHjPbGbzPPps9FtjvYtNDaJ/l++PD0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvmsPuN1P9khJUqXx1Sf58RoT04vYsaOc6j/8SD3+SiLDF/CpB
 leSBu6Whit12WImE+i3qYD0X/85hHJHJ2/RbUjFmbQ1obvUzHf8OYTkFhzf9V1md88PaZWpv66s
 i5QF5fT82yQaE3OhbhhS14/xvWsOVqeBlfF66Oaw/OyU54aGhX4OGn1cRZAmAXTdaR/4=
X-Gm-Gg: ASbGnctFGRrPBXjAfjQp8ycLYv83OgLUYH+mki2R2ZVgl0bsIk3YeeMDK8rdbN5JuOK
 ykUztPC+uC0AXRuM217J9MESj00Sm2CPSEzNYej53Juad6gQqS7B8iAiqcdc8jM0SQfA4iSCFYP
 A0cUiFsWdMsZsZCWO8uifLtmNGPW16c5gLtZF4WpklgSPM8iabbYxnvXBWmntm9I0zYQMoGs9du
 X+jLxX+kJdhYBUNSTtSDl0DdpycbVO03HcHIIkhEN0VV/ij1W/TZRk2Np/3i+Vn286MaQru12rN
 OZ3qT9DsoTI7cVqXk1RrIZdZ2NPIW1CtDxpmczgxwMddg+fIRPMd3tbk50+TFK8IDr/wtiB6Rfh
 ZkTQWcyOdEX05NwKlRBY3vvz0
X-Received: by 2002:a05:620a:3727:b0:7c5:3e76:bcd7 with SMTP id
 af79cd13be357-7c9607a69bfmr303271985a.37.1745574715834; 
 Fri, 25 Apr 2025 02:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu2cbMZ6luKxRUfq233zQk8HcwMCsp0kUGi6dzWhWP7Glh2HrpXIW9VL3IIiHTKrdr88PnLg==
X-Received: by 2002:a05:620a:3727:b0:7c5:3e76:bcd7 with SMTP id
 af79cd13be357-7c9607a69bfmr303267385a.37.1745574715471; 
 Fri, 25 Apr 2025 02:51:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:51:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/7] drm/msm/mdp4: rework LVDS/LCDC panel support
Date: Fri, 25 Apr 2025 12:51:50 +0300
Message-Id: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZbC2gC/52Qy2rDMBBFfyVo3TF62Za66n+ULlRrFIvGVhgZU
 RP875UCgabLLu/AOTN3biwjRczs9XRjhCXmmNYa9MuJTbNbzwjR18wkl5orMULwsPirhkvxGbB
 OghmCt3ZiFbkShvh9171/1BwoLbDNhO4hkXwQA7dcSdFppaS2IMAvcaO9+3S05/krlbdLXB2lL
 tG5WeeYt0T7/cYim/u/por1jXxuUSRwEL0L2PejcUr8plqNoh5LG/3nB0VVerJGjcZYMzp8oo/
 j+AGqNzyZZAEAAA==
X-Change-ID: 20240317-fd-mdp4-lvds-e317f86fd99c
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2413;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xowDveuOyf5Nxh/NFAAn7qa+GiIhDnbYT0YIxlH8WNY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5TNsIrW5kxewN3uQBb93kWSf47xMOC5iL1
 7tVlGHBMF2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1V82B/oDKgWlSZpqvnXJRApW6xUB2qmZYoZRwED+luGwDSKnjfmBS9yZBVjK0arPoVQVXEH4UjE
 ffdzxGRTgo9F0QqeHglDd7klcZPmZ3YtIDJ3uetLJpqPO1ZJjPq7uBwqSsLGrTtPj57i1Fm0yN8
 Xxas8dkMrISi5Azph4mcuT6h6vdhHFe/sJ0qFwj4G3zReoHRD6UhXqAxiReutRwsHqHy7iHMCMb
 p53bb39Lvf9U1XEr02tDn5xaokVfC5NQyuQcxRt4DoJtJhADzmY5Lix02NCNApX23rPE8aZM38G
 4/mZ2d5D2lnkdNkV98CDiaDGHR29qW5t3HJmeWFukHNBW8M1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: u8A-QuIUwRIb6ogLZg9fE-PnfL3TQvT1
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680b5b3c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=svjegcxvsEnm_b_G_zMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: u8A-QuIUwRIb6ogLZg9fE-PnfL3TQvT1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX/Fn3cYggju8c
 j68rZtIZ4I790EMsO+x2USnM5VCfYUEyXeriJNfgcNtNdwWbgah3N+9rzvZoacsCOh6mSacnkNQ
 j1Hcat/dglNgGxHaG/Fws2AyGp9VhvHR68fubjV/hCiVrN67QB8LSY1N0dMf7c16NA8cjDner4i
 8ve1iQ+ZOa6U0EKJleuweHvzfoyUJZk5soGXnYIOgxYuKetAc5F/q9Jw2kJdUEmoj7bx3+jZFlx
 FccY0zcPzJFaTuBOGbB4KGOCgpMYWokOsPoCCXCXXpbm6aDyvpQjPwzKoaAhfV2YeeL4JEynSww
 lUXYecV/Nf8fk3KMvV0qygj4+KmBr0+P9n+pN3uySwQA4f44bH0f2brRYPv4SRbQBs1onvRUh8S
 jC7jxfmrZqeXptZoUzEqbQ6+FK57RR7gnfcAB3e75qIE8Aw0OU06E8IWct6+LU9TWLSVwwx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071
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

The LCDC controller uses pixel clock provided by the multimedia clock
controller (mmcc) instead of using LVDS PHY clock directly. Link LVDS
clocks properly, taking MMCC into account.

MDP4 uses custom code to handle LVDS panel. It predates handling
EPROBE_DEFER, it tries to work when the panel device is not available,
etc. Switch MDP4 LCDC code to use drm_panel_bridge/drm_bridge_connector
to follow contemporary DRM practices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Retained compatibility with older DT by reusing PLL as LCDC clock
  (Abhinav)
- Link to v3: https://lore.kernel.org/r/20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org

Changes in v3:
- Fixed commit message to explain that DT name is used in addition to
  the global system table lookup (Konrad).
- Link to v2: https://lore.kernel.org/r/20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org

Changes in v2:
- Rebase on top of msm-next.
- Upgrade LVDS clock code to use clock providers and parent_data
- Use LVDS clock from the MMCC instead of using LVDS PHY directly
- Link to v1: https://lore.kernel.org/r/20220616090321.433249-1-dmitry.baryshkov@linaro.org

---
Dmitry Baryshkov (7):
      dt-bindings: display: msm: mdp4: add LCDC clock and PLL source
      drm/msm/mdp4: drop mpd4_lvds_pll_init stub
      drm/msm/mdp4: register the LVDS PLL as a clock provider
      drm/msm/mdp4: use parent_data for LVDS PLL
      drm/msm/mdp4: move move_valid callback to lcdc_encoder
      drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
      arm: dts: qcom: apq8064: link LVDS clocks

 .../devicetree/bindings/display/msm/mdp4.yaml      |   9 +-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  16 ++-
 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 ++++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  16 +--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  50 ++++-----
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 121 ---------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c      |  51 ++++++---
 8 files changed, 105 insertions(+), 193 deletions(-)
---
base-commit: 52beceed7049f2b4dc65ed0cc84b673bf804b679
change-id: 20240317-fd-mdp4-lvds-e317f86fd99c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


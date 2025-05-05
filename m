Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD72AA8A17
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 02:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF9B10E143;
	Mon,  5 May 2025 00:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jY9I134T";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BED10E143
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 00:14:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NLVJu032287
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 00:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=l90h0HGpLRpkB0qNvwdUHZ
 hYMuIvBrbptPLn9QIs7xg=; b=jY9I134TbSePusW2ZUmNzl90f6cO3f74Ixjv7u
 yI8bgMxgl8HLcl+s5jrsf9P7q0Rab5hFw2FFPoNeVXpTCFeb8dR5E5U0yhJsjIyo
 qYG/mrCSNLGTZxnmuoYIgmE60zUR9jQnxpiCUV9Mq6qmp212qr0TcHPoKE03rpvk
 Y15L65dvlVGWfAZZxo6merFAtgYPrrvPWM/uCIyDIz6pj0QuLQHWb/UU/oA25F92
 vt14aSTRPPFP434gsloK2g4wsGhdTcqLytE/Jj/mJ/Nu+b2uVv6gzQMi32CLwkvw
 xCrvJS0TZFFay7A7v5yrhJJ6Egdc/GaRAiK+8Wo3ekXC1J4Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9ahh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 00:14:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c54e9f6e00so869614485a.0
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 17:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404096; x=1747008896;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l90h0HGpLRpkB0qNvwdUHZhYMuIvBrbptPLn9QIs7xg=;
 b=vqn/PwoNTlU9AwYOtvDkmrPtD2hYFMlpkzY5nrDU0j0SBzjD6LtxPnt2wRY1NxfS7Z
 +HERsIOMrqr0VzZ83OEoR3YTL+2caqbNBEuPCIRGw4shKUWrrBCKjzeJSy9vJpF0krHb
 /22xjHl3oqWbGgdKYvYHxU3CIV+uGDWk6GilfZ75HBOqdRTj+5EZocrrWJObjZpkkdhW
 I5gBGZ9RQ3oWK5C2hL2dwvRvbxNyXIpy6Cji0u2NJC9v2A1iQqY8qp0Nfd8/0NFoIroD
 D3rK3s0/wpvoAVfMF+biMAF5uATYUBZ/PKa6KvYXV2XCmUswtSgJ9D/1Oq9kjQNnt8jX
 oJ1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdS6hB96VRcggFJK8GwndW+PRJ5yuQHrwpj1qjZeDdNOvRefMLkxitDOt+6wSF/+M6ulIZtNccl/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgfwBbrlBQF+BcMkNKzd9tLtHpBZajBTAbklrk7bKf4PthXOsI
 UjAz7D6Er0bDlMNq+tLAhqDSuoO61K0aENk9KQcITJlrvhaG1Zz3doEev660bpp9LPaR2agkNkx
 jyhvc37GHV3zycoJcuMt52uEx7Z9R3Iy09Q33BF3DHl0uecZOiniNstpjbsAYNRbnDGU=
X-Gm-Gg: ASbGncuSTjY2J4Wy7ryIh0Gr673O/dwJoqpxo8lzhQQ0qd5JLIpqUTgtFjRktPV0Xzj
 /rab1pq4bXGAKvXSAUTTwNL05X0urFS1DExii2pWBPgnZ5JzqmFR/Ty3oenZc6FLLyAuUU7BS/c
 Sjut2a+iMx9bdkanPXGhOTWbqRIG4/e5zF8Pwey7iHQealFGXcEGaFelIpRABuv5NH6MqeFIpHy
 8Fb+/KEoH0i2BaVRzJxN1Wn7DAZf6xp6v6oR80C6NYOJp6t27QzDZ1RQ3MT7Z63e95SOTQETUD0
 /4jCnblA/StFimN5HyiIqyALwIgj+rBx6lvdTgxocG2WzTq2t1OWqYDP1mIEOeyr5lVAfBEmQVT
 TmJ5WuYdFcH8h7Zl9yWRjx5bB
X-Received: by 2002:a05:620a:404e:b0:7c2:f39d:d0e0 with SMTP id
 af79cd13be357-7cace970621mr2280185385a.3.1746404096365; 
 Sun, 04 May 2025 17:14:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtGJXxyiZuVoheTixj01E/WidOroFmG3EK+TLgG2+eb1c8BMLiBCNLo1GSEwRMtdW96uybvQ==
X-Received: by 2002:a05:620a:404e:b0:7c2:f39d:d0e0 with SMTP id
 af79cd13be357-7cace970621mr2280182385a.3.1746404095994; 
 Sun, 04 May 2025 17:14:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:14:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/13] drm/msm/hdmi: rework and fix the HPD even generation
Date: Mon, 05 May 2025 03:14:44 +0300
Message-Id: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPQCGGgC/22Qy07DMBBFf6XymgnGr4Su+A/Ewo9JbUHiYoeoU
 dV/Z9KqgggWXtzFOXN9z6xiSVjZfndmBedUUx4p6Icd89GOB4QUKDPBheJaCOgDxDAkiMcAKDv
 TBXTGImdEHAv26XS1vb5R7kseYIoF7d0huZFccK2FbFrTCQlPQLapLI2zZanxPc8vH2m0JTe5H
 FZpTHXKZbk2nMWq/r/MLICDl9wF13rtW/ztWdvM8gc2dHkDS4I7o7Q1yrtg5B9Y3WFN/Z+3sCL
 YCKG06TB0bb+BL7dhCn5+0brTbR3mbEXweaC/73dDHR7pwYiniYDLN4Gi1WOWAQAA
X-Change-ID: 20240522-fd-hdmi-hpd-e3868deb6ae0
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7Pino99IS4gxmEVNtT1+Fg674jvsTFh8QsSqJonlwOc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL7k34CTyL+GciS47k4GgyjUDHX+AiePEWZZ
 PZu+mKeY1aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1d7DCACkX6diSixrEFcrvdjBBsobYTaNgNHevK3bgBqUR79f2pfonOim2y8lJLX9Fg9goVbj1qW
 al7hSm6nEwi6XSkld5cDVhg4U2y6DgZDOVwGUtre+qLRAx/Cb84RPUhUmpYsZyn2EEDke7sgoNl
 nSqNbc5I+gGdXVKsL2NUyZ1EwLtwKsivS+5gt3TvZvhwsSWdi8iFuXAAVICpIhMq0RHH+qLm/pJ
 Yb3ZFzWt8++wR9qcVZRjufl6hFe8/zHs0PcHaHLqtjtC7y2Qt6mTlATiNLn3ijqIRVgYB5eWZw8
 C829W9kv/t0e/7vdGOcCuEBrjBLc+Vy/WiUfCSOYEL0XhMA+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX/NU5x+KLFehn
 2cto61q+f82owELc+dPqCIWvlJBu0BleRwYcy37TX7I72bTXoQxfdOK5ERlSgKQJFTk6SBqMYyg
 cX2REDDv25VkF7cHDhaJi8dB7ehVZfiTtoF1LxSbN8n+tCg3nzZ6pbyQN1YqceVwxYiBAZWGtXf
 jTu59njdgzHTlUrrjqv7nQGVE9lkxl+rhcMGMUbrByejeBOyip1rSMncPL06ybJWheLgwN9U51Q
 Jn5K9U+BX0uKriSu7tB2zSOhQq4VRbeuFq2rOB47F3hIA8rk6wNuj4ibyYxXjfkK83NGh5X/Edi
 LugAZOvcstC10MIBJ0AnhZCHo+E3NxyDEIaSrdNkIlN8FE3qgteKYOH1UEmdwwHjQz+ql6PcuNJ
 VZObUqIDOO6HMIKYnB2+Hz3Tc+y+JaJyXM6u+CeZGcR1z2sb5zbONS8w6Ux3gJcSpFjIAp/X
X-Proofpoint-ORIG-GUID: UVXYHd3HrkWMfYJfJBGB4xSShTKmRJwE
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=68180301 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=xeEy2NUaHwTvFDDSPagA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=pioyyrs4ZptJ924tMmac:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UVXYHd3HrkWMfYJfJBGB4xSShTKmRJwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000
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

The MSM HDMI driver is plagued with the long-standing bug. If HDMI cable
is disconnected, in most of the cases cable reconnection will not be
detected properly. We have been carrying the patch from [1] in our
integration tree for ages. The time has come to fix the long-standing
bug and implement proper HPD handling.

This series was tested on msm8996 and apq8064 boards. Previously HPD
handling sometimes could trigger in the CRTC event handling, however I
can no longer reproduce it now.

[1] https://lore.kernel.org/linux-arm-msm/20171027105732.19235-2-architt@codeaurora.org/

---
Changes in v5:
- Dropped hpd-gpio patches (to prevent ABI break, Krzysztof)
- Link to v4: https://lore.kernel.org/r/20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org

Changes in v4:
- Added bindings patches. Dropped hpd-gpios from the IFC6410 board DT.
- Fixed checkpatch.pl warning about non-const string arrays.
- Rebased on top of linux-next and the MSM HDMI patchset.
- Link to v3: https://lore.kernel.org/r/20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org

Changes in v3:
- Rebase on top of linux-next
- Dropped the patches that were replaced by the HDMI Connector
  framework
- Picked up the mode_set -> atomic_pre_enable patch
- Link to v2: https://lore.kernel.org/r/20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org

---
Dmitry Baryshkov (13):
      dt-bindings: display/msm/hdmi: drop obsolete GPIOs from schema
      drm/msm/hdmi: convert clock and regulator arrays to const arrays
      drm/msm/hdmi: move the alt_iface clock to the hpd list
      drm/msm/hdmi: simplify extp clock handling
      drm/msm/hdmi: drop clock frequency assignment
      drm/msm/hdmi: switch to clk_bulk API
      drm/msm/hdmi: switch to pm_runtime_resume_and_get()
      drm/msm/hdmi: add runtime PM calls to DDC transfer function
      drm/msm/hdmi: implement proper runtime PM handling
      drm/msm/hdmi: rename hpd_clks to pwr_clks
      drm/msm/hdmi: expand the HDMI_CFG macro
      drm/msm/hdmi: ensure that HDMI is up if HPD is requested
      drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops

 .../devicetree/bindings/display/msm/hdmi.yaml      |  15 ---
 drivers/gpu/drm/msm/hdmi/hdmi.c                    | 133 ++++++++++-----------
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |  26 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  55 ++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |  89 ++++----------
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c                |  14 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   6 +-
 7 files changed, 135 insertions(+), 203 deletions(-)
---
base-commit: db76003ade5953d4a83c2bdc6e15c2d1c33e7350
change-id: 20240522-fd-hdmi-hpd-e3868deb6ae0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


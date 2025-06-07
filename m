Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E47CAD1285
	for <lists+freedreno@lfdr.de>; Sun,  8 Jun 2025 16:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28FC10E023;
	Sun,  8 Jun 2025 14:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FL8FIhGi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7594D10E36D
 for <freedreno@lists.freedesktop.org>; Sat,  7 Jun 2025 14:15:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5574480h018436
 for <freedreno@lists.freedesktop.org>; Sat, 7 Jun 2025 14:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=jQEDDMTmKsjlbrJ1T/mYsq
 l9DaM6HWHTltiou3XAwfQ=; b=FL8FIhGiYfRPpEb5zkLb6X5evl8aRpePWsUbgj
 woUE1/DwDvnrHExHMp86Y2NnGAGH8/6eHoXVwl16OL2JwcBbDMgPU+BeKCwWRkEX
 64IVk1M3Ymg5qahJWQOyE049C7C5MfZzR26IjVHAgH4DtOE8wXEoA5Il4rsHSqqG
 Y5HfoXWT4TSlOhEICgLJmvhmdl0qxpl8oWL9ND0t8lGt8H8nWaGhkJA2wk3qgPrE
 FD3O9AfKYzcbbK2+/46BQwXO/yiQr5e6FjlpJsbcZH/vOktcLBEcH/729bn7MLpj
 ZCIirVPQgI7MuWu0Fuk8GMWZF8V/fE3hPnGyhjop79OUPT+w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474asrgvhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jun 2025 14:15:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-235e3f93687so44532715ad.2
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jun 2025 07:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749305743; x=1749910543;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQEDDMTmKsjlbrJ1T/mYsql9DaM6HWHTltiou3XAwfQ=;
 b=OdhMfh1pQxP9xgW3KQgoOjx70JnoeBfbFPUYipiqQ0a9edWgf/VQq1JPqN3Z5h+KzD
 hn/yYwv8UOUfsa576Gj4snodO01gjLw4zVaLawTc6AV0tI/MXcw0laDxa0fEfWHeY1lf
 a4Ya3tnzcjHkczcibyD3Aa/YMYghb2Qq2XX4zed/Jqz7ckBFaFcJ6lc9Wl5n5COt0zL5
 0r3bfGzdyIYQ2EoK3F5uOCmM1nMKE8bK8u5pvyq9y2+XW4O9WF03rYxLli+/Y0yCr+C5
 dEhFBtnwIITcWtCWbw0I82Y8JFwtHJuD8MKaUOa/ulDKucDNRF/NdZ62VKb4x7yyg5x5
 6o0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMLHOhgntE556ZGREBXRafjo+p58UXL39u1897SPrTi5QPee9YvCrOVvcvJjcTbZaK8WBepyrYmLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4fZIrAQ9QfrlvifC7yCV80tmu80Zn87m8A+ARexVfEOimEO44
 LBB+ZAlqPp6wN4IVhNUuWcv+BCVmF6a+4bMcspI6mopty0fgxy719LNPqipYvtqt4wCDDlSKopX
 qBLw6Rv3k2VWrSFz5cFwvbWH83QtVTKKk3WebHHdvr5qmUm0nRtlCu66CV79vrJAkMC7lYMA=
X-Gm-Gg: ASbGnctK7RdsWI/jV5AFGGxzaNxMyiGcEFKtqgPD/HY2IdAgKInlwkb99a1nCQhsjuL
 X0B+tAWIStWjDIxugOL2yFR+UziPX+TOGgl4A4hz5KFl2RU9fbks9DSEZsf+jkaMUtCTAP3sSvi
 E+41SdvvF7o9LsTbFSdqOMkGjvznXwRfJFi2Ztj8Qp0Z6LB/CMCO89JZnoUqU2sRYRNzVLMsmJ2
 Av02VRDjPSz/cixD6/loXVPwESdxE8J9l9Ecet9HpR0vkkYsbtZMUcizRVVXJ1z9JpN6Y9QwxCG
 Lh9b+tOhKyZTkRlkpDXPKA==
X-Received: by 2002:a17:902:e750:b0:235:f4f7:a654 with SMTP id
 d9443c01a7336-23601d09641mr109277435ad.22.1749305742565; 
 Sat, 07 Jun 2025 07:15:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjF9YeOEhWSWfxr+m+2RrgoG06THK+k2+nMjTup1J4LstKl/tmEjXBkTr4o+5QwdlWwirKMQ==
X-Received: by 2002:a17:902:e750:b0:235:f4f7:a654 with SMTP id
 d9443c01a7336-23601d09641mr109276915ad.22.1749305742176; 
 Sat, 07 Jun 2025 07:15:42 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 07:15:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/3] Support for Adreno X1-45 GPU
Date: Sat, 07 Jun 2025 19:44:58 +0530
Message-Id: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNJRGgC/y3MQQrDIBCF4avIrDugNg00VylZTHXSziKaqi1Cy
 N0jSZf/g/etkDkJZxjUCol/kiWGFuaiwL0pvBjFtwar7U33+orVLEg+cYhozd2TnXznqIN2WBJ
 PUg/sMZ6d+PNtZjlHeFJmdHGepQwqcC34d3sYt20HBKPUqo0AAAA=
X-Change-ID: 20250603-x1p-adreno-219da2fd4ca4
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=1043;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1R/4cAeIAzLJOWp/GuFrSGG6zEJyy/eVJqkUetChkPE=;
 b=T5B1TBD6n1ZXjWmBzYGz79OW1hjAwODNgkAjFeCeljEAqh+W/4n6lU8z1zkK0ykWF3R7mJUA7
 8yVMyFfn9g6BOOwS52MkZTyflD73udKJg7pyStIQ/5hNiAqyx8r065a
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: i5GkPxN-X2Egc9z1f4z59RNRT4R8MA9D
X-Proofpoint-GUID: i5GkPxN-X2Egc9z1f4z59RNRT4R8MA9D
X-Authority-Analysis: v=2.4 cv=AMUSjw+a c=1 sm=1 tr=0 ts=6844498f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=vb8sKYNj6oKrwasmUUsA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMCBTYWx0ZWRfX2x0D3lMqwIlH
 kuSNzeCTBu4Cs34ahLHe67gwmcJNNHBa4GFau/RT0i+1vIGTzfo/i/uIXIi77/a30gl8VbY53ra
 npVqMVllWI3U1cRqSk9SNzA96/g2AS/Aqde000K6E9lidFZESMh1biqKJLpw3Bjd8RZFn3/eCs4
 P7c6vbPkZHqCPWvo3YfqWlFFJqCAIlvyNqC8gCFaRdmvyB1NB7TFxc7bJFhp5TXKdhrgTFrcvJA
 7Leuz4PomJ20vLDBuc6VVVC6BE5qgrn4KUrMwGUqRqrdzp+/s+EIZGEyLjdWonIenyHezVTpsnn
 +OgHG7agGLUe3ruIOyreJaCyE5eJ73SJ0bRPhNsvpVrvuuKLCAqKFJ1KV7IBpfy6xy2VG1QQzMa
 F7zVAAvNL1VbRqCiYLMAeia+1QvvyfRqz8dlJkGLLbmLQlXI9Iic5PtxZThjSyz8cgEPAEvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=554 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070100
X-Mailman-Approved-At: Sun, 08 Jun 2025 14:06:41 +0000
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

Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
version). X1-45 is a smaller version of X1-85 with lower core count and
smaller memories. From UMD perspective, this is similar to "FD735"
present in Mesa.

Tested Glmark & Vkmark on Debian Gnome desktop.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (3):
      arm64: defconfig: Enable X1P42100_GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
 5 files changed, 170 insertions(+), 1 deletion(-)
---
base-commit: b3bded85d838336326ce78e394e7818445e11f20
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


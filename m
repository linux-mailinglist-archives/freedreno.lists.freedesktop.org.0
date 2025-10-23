Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA76C014D9
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A283610E909;
	Thu, 23 Oct 2025 13:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/7J0hxv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79F010E8AA
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7fQ1K026317
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IJq8ZteHVi/
 66D7zq8C07f3aqefDhDiFLFZsOOUaCOY=; b=j/7J0hxvXy0/VoN9aC/DOk3S369
 9ZndMDD2pApkG+uNM3VXdqkTiTpPioK0WBbr0PoYFIkTGvlrC8DTL/0vsSzOIvcV
 Yn0w+laY3HUc75NRdRgNLP9gHrru6TAIBhGIsfx1XGjLnQeqE9mdTSDxuPdZxJMi
 KhhR3iYM75xQ5KnYgcWtCpENcIW1+RvpWQ0Q6R2Z7zt+/WrAHwoeDWSffzT+YTu4
 hUFoa0BIJLkbXu30MVVP63EjN8CAOMMrnGakJz6/qZCB7kvcWAHrkr6jxi5GXaJ1
 yV5iCVGpy3Vq46ytiQ8TrqEFLz1Sxcud1xm25flZyZr3UmWPgyFwxS8jFeg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8hmxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7a27ade1e73so135046b3a.2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 01:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206851; x=1761811651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJq8ZteHVi/66D7zq8C07f3aqefDhDiFLFZsOOUaCOY=;
 b=RNHFa/6H9g7VJRTBHCb7TC+A31tnidpeX1ULEtLczSPXisXP9w4mD89NZtstrm0wrJ
 0amyJPSX3t+IzC9Y7BJ+ku0UMyF/fLik3OG6iN770kGZTvdigjwpqDkmp7DNBQelllyR
 fQLhEDTXZjjO6OHl78FlTRqqKWhWWk3Lepz/59U0pC0i45YI5gyJcnnGJPq+rqIzD4Gv
 TXFfVsXZ6yEGpf0e2ZvwF2LveXoAsBrPpqTawCuAj7MXlDI2j6xE5jYEeyxr6FPAERUF
 sMsdaaKZJBgnONrTnz+aEiRlOtEE2g25f1icI6+CwFyjH4vUfhVLxuCKUJyXnkrq7jfQ
 PWSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXBIxVKdzUuitULVXuPK1fSO+DEDrbShS/idrUYoSFSzWuhX1wwXRpaOpnqlkRz1q1RAZfXHOovHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvXdMnUvH4clIIIFePn2MNZG0d7fJARcfMRZmo32eKERkB8HoK
 uIoNqWgrqE+N0bkkuHY3z6qfJGXXpY578d2MDgjuSPLIl8ZRHabbLdI3YvFg98KPC8AHoriDMNX
 xQBPIZQdtcmisD/gligOj1SP5cyrU3Z6xDJ5EVJ8CZkL+yBruF7HVwl01Lu8P3XP8XxajLTw=
X-Gm-Gg: ASbGncsoTLwGhYJgitRuyX4K/ujOHxbOKDhlBK7q0A8bVX382X8ZUnc+iQbQECefM4I
 z413kPnEv11DRY+DCA4tSGx6B72tffwUYbl3KJEeXpZSQxtX4GsgPFpjkgqHrZDe5kRE2e6kTD8
 8dbA0Guc8kUETmSxKDT4cbN56Ei387TbjRcsQdnYpHtdqjjZhrsw9SCDRkeTzHoeME2pV14bcPb
 CzzHu3VTeXa0BoDTKBKoLkgfWl3mVOll4amwyh8DzGL5TRcj2Q+ZXHTEpXzANrSfWkCxTCqVZ5j
 NtvpR5B0Gpwk26rHdLBFM2GhPbaJJD7wyGOBPQnuqTrlHvG5b9k+jgq7D8WJlU5RMvey9RMhh8R
 Hs2MDOobBaUoDlmhgJ0s+pwe40eo7OKl3wXjUss+JL2PwLeGwig==
X-Received: by 2002:a05:6a00:99a:b0:7a1:7f3d:45dd with SMTP id
 d2e1a72fcca58-7a220130bbamr28847426b3a.0.1761206850650; 
 Thu, 23 Oct 2025 01:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyJ1rsxjg1qDnqSR6krY6mUI2Maa23+yEaD4eN6RpwTES5KZBi87GjaBN71trayEyatXK64w==
X-Received: by 2002:a05:6a00:99a:b0:7a1:7f3d:45dd with SMTP id
 d2e1a72fcca58-7a220130bbamr28847396b3a.0.1761206850204; 
 Thu, 23 Oct 2025 01:07:30 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 01:07:29 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 09/12] dt-bindings: display/msm: qcom,
 kaanapali-dpu: Add Kaanapali
Date: Thu, 23 Oct 2025 16:06:06 +0800
Message-Id: <20251023080609.1212-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HFntCOpClJUL06zLikvZu5o64oVf7msf
X-Proofpoint-GUID: HFntCOpClJUL06zLikvZu5o64oVf7msf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfXwP7nt1Pz3Sz+
 RUQF+305oxVZtNYtkpiOZHTgZXWe2gOghT/bHwX0GrMKzRufD8bLgyqXBmgQSkKGQqeM9oosgjg
 Fe5pEhb73jkR3NeE5bmL2IuB/ohpo1Mk+/hgMis8ediHA/KPTOzvu1PpNY2s4vyuJvJXa+fFZuS
 6nRXfqLBLdvvTktms+WbMZmxa6rjw5p00/8UzGoI9wgIy76uLg+iCqJ+e8RlaJ48vU8aQwGhOte
 UTXyHtC1KK/NvETId+rYYH8kTALE003v3Dh0c8EdwQtXUioH9k4cy0bs7UX9sVmS6sWbcPyIv5g
 ZV6B6mHA0/eCUkbiJzy6qkPCFSm4PJr1LkovLs/vuIq+rw27aAnoCJD0iBYcG91UMqA33PwxoA5
 LcuzhuhhnLk3/ANI81G/Fz7GZSG8Uw==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68f9e243 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=LEfPF28z9Y6gGZEU5FYA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164
X-Mailman-Approved-At: Thu, 23 Oct 2025 13:16:01 +0000
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

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd868..424dbda3fd9d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-dpu
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
       - qcom,sm8750-dpu
-- 
2.34.1


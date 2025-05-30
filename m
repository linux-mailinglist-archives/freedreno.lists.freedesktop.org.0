Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514CFAC9506
	for <lists+freedreno@lfdr.de>; Fri, 30 May 2025 19:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91B310E87A;
	Fri, 30 May 2025 17:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivU11vWF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2800010E862
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 17:47:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAWXCn008272
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 17:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 udvmo1kOasn0QS3/qdfX4+H38+qgrrNA8t6VayqEHFg=; b=ivU11vWFvW7EScUz
 KtK1O3hbxxvHfpR4zmrqB3AG1qA8UY2GmT6Pr8GqtB9zp0vwF5tIFUCARU7Ag/Gq
 cOx7ntis8kMdBP33dzBpxRjP3zSEFob/3pU7DlDBsPx1Ok8uGinvVV/ACmRVGHZ0
 RRdP03XuxewEMU6dFE2lCDIqphRyRQh4UPvNPM07S6wJy2ReY0WTyMRTmBeC5iM2
 13MRFoKRaE+6JY7Yyr5y0jkmtEe9c+WpdXLhyQZvk6lL35St9bq5791YD3kkGUv1
 jHU8EiFRgJLJKb5xscLcTRUBok7G+x//1WK0RakfUd5Vy/VptsCVNrEts0l25sAg
 /fzyuA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992v62k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 17:47:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b19226b5f7dso1670435a12.0
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 10:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748627268; x=1749232068;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udvmo1kOasn0QS3/qdfX4+H38+qgrrNA8t6VayqEHFg=;
 b=CmbN7xnvGDofMEDxTr4sTv/uUAZ4aFtW5BizVi45glVsUilFN8xop1m6wKMoNFm5di
 m0MPz+BcaJ6EZo5XIx70CDN8WiFgrT4+SJa4YxWUbQJC3FWJo3cEY+CiCdPONm8EcDL7
 1tYm6jvt8P2pZeU9+u7NHYyHXiMVdgbEl9WBHOluSB2lRGcWi0sw17CbvAb/20XiRO7+
 x345/21Uqgk7dbO0S19CHoctWYUaJE40QqeebVVDDzM+D3ZubUjen4HdcMVrsE6QI56b
 agDglBlg3VC86HwgT9zK8Xwvk5S/4qy7hSzlCULb0M8vB3utkvmEs8YaectW5V9PcWZ2
 QR4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSNfgrm4UY1vLVAwdt4sVSRiySDMN0ulhtQ7LGioTjN2RZZfVJ6BqGCTl2A+ZgJ7Y1/wBqWFPc1iQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze7lY3ReuoBasiRXU6XI2AclpNk5uiucdS4/RkKYIK1nM38tf/
 4rQLR8NzgCIswSdd7vNKnUGjkPJc//yl05MjHY0JVT4E43EywbdB9UKa7FVsEyni4SUSQjfc8zv
 6tkfOF64lP7MHU5dxQ30G5UYWyZxk6buTeJ/mcu5U8IVimVvmaaftdKLGQ3jRD/EDuheqnH4=
X-Gm-Gg: ASbGncvsnjED5o2v+VFLGge2fPfTxxGcolBm70BfjJq4kJyB20DHmXOL5d1l+hRYhyq
 Bm3144i61iweUc6SUigZ3tOXh2qypppcsxMm61rhj9OfdJbqXF+EaiAKL0WOCI1q9dOiUhx6APF
 NRml5faKI1HRNSxyWs9UY7tm7m+kaHSc8wE8T7gtVeYpQAcFOUlnNqOEQ8JYloRvqsZYWHcJ4wG
 Fq/cKeeRkAKEKhvn4dujNyFutokT9PV/lUB+HYIw5ZUzS/Sc4+bOAb/PnCc7cHoFHNqLOgjqzSs
 z9sx3+3Yt8lhqriOu+yk0E93dNP2Hc62bjxkMl4/MCH78ab2Varhjyvt9f7ThmUU40PdmFIjeE5
 wwCTmnHs=
X-Received: by 2002:a17:90b:3eca:b0:310:7486:d60b with SMTP id
 98e67ed59e1d1-31214ecdba7mr11895003a91.14.1748627267633; 
 Fri, 30 May 2025 10:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYM6Tq0PT3L6Et0ngnLO2GAyc7Ioe4U+bK3yEkIDizDcSa6y+xjFo072yssMT+EmgOBPqQIQ==
X-Received: by 2002:a17:90b:3eca:b0:310:7486:d60b with SMTP id
 98e67ed59e1d1-31214ecdba7mr11894951a91.14.1748627267236; 
 Fri, 30 May 2025 10:47:47 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 10:47:46 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:47:26 -0700
Subject: [PATCH v2 3/5] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-dp_mst_bindings-v2-3-f925464d32a8@oss.qualcomm.com>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
In-Reply-To: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=5805;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=S1XB9+JaEMa3iAt9Xnmf/DC2ThwkEN2OZRdUbvXaoBc=;
 b=lSebu3NXgPMqfVrX+ZExdEw0Qt9hbmK4Ngu6DhqZ8NRNYqWLC0MYOXj3XB+BigjIDIQIaX7Gu
 Xns8rhdsQs+CIcPDZ5zlZf1FMy3EZgvEUmv3T8M8JY4/s5MYN9ipqak
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfX9UsA0vdocuCx
 0gh7LDSXCga6BkuOCfpyUnAv6mN/D70czaxdS6Whq7cdYm8lXtnxdMq/SksIZbmf0mlA2c5N1R0
 +lJ5kvg5AeH0w9SRX9BFWiPu9tpBWVYq4GyNIUDw899udiThmZsTAO+oWgvRPsMEi4jplDRzjnL
 GekUTPnpibBxr1FSiHTPqWh4w+SrO8On6xn6EzJedrFLLlVTtFcT2cn1zeLqZWQrZfkR0HQ/kQQ
 MGs8ws1vMiaiN+kiQLqWi1NkCR8lbe1BprSwkUZkpcg14z494f/GIW6Cq375XoJEgM5DZghk38E
 8ctOYqo6uX9tQeduOzWv131/i1zhRmxgKqFcY0aKiQlSjnXOjtsyAvJRmaNN7wt3QQPvFakuyeJ
 VrA+a0yfIP5ZnREz6Mus72hHjagcNYDQIg+GS0UVpbsdvHy8Bo6Pw2IC8JItozEC+p4ivTjZ
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6839ef44 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=wErF9Qt5opcPDqNnyToA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: VZOO_EG_1Cnb1ba8npGdF4zHgSFh4PKX
X-Proofpoint-ORIG-GUID: VZOO_EG_1Cnb1ba8npGdF4zHgSFh4PKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=962 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300156
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

Current documentation of assigned-clock-parents for dp controller does not
describe its functionality correctly making it harder to extend it for
adding multiple streams.

Instead of fixing up the documentation, drop the assigned-clock-parents
along with the usages in the chipset specific MDSS yaml files.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml   | 7 -------
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml         | 1 -
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml        | 2 --
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml          | 1 -
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml          | 2 --
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml          | 2 --
 6 files changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 46a50ca4a986..a63efd8de42c 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -74,11 +74,6 @@ properties:
       - description: link clock source
       - description: pixel clock source
 
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 
@@ -208,8 +203,6 @@ examples:
         assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
                           <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 
-        assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-
         phys = <&dp_phy>;
         phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 1053b3bc4908..951e446dc828 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -393,7 +393,6 @@ examples:
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
                               <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
 
             phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index 870144b53cec..a1f5a6bd328e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -216,8 +216,6 @@ examples:
 
             assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
                               <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
-                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
 
             phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 7a0555b15ddf..f737a8481acb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -269,7 +269,6 @@ examples:
                           "ctrl_link_iface", "stream_pixel";
             assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
                               <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 2947f27e0585..7842ef274258 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -298,7 +298,6 @@ examples:
                           "stream_pixel";
             assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
                               <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
 
             phys = <&mdss_edp_phy>;
             phy-names = "dp";
@@ -389,7 +388,6 @@ examples:
                           "stream_pixel";
             assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
                               <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 13c5d5ffabde..3cea87def9f8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -401,8 +401,6 @@ examples:
 
             assigned-clocks = <&dispcc_mdss_dp_link_clk_src>,
                               <&dispcc_mdss_dp_pixel_clk_src>;
-            assigned-clock-parents = <&dp_phy 0>,
-                                     <&dp_phy 1>;
 
             operating-points-v2 = <&dp_opp_table>;
             power-domains = <&rpmhpd RPMHPD_CX>;

-- 
2.49.0


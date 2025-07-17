Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ADEB097C5
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 01:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B3510E8AF;
	Thu, 17 Jul 2025 23:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQXeMR7S";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A707910E8C6
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HLE1gS000564
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lWApfG2mxCWAzM0ioYEsIC8m21xEZWVI0AmdT2yj6sc=; b=PQXeMR7Sl/LioOF0
 mA9oHRpo5WOdK91NCBmGERegP/Nvo4E8toy5yu1edWoEZmFvl7JWDOy+ymiQlPgO
 M0b6WiMYCKJlVrcaNeG6IdXl8E2cVIwguzWl2IEobm0n9eaeIqrO+nGok44l6lg+
 rF4thoNvKdnAgN3VcqLnBRfuufzqe4Y6/iBWbtRvBOinoF4kfPJrvNH8dX/ThAWr
 PsBYc6I3NsdzBtvNn8EEYxGPamFoiEt5ypcQxnAJaDKcHaoICsZ1kgbI/EYKpnb2
 u3MGrlYUhkUSGuzuLviGvRgZSLZkINZpEWvM6MrE+R28odo6/HH5UZQa5Zad46hH
 7UE7rg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drvhjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-235e7550f7bso14077885ad.3
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 16:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752794937; x=1753399737;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lWApfG2mxCWAzM0ioYEsIC8m21xEZWVI0AmdT2yj6sc=;
 b=YWn8tvrVuZrZBwKTm1DUhnZV+ZUfQ2Jw/zn4gn5YCSVRO3kHi69bPbQw1Cs99feT7G
 r2ONk1pUhdYlhQLAiWbwq5SNEMOUJtaaINANAMSQ1DlwqSW2Wi8Of92mNb1wTCvfnwZY
 IIoa1CFPyCAjjj9Nw3L2pKgtmytcZw8acWtTkLrCwz+j6z0+5wCZO9mUKjTSS4lpbHTZ
 9HP6L1dVIl4tGueGWDZbHQtdVOkpNXccrKRDt5K68bd9+9Pob0dfmqLPptLc93nPJxYH
 4i8wDysOTfQ1JsM17CdVjYkq3/kDv3dNPT0DYvsug14NyWPXz1i1uuDbesWc5h8bjU1h
 dAUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6VGgMfcRYTfCUNAeKtPZmYL2nWXU6cJIKkC56P80h7OfH49PFVmFmlJMO1r1UpN0UDnIqqc73njU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5YmL8joOrHg0Xao5dLI5o6sX17/hP0JcxOJqQlv1lNkxOhKGU
 FY8QI/WII5o84JL5kkPPswDC/rLF2tXpUibxcCDpifDIjaK1GYYEWc25mwJ87aWRsK0xpnDVJBC
 PR/3Xad82n40s9wHRUQy/88JKxusnxCXsgGTdMJyjYQ0rkDXXQDkMgR573t8dLFZn4qG5kw4=
X-Gm-Gg: ASbGncu3oDQBjuyggU+anX925vdI41E74fBuZWTzh9Zk9Fstx8/CCi4a07RE2kiLB07
 O2BLgTpBkdRfoK2zANjq2vwTFICBtkunUyx11wMf9CibBkNM+wcwhxYIH6Sxgq5u7LW6/gror9b
 Y71jaDgr+9DHsx+CfELFyxfD0ECs5M2xF5K7dfR5hciOZFAgkCH3XmWkxJDcKItV8kpH6heS2oy
 5UrA7vCDqg8sl0uPv9gUiAHxDMSgQjpGbdt/yHTZUr3dLN7uTklGGcgG0r/sdj6BMKxYAcumhdY
 ABD1yzMoEo/++4nA5VlLBw8BjtywIiZp2Ldm3GdNfRjg6YgCPCN1q2PekiVHnipqQ6pPys8yGYp
 fwpkfpQ9PON9ccBk3gOvOo53Q
X-Received: by 2002:a17:902:e5cf:b0:235:225d:3087 with SMTP id
 d9443c01a7336-23e3b80c9femr8053265ad.30.1752794937033; 
 Thu, 17 Jul 2025 16:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhH6tJEH4IvPWPkNyHBRb0ZJ9qv+LFEoEsSd2RwQQYetT44kKI8ABmB5MC5Z+R+lVggcU3ZA==
X-Received: by 2002:a17:902:e5cf:b0:235:225d:3087 with SMTP id
 d9443c01a7336-23e3b80c9femr8052875ad.30.1752794936504; 
 Thu, 17 Jul 2025 16:28:56 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e3cb7sm2002195ad.17.2025.07.17.16.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 16:28:56 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:28:45 -0700
Subject: [PATCH v3 3/5] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-dp_mst_bindings-v3-3-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752794927; l=7576;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=Z7Q5MhFNW++3sg2l+MY10L8IMh9EAArq7s0Yr3E5sqQ=;
 b=bXvkMgRG/fOCiubHjM5Jn0LKe5/Q9lqISkXucJ1CRsxFEN778kZWlM3xXVklsfaaCbVIwiSFB
 ycoZ/YlAjoBCOiAORpn6mMaJdtIv28Sf0ik3WqYNt6hPeRhc20TpUZb
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: G9FKBmwS3lxXNX2eqLcFINpsUTZLfKQ9
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6879873a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=y-iibUknMj623qMt5boA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: G9FKBmwS3lxXNX2eqLcFINpsUTZLfKQ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDIwNiBTYWx0ZWRfX6YDa3tedUypP
 yad5Dp62euDtFUepa9+2OKuAT7MO5SieD1Jq48RaHc4/LAdvV+NvMsA3T3eJAIX7yOsOYp69jE2
 Baf9519pwHr1WIP4ETU+IdLJtNWyjHY2a1tugdh/9P/QNc/A67sRbLOqYAtOEnhcL95d6gHVKxq
 GmVc+leWih28I9QdU28j+oqnQc4xqZronVw0Z2Pzbd1HLHW9Aiqcrar1AfoOSbjzVX8QO6oV19G
 sdzj19FI2xlolbHJMBBCJUbOO8bAVW+YQy1PQvnLgktDSsWQXKP3sM/SP0I5Is1iqw2DkwAjiw5
 id7+Bbk0vbuncwntYnk/li/dCsgsc2MyFerjF6BBFxNZsKBNot/YqB03QI1a2ZDUbGJN/eV9+PE
 bM3pITQ9NFk9ThZ77kSnSkFgL3ZUgXYVFdHpclBt7ahZ991dCmrFGDVjWrNaNZY3tUkWK4c1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170206
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
and assigned-clocks along with the usages in the chipset specific MDSS
yaml files.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml    | 15 ---------------
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml           |  4 ----
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml          |  5 -----
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml |  3 ---
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml |  6 ------
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml |  5 -----
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml |  5 -----
 7 files changed, 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 4676aa8db2f4..d8d94f62c102 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -73,16 +73,6 @@ properties:
       - const: ctrl_link_iface
       - const: stream_pixel
 
-  assigned-clocks:
-    items:
-      - description: link clock source
-      - description: pixel clock source
-
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 
@@ -209,11 +199,6 @@ examples:
                       "ctrl_link",
                       "ctrl_link_iface", "stream_pixel";
 
-        assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-                          <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-
-        assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-
         phys = <&dp_phy>;
         phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 1053b3bc4908..2dc76a074da1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -391,10 +391,6 @@ examples:
                           "ctrl_link_iface",
                           "stream_pixel";
 
-            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
-
             phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index 870144b53cec..eef5627133db 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -214,11 +214,6 @@ examples:
                           "ctrl_link_iface",
                           "stream_pixel";
 
-            assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
-                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
-
             phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 7a0555b15ddf..a2b71b476357 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -267,9 +267,6 @@ examples:
                      <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
             clock-names = "core_iface", "core_aux", "ctrl_link",
                           "ctrl_link_iface", "stream_pixel";
-            assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-                              <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 2947f27e0585..9e52ac9c0eb4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -296,9 +296,6 @@ examples:
                           "ctrl_link",
                           "ctrl_link_iface",
                           "stream_pixel";
-            assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
-                              <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
 
             phys = <&mdss_edp_phy>;
             phy-names = "dp";
@@ -387,9 +384,6 @@ examples:
                           "ctrl_link",
                           "ctrl_link_iface",
                           "stream_pixel";
-            assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-                              <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 13c5d5ffabde..eafea2fe1c95 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -399,11 +399,6 @@ examples:
                           "ctrl_link_iface",
                           "stream_pixel";
 
-            assigned-clocks = <&dispcc_mdss_dp_link_clk_src>,
-                              <&dispcc_mdss_dp_pixel_clk_src>;
-            assigned-clock-parents = <&dp_phy 0>,
-                                     <&dp_phy 1>;
-
             operating-points-v2 = <&dp_opp_table>;
             power-domains = <&rpmhpd RPMHPD_CX>;
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index 72c70edc1fb0..0858dd61fb0f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -408,11 +408,6 @@ examples:
                               "ctrl_link_iface",
                               "stream_pixel";
 
-                assigned-clocks = <&disp_cc_mdss_dptx0_link_clk_src>,
-                                  <&disp_cc_mdss_dptx0_pixel0_clk_src>;
-                assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
-                                         <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
-
                 operating-points-v2 = <&dp_opp_table>;
 
                 power-domains = <&rpmhpd RPMHPD_MMCX>;

-- 
2.50.1


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E24AC9501
	for <lists+freedreno@lfdr.de>; Fri, 30 May 2025 19:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1324910E854;
	Fri, 30 May 2025 17:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLvuOCyq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBCA10E84F
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 17:47:46 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBGeqU004885
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 17:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G3Yaqy14zRsDj/Izz9GTItYivVNTdDctP3/IaDWEKC8=; b=FLvuOCyqwowbjxsp
 yBk8vn5Sb1CkQ9OqQ/c3/gQWkWbn2Hia9PPIm0Ebc5BQvtUOcseAd/J4UK05Iq25
 jxo2avGTqcL3DcijyLXC+KeVKPWAvEoaCSjhmKE5A2jOwSLin+35hJ2zPWdhGdZJ
 nH87I7y4JLJwDElm7f/lhOlfYi0+sIzqmD5x3Jqpf/pr7+v9+n5veQ8RIJYWu/ab
 3wSkorySUWquBnxVQ1Wi5Vx6og4pMvLQvQe3QDPa4nDSZ/0MyKuv1dzmTW8vY8jy
 /FoT/DEISvDHyFc6/xcGQuTCx1xNHxRi7+1TToScl5xpsK+i+VC/JhV0tpyZtRSR
 P/JobQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek9s3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 17:47:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311b6d25278so2406166a91.3
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 10:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748627264; x=1749232064;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G3Yaqy14zRsDj/Izz9GTItYivVNTdDctP3/IaDWEKC8=;
 b=XMiR540PsM1tlUzDspeWh/KwPHPepgPO/TTkrPmJ1ZOd93sn47uy7thB/VLC/trMOW
 WhBvZGvWqwEpOuk11r7xcjArlgSd4IhOCPPDTyX9oI6//bZP3MwC8Bh9pltRNOY8NlhL
 zYDmsrXXJ0VVtP6QfyXgeuFVsd92Irc81z+vBd50IGEyYFbTjtsCB1zPhnFKiKI9M+cp
 QwgttyjbvROOMfEh0DgMPnuBe3tSBPNQqjQZzzPXDejrsYnjcZchvx0vl1R2sgBSer1W
 zSKvY/K9RBDOKMlMo1yBKL4MzOwMSVDC53vrmazryGT0DW9NZlDh252uZ8qu+D+ZT2Um
 TFCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ10LbOolefjHWiRQkHarQCdMBk1pB49egL89jHgdGrvv8JRuK6bhHOJgSaMnxfTMGJVrskRliZqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW2z+Yz41ENmsRdPwzfE0jamqx78LedcaXbpm1IUdPAU2nHueP
 iM/RR7rSSrQbpEqMNUZDem3Yh2V90xOiZh5AGuhGZRCDtkbUfJvAGWYjKjcKzWJYhbINmdL7mYh
 bJ0yBJP377pf6T29zBWLQNNg3m7HmiYwueh+4Mv/h+v2QOZ/KX5XqxRca7kavfojQJpUFBQ0=
X-Gm-Gg: ASbGncumvhNJx9Ol7e8dPb6lemFA8UmEx3RudFfaAAisQwoWBMyyFn12P7gn5yKsenM
 T20W85lEtorqq7Hl5XcJN+l+a1dp3r8NAhD2orU9d1jLJxhhzID4/MxLV78xX4r69XkfXSP8Z6M
 7Y2VmviReg7WZZT4a7Xk9zNjyEHtIqmPxFPtuXMrnTuEn7xlwUIKDmOpOyXH5m4FOinh4c+/pqZ
 XvYhRtIeKp8kMhYFqfSFusdWPP7BFik+M1whTpMO0NHSoOzZrQOINbJ+v2T84qjjVQRbhbmeXuW
 2W4Jgx1+WLLH7Yhw3x5n41IjLDaaLsgrHblauy83CKbj3aFQMtJXqvxC9a92aS4d9S17ksf8
X-Received: by 2002:a17:90b:54ce:b0:311:e731:523a with SMTP id
 98e67ed59e1d1-31241532eb7mr7091872a91.11.1748627264423; 
 Fri, 30 May 2025 10:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtRyWpC+3J4vARPUxNqzxp7BkyRVcIjF8pzurxuAfBXAhl/rjeV8CUFFYkLjSxulswmYqtTg==
X-Received: by 2002:a17:90b:54ce:b0:311:e731:523a with SMTP id
 98e67ed59e1d1-31241532eb7mr7091826a91.11.1748627263967; 
 Fri, 30 May 2025 10:47:43 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 10:47:43 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:47:24 -0700
Subject: [PATCH v2 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-dp_mst_bindings-v2-1-f925464d32a8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=2367;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=7Nf93rJk1Jau571xR4KogJtaiOBtO9isp+SwjgHQiMA=;
 b=/V8/oYxYroVmei3jP22ho13u9RU9te5O8gMSJvS2fsv5LzCmRzxuZ7SWGvcuaJNzLm5NDHvH6
 Z+SX6xZyosxCjhFzne33X5dJrRH6cXF1LJw0ZmHLBJgAd87nGUHIeH7
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6839ef41 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=l8kPDwqpA12hi6-TC14A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DeA2n9lPV9CZLWvTY9IDqD_yGCClSe7y
X-Proofpoint-GUID: DeA2n9lPV9CZLWvTY9IDqD_yGCClSe7y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfX0wABynkGFZkq
 Sst1OppRTrjsp99oUjXT+XxhQtdJrQNHarOTkbl0Ja57QqfKbHQhRqHatYWCzM2RUEQnZSJwfiA
 v7LCigdewI4mohtSAtd+zwp3qn0sis6tozdv8XNKrbEriG55Drtf+hfcjhmc/56NYwp1qJ7aNzM
 1lI4HcURlpLb/Nj7Dhb3qoUQmuJvymRE6PCFMhMm3NMVA8t83fX4QHNSW0z/WIZm4uSEntxuwcV
 ACdTTiqlgvQM6YLzWP2zAFBezUiykVnTwnmEweZasSzXiLKdqUhudKAc/jmKj6vHw9qFhGj1R5w
 ajredPkNNjlqPJN/AEithvlzhhMj6ljHFY38UXJrprgBkHuLeV8inv1z3lIqmjyqzR3cT9mlfrF
 08dSMsf3Jl5bGt9f9choFKfmg9A/mAfL0caQUnq8+L7Vrn/nPim5B5m1b/MVnqEZJLjUwMcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=708 classifier=spam authscore=0 authtc=n/a authcc=
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

Add x1e80100 to the dp-controller bindings, fix the
displayport-controller reg bindings, and drop
assigned-clock-parents

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml       |  2 ++
 .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml  | 12 +++++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 246bbb509bea..46a50ca4a986 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sar2130p-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e47333..791de8a277cb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;
@@ -191,8 +191,6 @@ examples:
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
                   <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
-                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
             operating-points-v2 = <&mdss_dp0_opp_table>;
 

-- 
2.49.0


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDDFAA65D2
	for <lists+freedreno@lfdr.de>; Thu,  1 May 2025 23:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD9C10E890;
	Thu,  1 May 2025 21:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWLD6bj1";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Mi+6akHb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C6010E890
 for <freedreno@lists.freedesktop.org>; Thu,  1 May 2025 21:50:39 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D27eR029039
 for <freedreno@lists.freedesktop.org>; Thu, 1 May 2025 21:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:list-id
 :list-subscribe:list-unsubscribe:message-id:mime-version
 :references:resent-date:resent-from:resent-message-id:resent-to
 :subject:to; s=qcppdkim1; bh=BMMVAro5qrTxXRTT2Ze0ylKnxs/jGCiIsQL
 FTx7Is7k=; b=DWLD6bj1g0FCd9ac8gl8O5o+VIoDdIZBXy2DvMfmxALsYHvnKmR
 qHeFTerBJXghkswdz+oHrlxweXGkqbtxmP7u4JQAUpN8Y38o0zpRQ1gqLb+1fVXN
 fL5bf4EiZh2N2fEOfL/mWbvihbv5+/n26ErORP8dWJDG6NySWUdvvxL3G6u+NYL3
 O7utzBSO81spo0AwUUNNrZnFR1JGqtP1n1gzIza4Toazrp2wSdM0PR6REvg4DizB
 BcMxGsCgSFeaT+6U6PTdk73Td3oRZ41sXAgdN8YqBXMyfyDlHprGmSa1XhWxrFUR
 MuBjkxLAnkUOL437BjrHDI+ydvmiu7at26g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2ejpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 01 May 2025 21:50:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c955be751aso241954485a.2
 for <freedreno@lists.freedesktop.org>; Thu, 01 May 2025 14:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746136237; x=1746741037;
 h=content-transfer-encoding:mime-version:list-unsubscribe
 :list-subscribe:list-id:precedence:references:in-reply-to:message-id
 :date:subject:cc:to:dkim-signature:resent-to:resent-message-id
 :resent-date:resent-from:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BMMVAro5qrTxXRTT2Ze0ylKnxs/jGCiIsQLFTx7Is7k=;
 b=qo0xs7kPmS+RK85rzj7VcTKPDmprRyT53prjcJ5iLPw88Qcc8cuaPZHx8f5MxUpIEv
 /rYOU4JhfhAuDbtuv7viINWYDWXkCurGxGygW1WT5H6T7BGgRqzSj19mHnpRtny9Vx+M
 ulcCjI/UU28yxGEsgAwDFjfWMqL63LbgXKKKqdsoSt2Swi3COh2yT/zySqSJ/uEUbKwG
 Vps1GNCk0k/7jFCH6JckVTLTt3M6dfkSc9im6re9f973N+dOtmAyLnPbWbeVj9Wfd3Ap
 JQ6YeDqqOvpVlQB3aGIp3X+LGzlkTuzoD1Ol7GUac63/7QNqAc1GtkYjejL8jpf2S+h7
 9aLw==
X-Forwarded-Encrypted: i=2;
 AJvYcCXvuyvPm9w1W/2BEtO43y61x2UI3tJNMnOhHLVmMitdGtN7Ptu+U2XQWZQLuEnABcUuS2qdCkjPwW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPcbWWorYIN5ElesHGEzBQD7RrPtDRPC6DvS+eKhB1XtTiYok8
 gSS/ZmDBw/QIgLzH3O+IWRl8/wK3NF3lc9g9s7zavpxlFAvdU2dTL12RYCTp2/Tlw5rBM/MVZwK
 taTqaqautK8rP4zhgnVfFncY7QsSPd2Ihtw1aslKyL8iWcl7D6bvtH+nSTiyPl4zNuvFZLaoSZH
 s=
X-Gm-Gg: ASbGncv+75Zuymp85IaIhXNR8SzH3epecD9vFGqEOGJd+D/MlJGDa1r/bt3qf7qo70+
 wK6wtYbxTg0YNi4Nf0nv5esurFrvrfitQ+1bss6m+OMGtXk/9buWfcH0dupN9eBnaexSIQDzKu4
 xCkLkAguiVWx1N8MA9golsNlpPp3FGXOwMrwCi31JWujOkXG8gBQRxZsIBFeZcNfizFLb4kyEW5
 32M428UG8VPrIY+VgebH2rIZ/9XACTax6rhFY8rJKlVC6wKHwQT6i/waEUk4Rnw4KiDCld8Uf//
 r3VEqcHnSp5NfLbiQWfoop/SGi6f4VyW+tU5/iHLLSaFdBH4GHJMA6W/UAq4rv6cqg2OdjIKLZk
 =
X-Received: by 2002:a05:620a:f0c:b0:7c7:a184:7cb1 with SMTP id
 af79cd13be357-7cad5b20743mr93717485a.9.1746136237475; 
 Thu, 01 May 2025 14:50:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0t4xtpu0bS9bzLtY3W1bgGZjf1mnO+Y2E9+YbCgqSR7YRk8AzK7/4/S4XnqWhnpOn5p2H2Q==
X-Received: by 2002:a05:620a:f0c:b0:7c7:a184:7cb1 with SMTP id
 af79cd13be357-7cad5b20743mr93715185a.9.1746136237097; 
 Thu, 01 May 2025 14:50:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202930698fsm1906691fa.48.2025.05.01.14.50.36
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 14:50:36 -0700 (PDT)
From: Ayushi Makhija <dmitry.baryshkov@oss.qualcomm.com>
X-Google-Original-From: Ayushi Makhija <quic_amakhija@quicinc.com>
Resent-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Resent-Date: Fri, 2 May 2025 00:50:34 +0300
Resent-Message-ID: <zqorz3gimljfcvvqpbaotpnqqm2svtsafq4ctoo4jngtxlenri@p4ud5kn7t3vk>
Resent-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C811E0E0C;
 Thu, 24 Apr 2025 06:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1745475901; cv=none;
 b=fbhrZSjpDo9wBShu7a39tefNDnQl9kicKAMT6mQM43FaAOzpKe0gt64bge/OVbMUgGTP0R5cqJyFL8LQOTMZmSY1NULKZQ93sbvbr3W9XUP/O7qQJmyOSZnn9ywqZNXEfV+CupQ9dtAU8KIjAGZBz0No75wxibSqqOmlvF8aIJk=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1745475901; c=relaxed/simple;
 bh=FqMJt3ck/djJm42J9C8RW0w4KInWa8JhktAIs7hFUn8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=GXropUUUNcZNIeb8g6f5cu7e/FHv4pXtbZ9qf+KM6foRhZa1UB6OAx5IGvwfO6PhovBCXH1DrstrtSMIh5aGuFNyugIb6QywU5d6BQ4OPi4Z7lIfRhzLfWhaDJs6rcPeb0lS7osJ/MI2vCAeVU1vjxGvzktUvGKCM4tlFHGrzuI=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none)
 header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b=Mi+6akHb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Mi+6akHb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9Ow005869;
 Thu, 24 Apr 2025 06:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BMMVAro5qrT
 xXRTT2Ze0ylKnxs/jGCiIsQLFTx7Is7k=; b=Mi+6akHbQBmbkI3nqSHDFY3a6nI
 B5wMmquVWE9vijLNx0AsFAg2mHH+dk1uQWdUGT1vxMn8RcW9wTS+XuDNLWzcytI/
 APaP8w50AbXGHyImcwz4gu5ZfrV39XJH08kinvXlj1dBhMfmpju3BHzqw97bkx5i
 pSqfoZ6cSVsaQpXFhvc2LnJJX//Hxv5vvc5kBMwEJ0f4dWl2J5mqHIIYQ4RIZvJs
 bhX3TTZoLeoA+JpNcI+3Z51jyvQV02OUJRPdo/CemxLjbtQlgB+y6jv8SNejokuJ
 jcEisTeiFT89Zsj208MIeH0MMmMoKfmkbBV4A6DHu4ev4zhbW/IkvHtZ0tw==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh04eg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 06:24:39 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53O6OZHw003920; 
 Thu, 24 Apr 2025 06:24:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4644wn010d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 06:24:36 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53O6OZZm003870;
 Thu, 24 Apr 2025 06:24:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 53O6OZVs003945
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 06:24:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id C4E2A59C; Thu, 24 Apr 2025 11:54:33 +0530 (+0530)
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: [PATCH v5 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to
 DP bridge nodes
Date: Thu, 24 Apr 2025 11:54:27 +0530
Message-Id: <20250424062431.2040692-8-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_02,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240040
X-Proofpoint-GUID: q2CG752LJOGWhQTgn_C7ZPusA7mdgw1I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE2NSBTYWx0ZWRfX8krOlthkNT36
 RpDcOSAurLTKrU/bU7Zpqdsg8TEdbUKulLF/1Pl+CQshKw5v0T4aXIOf2jy+eDVj5cit1ft/p4w
 ZiWauTN5YrzoVFrWDeHt7W43E7vKw8j5Ju0STiadLbb0buisTZsVS4XRjGCT7xqdy/g1wtHBM9I
 jLN3VIrOnxpHpLy8mRocqLsIbj0EovkUFBfZ4DugoO/nWEH5KMz6ihcAllbWhV30pN1HSAyJADe
 s3zRxHjxc988iSQn8huDI7lw+LpGGVAZy9M6RjF+CkDJaXVUSSttxS3a7cfEctHl+tyPhLfomAc
 z/+Su5ON7mbKQzGAJYYRw+l1a8RQiYG6s4rdQ9n4YKFKRqJB/mKHpjXdajxfZ2yCk6Gst+wCZfB
 sskffvFY8vgBmeCOFOa+TjaPz8fHdvwEI3upHpM844Lm3PO/1IpUMEkf/LHnbXH3Ew2gh0km
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6813ecae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uX6r2L1qC19fvkj5lx7ojA==:17
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=HN16r5VKKHEA:10 a=SKaEv8EmnvEA:10
 a=COk6AnOGAAAA:8 a=VqzA0eLRv8fxzvICV_UA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=rM_M2ypzF74hP4qBxKp8:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: q2CG752LJOGWhQTgn_C7ZPusA7mdgw1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010165
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

Add anx7625 DSI to DP bridge device nodes.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 181 +++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 175f8b1e3b2d..b8851faec271 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -28,6 +28,13 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_conn_1p8: vreg_conn_1p8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_1p8";
@@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
 			};
 		};
 	};
+
+	dp-dsi0-connector {
+		compatible = "dp-connector";
+		label = "DSI0";
+		type = "full-size";
+
+		port {
+			dp_dsi0_connector_in: endpoint {
+				remote-endpoint = <&dsi2dp_bridge0_out>;
+			};
+		};
+	};
+
+	dp-dsi1-connector {
+		compatible = "dp-connector";
+		label = "DSI1";
+		type = "full-size";
+
+		port {
+			dp_dsi1_connector_in: endpoint {
+				remote-endpoint = <&dsi2dp_bridge1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -519,7 +550,108 @@ &i2c18 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&qup_i2c18_default>;
 	pinctrl-names = "default";
+
 	status = "okay";
+
+	io_expander: gpio@74 {
+		compatible = "ti,tca9539";
+		reg = <0x74>;
+		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&io_expander_intr_active>,
+			    <&io_expander_reset_active>;
+		pinctrl-names = "default";
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9543";
+		#address-cells = <1>;
+
+		#size-cells = <0>;
+		reg = <0x70>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			bridge@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
+				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
+				vdd10-supply = <&vph_pwr>;
+				vdd18-supply = <&vph_pwr>;
+				vdd33-supply = <&vph_pwr>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dsi2dp_bridge0_in: endpoint {
+							remote-endpoint = <&mdss0_dsi0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dsi2dp_bridge0_out: endpoint {
+							remote-endpoint = <&dp_dsi0_connector_in>;
+						};
+					};
+				};
+			};
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			bridge@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupts-extended = <&io_expander 10 IRQ_TYPE_EDGE_FALLING>;
+				enable-gpios = <&io_expander 9 GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&io_expander 8 GPIO_ACTIVE_HIGH>;
+				vdd10-supply = <&vph_pwr>;
+				vdd18-supply = <&vph_pwr>;
+				vdd33-supply = <&vph_pwr>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dsi2dp_bridge1_in: endpoint {
+							remote-endpoint = <&mdss0_dsi1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dsi2dp_bridge1_out: endpoint {
+							remote-endpoint = <&dp_dsi1_connector_in>;
+						};
+					};
+				};
+			};
+		};
+	};
+
 };
 
 &mdss0 {
@@ -566,6 +698,40 @@ &mdss0_dp1_phy {
 	status = "okay";
 };
 
+&mdss0_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&mdss0_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&dsi2dp_bridge0_in>;
+};
+
+&mdss0_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&mdss0_dsi1 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&mdss0_dsi1_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&dsi2dp_bridge1_in>;
+};
+
+&mdss0_dsi1_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &pmm8654au_0_gpios {
 	gpio-line-names = "DS_EN",
 			  "POFF_COMPLETE",
@@ -714,6 +880,21 @@ ethernet0_mdio: ethernet0-mdio-pins {
 		};
 	};
 
+	io_expander_intr_active: io-expander-intr-active-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	io_expander_reset_active: io-expander-reset-active-state {
+		pins = "gpio97";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
 	qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
-- 
2.34.1


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23BDAA65D1
	for <lists+freedreno@lfdr.de>; Thu,  1 May 2025 23:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991A910E35C;
	Thu,  1 May 2025 21:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXIBKUSw";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="f6ua/G5n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129B110E35C
 for <freedreno@lists.freedesktop.org>; Thu,  1 May 2025 21:50:20 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D25s7009589
 for <freedreno@lists.freedesktop.org>; Thu, 1 May 2025 21:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:list-id
 :list-subscribe:list-unsubscribe:message-id:mime-version
 :references:resent-date:resent-from:resent-message-id:resent-to
 :subject:to; s=qcppdkim1; bh=16UiaBpo94tnvVlNGa+rBoEdukXtZTxyVHD
 UiuLoFqo=; b=FXIBKUSwt9uSsLw7UwqLqELGlXyP3AKVi2UltRTa/IcL5BUNkF/
 4zDCfRygBTC4Tav84NBJ7UdGwe/L5lN2k38wllLip1FuUBtHbJOgsoRSJwvuCeB5
 W+Sjjo3LJxjj6Xr+ETCLCWd4ecxvDVYT9hk+11I/w8GBkunY3lDLTYtSVPM3LbjG
 QeTutpaH8KAvRucw9tt+v72u8bn92fMX8ybEZYFxNRk9h5ThCUDtcFNBIvBmKD7W
 7dvFUTCu5m/kTHC/8vC7wNpGpj1Or/Lhh8ncmh2dPMkeVeuiKbtgqayFd2GoCN5Z
 oRf0Kn/rRAYMy7kkBcaFWXJhffh5CD7bbTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4ehd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 01 May 2025 21:50:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5d608e703so241034585a.3
 for <freedreno@lists.freedesktop.org>; Thu, 01 May 2025 14:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746136219; x=1746741019;
 h=content-transfer-encoding:mime-version:list-unsubscribe
 :list-subscribe:list-id:precedence:references:in-reply-to:message-id
 :date:subject:cc:to:dkim-signature:resent-to:resent-message-id
 :resent-date:resent-from:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=16UiaBpo94tnvVlNGa+rBoEdukXtZTxyVHDUiuLoFqo=;
 b=VmekFgdF5Kn+z6nhSzcaSb/U7IM59IL4DjJ0V3Z6hdByaipZL4wT2O2/nrgKZjW++H
 BIMyvogGSn7jTp7HxZAFOQcu9Wo79fhCyFQhJ+cmk50T0u53kyPzVBCNKM5+cTEUOJGp
 WWpXgCQ0zaNF3jl/rxNLLeE9vubFSmy7hRU4x/jdTX7o18aXxe9Th3m9keeg7yDNhhK5
 5xcCqWzdP60CiOLzv4qf5a7leyd2p6kLQ/Z4WIRBD0nx+qigDWhOEI5zL3HXRB2JmXTi
 j9LsR0DHiCRt2XTWlWS8Wz8lsRCgDx5Z7q/tEMfXB6yXo7pvrmZRmvvBCllSy29XqaX4
 ga3g==
X-Forwarded-Encrypted: i=2;
 AJvYcCWOBBwFXd/v+O9Woh/D5vphW31Mda6VFBmzxsG9DB321vrPCPqz7Fkx9FWEdfKrx7wrWTSsEU+qtx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAPv0fDhsGZHhOEVUhxuYiDGNYCaX1mndN5H170EvR5jXIpyOl
 vq/xY+JKl/rVsbSdMT6IEVLry3X1eIWtPYV8hzVSUTLHk4k/DRHph7gaq9+SYkpIRSXy97cc6mi
 Q8GygEiJjaszY6SOKfOPplcQiuaJTPuqi8kgwUnkaJBcyyo5/HZqXsjB0Vt78xzeZUiQ9l3DKCz
 s=
X-Gm-Gg: ASbGncuDETnhqt01T89Ys4Wjxjiq9a5SBtSu7k8EJBrxu3zAyzHdLWJKHa0rnT4GfYz
 1O9WhVAmuBLW5txx3Q07ROihOUOotj8GeQgjzo2KcSCsuvn4suvK8kbmkHdn0FVFR9tviR++Sio
 vyEPio98Ix/jfVqzDBZfIbQ0WA8X0koh4mOlYKkey3/SESjvwdiqvBh6r5LRSlanvZWptymcirY
 1qaMqzv/eEYykc0O4YkTP6HU8jswG14nQ9t6EMSpiwM2MjSO6yzUd1ztirJoaSX11AM0715Hrp0
 W8Ldu/mzRjCScN1EOXORpYNBuYNMe5/4MWm17B3LeAqZPK8ryGCrUUhYPkHZuMisQ9v5OANWWA4
 =
X-Received: by 2002:a05:620a:440f:b0:7c5:4b91:6a42 with SMTP id
 af79cd13be357-7cad5b380b2mr77058985a.17.1746136218703; 
 Thu, 01 May 2025 14:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhnE0Y3N4x/TzMc8m76DEYIjWswk/vertoY8/hAaV7KCJaKufk+bBXW9PSd+UolAEC6bR4fg==
X-Received: by 2002:a05:620a:440f:b0:7c5:4b91:6a42 with SMTP id
 af79cd13be357-7cad5b380b2mr77056685a.17.1746136218319; 
 Thu, 01 May 2025 14:50:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f2020sm193561e87.192.2025.05.01.14.50.16
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 14:50:16 -0700 (PDT)
From: Ayushi Makhija <dmitry.baryshkov@oss.qualcomm.com>
X-Google-Original-From: Ayushi Makhija <quic_amakhija@quicinc.com>
Resent-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Resent-Date: Fri, 2 May 2025 00:50:14 +0300
Resent-Message-ID: <atqcs4kczkgpcw7cdtqdhiwmomosct25miatv4lwdcckfh65dh@rivfguyfghzo>
Resent-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C321DCB09;
 Thu, 24 Apr 2025 06:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1745475898; cv=none;
 b=IA2i0yy2ql3PX+FstG/Hq+cadZgewwhJq0JRqbNzW6rPuIFB/JhAxMEhld2d9nY0IUwmwBjJy1fTOKb0/YDnEA4CD0mbxBfhNLZeJ7F4rdnQXyg8UaR9uFfQbaKomNWVKg+iUSXjtXx1euVb0NpDHcPI+1onliJY0m8cnAQ4PfY=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1745475898; c=relaxed/simple;
 bh=Gz861zHPcukxH1Cx+rQ+BRiEjdHg9rm34GbMKk1dMIw=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=MSRWJiil12L5BwST0NPoVQf7SFtMG2iIkcr8ZB/+Iq5FHK1JwzyTiSQ7gNhtPi2iKGJiO18sBKFLZd4XLnGkU4JFrMKwZcbwm9hlfsT+CJdV01DrSCw4A0zlTaAlsDOxeHpExZbkdixQlvlguOezodceE1RL5mBTZ2TSJjpuw2g=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none)
 header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b=f6ua/G5n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="f6ua/G5n"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F901010294;
 Thu, 24 Apr 2025 06:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=16UiaBpo94t
 nvVlNGa+rBoEdukXtZTxyVHDUiuLoFqo=; b=f6ua/G5nR2Fcvi6stIfw5nZzQhq
 PGKC+tLzkSmpvm+nXHbtnqhboriW6ArAKZ+W6odE7I0l6ehyZeI0gNF3LDxDCvsz
 PG9cK0fSKlHnhHuPVuBo498sZvDqb0ot2p/O/lkPCF+B+z3wJhP1eDALJboawSkC
 bhlvR293/biEuZtsYGQ0OVEi9EZ991XMLsdmnWZCrLF5If4YZuGJuOSrRs2ePHXx
 HBi8GHPbTbzlLtJ9qhYVQlIDpTkX0v8uS84vO596g4MYP/mr9lwt1SB6T0IVnpfV
 +Z6d/I6jBdjOE+HuVQntQdMvX+0f7QrjsvwgxGfHKN3RYo+/3tj2LkgRVCQ==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3mdu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 06:24:39 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53O6OaKB004004; 
 Thu, 24 Apr 2025 06:24:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4644wn010b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 06:24:36 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53O6OauJ003956;
 Thu, 24 Apr 2025 06:24:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 53O6OZZf003946
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 06:24:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id B931B599; Thu, 24 Apr 2025 11:54:33 +0530 (+0530)
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
 quic_jesszhan@quicinc.com, Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH v5 05/11] drm/msm/dsi: add DSI support for SA8775P
Date: Thu, 24 Apr 2025 11:54:25 +0530
Message-Id: <20250424062431.2040692-6-quic_amakhija@quicinc.com>
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
 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240040
X-Proofpoint-ORIG-GUID: v9wQf6L9oe0BASiJ5ljJKyVJOji9cd-g
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=6813ec9c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uX6r2L1qC19fvkj5lx7ojA==:17
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=HN16r5VKKHEA:10 a=SKaEv8EmnvEA:10
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=FC0MWNbw2lKpcE6E8h4A:9 a=PEH46H7Ffwr30OY-TuGO:22 a=rM_M2ypzF74hP4qBxKp8:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE2NSBTYWx0ZWRfX0INqHIihmc0h
 ojNRgzc9wqmBDyJaRBzPYNme+IjfIcaP+CXT0KF7cYHvVhJOd4YQnh6bDB4P+6OBZVax+So+dMx
 kWGZ1+raGkl11rz5wtyRf7Krd70FgRswWSMryeDd5+69JCpUfrweaHTsp00+IJTUN50T+6ktZBD
 8pzxBikZt2Gl0lS0oy0oVrOm+KRgqu9LfmPIPBbahtSU9GD0YJmKiGQPpp4Zk9ts9C+y9DA1cPb
 dckcHTFXckRb+v9OVD+GKJcYVwo8TYgFzWktqo17R/Ypnkr44hkK08lV/asKrLUAHGkvEsQEKuB
 tY1X++S3vaSNosr2wOpaA6vaeV8BB4VxUrd0JMt+2ZHMfjB8WBb/RLoodMoLNckGti5w7C1mKT9
 dEmtKShgiCN1AdHxKHgZL4xGF3avbrz7HQMcDxsuRqj19Y4jG3C3CrCL/3sXF3F/OVpwbLBB
X-Proofpoint-GUID: v9wQf6L9oe0BASiJ5ljJKyVJOji9cd-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
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

Add DSI Controller v2.5.1 support for SA8775P SoC.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 7754dcec33d0..7675558ae2e5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -221,6 +221,22 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	},
 };
 
+static const struct regulator_bulk_data sa8775p_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 8300 },    /* 1.2 V */
+	{ .supply = "refgen" },
+};
+
+static const struct msm_dsi_config sa8775p_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sa8775p_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sa8775p_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0xae94000, 0xae96000 },
+	},
+};
+
 static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
 	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
 	.link_clk_enable = dsi_link_clk_enable_v2,
@@ -294,6 +310,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_1,
+		&sa8775p_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_7_0,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 120cb65164c1..65b0705fac0e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -27,6 +27,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
 #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
+#define MSM_DSI_6G_VER_MINOR_V2_5_1	0x20050001
 #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
 #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
-- 
2.34.1


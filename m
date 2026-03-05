Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNQfAKWTqWlCAQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 15:31:01 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A053D213734
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 15:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D784810EC29;
	Thu,  5 Mar 2026 14:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+e8FkeJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iuiLkIUi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CAB10EC28
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 14:30:58 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFpSC861661
 for <freedreno@lists.freedesktop.org>; Thu, 5 Mar 2026 14:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=; b=d+e8FkeJ4Y7l/fHE
 a8Mz499o/9gD4jHBziO8z5hLSXSHsthC8/PC/ELdFX5cuZfnJ/WNaY4v3MzdDGJI
 E7AWF41HW6qRlXudanQoaeEstRdy0zjzoVKMXBfTtIkGh9LqnrmgxFnkq+KA+wPb
 P9QNZCd48K7TshI1Rnhbzfk4Fx0V0Fqk7r3HZPKqXopQjYnTwJy4mGYQLoEmvn1a
 aqgDV/Jke3VRfEQIp+0QOM3M+IlMaATctBjN+RYrJBIKLVS9FmWsQvM1ikGQUSTT
 M39A2MFUe+nEnOuZ1G6/GZsb15SebGQO6eB/Qt2pYCz8ln1d81euPD3ZkxPE0I+j
 Llsm5Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wbkks-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 14:30:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-5ffbf6d209aso5299314137.3
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 06:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721056; x=1773325856;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=;
 b=iuiLkIUi597u2A0NpKsz4Xcak6ll5GnHxvJbBrdbd63BWs2htx8lbmj4YmTn3Htxyr
 41O7INzrcj/vcTeRXdcKA7hlgpL9uWgkIT+1zZlQO283VLPRwt8rgtIr9duuE97SMIvq
 3SzMWybaDjOYlQ2ySbR+3mvgyEmu77Cs6USEy16mRx+Fm4X6wY9dTJ48FfB0YqqLWl8B
 0VfEwa9BztenehLyOCrM0cF+u+TKmoTj/iWqyQza6ir5Bk7bJrwvxoKzUdcVXHpuRXO5
 bqAKS7eTy2ueUfsoQ6iZbyh438pEmxy0vBia1hlYU3Rth7NByNuw8nSQjFp2rUIObs4O
 UbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721056; x=1773325856;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=;
 b=B5oar0bhmkguIp6kyRQR3oLW2oquJYnxFP3exa/8N5QvgVHmx8+B3jaa4QB6uQy1de
 8MVbTEP3Zj4WyyJK6GoLl3yRlGfbABW7O1BdZIpesIa5/R4kKAZUqEpFDP7IvVPopGE6
 AZaTBkfhMoS5onjx4gAy69mvwR8xnQp856pyFYEu4W55gEyZqx0FxMuizPPyrPsIlito
 2mfeWj5Wh5zg0SUBHIWyxLNarSlwa+aBtdvG3H2aPpVw8r+e4o1RJGSDoDz/hzjWrCp/
 oxwZLYlRwuLf2K+jMJU5rygPaeoKwFmnatcAIylnOMQKt6trSbHV/qSztnX5VyKMvR+U
 fLsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyvUI+9qvfqzenklIe3hqkQQbS5bZ1BiKBOFjCzWkvbwKijTKdTpilG8vc0rWRg0/lho51jmxf5Dk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbOijVSUnjI6/xx/E9T15+QD9UAsXxiyr836iTh8XixWwDIlhG
 TlNXxxt5edoI1DLiYkJTgDwPzv3TvJale4F7AacJH66VBw6oKZkZdy2M6AZisPQGEtzRUAPpkCq
 49ST6h18JXYTcBwtgKEAHszPcgFzocv+CAbqfBM+07M/el7bdxJM3f/FGwQBkd8Sm1XS/K6c=
X-Gm-Gg: ATEYQzyRqw2yGR60xiGDlgSj/pM2Y3XJP63iKuMxyzre8+V4i39g6dzpW5JvuXIsJnL
 L8ooRfhHyDXjRmhU5Cx3ybtXk4IJUzWf1dd+NAWtMI64PBCHjoro1LYdZzAohdGDI/Gq193sOu+
 HYyIU3BAhTCiLFlfq9jqmBpNPV/9E9P6OhgzdGgOg443BNoDH45xWU0lVt4Ctiuz5eJdurNygQT
 fyTIveKjGTtQilK6lwV10CEG+vdlXfnlNbJmAQ0/S/Oslpzcb35GmErD2uzkOb1wXzXKI9uH9iP
 U3JU2ace1+NAQS05hSzjWdseuL4vwk/Z5Iu0tIdo+LCXwt86EbBxoMbzh+1KLsTUUoeBwY0oHbT
 N6x5O2EO6E621aD18qT8YnlbTsAtAr0YE2oCFNPxWjI+CK/PUAJ8n6t4NW7OBTJCo9osgxeRmCw
 WVLLddvXy7E2DifEvGVS96rNkCxGDt0AzCh/k=
X-Received: by 2002:a05:6102:a4a:b0:5ff:24b4:8992 with SMTP id
 ada2fe7eead31-5ffaac15453mr2837172137.4.1772721056365; 
 Thu, 05 Mar 2026 06:30:56 -0800 (PST)
X-Received: by 2002:a05:6102:a4a:b0:5ff:24b4:8992 with SMTP id
 ada2fe7eead31-5ffaac15453mr2837098137.4.1772721055666; 
 Thu, 05 Mar 2026 06:30:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:30:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:45 +0200
Subject: [PATCH v4 3/9] drm/msm/dp: Read DPCD and sink count in bridge detect()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-3-39c9d1fef321@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fflo70A3oSMP6LkHXNPuDEYg6XV8ot0GBkcmgzq2Sd4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOY4EH5tOhJuNNlBqaGXMfWD0qmfHcWOb8Md
 OAljlFsck2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1e3yB/9nmGw5lKskzi+7opE88tsBJ84JNH2uon89P31MsY0o31gm0avvv1hfvFUXX81kgUc/oSb
 6LcX61PL5oNi0P6+CAoFWXb0iil+kzezIZm+jg0L/P5sOtoM0rNbyJqBkfBpxsUCdL7Td4WKCOp
 bhbpOmRinO25ahqKRWhbTLSnEAZScQ9jtTXHjAQvllfkR3j7xuHei6aGxVDGfEd6hVyjiRRn8TZ
 yxlOy76d2Tp/4bjjSzwso/BSkXfQF2JhAM034ZytvqRf/GPyn8SwBhMdVPxfBplYYSfs47nd5yq
 56f9yujtCWga1EMW+Bs7dqBRoMb+Uomq0PcoqC0cSrmAvidy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: PxQ_s7tQwXGZhzcbwABkZTVDVjelvz8H
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a993a1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jcEwYMPARZwhhGfK5pwA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX1UlZ6Kw1C5ya
 BbZjTpRkx0z8igFYjX1adMgUsgE9sZv+aJ1x5JOrYwgjR5GjCSE1QCVX0UKmF6fb4813bxM5nzm
 R5GUmh6hHfWJsii+WpaAkN4SlgGvT0Fz4UU2ADspT/7bSGgyi56hiFedbNuB0Y8BRwgVzXS1/4A
 VUltRaoCLn2KnRAi5YnPMzZJ50bZiOtAEhDXwQljzCol8LjrOvn1528yjR3AldP4n4onVOOtmvd
 NnoAT1wusXg9vUvLx4OSRdXrcfJ0OEAl/2UvpevVdlnnCzj3eqbukLpG/Ci8YLaP1B/gZoKRmcd
 1GjIYnoinuYAQByUTGXW96MSObzDLvGoagHVHwzlE7RAVm0/+qpqrYXCusTmQmLseWuqo8IfltJ
 dlNUJE0G1KBTS04PY17gIolCAW7Za5i9sV24b79JrUm32ZjJNVEtNV9BGOUPaBx0vfqIW0Md0VZ
 J9rwsMVAemNnjHyO6ZQ==
X-Proofpoint-ORIG-GUID: PxQ_s7tQwXGZhzcbwABkZTVDVjelvz8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
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
X-Rspamd-Queue-Id: A053D213734
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jessica.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Instead of relying on the link_ready flag to specify if DP is connected,
read the DPCD bits and get the sink count to accurately detect if DP is
connected.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 3 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5997cd28ba11..a05144de3b93 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
 	return 0;
 }
 
+/**
+ * msm_dp_bridge_detect - callback to determine if connector is connected
+ * @bridge: Pointer to drm bridge structure
+ * @connector: Pointer to drm connector structure
+ * Returns: Bridge's 'is connected' status
+ */
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector)
+{
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *priv;
+	int ret = 0;
+	int status = connector_status_disconnected;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	struct drm_dp_desc desc;
+
+	dp = to_dp_bridge(bridge)->msm_dp_display;
+
+	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	if (!dp->link_ready)
+		return status;
+
+	msm_dp_aux_enable_xfers(priv->aux, true);
+
+	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
+	if (ret) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
+		msm_dp_aux_enable_xfers(priv->aux, false);
+		return status;
+	}
+
+	ret = msm_dp_aux_is_link_connected(priv->aux);
+	if (dp->internal_hpd && !ret)
+		goto end;
+
+	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
+	if (ret)
+		goto end;
+
+	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
+	if (ret)
+		goto end;
+
+	status = connector_status_connected;
+	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
+		int sink_count = drm_dp_read_sink_count(priv->aux);
+
+		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
+
+		if (sink_count <= 0)
+			status = connector_status_disconnected;
+	}
+
+end:
+	pm_runtime_put_sync(&dp->pdev->dev);
+	return status;
+}
+
 static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct msm_dp_display_private *dp = dev_id;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index fd6443d2b6ce..e4622c85fb66 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -15,26 +15,6 @@
 #include "dp_audio.h"
 #include "dp_drm.h"
 
-/**
- * msm_dp_bridge_detect - callback to determine if connector is connected
- * @bridge: Pointer to drm bridge structure
- * @connector: Pointer to drm connector structure
- * Returns: Bridge's 'is connected' status
- */
-static enum drm_connector_status
-msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
-{
-	struct msm_dp *dp;
-
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
-	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		str_true_false(dp->link_ready));
-
-	return (dp->link_ready) ? connector_status_connected :
-					connector_status_disconnected;
-}
-
 static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
 			    struct drm_bridge_state *bridge_state,
 			    struct drm_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 9eb3431dd93a..6c0426803d78 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -25,6 +25,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   struct drm_encoder *encoder,
 		   bool yuv_supported);
 
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector);
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_state *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,

-- 
2.47.3


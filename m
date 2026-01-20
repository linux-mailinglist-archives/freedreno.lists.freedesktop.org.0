Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGSGI2H8b2mUUgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 20 Jan 2026 23:06:25 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007424CB7A
	for <lists+freedreno@lfdr.de>; Tue, 20 Jan 2026 23:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5C710E257;
	Tue, 20 Jan 2026 22:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OojlrFUT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJ3LaSp0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A980410E257
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:22 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60KHBnTv314576
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aG6yLE+iMJcps9v9V3RlJvutgLy5xcCphtOU6pbn8jI=; b=OojlrFUTVPOkZSHu
 YisPKoO5N3VUJzZFZv0TQNuKnBKNYzscj8Hmv2aFPx4T33otI7UNzPWqkHwHN96T
 2kDbnCG6YOlbyjAWN9uG3fuYSVF9zYFuMA39N/eRWiGAyxI5I4GEqqFB7UOG6ysY
 YwC/1NKTuEAwRhqdEoEvNCvJur3D+82peKeoA/wiOA8F87iGdjA140zEXX8hSsTz
 pwwjVwYB5ikHeYNmquMicFLOEgzeWemt1uMSpaGfFSlqVTMPGliRV4KwkYDilEAu
 /QWPIUiLtVT4mA8aJeab5xqJrAB89DupQm8axOjtQnzXnQQHcvoMyHx8H+oCAKod
 wGeeKw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btdw2904u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-81f5381d17dso4796431b3a.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jan 2026 14:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768946781; x=1769551581;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aG6yLE+iMJcps9v9V3RlJvutgLy5xcCphtOU6pbn8jI=;
 b=CJ3LaSp09VeIF0wOPZz9sIvW+K02PMWD2HEnhV96CpyByqEVG7ts0kzIO0wCQCXIUc
 Rz1DK1N6Y0RuTVQ076wa+a1/IbwnOkUUeBhG7N165DZgKQOHBDqcQD4YsI4OKqs1MHiL
 F1RcW+g+3vROhwn/suLJfIB8Mi2cP0WXZpbCaye1xAU0oRFfS5SCEq0gKK89pEidp5MQ
 Lh52ziYfh6R7jwBibQMoZ4WaAybXoKBK239jQ2XLyzuY4+5aTHQmd1fcMr5wYJ2EHTHc
 Kon4cgsGaPgtVmy5VNiNNFsAybfFCCRK3PJPFc7P+I0gPo4OXsZ6Bf8Q3SVNCm+TWPCq
 lP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768946781; x=1769551581;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aG6yLE+iMJcps9v9V3RlJvutgLy5xcCphtOU6pbn8jI=;
 b=WK1z+QAA+i8/kK76SxyJ1N1J/vFucUJVPjzrEUr3KkwU9UgFU5JJ89W18579QsJHkR
 /10dd8x06QV69vKaqQZM909+EdDY2NNnnFe+tHbl/9JKabCC2NNYx4SatSSEMSgueJH8
 GttBjozB67bTnWv6Rfr8C6mP+38rW4NgNZzAumZsUQ3k4iCHPuQg43hHY3yGFV1bW6mO
 0NIba4PiOidMrOA5doYMfImhvxbrI/KO3YdUtDcqsVP+/OqywqrwzsNx0nPdddog+IJ8
 jN/EqEYST0NrF/994tXuYkvATHafNHThPfwvIiPkNmoWJ8Q3tu9DIEu2QiTvmBYTRT0g
 LpRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtwwUjtE3dbPOPtiSBqjrsZTZ+6FA5BVOrznkrUp6SHoaNclJXNGAzTHZeFemWVtD8DZzKiK/mJXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyiVCA0l8LT03+UGhCea5NzYbpcLKWYJx1R6XcVOe6SqLQwZ5I
 X64nJl0HpYygsq2WqKLWoryh0TGLklyi9u16EIPcdpIXkuz+AEXFFcBY1CaBCqunxoBh7tersfo
 Oicuyl5KYK9H7FvWHX5bg5Sp2j3PHPB8rBPRy/aUon8jO6IzH119pEI3xBqkueGaZW/5SKCQ=
X-Gm-Gg: AZuq6aIJHeKG2KfOjGoI0dg/IzRfw2sl1tHdIxoGSfWzbZ7J0yIyCQHjtokAeN7IB5e
 On6yL1CgZCcj4Ceuf6q1AthqNGrzKdkWV0gHjHfeRFM3D+wXqWivVpRF/0SklxREqaTXj0FnRv0
 krkcb7ZPBQAvgULkQ11OnI79+1KdWoDwMuZe52PtwV07yYYj160jc3F+v0ZWC/JtJIVmuNM7+LW
 pOnJmxhNz1OIdqdp+ZsB11XE1h10KZA2sUYlxmMxxpR3klsxayEhwOblcLIsaISoVodxWVcz0co
 Kf7tgFGluaC18w6CPd2En8zBdkaAe51GaLxhsBkjXx8+BlyS4WidYt2HGf/AMA1+gqJJe2Z1ieT
 N44AqIW7Nr6sCjEDFksH/EgSz6aol9UptNA==
X-Received: by 2002:a05:6a00:1743:b0:81f:31c3:2e38 with SMTP id
 d2e1a72fcca58-81fa17a0472mr13858734b3a.19.1768946780654; 
 Tue, 20 Jan 2026 14:06:20 -0800 (PST)
X-Received: by 2002:a05:6a00:1743:b0:81f:31c3:2e38 with SMTP id
 d2e1a72fcca58-81fa17a0472mr13858695b3a.19.1768946780157; 
 Tue, 20 Jan 2026 14:06:20 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa12b30f0sm12867088b3a.61.2026.01.20.14.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 14:06:19 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 03:35:52 +0530
Subject: [PATCH v7 1/4] arm64: dts: qcom: talos: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-qcs615-spin-2-v7-1-52419b263e92@oss.qualcomm.com>
References: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
In-Reply-To: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768946765; l=1901;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=auGzOt6EwZwwOo/iQK/twL4Y/TItrT+w7eLe1hI4xbQ=;
 b=INpKM61F6lNusR29d4hLWQMtrqGVGwx3XbgDAKwYw0FmRdESF+NrTtBQkmuVPBLdd6CfGyg0g
 ilOGDMYijygAzpb6DI12T0FNjYhmr9Ihjd/kRwDo2/Z3Ko2O4c+aXgv
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: OvMFsGdDn6JxOvk5YVyesNdXCywX8a4X
X-Proofpoint-GUID: OvMFsGdDn6JxOvk5YVyesNdXCywX8a4X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfX2lo/Tg8uJwDZ
 UIeocN5tGz11/myCWVuYhNDnQnyYzOMu6F+p29Ndna4EXQRhSjIwrudxWpbjBrRllZF1JKE3asn
 UxZWzeybmekQTW4aYOTCyAqJLpoAovGcIPwUidtH3sroUxsSFcQIL5ZG/31QnZVBhPfDz0VtGH0
 LEc7zLghOCS1AzSyV8VToWtMBgXwU8J/ClHVxpKmScTCe69mniW5kjk7xqhLuf30zCe5e9qCJUq
 q+pPZ3kI8OzHo7d6dkK5L5GkUiE8nSWIGkQnnT9/jG4tMnMyKYNpQIvOO9cSe/FdNefyTfIMicc
 93pztgzWV8QFoXCgV1RTMis9VNpIajWtBHl66kCI0HhjCQqvKrwTwoO+T65Lc00ZffRPFIBHkKi
 KmM4zV0ND5qbcgfDjhg9VE6RB43kygbqNIXwfOwOQMYdgq9lnaABWQcXRhorM+AXXZKgP8TCVVE
 5cFFWMtnXpxyHXpWIrA==
X-Authority-Analysis: v=2.4 cv=RqzI7SmK c=1 sm=1 tr=0 ts=696ffc5d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200183
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:jesszhan0024@gmail.com,m:gaurav.kohli@oss.qualcomm.com,m:dan.carpenter@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:quic_qqzhou@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.91.149.80:email,0.77.170.208:email];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 007424CB7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for Talos chipset.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 88980d8c3ee3983fb56b2ccd170fdd41b22c222a..9495514dda1a32e21f53f4afca677dc13fd9cd5e 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1843,6 +1843,31 @@ gpucc: clock-controller@5090000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@50a0000 {
+			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x050a0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "mem",
+				      "hlos",
+				      "iface";
+			power-domains = <&gpucc CX_GDSC>;
+			dma-coherent;
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x06002000 0x0 0x1000>,

-- 
2.51.0


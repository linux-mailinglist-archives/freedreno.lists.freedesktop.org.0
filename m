Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEvfAUzdpmnRXwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:08:28 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70201EFE28
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE2F10E80E;
	Tue,  3 Mar 2026 13:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7tMzMeH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpm2nTGt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EEB10E7FB
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 13:08:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239mnVk3995372
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 13:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RAE817eOkoFlssgZD9qvItbxSD0wQHT8mpg6XXPbDoA=; b=M7tMzMeHfrXeEfGP
 mfn1VZNmc8kqDEFe9ywMRt5qxlZWM4859at6FIq3eovf8c31g0j8wZ1YweQvR1Oj
 tJY7UloyUp4bsCcfaBQ9rjArDWCMVp3MwphVlLu+zBE6c8eXpjBMsG6924Iy40iK
 ckbx+oxmkvHiTMkPgHqSoFac9UiCD37S+LxZTk/4sSmEOCxrRuxcJiSg+ZPe9FHb
 Txu1EJNpRklL+NqsTu0HAr29ylX+gGxY4lLRZTSims74pwA693RLUO0nUnEoyL3R
 FufzdKAQqnA5oaGTOXVrsUKArCdZHNP3gXIh0mXHsN/GR9LE0zQcs0QnTQmRsxiT
 EO20PA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fshan-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 13:08:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c711251ac5so3763621185a.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 05:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772543303; x=1773148103;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RAE817eOkoFlssgZD9qvItbxSD0wQHT8mpg6XXPbDoA=;
 b=fpm2nTGt2rwOLrNcQCJAJJ6wRYx98F10RXWW1c0xa6Q/I5x5OVWcdjTbm0fVoYiebB
 +WlQoQJdvny+WpagnuBGkBwtp8T8zGQzI5RYWEw7XlV+xp4Bth55f9etQyHArJtrEhNW
 ROut+hgxGYmv8VgkgP1zDEqtmJfcVPGlkLxmImyOjOhjn/wMifVmgaIjH5KQYRc9tngH
 lzLfgXbU+g6TqwCZWswzzlowMw2uV/tQm+L7PsT7HWv9ilrE6x/nm5XLU+3NW+Zgx1RN
 JLkExGH9kzgm+jXF7nmJHoZAkLXXWCtwDdG3cw70CV1I/AVoNQQtsizHjvNza22peO/u
 Sn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772543303; x=1773148103;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RAE817eOkoFlssgZD9qvItbxSD0wQHT8mpg6XXPbDoA=;
 b=Q7oi6n4LMgBUCzZ67MQzaLv+QzVjX3UKsT7ou8TVkQbfjzCDjLRVas7gQr7CcBKWx8
 XerVBb236JKY6Ir/nujlmlpZPGcXUvue58MZ78UvetqHw/yxL+DGpNP5SUMGMJHFvUxC
 Ps5YQllSll37t+C1DHZQ+I4MO/izdeh+Nvj1YQWvih9hQS6pFTi8CDdyCvjgiMuf4I2x
 Z2SrSVyKukEilUvifNv45ZJ1p1AzEk+jqjGaUeRLKlU+jlKOT14Gk9t3BLZ58HOBdFIa
 jxPZoCnjdO90qmfoKlY6vXlo4pbKi2Db/3hc5AX3h1ORci9pbPnkvYBX+PcUpWpIvjYT
 6ZBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLTH60PS4LfooRVzHg3at6J4VLugI0jOHC03RuMjFpGuum5dheVLmGXR/wzISYIdfeU0B0aFiuxT4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/sh8iGo1hQjEb1ek9/3aiH/RCQRmOqx4JIkiymtYQUSc+gRxW
 5q2KolC5vlqAhfTmvAVo1ObbB9Qo53irrQNQDbF+yUAiUzN8yw7MJ8CaPpasbmZnHWBDYiMIUAE
 A8pvxYznd8A6zKXLTK/sIOkDeT5X57Fta+svca+qN1te8jv/4gVvaeQ1AtwK5xfJCJA1UtyA=
X-Gm-Gg: ATEYQzz9QAnEWp5G/bZo/O6gcdK8XFtZ/xVwpKO0566wS2ztJojFP8GlVOd5y5afjLH
 SzPtwEaqSiF6AVNMqtEiTfRHP47VcR5SyZ4CGyBJWOiFO2gXzzWaQEPLHEpnD/hfZ2eLyrArsLR
 GD1TKj242fqWv+ltj5Bdt0jBsP6PPrxzloHE04ElASNb7v6CBdWuuzWsq2y/sxjRpYUDh9SaY1V
 wh11/09TEriAIdoqWnnS297J3+VX4ErucRJ2KKTjJ7wJt4qsfgoxQsl+57vY8XlltoT08p7Z+9x
 jcZpn6O4DWpe5nE2p0jsI+yDQvcFAfzksegIf+hyp85RId4kgNyNy1PqbIG0KeP0lKj0wDnixuU
 WE0s7LWyPrUIyxzyc0asj614Ks3HQyhlskCm2gKLg66aT
X-Received: by 2002:a05:620a:458b:b0:8cb:c897:6839 with SMTP id
 af79cd13be357-8cbc8d999e2mr2076167785a.26.1772543302756; 
 Tue, 03 Mar 2026 05:08:22 -0800 (PST)
X-Received: by 2002:a05:620a:458b:b0:8cb:c897:6839 with SMTP id
 af79cd13be357-8cbc8d999e2mr2076163285a.26.1772543302307; 
 Tue, 03 Mar 2026 05:08:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:08:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:54 +0100
Subject: [PATCH 4/8] dt-bindings: display/msm: qcom,sm8650-dpu: Add Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-4-814121dbb2bf@oss.qualcomm.com>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
In-Reply-To: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rBeHOx6F9m6NdTQIVIlJ5ueXyG6WKv5A3h4KFzfYNqU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0uiRASLjzocGD6W+PgQ9ZT+E09PuHdyD4JZ
 /BDtkzAcaeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdLgAKCRDBN2bmhouD
 15skD/4pO1wbWknuEyHHcse+SuZHM5VK8jW1h4NIKSdxK/t55TGFfetmTgHjCig44dQyCNCUOay
 GCpZU80ZGYLajIUmft5/aLrCS0+b/pjnnxt2QszffgTuKFQpS/kfuPL8C4argLCxrvUsS3tbm45
 sFz3aEBctxIJ1owJn0SB4dLAmvLL4FvT2u5GQKab5N1Nx1Zs6n45R0kN5N0RfKo0jStKcEBUoZD
 eiK14SynEBrZM1lGaR49TWST91mDo3qhYtdoTAI+tfEN1XQNTNPfFDTS2DHuwHmJh/WmpxpOoC1
 t4njSSKSBLlOYXaYsX4KoZupNBG4u+Un+5iIlWxaBoLLhsaPjXj8bGTe7EUXo96ihP/GD0ozXH+
 po1FVzhAsU5jjVKOg8Lfjb/JyfExxGFiMrN9yXPxNTWXBqWeprSsd1MBTItmdy9UPlxmAy2s5lO
 pG8kpunOjIZMJaU+iqwbowevAx4138mwNiZJ4sFwst1jTR++hc8KCOm5cgRVMX4/FavWk5TBz62
 O2zB51tnQ+eU9KJP4Y6do3QQvajZiTUAEg27AY6gov63joBX9kolsNb93gG7IR8SxEzsukLbpxk
 1OwNUUm1ZlhJcAKUrg/NaWZd5mwxREvkYLTm3wCFuRhP7WZIIKBPMSU6mb9NPDx4/uD+BuMUYt6
 88mOMMM1j9G4Nnw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6dd47 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Qa_SlUMgUoJhev3IiQkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6CgMoM_S6ppHbPbR9BtotgrvcsORcYPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfX7lfRKF0SFlen
 SRr5z/1N2iOiinHYKUPg2vanFM4ldhjLfYo5sVLXlodNe64xKAyZ/eWMPBmvIJwi9mXlq0IyFky
 RyZn2PHBfOGzRpKvINbVqEnYZvKHG9EjOR1Wa8Yi9C+GzTF9f+sUs5GK86cg/VQevHuWmTMVokD
 x1eBtzw6EciSM5VdJLbNdhHnVODYEdQzoBlcxbxWs0Dz6BngGXRup5zqu9q0sNE+E1PFRnm5z7I
 lQzsDtKRVqy6K/2Jf69RxryJjf9ioysuSoo6X9Wm06ZxYZg0WgX2AOH/dYq53ylKXej8ycmoKcn
 NXkxNQNOhLbwKzk2Hj9VyBFV3GYy+8uKzUhucRJp8VDuIMtQvGjwOafLRi9oJyLKvKnF/pvBVpB
 ZSXUqvrODOk6S1rJ1Rqr6AYfHsJuLtP5Kvd5st8rfGyU29P+39j46QxfP4lnG470qFRx0eP69S5
 xk0Tyv0O+Lk8hyRohRA==
X-Proofpoint-GUID: 6CgMoM_S6ppHbPbR9BtotgrvcsORcYPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030103
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
X-Rspamd-Queue-Id: A70201EFE28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

Add DPU (v12.4) for Qualcomm Eliza SoC which has noticeable differences
against SM8750 (v12.0) of mostly removing blocks:

 - Removed CTL4-5 blocks,
 - Removed VIG2-3 and DMA4-5,
 - Removed LM4-7, DSPP3, PINGPONG4-7, MERGE4-5 and several DSC blocks,
 - Added HDMI interface.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index e29c4687c3a2..dccac525d202 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -15,6 +15,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,eliza-dpu
           - qcom,glymur-dpu
           - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu

-- 
2.51.0


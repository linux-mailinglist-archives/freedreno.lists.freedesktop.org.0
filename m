Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF73C6854D
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 09:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4F710E469;
	Tue, 18 Nov 2025 08:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="acW4vh2C";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmuFb1AP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0848C10E46B
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI3BPOA375679
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=; b=acW4vh2C0OBfNK+0
 49zxa4PHlVX/A2qjaLVG/Ltde/DKv2Q8gYXmRe9mSmhL0WU44TeCRR+t1HZ3dSPg
 goarJ/7XHxjsCkDNpR4SmgxNJQwfRey9hFcQDQYG36ZVeNWSjsS4nxCstUQGGx7g
 WD+MbDEcOsXqJ9PUZfbZC2orkJqCu1oyF3hDhP8+qy+ocrDF1zck813KYG3sTxOD
 yqB8MTSbwq/TYvVvePacP2UB1gHNek3BIpXm1o2dJdx0OtuX3Oa5Y6ACWSu+4RZA
 uDZztcrI2M+P8rojhfCjits1PxtYkU+qcJau3x4/m7VGHFlz9Jg9UIxFG+HH0lkM
 qTF1nA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76njg01-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297fbfb4e53so94998515ad.1
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 00:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763456033; x=1764060833;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
 b=FmuFb1APuz2uJNlDWbKnDEEQpf3Z2EfBM+ayyp5tnhqvOhMlvMXnkQKusyKr9k0Qui
 vIRZhQ3/UA+3hhk15teloQ/TBgEfPIz2yAhGSdJTdki4uLv7oRUgrEJ52l92yDrqzRlr
 fsk2F2RTsiI6+707OLHupOdww6pyipv23c2y7lmFQRmiGJcgAZWYkSgqJShAUwyu/uga
 1OCtTf0vGU0TmFWbpw93MpN66o4+oZO0cIJGzKQ4GPFYNu2ol31+PN7Wb3cvhT6o+Hoi
 92P/fvw7qsrANIBJ2hkmSCXA96PfzPZzPIF71euvSQb3yPzdJ360/sMD0L1dSGYlFlK3
 unHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763456033; x=1764060833;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
 b=VER2ppdxj79QFGwW5JtLZGpKLZo4xaImK0YftdLnSOu09zas0ljjQExEkeTpMkpkUK
 dfz9WtcApilQh0lLR1xUfaKXeXLdHFJVzI0JLWQncxtIFYCr1E19GKEqFKwNz/8YpOdS
 8mPOSCxXjgmvcZuY9Ni/+4IrROHaxwuAjOT9BmGsj8Kem/kOGt5+ZUFSsC5qzU6qPJgi
 lrtBBTXTMmIeWoyQeftarHtccoTxcW+meVqzfqMzxMOMvauYPOia4LjGmOxubzo4AHVa
 osWFK+JjxerHq/EbWFGJPQ4uTDphh1/LLfKz/RSlBr3xLcb8Kq21+kaPvuHlgCjb4sZ5
 rTpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1FGIbLZpDicujP60NqoIqPcxw5zUnop+8+EoTlF93sdZQXQ1K1ehZKRS+fcbMOL2A4Po/m29Sos0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/XQrVvgCP+x1O39olOZBXEnUuvuI3VmEVhwVbGBWpVGxakh5w
 ZIhe/ACqn/hhknRbb04kSuzaSKN/MpdFE0o6hxQqCZudMQuaOG3/d5RLJFe+ZbKZ+K5UkPNoVbS
 3oKj+/DOF1oW/7m8n3X1Qq+ka75ubxvCO4lP2YKTT/omYxAsjRVfWjEJtvY3tWpjjPcYJe9Q=
X-Gm-Gg: ASbGncuoUfEHGUJuu2OlreMmtdCkQ/UdYoy5iOXhiRalro57VJ64VdJ3IbL21AkQzvf
 JUUoSRxuHYL2QqlAyEABCRjh3jWVDfluaEJrbExy53HPiySHAgGQvnAxLEez7obZT/ea9lMJxTz
 /3dhnikVe+LAAvJXxBEQRQS/4Jwnmt22y/K9CoiKUrCg4XXjmE7B2viutrSF3RnzxRyrUcOAZ3m
 WguOb1lmm8QMmvWna2F5x2CoK1vFedCPDhOJbMceIRLB4RWuYJwFHW2oENMJjR/TZ+NNApaD7c8
 54BoiyBax7HekmxuLsFfgJvlDwPb6dticopkXn56I31ImC6XhqnNXCKbOSM0HnoRQQdTI09gnlo
 xUgbV7UizjPk/o+SlAsi9vso=
X-Received: by 2002:a17:903:1a2e:b0:295:f508:9d32 with SMTP id
 d9443c01a7336-2986a733373mr199740145ad.37.1763456032950; 
 Tue, 18 Nov 2025 00:53:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAYYS70u+Ee2zagd/j5aTO/ulost5I9qswBrR/l8KD04TpBbwpgzQvRoU7wV90gj86EvfwBQ==
X-Received: by 2002:a17:903:1a2e:b0:295:f508:9d32 with SMTP id
 d9443c01a7336-2986a733373mr199739635ad.37.1763456032365; 
 Tue, 18 Nov 2025 00:53:52 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:53:52 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:47 +0530
Subject: [PATCH v4 20/22] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-20-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1792;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NcxT59isJ8a73ABBo5632Wjovo4V8SjmsWcRhDa2gQw=;
 b=j7F8HzU/j38mbjoyk5aE6lcoDgwRxl8yKHoa/I9iVW6SXOUfEtgqkULnZ3q2RFEcVTcBHYZqN
 5H9tDBA4YdZBkuxB8GVxkab8xAf7MHBF8hHFiFj7sxlD9y89W4liF17
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX0D7ROzvDWbPl
 3q2p8jBdXr3/2+o9EZxaJ2HOwj3uNsYXdV1fkmCmvi+PKquYzOTDGyyV0jQ8lpN2ZCiMiskQo9r
 /jDE6efCcCgzBUrVNnVrSRZg9V+OcuVU48dkzvrHbdBOM6R1ZzS3cQ5WFCFXtEKQRM2ZSkr2TXF
 AncuaIdlts6Oong5Z/u4NkzqK5Ncc3SwA0dmwk+Adpfmdv+B6aAXIlxLYty1wNYmp67mGoMRX7p
 vM05fkr7IfYVBE81S37MkeQN77dL9famQLXoDfHXfM4Gjkum2VmHANdV6nXaOSrChJaNlY7LolN
 MSLs1DF+/A/HVVUeJkogE6m1bu/up2m5TGk6hgXf8weQjPMpBctMvinBbLy3DntA2KGegmOpXVc
 ayP6DYtaNsog3eqvMKSug567HRL3pw==
X-Proofpoint-GUID: dpgichR8biakpU5JD73hTFxyvF9RcQZW
X-Proofpoint-ORIG-GUID: dpgichR8biakpU5JD73hTFxyvF9RcQZW
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c3422 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e8idWDajkKX97RI96f4A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
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

Document Adreno 840 GMU in the dt-binding specification.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index afc187935744..2ef8fd7e9f52 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -21,7 +21,7 @@ properties:
   compatible:
     oneOf:
       - items:
-          - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-gmu-[6-8][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
       - items:
           - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
@@ -299,6 +299,34 @@ allOf:
       required:
         - qcom,qmp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-840.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+
   - if:
       properties:
         compatible:

-- 
2.51.0


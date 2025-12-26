Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A26CDEE42
	for <lists+freedreno@lfdr.de>; Fri, 26 Dec 2025 19:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6241138D0;
	Fri, 26 Dec 2025 18:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1Ltf00D";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtMCJBRF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DCD112CC9
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:26 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BQ8baO11280905
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RgAmFhI7swuPIf8WPcGiUXJ7Xp4sUyKMt3c/cd48bxE=; b=b1Ltf00DQDObPEQ0
 Q9M/2o+wTDuEwwnD58nUYRULQ7+WSl+Xgm0MjHxaJowksqHI8ObIFOAkDcSj3nkB
 iWlCOmDaTVYwM36mmANN7r8heDOIZ9oCwDqRuHnUgAVq80nFAnUo6yfWT6mvg22D
 QWR/h+dOhVd2sakD/VZxrhpHYwACyc8M1FhK2ckhpFwlzRp5eEY0elC3tmP0GrYy
 z7JoqPI0gRVZJX9eV5NbVedZ6y1R6z0XE0EalBSTa4R2amy9VVih8/QzGYzanVId
 79Eppc3uA0pJTBsJQOpp+wANE8BfGIt29D7+SqwearUF3xy7PFmf3vSjREd46blF
 gMRO5A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8p4946tw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34c43f8ef9bso7806680a91.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 10:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766773824; x=1767378624;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RgAmFhI7swuPIf8WPcGiUXJ7Xp4sUyKMt3c/cd48bxE=;
 b=jtMCJBRFnXzzJ0kFTX3AnXzoSjehjAxCS2rMtNwWXv485Ojm3mih2kv9s9vt4FAhUc
 +xOq5MCmTEIB+WfdN2DNyVoNbqn0a293xQtVhryHSPnojjp9IXQaSDVBm+bD3eoFKEg1
 RWqMAusBRPpEoq5dZQlZtmQyc9uN9AG/PbC6JYCODHGjMRo+uCPo8Un40sXYrW0VA0Tw
 ONBkRUIJ6GynfHZM7Iy1DoRRsFe3gD2SjpM9r7taqzhHEgyiL+czd5vaRpyBlKGi4NIG
 K1FZONVa8vpcOZ+WZvOjaY4phWRA6AKOjgxy+k9oywkJmtLF6HA8w1Xv0gOzpk9/jbda
 2iQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766773824; x=1767378624;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RgAmFhI7swuPIf8WPcGiUXJ7Xp4sUyKMt3c/cd48bxE=;
 b=IuPVr47XwXcbbgLbh8NtblDoRuSkSYMgCxUer22XBhZBaj24opjZdvIljYsa26K110
 Gx7CKMmAJ3Uqc2KAlydbLElgmJCmAZEPHkcspQVvjU6FKSgawHqTXa96Lxr6SmuSfirU
 xIxwHJeDy9bEBE1B34ao5CQNHKbYNiaYO8yfY9F5mPf+1CcQRlWOf0vwlH7HNzM+fx47
 3P+sTYfWrbo85eb0g9nWJobmAKPeeFN2t6rCPVVpoEC7zKzzKsKJBo06eqszLtznERdO
 TTJsof7W1sztbJvPHsPxLvcolxB8HFOZ7hPWtnCUSqykS8HaCHd9BXCWdwL+1youf0k7
 8qhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4+h6sFYOfGFXa2YOrTyjhNyI8MjFm22gOJlgbEPCfQ/38qH/gyTR+lIWlNbk8bsMapgsY+Zt5NM0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4+IE4HefGEqcabGnhkUrztnl6XibXj1gr07sZtPDFEg1o/f9H
 SvhXVnhCIfdmcypextm1BwFPUpyMTkQQREyQEQFU2xwER2r1yiY7mwqLonuG1k2SRXa5fiK2sRD
 Cp2eB7Q9ZCqPe5WQpOghf7HK7pet92x5Vxk699E9z3djCSv4UAqYBL6w3Vdkv6+14mpCkHDE=
X-Gm-Gg: AY/fxX74THr1+j0h0CVlfUM24ml3HmbxRHVcrMlVlJcmpvnWFgzvnbLrXsiWLBhcskb
 VvVrzHlBHqvQixEL9xKoSRVLDdP706Nrkrwz4uzPDx0HwPXM1eco1QI+KPun7B8j6oFfw5PKOgO
 Hws1sNe5rz2unx/VLlcxYuKuJFDHSQC3dmnQ/I/o3tQynRkW9s8qqHPQpQPGIQ4c9GpX6sAGnWe
 U3ZV314m8GX1BdLywNfOLVvOJd4PD3rXG9yfeg8gHtNrNGkMbFigAm5EpjdpfoywA5rtLDaDImE
 z+/ax8D8VpJCBgS6lMqHipT7Xxa90mwGJtBB7Xt410a1Y74oll8111fx8k+dRbWXEwdF13Flymz
 XWwXOqQuVwhohX+Okd2B5KZ8LT2trsIUmnw==
X-Received: by 2002:a17:90b:2803:b0:34a:a16d:77c3 with SMTP id
 98e67ed59e1d1-34e90d5d6d0mr21217662a91.2.1766773824291; 
 Fri, 26 Dec 2025 10:30:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxqzDaOi7TeYzJ5Xh/GgEoe2tstfUdz928XPlxJaz216BBcTVVcEWqmIz4NI+E/Gqd0G21qg==
X-Received: by 2002:a17:90b:2803:b0:34a:a16d:77c3 with SMTP id
 98e67ed59e1d1-34e90d5d6d0mr21217615a91.2.1766773823669; 
 Fri, 26 Dec 2025 10:30:23 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 10:30:23 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:36 +0530
Subject: [PATCH v5 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-3-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=1791;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5dTgJd08Hj+VK9BytzXaVkvC+Zi8xcPYy36Mus4jT/0=;
 b=HfCwIXMsyvhrdpkseOTWeZc12Xt7mv13lFpk9j5FJ8oClUtZqBtZfMzvQFwJH4TcllMLqqcNR
 fyKNK+gYp/7DxfktVguqA9aUIreiPEJK+WPd/uleFx2amCvM7MPUJko
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: r-6X0BZHh7KtXG2JUuN76Q9AkSyb9Xre
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=694ed441 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX1/2EaKg3bNwb
 GyMNZdk7AmJppT/9Sjae9hwsAxcmTrElwNIxw1T6Bpp1TMLypAelzHvyguusPCoeDLFbcfBJnHe
 iJaVDLsJkNgiWbIuAyO1ffqCJJuV5ebiT+IKzX7dI7TZka/hmxNvxo3C+NvvYgUz8q3vp5zdc7N
 WGLmmKExEEl/339DU3w2iVMOjQzTQuVjpdR2y7kvO/EWhoqlVhfrJf2boFDomu8dtquMCM3ULSZ
 NtXlabIlGTiAKi7w6Yni+h6bZpbW4qOeegkuOdEKamNJxBKp5mBoh1baqAj/feLh8ehJNtRJbiX
 IUtsRUl+oS7lrdgWPuoe9PErP+RAxC55eatlr0Gd1LLMQ8Vh4EO1NQEcT5whVQY08sZIyrATWAV
 8piXA7INeJ2x7+5To6A10gQN2F5+obWwdCKB3t+NyZ6w/bPowB8gIhwVQieuBJ9RUR1Va5PAjmo
 alAbvwSNOOHNFD4WmmA==
X-Proofpoint-GUID: r-6X0BZHh7KtXG2JUuN76Q9AkSyb9Xre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260173
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

A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
which replaces GMU. But it doesn't do clock or voltage scaling. So we
need the gpu core clock in the GPU node along with the power domain to
do clock and voltage scaling from the kernel. Update the bindings to
describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 33 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 5c12b5aacf8f3ff64ca2ef97fb0dd6c3a26a71bc..27ce88766dc5c074ee81b8d3e5d68c2c531ed2cc 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -45,11 +45,11 @@ properties:
           - const: amd,imageon
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   reg:
@@ -388,6 +388,35 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-612.0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU Core clock
+
+        clock-names:
+          items:
+            - const: core
+
+        reg:
+          minItems: 3
+          maxItems: 3
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
+
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:

-- 
2.51.0


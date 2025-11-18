Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7CC6A36B
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 16:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A65A10E4DF;
	Tue, 18 Nov 2025 15:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1BE7OeW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="InKyQ0x4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C693F10E4F8
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 15:07:20 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI8Dqop2193978
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 15:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=B8mN/GmjCsBG0594TCA5PjjHjg1VtzMRNYw
 pzS6EVWg=; b=o1BE7OeWrWuG5/+UmIahCqeT249CIiRgTZqGP/9UbC8XDo2aK11
 EPHXxoWfw+vM98ijbrfNKR4+jk7AKTiMIuJ89L8k1Qzru5xwUhwNbgIQpX0TQH0w
 ELAiG/Rqck0TbhoIGHF3x5+TyPudc7dgPrjGo8Imh4afgGfsgsE0KWoaMZppE8k3
 dnikibjEod+hLGj5cpaxJvsfFtSVz7QL5zFFDhMK6b3lC0n/hCf9bJo1zz57jUkW
 syTfwoMWuLvk5WD+GbuNPo/nv6vmW90xT6+wRT0MYwImop1U6Lk8m4lxk4/Y50vB
 jX+/uuTUBk8qLLUmevmTMG7hgOm4CAM0jCg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y95kg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 15:07:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7b895b520a2so5625193b3a.0
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 07:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763478440; x=1764083240;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B8mN/GmjCsBG0594TCA5PjjHjg1VtzMRNYwpzS6EVWg=;
 b=InKyQ0x4X4kV6kz83asVoZtwwPKm6aXfDWFc86VCTHRUfLu3QuMyigFY7X14hoYVmS
 YWsoKa67YENwKAzaWzqdm1lLmEU3MUdNnCNjd/NkNtUXo83YUCvQehqpHvVyn9P9Z03r
 oyMC9wfTafaWwPBZGSUG+FDE7Wvft5SoHvwJ5kLlwY8XeozpBP6sqZrZ+JI8hiZEFdRG
 XgZuRZ9Zc1NFdQm00TrawtiqxuK8m3LPEa8Omvn+E7NNE2IRntukwRUFhfAjrIgviZef
 sVWrvsncf81mnab0z3ae5K6O0i5D/T3rW4zcbA/yL7TdgBzxzH01D9nH72oCp5UYp6oQ
 wLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763478440; x=1764083240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B8mN/GmjCsBG0594TCA5PjjHjg1VtzMRNYwpzS6EVWg=;
 b=VbcNtSE/paWhrtyVuq9iW81/QGlM4Ey0TN/nwldaMN8rR4/aWdpmTOCIIFcPceBHG+
 /MlYDYWV7i3S7R5SFBgmzoo4qziH1ZbYL9P3CAI8ax4Y27keW/007YRy4FV2FlYC2uwn
 xFZ6BtnvqDT/pnF7tlXWfhOVDWHtGt3q8f23MhYc4QE6tlDb4zqCWLbHQEK4FHHQ3OYK
 s/ZZf5vBExlHodwxqbE4ox3eK437P/RXAKh1cndI8or+yCaKgzqjXdh56COa/MZ3NsqY
 6hyuYUeh241bCafvKxpBQev+IchRZaIGPepQDnsoxVmWvO3PHCsLBTLQLnnQosMVo3Zp
 tQ3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlQN+fQjirO3eCm0sDC6HuYgQxiWwmApSrfJYkihqyrgMOrtpaQqfBFyq5ztmxbgHaQ52N93eU5LY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya7lyhbxlauviVys3lDs7M4rNWIGyOnrOz4JJtlX/p3l1FBXmq
 qAbQeNPmsJTnxoNTTmQib7saOnDe9Mi0kxua0+c8MY1eumsH/ucpyupf+pmAvEshQ5XYxXSJS/a
 ekODg/fGPN8s6ugPIjTwGiKpgpmImXJE0QCESKdBv+xDP0kueC+siOcS2oA/0AC5aOFOoX+0=
X-Gm-Gg: ASbGncvq0vOe7jrcSuiOEiMTcxrdVt0TJqtFCkcGHmTYs4cfcUDEklnBZw0w/cGtUpk
 xKHmQoepVkomBgw3YtrP2sfbYTimBa6YzKgW6LwJ1T5TjDeoWX/w0PuGPkYFOQ+H7sQ484UvsQ1
 A4YXdeW9axJ1ioJRVYInbCoOjFLSS7VEgIavuH/OB03X4yxiyAQCPmkkzFZhuxbkxq7nqI4bwuF
 6D096yx8rcnrZv8WYzj+cjKuHdyQ19gpNcj7H0XBNx+v3VqO0E2ECyx4pWzqb3WzPBstyhf2G1s
 R/AbJRu4C1JDNbinSyvmvT8Y3K/IpHWY4Y1UK9QhHTMtv8rGFceU+PdwVlCI4RJbdHVomfV75HQ
 edNjAxGv1LfsY69YaaDXGYQuLhAzLuNUsGB2o/N6Ah7mT/n1yyhKZJ/PU
X-Received: by 2002:a05:6a00:1703:b0:772:4319:e7df with SMTP id
 d2e1a72fcca58-7ba3c66bd52mr18596372b3a.30.1763478439460; 
 Tue, 18 Nov 2025 07:07:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN8v25wkXWT1nNh0+Q/Q5NPaq5o0aKvp1i2kqJK/B168hXAA16+kV6/H29MM4NOga7YqBAhw==
X-Received: by 2002:a05:6a00:1703:b0:772:4319:e7df with SMTP id
 d2e1a72fcca58-7ba3c66bd52mr18596314b3a.30.1763478438733; 
 Tue, 18 Nov 2025 07:07:18 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b921cb6f44sm16942993b3a.0.2025.11.18.07.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:07:18 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/registers: Fix encoding fields in 64b registers
Date: Tue, 18 Nov 2025 07:07:12 -0800
Message-ID: <20251118150715.201623-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyMSBTYWx0ZWRfX4DodBj8cOvQv
 ozHB5eai6D1Z9XI3F2jPsBdfJXQ5UB8ph+ZfXiN/kCAhTyIX/GiJFh440ZnKSoJDXs2inczsxDX
 qCcOCnsX0jTPKCMFv9Qq6utLyMAwQ7xOVZz1zB5Pu/DVCYEf101ONnQfAOrf/vkRg2i86dJt6kA
 Vjo0PTZ3MTnv1e1A9aymEkaGKW8EneBwZdb29xsMALZni7YZsGvKBklLTYYQ4cE3X1S9CZLW/7s
 eFYft3E5FfxqSuvpAMp65nC1Xhv5TP17KZMi/3Rtki+3FUBQGObbKX30CI9niYqOYgBwbIpkMSC
 D/cFNNAJXAOLnWYpH/I0Ba7q25WeyhJF2xhDQGrPLbgCAOuWcuEcLMnZZLpkgMFvXBRm45DH4oo
 cEmEbJXbg+/t8TgcVqxLTJgKNraurw==
X-Proofpoint-GUID: fF1b1DgXF9EM5vwOYlYXK_tGxafyD1HI
X-Proofpoint-ORIG-GUID: fF1b1DgXF9EM5vwOYlYXK_tGxafyD1HI
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c8ba8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OSLXHSMv42BtIwkUFNYA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180121
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

Based on mesa commit 3f70b0578402 ("freedreno/registers: Fix encoding
fields in 64b registers"), but with some fixes to not skip emitting
interrupt enum values.

Co-developed-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 1d603dadfabd..54a08d4a0ae7 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -189,12 +189,13 @@ class Bitset(object):
 		print("    return (struct fd_reg_pair) {")
 		print("        .reg = (uint32_t)%s," % reg.reg_offset())
 		print("        .value =")
+		cast = "(uint64_t)" if reg.bit_size == 64 else ""
 		for f in self.fields:
 			if f.type in [ "address", "waddress" ]:
 				continue
 			else:
 				type, val = f.ctype("fields.%s" % field_name(reg, f))
-				print("            (%-40s << %2d) |" % (val, f.low))
+				print("            (%s%-40s << %2d) |" % (cast, val, f.low))
 		value_name = "dword"
 		if reg.bit_size == 64:
 			value_name = "qword"
@@ -264,10 +265,10 @@ class Bitset(object):
 				  (prefix, prefix, prefix, skip))
 
 
-	def dump(self, is_deprecated, prefix=None):
+	def dump(self, is_deprecated, prefix=None, reg=None):
 		if prefix is None:
 			prefix = self.name
-		if self.reg and self.reg.bit_size == 64:
+		if reg and self.reg and self.reg.bit_size == 64:
 			print("static inline uint32_t %s_LO(uint32_t val)\n{" % prefix)
 			print("\treturn val;\n}")
 			print("static inline uint32_t %s_HI(uint32_t val)\n{" % prefix)
@@ -283,14 +284,16 @@ class Bitset(object):
 			elif f.type == "boolean" or (f.type is None and f.low == f.high):
 				tab_to("#define %s" % name, "0x%08x" % (1 << f.low))
 			else:
-				tab_to("#define %s__MASK" % name, "0x%08x" % mask(f.low, f.high))
+				tab_to("#define %s__MASK" % name, "0x%08xull" % mask(f.low, f.high))
 				tab_to("#define %s__SHIFT" % name, "%d" % f.low)
 				type, val = f.ctype("val")
+				ret_type = "uint64_t" if reg and reg.bit_size == 64 else "uint32_t"
+				cast = "(uint64_t)" if reg and reg.bit_size == 64 else ""
 
-				print("static inline uint32_t %s(%s val)\n{" % (name, type))
+				print("static inline %s %s(%s val)\n{" % (ret_type, name, type))
 				if f.shr > 0:
 					print("\tassert(!(val & 0x%x));" % mask(0, f.shr - 1))
-				print("\treturn ((%s) << %s__SHIFT) & %s__MASK;\n}" % (val, name, name))
+				print("\treturn (%s(%s) << %s__SHIFT) & %s__MASK;\n}" % (cast, val, name, name))
 		print()
 
 class Array(object):
@@ -437,7 +440,7 @@ class Reg(object):
 			print("static inline%s uint32_t REG_%s(%s) { return 0x%08x + %s; }" % (depcrstr, self.full_name, proto, offset, strides))
 
 		if self.bitset.inline:
-			self.bitset.dump(is_deprecated, self.full_name)
+			self.bitset.dump(is_deprecated, self.full_name, self)
 		print("")
 
 	def dump_pack_struct(self, is_deprecated):
-- 
2.51.1


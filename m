Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B036B499F5
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 21:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4439F10E5BE;
	Mon,  8 Sep 2025 19:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVqrTKRB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D9910E5BD
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 19:30:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588HKWOi030096
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 19:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=WsTaj9aC5GD
 50Hh4uc9YImnv7c9qgszQr9EnvkcFHK0=; b=eVqrTKRBhlWdtP7W72Uxq6NoiIW
 YQ5p6nq/CK9yXaMQQlgEznwtyPAEChT3Cq7Nw+/roK0elBzPbJjkrzDp3xLZk989
 K++0VQvquJXc0CYtc7TXeZQPid3bLSHCXciECvI+EvDEiKyAOOiS0rD/XyThvD0n
 +sXG2RVyKjERFHJB0kzu9fvevv5aX1+qwf8g6LOdS3Eqb0ECxkOuGciKtae6S6EM
 DjDhwp/74ROdDDohVZXEpT7/N4KT7K4o8uWORMNsWH637gFyrpSg8SBfSXu1FKSb
 f423jRqAadm/zn+NpWpiFsZ7QHcz9uHSRU/lIJBjDC71v+sZh0kFohyEbLQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kwmpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 19:30:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24ae30bd2d0so45742505ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 12:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757359838; x=1757964638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WsTaj9aC5GD50Hh4uc9YImnv7c9qgszQr9EnvkcFHK0=;
 b=rQbpQTW/6wONlNZDmJ1R6HjhmqvAvb6SppPzLKtaOsmRtk/c4uhv5IqKkA58XjWehq
 GQp3tiGrFY91flkK9j7FCauCKUiZkmBGr7qGJh1REmZigH9ffPdSxYyiIZq90xbFr7cN
 vTMvMzEwxVqoESR3K+SastRqT8yY9924ZW4eM9UDyipWh0mI7xL8GPXJwiaAOVQWSRzr
 zL/NbyRNZdfc1vcsQlMinbPamDrj8QcrvavO4HO33M3zHF3OcPxq31+jo7buMLR0Cmt7
 GOcum/Y/PfylYZdef8joFQlG2dbPtDNFv4RIxNY7MHyWEoAHLdQis8ghEND6rglvFLi9
 1nXA==
X-Gm-Message-State: AOJu0YxLQV63AMAyA5tWySKGQCmVGFXA08dhE4RHcHvJN3YOVv1q4zN0
 wUnBiAvZGLxqDjQl5Qw7BTrScJRqJr+NZRZMzV2Gr1XQ2EV88KC/wMfMOzi28u7tHnSPC1zhOwX
 eJNtuKVjexIiPRo8biDq6t/1gcoTNbKrnrst0XLJxA1Pz5BhOFuMk9LzubW7S/fy8AJbMWTA=
X-Gm-Gg: ASbGncuIRE0N9WLloNhDbqiUIiOOxoL6PtBZoVo6GoqGbGHDdoHmyqyZdNDMNj+3PGJ
 IuP/2MZQRK57THwh+BNem6ybzB/jaUGvzn3O4B13g/XaDBRPKqbaleDbwEjPHyzQZhfjKxjwmJr
 /5I6Kps6EN3bV2UUCAGCMNQifTfiEZ+s0TtTa9XVJACHF0/osCUwMIbNe2s5GYvKN0hsQXhC2vL
 4Q8xRU5gEe5PIe4pwq9ftPKZSskZrbhJOi/7c17bpnhduZXeIibjf6VdROF8ZXZXKmM+2K7ib4O
 mSuGMO/aT7t9QiQKDqLC/ikU95P+W2u3C5iqtWvC1ROZFbOgyQE=
X-Received: by 2002:a17:903:19ee:b0:24c:bdf5:d74b with SMTP id
 d9443c01a7336-2516dfcd7c5mr124312235ad.19.1757359837569; 
 Mon, 08 Sep 2025 12:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnE8HmdaJ0DQoZXF+EtTS9roT6QVEtH1gZOT81nijuJgDxG0dijPNgZrPVtA0NPjF7Ux7yew==
X-Received: by 2002:a17:903:19ee:b0:24c:bdf5:d74b with SMTP id
 d9443c01a7336-2516dfcd7c5mr124311505ad.19.1757359836629; 
 Mon, 08 Sep 2025 12:30:36 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24cb28c3110sm134810835ad.120.2025.09.08.12.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:30:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/5] drm/msm/registers: Generate _HI/LO builders for reg64
Date: Mon,  8 Sep 2025 12:30:07 -0700
Message-ID: <20250908193021.605012-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX+k4gqftzW9EY
 0Cd/agTjgoZK4CnzGlW06TGZhdT3xklQWnnmAW+ni6IIScutjTguVPf5S6Pb1WPugeAaKGi3SKD
 K+RMN1ZdBlCALIEV1k64q9lb1lDcFwTp8rIE7/0aTrx/3Ud56wA4nRH1Tv/7Y4hHCsSWctULKOR
 oxHP4gBq0kxo6aI1Us+kCEAK21OE+oouqeceEnWkyotASFKellklozVkg017k2tzlmQeCQ/M/Lp
 IjSyHSf6Ze8YBjvhg++vNLatAvQlQoaeBhgU+k/ITbOsjzVE9dZDZyDNYZcOhkl1Mb40tgIeM++
 3/XKjCpwjYe6vQSfpXrHUGbElW8V9bSPGomEBouMETCUeimb4V2UrRwW8yQTm83Y0WwD0wywy7p
 9X5PzgFt
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bf2ede cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=QI1G1A81GPnZtfO3aA0A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: KStboVbomke-NyksXW5KKltSAzhnsUsM
X-Proofpoint-ORIG-GUID: KStboVbomke-NyksXW5KKltSAzhnsUsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

The upstream mesa copy of the GPU regs has shifted more things to reg64
instead of seperate 32b HI/LO reg32's.  This works better with the "new-
style" c++ builders that mesa has been migrating to for a6xx+ (to better
handle register shuffling between gens), but it leaves the C builders
with missing _HI/LO builders.

So handle the special case of reg64, automatically generating the
missing _HI/LO builders.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 16239b754804..1d603dadfabd 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -161,6 +161,7 @@ class Bitset(object):
 	def __init__(self, name, template):
 		self.name = name
 		self.inline = False
+		self.reg = None
 		if template:
 			self.fields = template.fields[:]
 		else:
@@ -266,6 +267,11 @@ class Bitset(object):
 	def dump(self, is_deprecated, prefix=None):
 		if prefix is None:
 			prefix = self.name
+		if self.reg and self.reg.bit_size == 64:
+			print("static inline uint32_t %s_LO(uint32_t val)\n{" % prefix)
+			print("\treturn val;\n}")
+			print("static inline uint32_t %s_HI(uint32_t val)\n{" % prefix)
+			print("\treturn val;\n}")
 		for f in self.fields:
 			if f.name:
 				name = prefix + "_" + f.name
@@ -645,6 +651,7 @@ class Parser(object):
 
 		self.current_reg = Reg(attrs, self.prefix(variant), self.current_array, bit_size)
 		self.current_reg.bitset = self.current_bitset
+		self.current_bitset.reg = self.current_reg
 
 		if len(self.stack) == 1:
 			self.file.append(self.current_reg)
-- 
2.51.0


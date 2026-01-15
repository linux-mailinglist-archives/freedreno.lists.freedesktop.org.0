Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5247BD284B6
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 21:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F0810E1C4;
	Thu, 15 Jan 2026 20:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mthU4qzs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kE4ZnI//";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9111A10E255
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 20:05:46 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYF7W2174565
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 20:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 f/enLxHnBBykrdCL+IaxgmW7qNcWXutcZNBdtd7FtnY=; b=mthU4qzsZz5I+ucW
 iwOjZiK+6bpkiJYpr3K1jN9WMMhX0GecJZafQhvWcnZ4y6ISfXbi9LvyhwdwQzz3
 Zvceu9KKl+LjCe9Rc3jcikWQKWqjHZyEMe7wFmo+s2W+oOGfXF+9MPDMZI/ldXEa
 S96Q5CuUPAgJXooNYrSJB9cREwe8eDxYEArZb+UarrATR6qLpfXI9r3F4T2XRr2q
 5Hri9h5F6MQ2/U51rIj220xByDC603EDvNbUkYkOIHkOwOCQMLZZ9tLZ9H+hncxy
 APDmLubeRqOQaNVtUdE1IoReNmbLkrg4APq1jC4TC313JMgKt/mqEdNoc4hjBWv1
 hq987w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh92nm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 20:05:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c52fd4cca2so356335385a.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 12:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768507545; x=1769112345;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f/enLxHnBBykrdCL+IaxgmW7qNcWXutcZNBdtd7FtnY=;
 b=kE4ZnI//dIw9I2LnVgufC+oLlfMGtwDNM6xbF7kG164GNq3LBBf3ZRFlDYIrXFyL5s
 47TekVwQSQcupWS0dyO4Clz59xtbUEpYg7BolweFEwCcdXBoUQfahUnF9CTgGFlXjVa0
 wsPnaA0wJe7hcuA3EYzSGm5vSDjR5AdcGHIq/hkS8l6XM22hZIrPt84gKM+m3Hpk2/Du
 MSqQ+HxEjOj0iEXhcg7nWNy3zRovtRQ/79GGJSjCc3fSPBe8dj6Pp2XVNhtUdM1TwH3A
 2eRv1XhDrr5lKvgGWltr0wCSGhzPGpJmVydAO5wf3MzFqRCgum6VVCdoYZhpo7W70c4Y
 9ryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768507545; x=1769112345;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=f/enLxHnBBykrdCL+IaxgmW7qNcWXutcZNBdtd7FtnY=;
 b=u9rGXJnHFieG0u6QPvvCYI36B21N0nL32I8GezVB6Mw1JhwHkpho3xzT9jLOuI/MNj
 pe7g8iZlPGigFzydIJa0qnmbaNYKPh5kZW722jFDEpZTScS4fifW8EXIAvSDaNJgjR/9
 LdAQ8SNbPKtWVNiZ1JsCo8h5vUaa17176K8NvRclr1jzA08ZaVZNJBkFQkHbUNLHIJeb
 MVWdGMf1rm4PbyaPjO/boIGzEUjuCU30kXTOEwkvh/0cEvy7CCLhomVBEYoH+rgbmF+E
 bVzPQmOCeSGNAYRxMYuZD0xyhoynoAJvewCiRUzLDtiF0ap9Fa30bYSIXQVDvn/caGAZ
 lEnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT39nlDXTGTBp8BolMj3sExm27aird+A+hhdlihPG2pHP2F2/rlJNe+NAZUl2S9hu/24vv4e3061Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzazR7gUoI0hlQj2m77lOjgNm/zjMLiWAjSrCfppa9gI1LtP1bY
 ZgRSGbJW3aHgV5MURdZ3tC6ngQZOInTm2oYSM/CQTtXedNEy9q5SUKlnGV8kpVa8efW3gKgaYB8
 88uPkgIleJnF5lgHWWoim+PKlHFo7H+QXMLLSv1Ceu76weGkFXvNqCavkNrznUOazi9XajvM=
X-Gm-Gg: AY/fxX6rcnJWgnmjW8NDteHJX0vx/LRd0kMnNmzVSDUfBmbFNHMt0paOjxEuUf8LOds
 CgR5Ys69ItjVQQ+e1tx7/CX475hGI0BpDq0jPmIpAm+DsVXzDeVPJ2Hiro2G8R3de/VzHISWi8r
 ePgzrDj2OqOvOAqitJBdVNs77Fxj9ukZhPV8WyrwSIOsdgQAO6VLzQXmxbdT37L8IMx43uvCnS8
 OliutvbanaqcEjTTiyMA1liwav1LYr/JGbyS5Ll3dXLY4Dv2jowzT95NQigkDh0OaBk68LowXi/
 jVbjC9kp8zePPnZBCXro6fT9qiI4so7REYpqkM6JWN5Nw67VzDecCFJgUB06QqXmy72ilMKhABM
 p+/N3q7c0gxjnjM0oiJqcrisEoBGP6e5o7J4PUtTRE5pEsJsa+QHGxJE7n2obbr+wnU/n2oSbUQ
 ZAoCS6O3Fk+xgEhk8nL+JUdD8=
X-Received: by 2002:a05:620a:3910:b0:8c5:2dbc:6244 with SMTP id
 af79cd13be357-8c6a678e8c1mr113035585a.47.1768507544916; 
 Thu, 15 Jan 2026 12:05:44 -0800 (PST)
X-Received: by 2002:a05:620a:3910:b0:8c5:2dbc:6244 with SMTP id
 af79cd13be357-8c6a678e8c1mr113028585a.47.1768507544295; 
 Thu, 15 Jan 2026 12:05:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e790casm1381901fa.29.2026.01.15.12.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 12:05:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 22:05:38 +0200
Subject: [PATCH 1/2] drm/msm/dpu: correct error messages in RM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-dpu-fix-dspp-v1-1-b73152c147b3@oss.qualcomm.com>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
In-Reply-To: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3115;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xCYpyxz2Y++3bSOvFHpWng3+Lz48nC4C6QeLJXM/NFw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaUiSa+LQBrNcwNslYVUlAqVNZ9NlLmdtfWaaX
 ubVvRo2GlWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWlIkgAKCRCLPIo+Aiko
 1YLOB/93x1oEBQn3+4s4f1V4tQPtT/OFmIEoQR9Ac8P7YDJB+7Bom8kDcNhCOQ4BpxRcqnLccuS
 P/vLOepyMeMebSCIr7TINb/ZkxAToBK4uhUIH1z/A/8AdAPh+hribG5/jifPfqM6kNGVGNI5jAh
 /zL4kS2z33raiR74Mdmkzy8K+XTpIu8tHIH8VhptRoyizb9ojl0iomwRbHTzx3Cy+x2w6HfSB/y
 TntlP5sesrUtoTOTLjlNrwLP83+TeJKmNc8Pxqc0BarIA2Mo0aMiR1QvJ84Jyu1zUVu1C939I7y
 y8UoHyMT1Jf0PBlphk6nxG3X3xpAopNPQ04vPFJ6pJNnE8+q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: rPvRMll60CbHm_m7lG34RtdwSTlrb42C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NyBTYWx0ZWRfXzcbSbo9UwJqq
 ahw8ORH00Ly8dQ977JmkuhWJ6T2VRd8P79qG0u0AOWFBI8g1rrCY0tyXNjNBGh0OmaWYtR4jNIu
 apufS0XFH3jJy7mgEq49NX0R+h6q085EIG9RJqdeDHRNfpTXch4ewq9nCL7mzIDXy8K5JSYHNfk
 Fa4DyMftG6mR2yMhqvCQW2kCx/CghB1zKL6jiWG6XfqijID7NDKDgewZZGYMgh65x7zstEaM0i+
 aCu9XnHfKaBpmGlUw3zTOcH9UnRr13mkYHOWjfM2zbQ1NM/y07nXPkvyQ2/3ySaWmew2XIpKAHX
 EV6fcvaYn6PXGmakJaJV/WXi1pw6eLD5Twi1mtfmgZWhvEmrxJFpKQDaK4JLMTsB9ALKkJU3YC8
 BVE+lOppXPL0Rvj/8gqPbmEXKGn+iEMMbaaHhaibNI7iMD8OXAi1pgv5fEOtMEamyi1k8MGIGXj
 FChcQ08PqCBABJ10LlQ==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=69694899 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LiGtz_15ZcBlpgV9qhMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rPvRMll60CbHm_m7lG34RtdwSTlrb42C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150157
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

Some of error messages in RM reference block index, while other print
the enum value (which is shifted by 1), not to mention that some of the
messages are misleading. Reformat the messages, making them more clear
and also always printing the hardware block name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f6568ed8375f..7e77d88f8959 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -315,20 +315,19 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 
 	/* Already reserved? */
 	if (reserved_by_other(global_state->mixer_to_crtc_id, lm_idx, crtc_id)) {
-		DPU_DEBUG("lm %d already reserved\n", lm_idx + LM_0);
+		DPU_DEBUG("LM_%d already reserved\n", lm_idx);
 		return false;
 	}
 
 	lm_cfg = to_dpu_hw_mixer(rm->mixer_blks[lm_idx])->cap;
 	idx = lm_cfg->pingpong - PINGPONG_0;
-	if (idx < 0 || idx >= ARRAY_SIZE(rm->pingpong_blks)) {
-		DPU_ERROR("failed to get pp on lm %d\n", lm_cfg->pingpong);
+	if (idx < 0 || idx >= ARRAY_SIZE(rm->pingpong_blks) || !rm->pingpong_blks[idx]) {
+		DPU_ERROR("LM_%d, invalid PP_%d\n", lm_idx, idx);
 		return false;
 	}
 
 	if (reserved_by_other(global_state->pingpong_to_crtc_id, idx, crtc_id)) {
-		DPU_DEBUG("lm %d pp %d already reserved\n", lm_cfg->id,
-				lm_cfg->pingpong);
+		DPU_DEBUG("LM_%d PP_%d already reserved\n", lm_idx, idx);
 		return false;
 	}
 	*pp_idx = idx;
@@ -337,14 +336,13 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		return true;
 
 	idx = lm_cfg->dspp - DSPP_0;
-	if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
-		DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
+	if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks) || !rm->dspp_blks[idx]) {
+		DPU_ERROR("LM_%d, invalid DSPP_%d\n", lm_idx, idx);
 		return false;
 	}
 
 	if (reserved_by_other(global_state->dspp_to_crtc_id, idx, crtc_id)) {
-		DPU_DEBUG("lm %d dspp %d already reserved\n", lm_cfg->id,
-				lm_cfg->dspp);
+		DPU_DEBUG("LM_%d DSPP_%d already reserved\n", lm_idx, idx);
 		return false;
 	}
 	*dspp_idx = idx;
@@ -364,7 +362,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 	int i, lm_count = 0;
 
 	if (!topology->num_lm) {
-		DPU_ERROR("invalid number of lm: %d\n", topology->num_lm);
+		DPU_ERROR("zero LMs in topology\n");
 		return -EINVAL;
 	}
 
@@ -468,13 +466,13 @@ static int _dpu_rm_reserve_ctls(
 		features = ctl->caps->features;
 		has_split_display = BIT(DPU_CTL_SPLIT_DISPLAY) & features;
 
-		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
+		DPU_DEBUG("CTL_%d caps 0x%lX\n", j, features);
 
 		if (needs_split_display != has_split_display)
 			continue;
 
 		ctl_idx[i] = j;
-		DPU_DEBUG("ctl %d match\n", j + CTL_0);
+		DPU_DEBUG("CTL_%d match\n", j);
 
 		if (++i == num_ctls)
 			break;

-- 
2.47.3


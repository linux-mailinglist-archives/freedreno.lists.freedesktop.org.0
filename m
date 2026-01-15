Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DC2D22CEA
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 08:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9ED10E6C1;
	Thu, 15 Jan 2026 07:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lA4r2Aer";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jA9RDXTf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF26110E6BC
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g8LL1554485
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=; b=lA4r2Aer9hocwYNS
 HjpLjW/ZbQklU0LkL34P30bPINgLs3C+zfnTRAPoQOO7+A2KcFXLmB+Rl9pOfC9E
 Xf+Y6P0R+C+74Mkc/y+5P6cP/staUKk4Hj7x4kFUUAiQEdyD8PANWgpchqkbGiqZ
 s2NPitEpRtG33Gt6FUgijHIfNFHFaU4DWO6yuZyO9IaLTt19/9ouJP0Lqx4SGv15
 UKaKjnbp6mEbkpxzfrGG8VvOCBec2Rh1H7c33tMevKdpJ1eapCQYDhnQUauuz0pq
 XWQWZCtKx8b8xYXLU25PqQpmjFxNZiFeIugn6B8T51MTLgC/xgWO1DewUq9dXo1a
 nZcWXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8udba-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a291e7faso35456985a.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 23:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768462153; x=1769066953;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=;
 b=jA9RDXTfhNgcCgUNufN21OAF8qrCBchpPZSsyzHQ1EbhvXO0LLXgBGHHoJjG/70hps
 1PNFAfyK5L9cPWneIjr2BqhQebJQXhgpAPywiZYeA8ra5zMIRUj5aHmKSUixcmLw/kW3
 fA9d0/Rj+qKV1MlQIZbXNQqeV3C0P9zMZAwluanLw7AFumk8WgtTVkIbRQ+eQDxKMvDp
 C+0ROYQ83LBy346I0LLw9jki31Df8Cz1PEhHZ8iW5gexMDC20ZAX79+fhgwMi4MM4Ozi
 qbbIWA1pdkzf38OOUksEv6Vde9IUismNzNo9l1jaMCDWXMy/AVSbeE9OlHv/3NyTiHMr
 y2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462153; x=1769066953;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=;
 b=jxwevVbEwV3HXg5xBKeZ91qnnU6Wtzr+OKxG767CHUrxdsTT680hvZaTxdgJ7pjEPQ
 3Ez5yz3Y5NARX/6YXolqu958zffpUcbFLIJkwWpSuh2ur6F6OBR/nM2+1tuG/s1b74GX
 r+KIr2ME2ghDbIm7xLFH2imgRNrXhHALtql+qzqNgRd34S8WqUWgOLA8yaf/W34a9glX
 MDeyq740V3PMpMMJVJa1b9Wt/SGTAmXcHebaaSplNEN1Yhsnz4LIQDBZ/IfUIgTFAw5z
 7wg50UxzrUG6qctCWe3XKfT8c8DiMF3Zsne17Fcn8DWFTiNHZAuIwAN5oVyr+8aqW3WR
 5WBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/JcCCly0e4KY+5scKK9TZgtxw/THZrHlxjXP2MDdO+hTQ7j0XgZHLuP6RFgmLzNQNa+d5uVgbaqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwtSNMXH8tedHCnXufK86xbfZ0bMvyp5huHBL5nXZ0Jf0otmTN
 whnhWW6Jduv2ua2e4MVPR4bf8BDV/PFevSjeeXl8ZKLkzC6nV+CnZK5XOuww99X65yVzMiQzHY/
 3hKelZgNsdmhBIN8p7lvxyf2F7DWdP2gQlojfJxI32gdMjfMTd6ka/hgHiF6YQBnYSOGZvm8=
X-Gm-Gg: AY/fxX6YiScjyqkhW/FrFv/lBkPjNzIgEoSp2w+o5wtZqYZ2kRs+vft5CsxtdFb4mIG
 tTt2H3+3w4TiUxZxkxu3GgZhPVTNMNMky3qH4C0tXzx915aXYaUaJ676KzGBFfveVjKJrg0ZGFO
 qZ4nfq+xxu+HHmjoh5KspeFabCwo/PTfDxNEn5YnJ99FiNtsyG1SgW9aV9t8/FVtH7g3ViPOv/K
 d+I7WPC5XYXQ6NS6T4coDA8uORlZ3zlChRrTEG0WoO+FGDNN/+Gf7UH3BpjcHgBdUQcP86On39f
 koR0AfaDbiotq67yhcp4hrqkpC+IBDpG0ih+0tRDpHwOIl0LfZSsix9zYx9LIijj4Fe7g2Y3ZQ3
 0Q8ZKtT95FvxPm3G8QurCoe7gAy+Fyc0ugosJ0tV7P6ijkycUgXXtfIe5b0Wnh5EIFrxZGyEXvL
 Djf2v8gF+T+ttorED4FrXTkHo=
X-Received: by 2002:a05:620a:294e:b0:8b2:6eba:c42a with SMTP id
 af79cd13be357-8c52fbbee3bmr739899885a.61.1768462153286; 
 Wed, 14 Jan 2026 23:29:13 -0800 (PST)
X-Received: by 2002:a05:620a:294e:b0:8b2:6eba:c42a with SMTP id
 af79cd13be357-8c52fbbee3bmr739898485a.61.1768462152871; 
 Wed, 14 Jan 2026 23:29:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 23:29:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:06 +0200
Subject: [PATCH v3 1/8] drm/msm/dp: fix HPD state status bit shift value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-1-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hzwfWK5+EPLPBOMgkg/4Azem10iuzkilPWoxif3rO60=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlol0OgRxZ1MBFNp0tkki7+qUT/NIE7YGEFzQfNJAcdZ69bi
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpaJdDAAoJEIs8ij4CKSjVhioH/13E
 FHzJE52YmAQhFdyvBSMPAFtSVssioEXr3PXm8t4IcDujo+95BTt4RPx4/7yzj54pddcI/MM1Gq+
 d6nwzkrWyio/F3OYxfwJQKr2tj6D5tMY7NPdi3/LAJYFmjs48i8lee27y5+6MKgcqjSe0LtkwvV
 G6p4AH8Cbrv3hcf2M9trNwSVgAwcxNpWIpD+ejGYV6kYIdig448hT6G4wJR5QW9txrADi8nfk8M
 ABr4khelULaQ57GFxVGGwYyz5iHpcuJQkUtEByILkOVFgnC9otGU7KZ+i7uPDd2Vl/2nez0gPXC
 1POFbvmkzvr/gJMNN2rqQaYba/jgW21luZtkPzY=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 2UlgtLu4f9PAMDjwtFCHxcp9rNUbchoW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfXxDNx1HtnBiEJ
 V7Rdl9Aj1UEg2R+qzMnnE3CJxOMjZ1V9rAvhRzou7khStPtiJdDIE9bDfz9sW8ZQ3rlZ7AAfJpw
 kJvNIKsxIyApV1JthPz0mMLSgRnl2XT/x0FHkdysgHF2/asL2MUC2h6JsKmuReg5On3o6YiM06C
 5p/T2NWe5ARXuWyFgNMW84bM3VKYbzAzGc8IFdquCr9eMk30BGnHiNk0/TOnlmmJdzt2KA19lTZ
 MIDLRvpgEahRXWNSpjHCEB+kh5/thNE8pRdQeG5TQItvuQvmicdpTu/HbdD7kmHJPZhvA8nkvVL
 ewbtEb/ynY/N8yTj59ZCeDIhLHI8vFi59hwAlmoY4H7Tp1OXn1moGcIk2v0hHlCU3yx2+Z+z8t3
 P3iq5Xm4lyhSNe7E/aOe2DR50XpZfdxa0e5C7RdziOBxenaN7KQ3D9M9JqS4jByP680WHk19Tod
 UA0AC5LbF4pQPHr1eXg==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=69689749 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IBRk8GtBIsankUNt0b0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2UlgtLu4f9PAMDjwtFCHxcp9rNUbchoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

The HPD state status is the 3 most significant bits, not 4 bits of the
HPD_INT_STATUS register.

Fix the bit shift macro so that the correct bits are returned in
msm_dp_aux_is_link_connected().

Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_reg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 7c44d4e2cf13..3689642b7fc0 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -68,8 +68,8 @@
 #define DP_DP_IRQ_HPD_INT_ACK			(0x00000002)
 #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
-#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
-#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
+#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x00000007)
+#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
 
 #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
 #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)

-- 
2.47.3


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92619C85CA3
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 16:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2AC10E43D;
	Tue, 25 Nov 2025 15:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDUE/uE+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibLNM7+Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E9610E2A1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 15:25:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP9kgb81232178
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 15:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=DWiu5ksRlljwbgPGyVazaU
 o5FrHk5DQFqyQwrdgB+ug=; b=EDUE/uE+CNi5snlEZoYAho5XEY2RvIHIVt6gls
 TkygaoSNczaqM7u0Wt3laJatSiN0O+Mx9my0kUS65kzuLgCaggkjjHgq7DpY9j4Z
 SBEGHD2wB6F1V/NjqnYiQ0yVP3GDe08TrgUlY1/AowN6T4QDZjUeC7oFO8L7tyLn
 gzBxMDEadNTGTXkoyQ0rpHVkyiqY7pP1hT+rvj1wgbX+Va96ZIzH+ZQtxVHNiH9c
 Hae8XR3JnDRryqrBXFMdH1qh0HR+WsvAZy3+qZ1WaG9emkO0Bo8NXI+7W+aiO4Um
 LShTuT+EuDtlSx10e/QjjXhUMVcEGuPSDPF40FV2CT4Xt3eQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyjmx3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 15:25:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34378c914b4so15402988a91.1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 07:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764084316; x=1764689116;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DWiu5ksRlljwbgPGyVazaUo5FrHk5DQFqyQwrdgB+ug=;
 b=ibLNM7+ZIg1ZH4tdJQv46HoEaSiNnslKQd3Z/Uj6om3yxk26kf5RCMU/eGfDJ1BlFe
 kHG4q5Dh9DZ/xLdY/zbNR9QeIdAOufU6AlYpvn/wMbG+moeoYv0ww/rTWqCGphg/LIgn
 9BShcg1bE/+TVnEMmUJZvty5x3BKDOuqqIR7gbASc/k7RyIxT3H5hU6M3u6LFn83KbKw
 pLeGaBmi3NB19D/zawYyIL4EXv2mY3fYt2m4quGMpTd/VobE8ZktDZexza5HGW8KQNM3
 IjD5xIJ99HZPbLaJWTbbYkkzefMU/55nlwJuI/VJU/6uc8wCQ/uucpda6n8XxAaUkV/4
 wcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764084316; x=1764689116;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DWiu5ksRlljwbgPGyVazaUo5FrHk5DQFqyQwrdgB+ug=;
 b=n7VzTcFvRhT7IIZ6Nu1jwsEnGUOm083IBo8IX3Ejpn+9AEruLTc6JMjg0DPnOlftrk
 UHenwY2tZhEISM5sFjxqmw1NltxtWoruvK9xu5PfIcQW11r09/+dC4watBhJycGxpSD5
 Ij+Aes0fWuoIx6NUJ7eoHg0LUNDYRbdXZAifyP7JO8qW82zn08rsFOwhC/mZPvoLvGw5
 5X9oPzqaa8AFO7ZVAz8S77XG6V1yVvwavcHUYLQ6VAcJWqYUXqzkxNMbX4bc5/AXVl1o
 2B5Z9tbO6lunHFdCSRpvUyNs1+xjpoPpBUDuy7v526IQfOFrkVaKHGIinvtY8r1xJxqz
 igGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLmj/aanj4WOyZTQOs4ZWyNgLLLx+470iLmIs/uZB0ve4YOPxW3BRIO9uNIdaeNP4NNvNRHQAMsuY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUq61R16M3NL5X+1+HQAv/49j05L8UUkXPc7aPWAOiFgXGlcmK
 JdF8v9UPnm8clhb1ovrS4uk1EKFF22hvFU/18nwA8Sc5PhxhtRCa2pBJCDk4bAyPmL1zMzWZDDR
 nXWJZIGoFXYh3T/9/6JDl/IGsprjI9xAYwPgl4OUFLrEt4FP0thwxdzo3UlM7qH00mxuBOqI=
X-Gm-Gg: ASbGnct4KLbGSTRdt7C3AHUbUA6DipwzkZULx3AK/WX5DKfutTeWehunC4S662F5coK
 AenR5Cqy52vq+7UjEoKuTGgufZqtncpQCI6dqNZLYNGfjFmV/AnwXLrzfy5HzFbP5mpUdORYHfa
 8aUrNp7Be92ThAm83/cc93aGzvM31vYf89qarU1Ad1BKCDxS+8xpAtOI/REoGyFD5Fxz817MxJk
 TNog1fG+JqIsPPUyOSKZhKSEq/b00dGTCkrZlH2BGOKc+/Jbwxx6wyFBBCCC+cduMIkhO0vZKK8
 p4PMmaeKQW6Vyxloxe80BxU1oATLvgzLRERv9SrFmDHI1um0eLBJJciPh6kkXtQ3OJ/3GlBJCqH
 lxX0vHeRUjPHalTiG1DSLi2w6t3LjgCs=
X-Received: by 2002:a17:90b:3b86:b0:340:e521:bc73 with SMTP id
 98e67ed59e1d1-34733e2d536mr13523460a91.5.1764084316258; 
 Tue, 25 Nov 2025 07:25:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwDIciaM8fT4Sm6dek10YkSXKVgkPJBK4nqwfc7HN2+8feblvYmjydOt+c76wRPvDWkXk5CA==
X-Received: by 2002:a17:90b:3b86:b0:340:e521:bc73 with SMTP id
 98e67ed59e1d1-34733e2d536mr13523391a91.5.1764084315261; 
 Tue, 25 Nov 2025 07:25:15 -0800 (PST)
Received: from hu-vvalluru-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3475ff34831sm1269949a91.5.2025.11.25.07.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 07:25:14 -0800 (PST)
From: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 20:55:07 +0530
Subject: [PATCH] drm/msm/dsi/phy_7nm: fix rounding error in recalc_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-msm-dsi-phy-7nm-clk-rate-v1-1-17141806e3a0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFLKJWkC/x3MQQqDMBBA0avIrB0wE4zSq4iLGKc62ETJlGIR7
 97Q5Vv8f4FyFlZ4VBdk/ojKngpMXUFYfVoYZS4Gaqg1hlqMGnFWwWP9YpcihteG2b8ZyXVkvZ1
 c7wKU/Mj8lPO/Hsb7/gFyQsTCagAAAA==
X-Change-ID: 20251125-msm-dsi-phy-7nm-clk-rate-26723a3b686c
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764084311; l=1586;
 i=venkata.valluru@oss.qualcomm.com; s=20251028; h=from:subject:message-id;
 bh=7ayFBJ7Y2AmVW7OVfEwWNzmHgzbLjTCXtOnUFO5KOBI=;
 b=/5iu8JRKBCqZ/1D+J2tdQAk946G2v3s0XzkNHK4VQkGvU75y4mVYbPct6TmJ33S1rfHthCMvO
 InWPd3lKk2eAHpI5svS567TmJzpLLrfTKf/LGjmhXacYOjqNqIV/JRE
X-Developer-Key: i=venkata.valluru@oss.qualcomm.com; a=ed25519;
 pk=KEpJdy7/I8HDmNSf6B83x+sFHUNr+mjMNJ2qe4G/zXI=
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=6925ca5d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=R1ZPujbRWijfOtoOsmYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyOCBTYWx0ZWRfX6BGb4ptTk+ES
 Tje8jkfPDR7bFXPUZN/ebUSmhkKLDXk6VYBmbbaOUeNmyaB6+GIUGNCjvfZwAEPL2Bo6yE9GK7P
 kx/DriplusPWBGfOrJqVK9At0Hq4c/W9GRh2yXcDu0FQfU8XolEnsO0jL8jSNeIrTKA9EdteyRH
 5HHJyCyfbhVrEA9A1z0ZGqo2ZI9cT0i6idIs9ixVyOq1kIPQe2QTSkY5eDDdSAsXkhlBben+1HP
 953WMV6ZzTLutL64bzl0kiw7bSBkJjrKIyQxUj5fL+69qvlwfRn5u2BV4MA5sOvXaxC2UCaqHeH
 P+ZsCighRrKVccy+52FSQhzoN0g6nHx1VWp7bfj7IGdHdr5uOnOkoMxLDiUHrVnZ4Qm0NZzYO0z
 mTJnNBhiNKjTLVNzoc4DYXuGDIXdQg==
X-Proofpoint-ORIG-GUID: E4zA6SwrHo3ADQpBK_waYeheJaYQNJwN
X-Proofpoint-GUID: E4zA6SwrHo3ADQpBK_waYeheJaYQNJwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1011 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250128
X-Mailman-Approved-At: Tue, 25 Nov 2025 15:33:28 +0000
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

Required vco rate is set by programming decimal and fraction
from 64 bit calculation. This programmed rate is not exactly
matching the requested rate and corresponding recalc_rate is
having rounding error due to this delta.

When setting byte_clk and byte_intf_clk from this pll,
set_rate on byte_intf_clk resulting in dividers getting
reprogrammed, which are already set from byte_clk.
Convert this recalc_rate to KHz and back to Hz to round up
this delta in calculation.

Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 32f06edd21a9..00f20c5a7c73 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -598,6 +598,12 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	pll_freq += div_u64(tmp64, multiplier);
 
 	vco_rate = pll_freq;
+	/*
+	 * Recalculating the rate from dec and frac doesn't end up the rate
+	 * we originally set. Convert the freq to KHz, round it up and
+	 * convert it back to Hz.
+	 */
+	vco_rate = DIV_ROUND_UP_ULL(vco_rate, 1000) * 1000;
 	pll_7nm->vco_current_rate = vco_rate;
 
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",

---
base-commit: 63c971af40365ee706c7e24f6a7900d693518f09
change-id: 20251125-msm-dsi-phy-7nm-clk-rate-26723a3b686c

Best regards,
-- 
Prahlad Valluru <venkata.valluru@oss.qualcomm.com>


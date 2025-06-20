Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E0AE21DC
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 20:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FCC10EBB5;
	Fri, 20 Jun 2025 18:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxP0bv8W";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B0810EBB6
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:09 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFRUa1024288
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nO3sfnzlB67rNBuLuCNg6x8OnrGZzYrJhAxTg03f9r0=; b=VxP0bv8WbfY8U4LN
 fz3P3sNSRtv9aHUEX8uI5HVwpCbuTh2nh57emOwXMLWoqc3NtsQbiJVwXLHmyUuu
 Sp0abie7Q5dCp7+uBvKijNrod0gUZHqSlKtRskPQh1MvPAESaydqxXZHnOEZ1K4g
 GDlWzGI011dSdLeOUj52O14zj79MA0QDtRg+HjEk8LGx8c5pcqFG5CGwK0oBGu8y
 KPrUXZCB/79osM0o8OHQ7kxtPNO7BGRk2uVXDFJXF+l2lgJxsWIUb6i1B80deIyN
 StatHysBMFiY7KLKP/KuA5vUyf7UGJaEnoPrD5yn8+eK/syrV9560Gs0r9r5+qXL
 T2BsAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47daa4rep0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5bb68b386so580800085a.3
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 11:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750443248; x=1751048048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nO3sfnzlB67rNBuLuCNg6x8OnrGZzYrJhAxTg03f9r0=;
 b=hxjCeJDbmf4vguuJ9+gDX1p2lrQn2ghCBwW8ETH5QBrUPESrsmq1K25kZ4zwnS6Ei0
 QAPkanTDjIkrYl6AaLkeS6+O+Tj2Djk2e2r/g51M5MUegR8X4RByd1PPURWIMYmbWmYl
 fSbwyDfLr/GMsFlAmtYosf8FdtTooFwnKq28IKhqINKiIE3GsUJWw8l/05AUkqwcKAPn
 zchjBiVn4F/fncYAEhexx2VQ93X5IDjRfrf9xJs1HjfEc3WpctFpQOJX7vp4Pr4vmJ4w
 Sn8KUEyCd2BDjxVMCJEsIY8smNe1ab79Q6QLd+0+8kw5D+91DKRldYEdioYxG1//GQzi
 fSoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFV43FiZ2Kbq7529bjOCVcMhZwYkv+J85j70C1kKUtbQJGXb41xlxK5SAcWIg5VgaAtYMGyYi/yzw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjaPc64m7ULNnuKEIX56Y5EhiWcBzMnEhU1c8jh61OFJtwN0wA
 yi8Ia3L4w3Tumm7ai94YWiXvstQo3YN29Icwpjp9GNLgJw23vzC8FTyk0aXFAUamZKGx0HMoPg/
 IbIZ/ewHuiujGYGjYewpD6v2hZBAZkZksq05VKURLwL5qt/c/VlHYvGzRTKBumhCId3FNzARZv+
 FE25BVJQ==
X-Gm-Gg: ASbGncv8J4smLFX6m65uRQwsi0MHfnC/DSymvFzuxwaDC4N0Y26wf+NSB8p/Imkw0he
 1IEQKawf9Cz61iKTyK3LoieXtcToA4AkqUHHhBDg5CGnGOmX8RdljooC90HdcFKOPc7+KDcPuQJ
 EzDs3Nmo7+kez5jhd2fJtZnGnM2y5J5mdfc//+vTkZHHcTN261ug5oHhEcHh5wk8RlR7TWQpP77
 xCapylhN4UISbeICRt75VRwefKNLMLpLNXqrdntRdj8z3OTTgV9xy9AtAeAogGflJlANIuzrsaG
 jWITe/9hs8UzAUvYH6KisXoALb5gp4/57c4qjdSFzCTqvYofhJgtMMPmFJpyNrqKWKsOXzus82s
 lwvjfPMU5VKFWaZJEt0GyI605vlBm5UhEv4o=
X-Received: by 2002:a05:620a:1b90:b0:7d3:8d16:cfb with SMTP id
 af79cd13be357-7d3f994652dmr464231085a.39.1750443247768; 
 Fri, 20 Jun 2025 11:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE58pSYF6MxuiRzGS1LvzWtsB3m3BexOiTThz68ytr6Mc+HTEwb5RlSh9XRTP66yPct1Sc7bg==
X-Received: by 2002:a05:620a:1b90:b0:7d3:8d16:cfb with SMTP id
 af79cd13be357-7d3f994652dmr464229185a.39.1750443247411; 
 Fri, 20 Jun 2025 11:14:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 11:14:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: patches@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/msm/dp: add linux/io.h header to fix build errors
Date: Fri, 20 Jun 2025 21:13:55 +0300
Message-Id: <175044313807.2014621.18142017999140082135.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250617185611.2965223-1-rdunlap@infradead.org>
References: <20250617185611.2965223-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4soPLtGVNQggq8a7odNH6DXmN_vuf9Zh
X-Proofpoint-ORIG-GUID: 4soPLtGVNQggq8a7odNH6DXmN_vuf9Zh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX2miEDGoKeeAO
 4JOeWGj91GY+qprHNknIMfeA3Y4rdeDVQuRaMlgo79nQqUq7egCqibHitkKTNmC5dXYMilyG1Hx
 dPJRdY9+wm67phcVdgJl/CdAcxbKNjakAEDkgL8nMEWd/nUigL8sWGCYvLu9g41Cszwb5R6tmVX
 FLjXnLx3h5DNcasTcirBoEIWQ712lf4aO6DEL42amqCvWrPIj3Gd/XNoAZdH2k7/1ymWqWAHoL0
 9wlHG+kjb9bFOAxEZKQWSX4vqKWd494LKp7rCzXD/iJwU1kgwppocH5gD7wBUwxDsa78NQXsj0T
 5SAIyeBdYyGfvtAeXNTU0B1kXtRdJSCsqPfsEaRhGAQ7fkjbePYytXxz3c386W4P2dZ2RBHztCJ
 2cjqm8S2V8qlPBu8KoRbLEVtnlMMOYn9MJ/MU57Csn6rLx2pnWCZtQ7nKb1BT+Yh8Gp3fhI9
X-Authority-Analysis: v=2.4 cv=KphN2XWN c=1 sm=1 tr=0 ts=6855a4f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=QBdSVzX5EUQIqSI3YyQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=952 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200127
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


On Tue, 17 Jun 2025 11:56:11 -0700, Randy Dunlap wrote:
> Add <linux/io.h> header to pull in readl/writel and friends.
> This eliminates the following build errors:
> 
> drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_read_link':
> drivers/gpu/drm/msm/dp/dp_panel.c:33:16: error: implicit declaration of function 'readl_relaxed' [-Wimplicit-function-declaration]
>    33 |         return readl_relaxed(panel->link_base + offset);
> drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_write_link':
> drivers/gpu/drm/msm/dp/dp_panel.c:43:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
>    43 |         writel(data, panel->link_base + offset);
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: add linux/io.h header to fix build errors
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ee1c98ae63d1

Best regards,
-- 
With best wishes
Dmitry

